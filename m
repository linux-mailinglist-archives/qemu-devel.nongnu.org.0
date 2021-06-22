Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0DD3B09E8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:05:56 +0200 (CEST)
Received: from localhost ([::1]:37898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviuR-0007Ib-5a
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lviee-0006xq-GW
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvieb-0005uv-2n
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:36 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MFgBT8015098; Tue, 22 Jun 2021 15:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=/VDDukpMShH0cK8abAolZeeL6Q0XU9FHs6v8xwSzvsQ=;
 b=IoJsq+0xtAWQcOtTgJlIeB8t04LpL5mynApFVsM2v+4tqx5RCK8kWDKVxQhFmOB0OPk4
 W6oegDANKQl67NJMkg2tF3rtbYmPF02sYY/K/UDVuuVb455Ff31GeS28C5o5zlBGEKk0
 JZ/RYUGtCnPR5fTkOztzfhQEIlfz7IHd5IIrdwPy2ljgbJaEAhoLKV9b9+W/SksMrhXP
 tqP8ACYxxGzPsgpa8vqubHplKoyltinCBtgvkL3lE2vPGdV8KWb9OPeCOcuSehV4ljM9
 fH0XtkibqUFjcy74prrmEIu8oFqUTdxbOFf0V4EV9URUuhIDkD3RTfgVIzF5ZoH/aBHB CA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39b98v9jdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:29 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MFkDQa028913;
 Tue, 22 Jun 2021 15:49:28 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
 by userp3020.oracle.com with ESMTP id 399tbsy2hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLy7O3CwV3ttvBw5v/NbgPOxqNCkupILUErgG+QMIchmDFk7934XHepP/5kAYFaK0D+KXf1TxTBBKCxwSUf5+MQmP48J8758u70EaWNXfBB2rDsiPINBDaQsCiqdrs9+DLD0rIUTd86iM6hzmuVFQuo5D5Qa3rmEAj8m3RaOvp5u/E/HJHmRlb42qUB66pkOBmFV1MXPcoYVU2CjTSQUKqp+ka4er1zNQ+eCsqHsyuuFRdoZAN3HAwxndt7hEpPGXt5r+CGHGLzfXgue9UImAWo8ojncRkiz5pgY0OwdW6UbdvxiVxZwVf/CXwPDAvg08rg851EZMIyugFR05QwFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VDDukpMShH0cK8abAolZeeL6Q0XU9FHs6v8xwSzvsQ=;
 b=LVCKQE99ygIkf9xFz89LSMmYqb4Zve5t+qT7lstvtun2jzBF9Q3PoCi6sTHvfLDVntBDtohN4ms23npSZNxhGhJ92PqvDzyfWiNHEHwxwC/riH3b5sWeanidovbTmTNMKHn9gQVP7EaG2FtO1mmMGwUX60yki9+cJI/jeb6ioyZgO+XaJmxQAsl74s9MnXJpTHIolee2UHYBHaG0O3OqAw1sgcGyO+a3ZALQWM8ZyEFejafELMJQ3ej1/qwEMJgrf6DdTXW5pSwVX1S/OMOZ+HDhrKsBk6iBXhuicB9bvvkCM31esixS93/Dpq1xBXC/Wx//O+E+01meQImdFU2sow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VDDukpMShH0cK8abAolZeeL6Q0XU9FHs6v8xwSzvsQ=;
 b=MPJ/fsvbcjQzmKlMJOo8qz8HGl/dVSvgmVinXoPAugxWWl/lpe52JqxUyncn5cBkbiokQYE7NNzsLhwrEQrsHuwVa4gzaElwtQvO5e4BySSeUzQDHurzTxjNR1+vF65zXgEuR4XvN98Al7sq5AoDRjEh5nePpHNDcdBuqOr5FHA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 15:49:25 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:49:25 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 3/6] pc/cmos: Adjust CMOS above 4G memory size according
 to 1Tb boundary
Date: Tue, 22 Jun 2021 16:49:02 +0100
Message-Id: <20210622154905.30858-4-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622154905.30858-1-joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from paddy.uk.oracle.com (94.61.1.144) by
 LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 15:49:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1567f12-b657-4489-766f-08d935954fd5
