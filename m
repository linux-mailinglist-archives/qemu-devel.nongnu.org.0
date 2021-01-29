Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650A308ADA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:07:14 +0100 (CET)
Received: from localhost ([::1]:36992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XEn-0005Fr-K2
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvm-0007HV-9k
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:34 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:57100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wve-0005nT-R6
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:34 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPJ5P181241;
 Fri, 29 Jan 2021 16:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=m/nK72ElBZCX/0NZTVdXJLBFePl5YhCY0oQZtUVN168=;
 b=EZwbWNRlgbHvcdzTX5MLbguP+nC9tp9mT37Dh2wlH4Z9sjVnLxF4ovT2Jazvze2Zqerz
 hQHSUY7oaNX9+Q5ug9yhd4GEFPb1Zn8tgDAd+UyoAHdbK/RoyC4cwIgEtJSOlCpqohTj
 mD1LhRvKkk9QljO939m3SLr5Ar2+bKUnp9zEAIfUwWOqVTmgB+BjrPFiuXt4b4zuls3y
 PLc7uhGUmgXxZN9IsmL9C3YDzPFDXM2MMhmJ3Fk5wWjyIr2wDLGyS7qOqG4UVqt5gVuy
 sZazwqy/SmSR1TUwq18tBunkXdpI/TyI2gzrUGGW1kgo0j1Tt51iTewi6o7sur4/7Bhu dg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3689ab2e0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPu8I089763;
 Fri, 29 Jan 2021 16:47:17 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3020.oracle.com with ESMTP id 36ceugw3u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvWTGfygeJsvhDhNcAIJVwfErP1793rG1gYlkAiYbdI1WlF5p6B5yKY8ZDbHMCRBsS7+/3Q+6+zLn1zdTbztM/xf9ImSmjno9gzXaIbPGNiUN9lwaB/KLtQVdOX9A4BSB8zMjodU6qy+WUimDX6lDZOIB6JcQ/OoX6NFbJW67Q9pygLYt7LyCTlcQ+Iu9izkamzLsIeAjuU+B1h2UYrz7RJRuhdqrOUGMWNr06k9n42hiG8bfXU7ZXB4uXx3DnfkrfHlxEFG4wWRPWyU8DpdWn/Ac77PnVfyCzOpBBpE3J9z5GpCvITaO1tMMEZVFQHcwGqlf7ox1l1zAgvKK2LRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/nK72ElBZCX/0NZTVdXJLBFePl5YhCY0oQZtUVN168=;
 b=fL/s134BpbC0yucIjA49ySXWr8VZmltcWOl3TTz3bupnefwPbeEK96jxt+S1IFYsRram3x4Imo0a3NMeJHZVaJT7s46kZhOKSawPzMrNIHd9suZdDF2vCPzaU2B8Umuy2fQm4rSFcwdmrTfLRr38pvPuJyuapR6cPg4FIsZAEoeASO8gew8BYFskEYCVbGuNUZGgGV1w3BtfY2o9ml+8Uhzvd6XlaxM1MR/HrgK5ovRWF5iMbJveSOn7uNi5IrEQEBRxXxsRHGoWOuxvqdc3hucYRP0O9FeRe82arwKnDeu3Xcx28mYMfA6vUDkaiCwD5G7wnEBlbjbVkT3dZp+BQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/nK72ElBZCX/0NZTVdXJLBFePl5YhCY0oQZtUVN168=;
 b=Ttom7uZxqLLmUdqobyHBP1uBYKfCR38MWTNMOVbTCncP3GblyKiZKB5bvL7baukpCc8lGC/g4tjiL+rE6FrqUzFNvP4kS3dpHmLajrM8229PrjyCkkjXx8CfzjDn+sl4OMlVPRjeWijjQeTfz+8U36MdtOxazmYmp3AmyY+Rpu4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:47:14 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:47:14 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 18/20] multi-process: create IOHUB object to handle irq
