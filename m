Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AB23CCDE7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:30:00 +0200 (CEST)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mms-0006n3-Mv
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlD-000436-SK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlA-0002EO-Hl
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:15 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GOHM021843; Mon, 19 Jul 2021 06:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=hHnr9eIDXnnun8OjXcEjP7t0JygDmj9ZfCzR5QH8K90=;
 b=VWcBPXMB89XEfPOavij0bevjUVeGIdv8JmB5x82p3Gz0DjobCWWzRwVvT2Swbh4nCjj9
 3l3lfnmTrCYDtA7lxHCm+R+y8InNzXSqYE7sUj+FAod3/OA2AEYxEluXLLvsShGQf1pt
 z4pRLLs8QKFrNWuChfPceSi19tgOMZptTi+f9/XGF0EI7wC8B2m6oogPvTKvqhfybQLJ
 LIVJw3cuKKc5JTSAB0zPm0susIWWt+IjKXRLk6w/luyvamu5Rm5BiTBc6wmK2yRkglg5
 HnTPUWDsaKKLfjAbHX8OM8eg84Ayvrb4qyXkWaz3SE5T6hTkjyyTzt2OHwbkgKpZC86m Ag== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=hHnr9eIDXnnun8OjXcEjP7t0JygDmj9ZfCzR5QH8K90=;
 b=lRIMN3aesR/GLkxE+UWaCOFnUr6oAG0V2Ex1hlYhlA7T1DFL4y/soTaG1Q83uqb5/eaU
 CpQWQ87OzkWKLMFngI4A68F3BiDte7ZcCPFnMwmQnHYJYe/Q1tmzGpuSmfieygSjhbMv
 /IOBX22D8kh0NO5c38zlyPMmV1pWBZbJWI3XIjVYdYFYyCk/aCjXD/cG1JmzlmmSNa0P
 bfisp7pfqS4OLfd6Y1clAsqqb4HmVsnjbuKEu2GJc1TvBgv7stI2at8hmdMPeAC3Cl5j
 vBNvbW6bKoYhpjJMDSJ0kAPOts4dpLyHgsb+HBnN3JegvA+SMk/j434TxkB49cRgrEQ7 7w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39uptrt6bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T3086873;
 Mon, 19 Jul 2021 06:28:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4hXN2ED7cFH4eA0oIYslkssAkyMB1BCP7WrtWZNdd3Qi513nIkpl0I2wook6wUuiTAzEL3BrZ1kr3OiuEvvleeAj6ScuS7J1h50EyR32TBEkcK8mkf10HDipKFPNTkcG2HKWkFfD588kozzl6ZvwokJgRf8idpoAMrlv2h2weLa3c1p5M00KEBlPvwIMxHUhv32fU2G+H9z8MkmOkb/rh37y1MT5MsPYdyCN4m43nRo8NTPo0JHpoXnhxvxrdt2K67B6vYGqeQIFgxpbEqWQU9+4uHoB4jrmtv5qxav/Fj22PU22rjqkqE/YMLBdXgI4k9xYIVTzOJ8+HFu1HTtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHnr9eIDXnnun8OjXcEjP7t0JygDmj9ZfCzR5QH8K90=;
 b=Sx7QbnyWckQleBtRqOBwMoSDBAfWqpZa3z16sPEpbKi6BtMFJAqDsbxANbFUhgpobtdFlOvcOzOggxZLU6P1k1cf+tcL+whMTpmKrEhL6iBVBHsya0FBynHpLotq/P+Vx3ykLqcKYkxd30+7qULOfHentNW0XETm98+7m9uM5e+NA+G6BKhL46k48bBY4bm5NNYWAdyCF+3hBsfOzRDQ5I2lNHJpTMZ7PyBkQ2Zu30OoxGFLODSARcGGjyLq0p8nVVDwYGpNrtCRuse75eRzUq6pLPnX/9WZjY8iY36ZVyhhohrX3W+Rqqrk4DuFbWDrcJTFuxJL9Z/+NrWpgXu3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHnr9eIDXnnun8OjXcEjP7t0JygDmj9ZfCzR5QH8K90=;
 b=gGCX4otY4QEjzuTpGvrc9xd/59hlC5VDxa1XEiSgbPLZxSNZV59siQSG8mzakrV+Xx0Ck2wlSlMt1zG6xH0H5rc1IxxLVr6xFeP7aCGdy3O9Ch8WHkkAry3iw5mAFEEohVxYaoYdWJgwixupjmwCk4u8+0H4N4dBOrw3hUuZPG0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:06 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:06 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 04/19] vfio-user: Define type vfio_user_pci_dev_info