X-MS-TrafficTypeDiagnostic: BLAPR10MB5204:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB5204D42B729484C61EFC8694BB099@BLAPR10MB5204.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gTPD2JjrqB5IDsPYRJlQNcNQN9j6AotZQ84HIA+Hx3+w0eFLe2xKx8Bu9tlLTkj6Q0zKBctPYB5XyIFurUwVWQEtY0+PMnbqmv1cEAZFUlfw2BT8m+mlaxLMaB5d5pdph+sg1FWjlbLIsxGFpdNklYyKYTaPvCHGHGbAk/C6uxYifjZPuFobVNAsXQkyLfA0/9fHxjNeGzWbKuBpFxldTP0hl59co/LhLDVTJGTrexXNZOrBBA9aEVi5lh33zzq3PJffNPenOQ6+TnM9B7beShjk19rcd4k52HmQulPGQfjV42EnvPAcn2JyqpkyQchxVNRCTp74M7fRtcN3XTwE2ElvOBsWN9/LzamjLChCeZoxS45pRMfSSV2WlcVsPPDvRHMXU5PRq/KgQ+UGYHgbh5ZMUNCafhKOqIT2D1/Tuq5RUxjc9fQhj6+w6RiohatRcLhA3k8XbtRTKxsHCxSrQXc9Xx50AhzRrfvOaK4EvJkgZP10smWky//brYo1o6Rla0hUVFBnx20VK7yOEmYCXuMfl3ZcYB9SLZvSQPQIa+6OUX1qbOsyqakGqQ9tEdIsUIBLqdoX/oJNLZAxevrIsdn22ce50RsDwGLP+9FeVtVBYi68Q0w1rCZdno5ZxrqKoR/8qTpIToDEVweq5e3HxJLzumvy77zr6ZfaFf5ifVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(5660300002)(4326008)(8676002)(956004)(7696005)(1076003)(8936002)(52116002)(2616005)(83380400001)(6486002)(316002)(66556008)(2906002)(38350700002)(38100700002)(6666004)(66946007)(107886003)(86362001)(66476007)(36756003)(478600001)(54906003)(26005)(6916009)(103116003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yi9+QuAM01lr5eMyWgeLkOtWgGbUWqqtyRH5zouxPvmFVT1dNVhcAUpTJrJL?=
 =?us-ascii?Q?kRxSbby5+GKCkC1BiMawBOwQCkcks0kMYPogNTLHnirAq1unjML9cwPrunyH?=
 =?us-ascii?Q?EEcxG18RpP2sVQl2HqNFKcR0B2Aax6FZzTCXWKNldit/35YanuJpDSKNmfGp?=
 =?us-ascii?Q?AsxykD+ekBNoif7+TPL1i09OBNVUAxtPHQf8n/7eswnptvKqo2FwEW9ilOd4?=
 =?us-ascii?Q?6qKyeYhFqKcfgzs+plXxNTr94lmM/HebIjJ0PdtMiXLVpWXpBFZjqPux00BT?=
 =?us-ascii?Q?udOlsQANFakhSFafxghEhTl7OgJp73ikqV94x8bmIsXPKGFy/mQfxhhtJE3v?=
 =?us-ascii?Q?ilbgUjfj2XCv+ZPzwGdQCkhbm1gJ0g/6PuvHj90p/Sj3SmUf/AEf9yQDtXPK?=
 =?us-ascii?Q?Jad6MYsKmz4FXGkjlCkV3BYwVfyusrC2/I2FtB1GHDj9Olwf3HBNfCPOHqJH?=
 =?us-ascii?Q?R9sLSUAgbCLjC2KrBkN1XeYTrnCpOmX5KKVj1TA506KeaK8VUJtMPYd/XXV4?=
 =?us-ascii?Q?S0ImjEv+k4k9sURQ2vyi9Ols687FcqlXWYYDeUyAnGnn7gPaLH6qRzGFxQAq?=
 =?us-ascii?Q?NiS7EBw1XDOuq4O462WpdaXWxjdlIowmM6T6c9JjOXJd/Y6S0DIulFivuPv4?=
 =?us-ascii?Q?Val00c7Rxi8zG2WpySb2rKMtIUEFUcb9xa9uWDyNvawEpelyY68brLW4nYOk?=
 =?us-ascii?Q?QbTqDafsJDE0iXYUtbivMy3dYOGc1cGG+q5ucN+L30wr0XT72YGVMHQtVg0H?=
 =?us-ascii?Q?+PoRxyvsFA4ztnjG6psteavJUlhoz1zGiUzrWTp6phPtfy7S/0+AEtW7pqtK?=
 =?us-ascii?Q?kLkaMZHbMpE6P0YN+S92kEUw1HFNfcbAt2v9SRFYMKNVhSXRN6fm8CxHW03F?=
 =?us-ascii?Q?NYSmZNqQS8HjHxEmsJMPyW23YoWPM3muv2m6nbbq6NXt2fAREkk5JbjD9T4I?=
 =?us-ascii?Q?LY5yyri1e5NQN2HkqyaWUnpz9HpVvoP4G40tsOjqxMjtR3CDritVAis1ms6e?=
 =?us-ascii?Q?Hpz3uAyJW4l1kN1aJhAObqjxQ0FA3pEQ0cC/phzLbmh3Ch41AnYZbygL15E3?=
 =?us-ascii?Q?JZ6KNZryCylbGGJe3uRmpjd20gSkcdRzmLbcFx7PvH+4s/kzHuPdPPp5pGSX?=
 =?us-ascii?Q?j4gYmXK4GMHMGlVKSR3Ova5oqoXbrYx7Yk7D3tCdXv8HoIDze841SI4T2FVP?=
 =?us-ascii?Q?QTpGEKyHxjz8xKyLEYqiIlBeVKKtltIiMz5RvTkQDWS/ZJXjlETLQcm4T7pK?=
 =?us-ascii?Q?c6Y4iWW5Pwjv8oJmR4Il8WmADIk6W0rtyQQ/Zg0jnOtLGQHtU9DmuE8BqjRK?=
 =?us-ascii?Q?tsyr0+bkpB8hT5YG+20w06cZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1567f12-b657-4489-766f-08d935954fd5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:49:25.6808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pU7zNYJtrlEmQr3+aMakCcNZbsDWXuSLXx9mysoYMvqP4ucg0k80RacIo3nI0u6gNTD/B1g8xePeez5S3CL9ds9RdvtovLCP2EyHyePjUOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220098
