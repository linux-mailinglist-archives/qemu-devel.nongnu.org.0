Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD4329798
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:06:53 +0100 (CET)
Received: from localhost ([::1]:35162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0zU-0000hk-MO
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lH0wZ-0006vT-Pu
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:03:51 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lH0wY-0007GG-0a
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:03:51 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1228xh1X104771;
 Tue, 2 Mar 2021 09:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=E5gWsRRi4hJJ1K33+RTqX6vbF34BL22NtXlwsD69b4Q=;
 b=uR6QhADz1fEizsDOVIBXEDekkI3fE1dPfNKPB+MJ2UA8zjh/Zikw5BSewhoBJLzhmsYj
 ZFUBRnWgAEaxER2hNuGnD29h9uTXFT6ZAdRMnAqHdiWHM41yBw0XNumqRPNubzQ0T2k8
 0dnvFE5oQ/FfsXWkMPsfYBSPqjqnr0jnI/alpJTJGn8hZZ0K/F4QcdJFiJBONSARcNqS
 lgnFspKkFuTyjCLUgMrVQY+B1YAeqTt4n/6j1EPcLfF/AiAx7+IO36KW9gxAFP57wfc0
 ZkdvtROqnoJM9HVXUkKhJzOoVJw2bpYALLFOEwO2x38NiRKpLIdeQ/Bl5ouyoii0R7Fj oQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 371hhc05en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Mar 2021 09:03:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12290wIs007521;
 Tue, 2 Mar 2021 09:03:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3030.oracle.com with ESMTP id 37000wpt4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Mar 2021 09:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiymEC4Us/kKc+3i/aTOdumJD+l+wfHiB609ilC3dq5TX3+2EMrOdJP8RBlIN7hHU1JOImSfIAz+JfI7BV+XsxuNEKcpMzVc11/qJLLQSpZOb4vtByaafV1bgBMfai+A4Bs1BlJYsbLVbHTdHjSBN4JpuHXz5aiusk7uAyAflA8f+FLjx4a8twHMtqCaEBLgoSCUBYyjba7BDlYvRkeoLKM4msZotD4H+UU6uqKXQ/QZ6/cxRsiwKmVk6TIGzQYNapowx/Rv7jIx+QeYkEILIB/872XqRmyYDnI+aIGQNSFhLTrY3cD1ImDWFOFet20YYCACNCgSjAwtTioiJqmOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5gWsRRi4hJJ1K33+RTqX6vbF34BL22NtXlwsD69b4Q=;
 b=QpbE2IiAYNkplZoRiaWazH6zf/sUfRBUDUPPCHa0k7lYp4DyNm2135Vpw3ZyVYmnKkkMe0K1z+Hi2WgxI1Y7aHAk71jS6pvRNzfQV1qnwV7Z9XVaJ1Do0YxKBDzOHdJ6R6mnUbRUgnRwOY14627hsDR2SlsgHiXU9bUfRdsy4jS/ficiovPfz7F9JE+wjy6jS1XFATHrjYd/FTQ0xN7tFGFZM91qLobdq+PZ067bKqkJUGbv0Lu9pSebeyxTHAV75eVP4qeKvTzUTFJrDp3/RAph5Kluxb21JO7Z9k9C/6uve/KgJytCtjls5w0MvtSsVpaIho0n3745IYbTX8aiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5gWsRRi4hJJ1K33+RTqX6vbF34BL22NtXlwsD69b4Q=;
 b=ALaJ75E2xHx3jVnxrp3ek64U7cxnpX8tTwoMV1OV9q014IPwGlCKW5U6vVAxMZdr//1n3sL5vqc3NbebCgAJxFGQy//PBZYj78RgHgdvRC82iNWwpS+cSTn+NSWf95NEtw/U7EQ2PD1vboQolpqpvCmGbcC7pxf5GLoKoM4zqzU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB4396.namprd10.prod.outlook.com (2603:10b6:5:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 09:03:23 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 09:03:23 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] elf_ops: correct loading of 32 bit PVH kernel
Date: Tue,  2 Mar 2021 09:03:14 +0000
Message-Id: <20210302090315.3031492-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210302090315.3031492-1-david.edmondson@oracle.com>
References: <20210302090315.3031492-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::27) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0159.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Tue, 2 Mar 2021 09:03:22 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 63051dbd;
 Tue, 2 Mar 2021 09:03:16 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 880afb92-1765-4190-1a3e-08d8dd5a0898