Date: Sun, 18 Jul 2021 23:27:43 -0700
Message-Id: <c65908895de707a0532aa9dd09932bff329ea416.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a1fe54e-337f-4f82-f338-08d94a7e5e78
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4814DEFC1DDBB312063AA1D18CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mfwdDQLHEDI9pwuES7EZcL97nK7hRMvOkxDod/Cl+dvk4EZZz1nykI8Xs1UBr/O3gZc61hcM/IcOJSG9UHOfPc4a84MuK5yZKLMgGKuCQvLYjJU+HPt7nkMf5sOYroFnob0X+LvqCGFZo1AIYhEnFYJ9Sz0fxjnhpoRck6RcW4xenLRMN8b3WUv6cSgWgAiT1J0u5gA71KAHNUoRMnt/1CQttNESIHJHI1bykXvx1sasliHzDtnrZAkGF7S7CF/szl7Jc2pt5Pf9Xi4Kcpc7BCx807bht32o3ZhNMKT3a3IRBaOn8FraAJGy3U/plfRy7i81fAAISqhxYKC7ONkjnUMAmeqE9cZaG1sO8IyBUxGnKByT2C2HxT6kNI/4jo3zy4mTh1IW0EK0ZIr3AeAGU5NPExonqK5V8Ho82uIOqRF7o9OoLbXHSGl5/7NRFrtbFjwlG81X40u2BqY/5QrwYFbyqI1PbGR1ndZta+WU9p0DPdsl8xwYcap69ei7/SqBu76UVUgiNU7t9SitJNBdHnazB4HroeYhBMvLoaPsqydhli0ERQnwnAMztsUmXThzM9q4WBY78PLEHBBPHUIb1Z9yIMTUx/kLR7Mq9du7Qe7sfY/bNTJfBvJspC8Yj/gxA2vWsGSQ72aNMbeqZ493Dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A55Rvi5/tsMs3pouuC/Kqj3Ei1RughhdDte6H9wNRG31t12yAx8gP0LIKZ1M?=
 =?us-ascii?Q?CFIr7jf9hJ/71G4yFWXksVjWT9psq2zxq3YoQtyvUDxj1gzIujZ4vtweKltK?=
 =?us-ascii?Q?oCq4TS20/SUNohN89Kk+BgLF7ILIN1LfjTtX7UkwLltRJIvSNgbFCtUmzTYk?=
 =?us-ascii?Q?19T4G5EhvSRR3e9MHos6x70IPI5t2f5EFb9rljU3zKs4NvBCCpBb80PNfhPd?=
 =?us-ascii?Q?oXT0X8hAvNQZWXzjV422R8wjOXzy9VpNqBkk6kCHjuWbzG8D6satqybMpmoO?=
 =?us-ascii?Q?+sCP+LVafxs54ZVC4ZD0+IBfjIwBdG6rTEMsCXlYdz1Zcxbyp4z1F09nn+lR?=
 =?us-ascii?Q?TnpqNzGqaxaaS6f9mp7ZNO806b05SaBXSfHpbcMKWoO8qRAhdhGyNinmGiDN?=
 =?us-ascii?Q?vYuxPtwS2OhZxW4AYyttion/pF6gtU7yAsBpoHCQXRY996O2bNR2Zs9m+svE?=
 =?us-ascii?Q?KEdXaAuEYjJcV3CZZAqAIR1Vy286KwRiugYKAX5Y4n+rkM3ubouyGU8bGHXN?=
 =?us-ascii?Q?nIpkvGnttpenpSiiACpNjPDLNhn1bOzanVH/N67DFAFJs2reYzlQyDp3OXly?=
 =?us-ascii?Q?cwR7U+HG6L/IQWTnuepwlMAoJKlqTqw/8Va6uB/jbm4OCVJL/H9rl/8j56W9?=
 =?us-ascii?Q?qF0xZj78LYqWuxkTSA5d+r3DIs8HMAtVcM/Lh1C7x0DXWAqu67idh9MM5bUo?=
 =?us-ascii?Q?lzqoCwD+bsT7C0KHbb8R8TIAD8XL9Wu73g0wwj7irWWJtfpLBQ/qKZv3+mWe?=
 =?us-ascii?Q?3IeOtHqUGC3atrwqM3R5QguhjSR2ICgSdoTpgo9mE3pnIO5nyJsgIiCwsBEp?=
 =?us-ascii?Q?ni8AUy/3jSSLrGNYm8jrr0rAADp+mgsoL8UYXJ+nsmbI9ovRHmH7emKUHxVB?=
 =?us-ascii?Q?gi69NmLeCPYVHYPghSup2mffwF0HaAmFOwGe4TIxUuMObH8AIsyI4zpswf0j?=
 =?us-ascii?Q?u9lavHCAEmAAxXEV+qjK9bEscBpd8nq7wod/Xymdfg0gNRElrkMrFdlX85nt?=
 =?us-ascii?Q?JHZWKf6gI2gOJURAeoKMSgbwnernx4Luj2EfZsXVcwnStwDDLHCROliq/w7O?=
 =?us-ascii?Q?5FWJNNFsFX+gZblsCDk4fBH+m0/opBnoFleVw8f8s6WDKBCnGoXEZTR1VF4+?=
 =?us-ascii?Q?0NWJXEcNIMduR8ZffhnizxRLKArMKjalnWPTsx6YGaRa/gp86xGgFrDMlbUK?=
 =?us-ascii?Q?NChDcPvV+hD78KBt5voWTBKpnTTAt3ghLK9fLOVIigoNCg+gq4M8f7b8idLh?=
 =?us-ascii?Q?hE/3s7kXzl4+AuaqIAvEKS2pc88eWYdkXryXgzNPua0GAB0XfxSvPcEdrEWO?=
 =?us-ascii?Q?Xmia56cCIn0LD1y6myiRCxCiUUgds0nJzznVxj6u4BlI1oh4VIhXAklpqEov?=
 =?us-ascii?Q?z9/FNXHiY6ZI2CTylmjMDl98x3dy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1fe54e-337f-4f82-f338-08d94a7e5e78
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:06.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeAczSbgsp67LpgPaG2K1e07pgSDFtg1QasjjIX9sLVI0SvAYDTNebo3soXnh2nE+pOklk/Y/RfM4CgY1uch1a1SZr36OenMMPgKJVxfgUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: d-ubVUmEevvoFe6cXscfXtc5KJRI6ebJ
X-Proofpoint-GUID: d-ubVUmEevvoFe6cXscfXtc5KJRI6ebJ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