X-Proofpoint-ORIG-GUID: kc2o3hfLIzJEIvUVDG8cKDpfqZOBtAm5
X-Proofpoint-GUID: kc2o3hfLIzJEIvUVDG8cKDpfqZOBtAm5
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CMOS doesn't have the notion of reserved spaces, much like E820, so
limit the amount of memory above 4G to not acount for the memory
above 1Tb.

Suggested-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c          | 14 ++++++++++++--
 include/hw/i386/x86.h |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 94497f22b908..2e2ea82a4661 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -644,8 +644,12 @@ void pc_cmos_init(PCMachineState *pcms,
         val = 65535;
     rtc_set_memory(s, 0x34, val);
     rtc_set_memory(s, 0x35, val >> 8);
-    /* memory above 4GiB */
-    val = x86ms->above_4g_mem_size / 65536;
+    /* memory above 4GiB but below 1Tib (where applicable) */
+    if (!x86ms->above_1t_mem_size) {
+        val = x86ms->above_4g_mem_size / 65536;
+    } else {
+        val = (x86ms->above_4g_mem_size - x86ms->above_1t_mem_size) / 65536;
+    }
     rtc_set_memory(s, 0x5b, val);
     rtc_set_memory(s, 0x5c, val >> 8);
     rtc_set_memory(s, 0x5d, val >> 16);
@@ -1019,6 +1023,12 @@ void pc_memory_init(PCMachineState *pcms,
                          x86ms->above_4g_mem_size);
             exit(EXIT_FAILURE);
         }
+
+        if (nb_iova_ranges != DEFAULT_NR_USABLE_IOVAS) {
+            x86ms->above_1t_maxram_start = maxram_start;
+            if (maxram_start > AMD_MAX_PHYSADDR_BELOW_1TB)
+                x86ms->above_1t_mem_size = maxram_start - 1 * TiB;
+        }
     }
 
     if (!pcmc->has_reserved_memory &&
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 25a1f16f0121..cc22e30bd08c 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -57,6 +57,10 @@ struct X86MachineState {
     /* RAM information (sizes, addresses, configuration): */
     ram_addr_t below_4g_mem_size, above_4g_mem_size;
 
+    /* RAM information when there's a hole in 1Tb */
+    ram_addr_t above_1t_mem_size;
+    uint64_t above_1t_maxram_start;
+
     /* CPU and apic information: */
     bool apic_xrupt_override;
     unsigned pci_irq_mask;
-- 
2.17.1