Date: Fri, 29 Jan 2021 11:46:19 -0500
Message-Id: <51d5c3d54e28a68b002e3875c59599c9f5a424a1.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:47:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1efbf3-9b5e-4165-fab0-08d8c47587a9
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671671096043A03B4F82D0390B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MTWzxi/RXfKk8Jl7+8gAFuTngbZFEXwaUIbc9fR19zvjAUstFfWI/rPnjRK2/B/DEXg8NzOC95f18zD+jlxDSKkdBTSUMj2PFMd8HIIIAeXAY6Qzm7k0uoqbbI1FQiiVUeJj4ghZd1yt7FVRJ6ii3uOjoO+INN5QKVjYS21GgHxwgn6V9jjopdjIo2aCx6TFuKRoYpQBOM6rrL3K5BJciNpiKML2KAM22oa+EZfCSXPnkqxiLxi5Up+O9CXA/LB69dTwy73rW1k+rsPOHNL5FGeFMpkGsmC681tFcSsW1hakS7TvR5oXwoAetbmWsZs3uFtwCtztyofWprS/TYO+wBImK6Zb6zYQgEh4rpEj6UDFjfGwgc6A+4NiG7ly5CH+H68fcKeW4L8kSBOUhUwcW7kPhiYphxibNO/OOcznDWKPOgA6+Tmsh2IZhZH7HIvVycPYrOFWeMYF8viOOL5y/tA0tGYy1R8b5FUNKBpe7b1Tww5HcbcGBBZ2zI11WSaavXZyXS34EeveIFBmNID3AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(30864003)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b2l5a3VZNXZ2elJjUml3QWp4ck5zbjdEc1RYRitzOFF3WkFFd2tUTk9ETzly?=
 =?utf-8?B?N0FKM3hlekwxUjlrOXlaQTZSeFhBV2FTaG1NcVYzZDBmWmVXOWZsWi9CZHRq?=
 =?utf-8?B?NkkxM1FQYnRqcVAvaG5qcnpLRllSdUJMWnhuN2lTYTlHV3M4bVNWWjlNSmw4?=
 =?utf-8?B?TEYwalF3VnBFZ3hSNC9vZ1pTOFhUZTZVb1dQMHRXNkN5N2FYcFM2Q1JERWg1?=
 =?utf-8?B?MnNrd25PTWRRM3dFdjhXNCtnOWtXV004RDlrL1c2VzY4OU0wcGdWZytUSDZ1?=
 =?utf-8?B?K2tLR3FCTHp5NU55T2IrakdMQ3Rwb2VBYnVNdHVVZGV4QWR4bnFOMmNlR2Ja?=
 =?utf-8?B?MjFBWmU4SGUwczhLUGxSbUs2TFRtVDd5Wmt3S1YrWUU2WE94R0FXR0NIVkZM?=
 =?utf-8?B?VWw4b29nSVVEWlZqTmd4VjV1MUJTeS9KRS9YRHNwemhkVTVLVFQwT0Zwb1BM?=
 =?utf-8?B?VlhiMVlaU1ZUYXkwYmk5OTZZbS9kTnEwNFpFeFpTeUppUUlNejlRVHpkZ21u?=
 =?utf-8?B?SGN2ZXkxNWJKZjZVOTJETkNLbXpqTldiMG1nak1BKzlqNXFjdEFoL04vdUdR?=
 =?utf-8?B?TFFTblpTZ2RKRnlhQjkwZUk0ejQzaWdldElld2Nzcjh0cUNJTnNPRjE2SEYr?=
 =?utf-8?B?SlNmcnJYWm5lRXd6V2dweFNDT3ViRWRaM1Q2T0tqN3JNRk9Cb1JyRyt4cWd6?=
 =?utf-8?B?V2txR09yUVVicm5MZHF5dFUvRUJSbjlBcGk3QlpCSmhxTU1hTlREblN2blBW?=
 =?utf-8?B?RDl0amkvcms2TFlVOFdxS25zb0FLRGVldDVjNExGNm5wTjdWVVBQbnQzbHZ3?=
 =?utf-8?B?OW1CVkNyQXV6R0M5Z0ZUU0UwMEdEMkNmYkd5bVA4ZXNtSEMvcno2dXVlcHhD?=
 =?utf-8?B?cWdrS0psUVlCVHM2SE8rdGJVenBVZHFJb0N5RDAvVGV4SXo1NWNRUzZMeUhY?=
 =?utf-8?B?NnpuVFpESW1EVDc0WkM0VWlaT01KUkxFNk9HVTlRQ0ttOW1WcWFIWmZlMVh1?=
 =?utf-8?B?UXVnRVhySmJwSG5ESExMaDBOc1RSU3pMMXcrSStOc2NLWGNlVk5mcHN3OE8r?=
 =?utf-8?B?TE13NHNWenRNT1RoUkxSMFdQa0RlOVZpaVNYRUc3QUluVGJNZitnVFpSQlBU?=
 =?utf-8?B?NjRVcW1YZ09oMVhoaGs2QjN2ZnB6OXZ2U1k4K1N5d0ZVVnJkM1FZR24zY3Uv?=
 =?utf-8?B?SGJJUjRvWVQwMEwvSzNFa0lJOEMveFNlVnBUWlJRZzhnOTI0dTA2WDdyZmI2?=
 =?utf-8?B?L3Y2cGhpTnZQUkROOVJhcjM3MkQxZ1VsY2o3VWNlL2N6Vy9IOTY0V1p2UlRz?=
 =?utf-8?B?MzRyMjAyK0JyMDkwVXdsV005aThFSTRSZXdIeWVMa1ljQVJtTi9xTFMvcllS?=
 =?utf-8?B?YnV4SGI2QjIvVCtsTjNwVUZpcHpBaWZMNEU2eTNtekZ2eUJ6bDFoSVkyWkNC?=
 =?utf-8?Q?VMVSMt+p?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1efbf3-9b5e-4165-fab0-08d8c47587a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:47:14.1185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQNuzYE4rPmAbgXzhXA2xdI4BCYvfjx8xBI8gJawggGLFD872XGMTLWIZg2TfrdSnSdkh5EDNXEZU8WKY6Xk1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IOHUB object is added to manage PCI IRQs. It uses KVM_IRQFD