X-MS-TrafficTypeDiagnostic: DM6PR10MB4396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB43965BEAD5F4FC537BA4C92A88999@DM6PR10MB4396.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAM+14xc0tXFpzYtsIZ6bH1oALelIQ2zDIDejH25DydjjKoNHBDDCXJ/V1bRBvbZ/CTIOcvMYefqys/qgNjx9G5uz7MSMDPEKATvD7Gcx3iHZdaXr5ElF0eCdVAFaILKLK5TNIIw8+49nKDGFsrlf+1Vu/nlW+Gr1ABQO0f+k3mvNQr7qwpkPaC0MyLAWBWpjQ7lge4a9WO5WginsgfC+ubvVk5P5RCtvu1abD4UHnK2L2UPpEYcX5GylE7cgaKffHBsSuf6YeCxopFv1Vy8MHNx8n1BbsirQd18MMlI4D3DlC1Hv8DKzjp/vw1GlJCDMAkR78F2DKc5M8OGgdrUtKr2llr+daBALy9N/3bsRIhB16aCfVR9TuOA3TmlzUTTV22BiST4yIA5p9QKqPfN+aKWrefyAznRdlTVGoIUTvO/ubobJVFe5PvTe5B6LksmB0zuUEyqoejDuxPwcje+aQbF56IDqvWSmxlHjxZj6+nyq3dVIqUmRHOJNmkyaZdXt+4uE0JEKLc4nR78+KOV9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(136003)(39860400002)(396003)(6916009)(44832011)(66556008)(2906002)(4326008)(5660300002)(66476007)(52116002)(66946007)(83380400001)(2616005)(36756003)(107886003)(8936002)(8676002)(478600001)(186003)(1076003)(54906003)(86362001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aUOmDyzycXD4CKQgi3+is9RJncnXDGOzWVjONi3l2VQc1x31/WILSaG+KZcG?=
 =?us-ascii?Q?2hj/ePd0ln53n6deXLKfhhqVpdwBn9gvHCglHbIHxInIEfDxT0QT1jimzdPU?=
 =?us-ascii?Q?HMqxD3xSNpLwGlsd1rHH9KRGmVwbHDZc5GRc9do5dkC8tEAmpARMLncpscs2?=
 =?us-ascii?Q?LxNNJ2TwTl8BhY5/3D+njZXJ4BX1zOFW832WIAab3BAMrqIQAQhUAFHwN/HE?=
 =?us-ascii?Q?W7pD/ARy1bRQKyvOU1o9PjvEjJ1+Js4iF4uintqasrCvcqBEF5nkyUa/Othx?=
 =?us-ascii?Q?1CKHp2ZudpK4Y3/MAab6u22EtkOs/tVzdFXYgsIAIzLrgrHSk3eAX3YnhmoS?=
 =?us-ascii?Q?dZvAAphOOl3f0R5BfYp4piAaqVnMPyKjqEnDh+8GnbCRnC3L1tjgP3wIFdYB?=
 =?us-ascii?Q?PdCaAOYxMVG+a2Um0uL/S57DLLNe+FJ0gUHLCRJG3+XV6JIuk2s6x0gtGmwn?=
 =?us-ascii?Q?3Y5IhmVKuM9GtGQFU6ndgB6yY2sIPmmGYAsrnSu1QsIbiXvRS2MM/wHbHzyX?=
 =?us-ascii?Q?QXANnuwUL29HqQGFeUdLqO1j0/O6JhvaDHoL84A4KsiitRNnoYO4WuTU+gUd?=
 =?us-ascii?Q?ofTG0+BIjdt8uJRreMhfYq4FJsRWbck4i+116D8jC6Wou0EGe6svHqGqTC1h?=
 =?us-ascii?Q?L9Zw6spEVCRPlpdN9hmooi3tcHbRM+Ie4fuesB2F+ic+Zffh1snbliEfe+9d?=
 =?us-ascii?Q?S07lS87XPDTpVwpqtr207UPtjodFZwqRO7Hqkbz3UUGZQkme2KinYxePCzGa?=
 =?us-ascii?Q?uWXFUuw/bq8k/2k44Ag9MU59NlAEkFjRdcbS+xY1iBNEem/AEYkYhJGONMmw?=
 =?us-ascii?Q?WWh0lMlaf7PISiIbJ8JM/kU8mv5ExSNMT8MlezovPAjQJVXNtPGdXha3irlj?=
 =?us-ascii?Q?P1fDmThBm+OFtpnCxCIHVdS58gZ9FdenfRDxn1sMF/+XFKAnWempMQEcadL8?=
 =?us-ascii?Q?xSAdsKPR46ETlTGLwv0sUxzQsKA99J3iLDMTYuf3c8a3Qy/UWje/RKIhcbSB?=
 =?us-ascii?Q?FVudB76ZfVkolQcfy9kmgWl9wbTArszPghYPjEojwpDuuHbpZMuoHvNL6Msz?=
 =?us-ascii?Q?NIPHVwSMHgiZG6ScGNcc6uKGUCccP2jBgS7v7Hv69jbBCp1oU5ts8nmgUwqo?=
 =?us-ascii?Q?YhHBtJFViieAl9eIE+2V0MLrT36n0m7BG8o4XlPdQhetEmhKkANyw577DZa8?=
 =?us-ascii?Q?DNp7f98AE8L9lgUoeiTkWWwHxgJze6UFk30jr0AdQuVQzO1mOIMZgr/z6n1h?=
 =?us-ascii?Q?3C7EzVfZJhoUI5M6tRS982lGRb2DqkMzk4hxGHaSTh+V86HBbBX0KkzI3vEH?=
 =?us-ascii?Q?MlYM9ZRYnI8p/UG2L7vm5HTCzrzu70YKqnViGGl+TIjkKg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880afb92-1765-4190-1a3e-08d8dd5a0898
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 09:03:23.5925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swiYjuPutrQhFGeGRNdhB9clr9+U8QdKwv/9I18s9iQ70yZ0XTxTgc0tOcGb0tuxkf53qG1AzzFoXdRkt8TUaLqpPNakEPQ8ENCsWiuWAHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4396
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020075
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020075
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because sizeof(struct elf64_note) == sizeof(struct elf32_note),
attempting to use the size of the currently defined struct elf_note as
a discriminator for whether the object being loaded is 64 bit in
load_elf() fails.

Instead, take advantage of the existing glue parameter SZ, which is
defined as 32 or 64 in the respective variants of load_elf().

Fixes: 696aa04c84c6 ("elf-ops.h: Add get_elf_note_type()")
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 include/hw/elf_ops.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 8e8436831d..78409ab34a 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -598,9 +598,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
             nhdr = glue(get_elf_note_type, SZ)(nhdr, file_size, ph->p_align,
                                                *(uint64_t *)translate_opaque);
             if (nhdr != NULL) {
-                bool is64 =
-                    sizeof(struct elf_note) == sizeof(struct elf64_note);
-                elf_note_fn((void *)nhdr, (void *)&ph->p_align, is64);
+                elf_note_fn((void *)nhdr, (void *)&ph->p_align, SZ == 64);
             }
             data = NULL;
         }
-- 
2.30.0