New class for vfio-user with its class and instance
constructors and destructors.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index bea95efc33..554b562769 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -42,6 +42,7 @@
 #include "qapi/error.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
+#include "hw/vfio/user.h"
 
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
@@ -3326,3 +3327,51 @@ static void register_vfio_pci_dev_type(void)
 }
 
 type_init(register_vfio_pci_dev_type)
+
+static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
+{
+    ERRP_GUARD();
+    VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
+
+    if (!udev->sock_name) {
+        error_setg(errp, "No socket specified");
+        error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
+        return;
+    }
+}
+
+static void vfio_user_instance_finalize(Object *obj)
+{
+}
+
+static Property vfio_user_pci_dev_properties[] = {
+    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vfio_user_pci_dev_properties);
+    dc->desc = "VFIO over socket PCI device assignment";
+    pdc->realize = vfio_user_pci_realize;
+}
+
+static const TypeInfo vfio_user_pci_dev_info = {
+    .name = TYPE_VFIO_USER_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOUserPCIDevice),
+    .class_init = vfio_user_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_user_instance_finalize,
+};
+
+static void register_vfio_user_dev_type(void)
+{
+    type_register_static(&vfio_user_pci_dev_info);
+}
+
+type_init(register_vfio_user_dev_type)
-- 
2.25.1