ioctl to create irqfd to injecting PCI interrupts to the guest.
IOHUB object forwards the irqfd to the remote process. Remote process
uses this fd to directly send interrupts to the guest, bypassing QEMU.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/pci/pci_ids.h        |   3 +
 include/hw/remote/iohub.h       |  42 ++++++++++++++
 include/hw/remote/machine.h     |   2 +
 include/hw/remote/mpqemu-link.h |   1 +
 include/hw/remote/proxy.h       |   4 ++
 hw/remote/iohub.c               | 119 ++++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c             |  10 ++++
 hw/remote/message.c             |   4 ++
 hw/remote/mpqemu-link.c         |   5 ++
 hw/remote/proxy.c               |  56 +++++++++++++++++++
 MAINTAINERS                     |   2 +
 hw/remote/meson.build           |   1 +
 12 files changed, 249 insertions(+)
 create mode 100644 include/hw/remote/iohub.h
 create mode 100644 hw/remote/iohub.c

diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11f8ab7..bd0c17d 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -192,6 +192,9 @@
 #define PCI_DEVICE_ID_SUN_SIMBA          0x5000
 #define PCI_DEVICE_ID_SUN_SABRE          0xa000
 
+#define PCI_VENDOR_ID_ORACLE             0x108e
+#define PCI_DEVICE_ID_REMOTE_IOHUB       0xb000
+
 #define PCI_VENDOR_ID_CMD                0x1095
 #define PCI_DEVICE_ID_CMD_646            0x0646
 
diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
new file mode 100644
index 0000000..0bf98e0
--- /dev/null
+++ b/include/hw/remote/iohub.h
@@ -0,0 +1,42 @@
+/*
+ * IO Hub for remote device
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOHUB_H
+#define REMOTE_IOHUB_H
+
+#include "hw/pci/pci.h"
+#include "qemu/event_notifier.h"
+#include "qemu/thread-posix.h"
+#include "hw/remote/mpqemu-link.h"
+
+#define REMOTE_IOHUB_NB_PIRQS    PCI_DEVFN_MAX
+
+typedef struct ResampleToken {
+    void *iohub;
+    int pirq;
+} ResampleToken;
+
+typedef struct RemoteIOHubState {
+    PCIDevice d;
+    EventNotifier irqfds[REMOTE_IOHUB_NB_PIRQS];
+    EventNotifier resamplefds[REMOTE_IOHUB_NB_PIRQS];
+    unsigned int irq_level[REMOTE_IOHUB_NB_PIRQS];
+    ResampleToken token[REMOTE_IOHUB_NB_PIRQS];
+    QemuMutex irq_level_lock[REMOTE_IOHUB_NB_PIRQS];
+} RemoteIOHubState;
+
+int remote_iohub_map_irq(PCIDevice *pci_dev, int intx);
+void remote_iohub_set_irq(void *opaque, int pirq, int level);
+void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg);
+
+void remote_iohub_init(RemoteIOHubState *iohub);
+void remote_iohub_finalize(RemoteIOHubState *iohub);
+
+#endif
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index b92b2ce..2a2a33c 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -15,11 +15,13 @@
 #include "hw/boards.h"
 #include "hw/pci-host/remote.h"
 #include "io/channel.h"
+#include "hw/remote/iohub.h"
 
 struct RemoteMachineState {
     MachineState parent_obj;
 
     RemotePCIHost *host;
+    RemoteIOHubState iohub;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 6303e62..71d206f 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -39,6 +39,7 @@ typedef enum {
     MPQEMU_CMD_PCI_CFGREAD,
     MPQEMU_CMD_BAR_WRITE,
     MPQEMU_CMD_BAR_READ,
+    MPQEMU_CMD_SET_IRQFD,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index 12888b4..741def7 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -12,6 +12,7 @@
 #include "hw/pci/pci.h"
 #include "io/channel.h"
 #include "hw/remote/proxy-memory-listener.h"
+#include "qemu/event_notifier.h"
 
 #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
@@ -38,6 +39,9 @@ struct PCIProxyDev {
     QIOChannel *ioc;
     Error *migration_blocker;
     ProxyMemoryListener proxy_listener;
+    int virq;
+    EventNotifier intr;
+    EventNotifier resample;
     ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
new file mode 100644
index 0000000..e4ff131
--- /dev/null
+++ b/hw/remote/iohub.c
@@ -0,0 +1,119 @@
+/*
+ * Remote IO Hub
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_ids.h"
+#include "hw/pci/pci_bus.h"
+#include "qemu/thread.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "hw/remote/iohub.h"
+#include "qemu/main-loop.h"
+
+void remote_iohub_init(RemoteIOHubState *iohub)
+{
+    int pirq;
+
+    memset(&iohub->irqfds, 0, sizeof(iohub->irqfds));
+    memset(&iohub->resamplefds, 0, sizeof(iohub->resamplefds));
+
+    for (pirq = 0; pirq < REMOTE_IOHUB_NB_PIRQS; pirq++) {
+        qemu_mutex_init(&iohub->irq_level_lock[pirq]);
+        iohub->irq_level[pirq] = 0;
+        event_notifier_init_fd(&iohub->irqfds[pirq], -1);
+        event_notifier_init_fd(&iohub->resamplefds[pirq], -1);
+    }
+}
+
+void remote_iohub_finalize(RemoteIOHubState *iohub)
+{
+    int pirq;
+
+    for (pirq = 0; pirq < REMOTE_IOHUB_NB_PIRQS; pirq++) {
+        qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
+                            NULL, NULL, NULL);
+        event_notifier_cleanup(&iohub->irqfds[pirq]);
+        event_notifier_cleanup(&iohub->resamplefds[pirq]);
+        qemu_mutex_destroy(&iohub->irq_level_lock[pirq]);
+    }
+}
+
+int remote_iohub_map_irq(PCIDevice *pci_dev, int intx)
+{
+    return pci_dev->devfn;
+}
+
+void remote_iohub_set_irq(void *opaque, int pirq, int level)
+{
+    RemoteIOHubState *iohub = opaque;
+
+    assert(pirq >= 0);
+    assert(pirq < PCI_DEVFN_MAX);
+
+    QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
+
+    if (level) {
+        if (++iohub->irq_level[pirq] == 1) {
+            event_notifier_set(&iohub->irqfds[pirq]);
+        }
+    } else if (iohub->irq_level[pirq] > 0) {
+        iohub->irq_level[pirq]--;
+    }
+}
+
+static void intr_resample_handler(void *opaque)
+{
+    ResampleToken *token = opaque;
+    RemoteIOHubState *iohub = token->iohub;
+    int pirq, s;
+
+    pirq = token->pirq;
+
+    s = event_notifier_test_and_clear(&iohub->resamplefds[pirq]);
+
+    assert(s >= 0);
+
+    QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
+
+    if (iohub->irq_level[pirq]) {
+        event_notifier_set(&iohub->irqfds[pirq]);
+    }
+}
+
+void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg)
+{
+    RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
+    RemoteIOHubState *iohub = &machine->iohub;
+    int pirq, intx;
+
+    intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    pirq = remote_iohub_map_irq(pci_dev, intx);
+
+    if (event_notifier_get_fd(&iohub->irqfds[pirq]) != -1) {
+        qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
+                            NULL, NULL, NULL);
+        event_notifier_cleanup(&iohub->irqfds[pirq]);
+        event_notifier_cleanup(&iohub->resamplefds[pirq]);
+        memset(&iohub->token[pirq], 0, sizeof(ResampleToken));
+    }
+
+    event_notifier_init_fd(&iohub->irqfds[pirq], msg->fds[0]);
+    event_notifier_init_fd(&iohub->resamplefds[pirq], msg->fds[1]);
+
+    iohub->token[pirq].iohub = iohub;
+    iohub->token[pirq].pirq = pirq;
+
+    qemu_set_fd_handler(msg->fds[1], intr_resample_handler, NULL,
+                        &iohub->token[pirq]);
+}
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 9519a6c..c0ab4f5 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,12 +20,15 @@
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
 #include "qapi/error.h"
+#include "hw/pci/pci_host.h"
+#include "hw/remote/iohub.h"
 
 static void remote_machine_init(MachineState *machine)
 {
     MemoryRegion *system_memory, *system_io, *pci_memory;
     RemoteMachineState *s = REMOTE_MACHINE(machine);
     RemotePCIHost *rem_host;
+    PCIHostState *pci_host;
 
     system_memory = get_system_memory();
     system_io = get_system_io();
@@ -45,6 +48,13 @@ static void remote_machine_init(MachineState *machine)
     memory_region_add_subregion_overlap(system_memory, 0x0, pci_memory, -1);
 
     qdev_realize(DEVICE(rem_host), sysbus_get_default(), &error_fatal);
+
+    pci_host = PCI_HOST_BRIDGE(rem_host);
+
+    remote_iohub_init(&s->iohub);
+
+    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
 }
 
 static void remote_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 25341d8..adab040 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -18,6 +18,7 @@
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "hw/remote/memory.h"
+#include "hw/remote/iohub.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
@@ -65,6 +66,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_SYNC_SYSMEM:
             remote_sysmem_reconfig(&msg, &local_err);
             break;
+        case MPQEMU_CMD_SET_IRQFD:
+            process_set_irqfd_msg(pci_dev, &msg);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index bcb32e0..4342245 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -254,6 +254,11 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case MPQEMU_CMD_SET_IRQFD:
+        if (msg->size || (msg->num_fds != 2)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 472b2df..555b310 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -21,6 +21,57 @@
 #include "qemu/error-report.h"
 #include "hw/remote/proxy-memory-listener.h"
 #include "qom/object.h"
+#include "qemu/event_notifier.h"
+#include "sysemu/kvm.h"
+#include "util/event_notifier-posix.c"
+
+static void proxy_intx_update(PCIDevice *pci_dev)
+{
+    PCIProxyDev *dev = PCI_PROXY_DEV(pci_dev);
+    PCIINTxRoute route;
+    int pin = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    if (dev->virq != -1) {
+        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &dev->intr, dev->virq);
+        dev->virq = -1;
+    }
+
+    route = pci_device_route_intx_to_irq(pci_dev, pin);
+
+    dev->virq = route.irq;
+
+    if (dev->virq != -1) {
+        kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &dev->intr,
+                                           &dev->resample, dev->virq);
+    }
+}
+
+static void setup_irqfd(PCIProxyDev *dev)
+{
+    PCIDevice *pci_dev = PCI_DEVICE(dev);
+    MPQemuMsg msg;
+    Error *local_err = NULL;
+
+    event_notifier_init(&dev->intr, 0);
+    event_notifier_init(&dev->resample, 0);
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+    msg.cmd = MPQEMU_CMD_SET_IRQFD;
+    msg.num_fds = 2;
+    msg.fds[0] = event_notifier_get_fd(&dev->intr);
+    msg.fds[1] = event_notifier_get_fd(&dev->resample);
+    msg.size = 0;
+
+    if (!mpqemu_msg_send(&msg, dev->ioc, &local_err)) {
+        error_report_err(local_err);
+    }
+
+    dev->virq = -1;
+
+    proxy_intx_update(pci_dev);
+
+    pci_device_set_intx_routing_notifier(pci_dev, proxy_intx_update);
+}
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
@@ -56,6 +107,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
     qio_channel_set_blocking(dev->ioc, true, NULL);
 
     proxy_memory_listener_configure(&dev->proxy_listener, dev->ioc);
+
+    setup_irqfd(dev);
 }
 
 static void pci_proxy_dev_exit(PCIDevice *pdev)
@@ -71,6 +124,9 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     error_free(dev->migration_blocker);
 
     proxy_memory_listener_deconfigure(&dev->proxy_listener);
+
+    event_notifier_cleanup(&dev->intr);
+    event_notifier_cleanup(&dev->resample);
 }
 
 static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
diff --git a/MAINTAINERS b/MAINTAINERS
index b8b24d6..f4cb80f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3202,6 +3202,8 @@ F: hw/remote/proxy.c
 F: include/hw/remote/proxy.h
 F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
+F: hw/remote/iohub.c
+F: include/hw/remote/iohub.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 7f11be4..e6a5574 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -5,6 +5,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
-- 
1.8.3.1


