Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42943C935
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:06:27 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhhK-0005hG-WB
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKk-0001JN-Bc; Wed, 27 Oct 2021 07:43:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKi-00071Y-2p; Wed, 27 Oct 2021 07:43:06 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBg7IN023568; 
 Wed, 27 Oct 2021 11:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DV14n7/S3wz2kgp24JFARftbQItwO4FTT3Cksm1E1Ro=;
 b=QrcItNyKt8eSEYt3cXarRc91fsU3yowNv5yKUgYPR8wxtsUkfu5sF1NOLFep3SbVwGRV
 zpKqbpzU+Zzj7uHw1XziL1kiAFHr8CeEQY/F6BlX3eaJlgVPqKjCZpA2Tc6uAGflZzIo
 FKHCip0rnROtSnvFTvuBAk0l1iwZJZyJjMB9Vr8a+yy9z38ss4s4gx8n7L5HnKAHDay1
 2KCJQIW5eeC+zONZP/tFjMOtwscnJNKetdVQCRMtb5DY11vk+lgd+Vi/Ze8OQTFYXCgr
 ODGJZeNsaWRIMTR+0f29+cKTZFN2SStjmEDhq0XfaIR7AkIF42G5XBHB9h5pD9gHgVyZ VA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj2mtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RBfHKh159674;
 Wed, 27 Oct 2021 11:42:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by aserp3030.oracle.com with ESMTP id 3bx4g9sr25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1TNQ3pvefwOWRANu6MDak/cc/ypBDjPegBA/rpvIinDYK4IWoGQ7+L4bdqub4t7rKHlPfF6ECQlV/ls6KprIGGPNM53KYyx0w1ED2KG/CwtrnCWS4vPkXAM/GHIIXgX2VJyGpbX37eJPR/+QGVhTGgikMIsbH4ujkbVQd4uVQidw6KY6P4KJoPFM2sXKSOip194P4ym7VTZdE/IZwHz71/e16RUudl0GUWWQn0E0lL+3fh1CX4V65OhgTiIg1iW9bJ+PLEQVrrnS91adrJ/9AXsHsoKUKrUT9+3rwi7EGfYR7AKlsVtpDxdDYazj2DjF4dxhi4p/mnSKvLMpyrYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DV14n7/S3wz2kgp24JFARftbQItwO4FTT3Cksm1E1Ro=;
 b=OMSsW1336egnehZox1bwCMvLWeGVutSD0q2vApGdpc3gTmaZ1OxNTXHN+t6CzDHZxAJMgeI42wSf5P5yiseV1hM7o+tZv0451TSxe2Dk9tvPaMVL3otSm7pDgA91tQkVWm20Rrw/cz6II59yVfzqBL7qXhZ3D3eprD2wXETJh6Mb9MmQi94bwy1r8dM2AKLuxZGxrEiDm9zx+fM4lKT/9WQi+ClQIpIudzz8RZPr3QyVk6avhi0m3Pg0UUZYNy01U5TutGuq2v7LElIUEiAl9qRD01h0WURNl9yRqKZ/qKOQmq3Qn2lJgLVKC+AWqr+lUND+97vcEdpqQddb4fdfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DV14n7/S3wz2kgp24JFARftbQItwO4FTT3Cksm1E1Ro=;
 b=ZxjY/imyFAr+4CDi+bJdOl+QTo6Qogza6zitcTJjjK969tYexBSaKRl+pc4Za6WW+qd/BB9OiisrLZadk4flMIMfGTbOXzIUlpho8D1BZoFszlUn36quwL91MO+R+riChfS7d3Dsr6ob+BGGFZsrQGtFh3OfyXbcRLad4Ftz04g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:42:41 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:42:41 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/8] qmp: add QMP command x-debug-virtio-status
Date: Wed, 27 Oct 2021 07:41:45 -0400
Message-Id: <1635334909-31614-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.40) by
 SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Wed, 27 Oct 2021 11:42:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e69e642d-963d-4931-8af7-08d9993ee238
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB47449CD8318F43386ED71530E8859@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Rgl9LaGnnbeitq3inN2xQaefcrBizBZP3LgMKZiClmvXiXamV4vVGb5RxXIhaix+U2JFny1exuiX+W5zZNs0fNbSVPrpODM4DTQCS8jpKQjoTGI0wopmNe02MPE0lOcLuOV3nY/Fl50VSIJs4ojnhLAYPGWX+h1KLaZhk+irmWUSZSDHkZVydcCLM5NC1pTUWNg+rTW6pbyhjk+3u6HoSRhU6XiF6yr3H4A1cDUT0Tjb5ZHbmmGrf+NHZqQj4gJM3w75l0zwTMB7s+WroIMWpPCcvttDQQSd1zQHUek6MTPZU0gkYEJVKbLlu6fmpRrgSC6XOa3dfTHF5I8H00+Y9hihC6HMqzR6dBqpDzj5J4NBxT8BdfvfhugmLZCuhVUYSCYHepS6r4rTjqTSAzL/AoTrnsPWwJbdL8RzErdcsn5rYNSOn7UzhE2yLvSGu7ExEeNzgb94f2IsmQozgpuDB8wQdfS7PyLGQ36YBivKIpLgxdTSTcgihR4OoFjq3/JRXoNrRYsesKFYehSpOqebO2YTEEkSmKcNU8pOuSfW1ponKiUecmEPOOEx5QBXPe7kCoMKuU2ONKvHoNeBDc5lkEmwTCIj7fa4fKpsF15NKk45hZ9IpG0cljP2zVXqVPxaFjClqNro5bJ3QxrNCReg+hbkXfkw33FJpSLaKaRa7thy1btmsn+/uQ2XUhk7SSK5qRh1SWACtB9y7PgQ+QivA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(44832011)(26005)(4326008)(316002)(38350700002)(38100700002)(8936002)(6916009)(956004)(36756003)(2616005)(2906002)(30864003)(86362001)(83380400001)(7416002)(5660300002)(52116002)(508600001)(6666004)(8676002)(186003)(66946007)(6486002)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uxc4VmR7uu++QRBQWbWPbE5xE3/nav+LufE5/Qa5iWYGtxKIskuCzUyk4Qys?=
 =?us-ascii?Q?gxJoA3kAsqabsxJw/OiIHWFznUt/b3ZN6bY+JmE6ByAqgRqpsSjG+6cK1eOu?=
 =?us-ascii?Q?BD15SCWT1MrcaS5jQTJHE7sp8tX25QwXxcJ8F3ZP8JqsPsnkCImT54uxsPpD?=
 =?us-ascii?Q?op9O9OqbqGh1K6r7TL7m/GULzloS8GP/t54BztyXyHm08SkqlNyhFHYdjOKH?=
 =?us-ascii?Q?eRFoEoHZyAhuhRtLwVx4v+W2IwjThlAoO4pPfS49ZrhtCTyJHwQybuTj/Ggq?=
 =?us-ascii?Q?NX1zakNfTx2jNV6yYvnfxFiythGC9e2xbqnmsT/HqvCuQGHoXcAW1iP00rB6?=
 =?us-ascii?Q?PoFUoTHcXrSwHTPWpD0H1EMRZTKFX3RBObgDyTl9npO9kcldhBOyA2G8ocQ5?=
 =?us-ascii?Q?z3Xh1Gt1/cHwqmzHnWrrKWzRirqQVpFscfTb0AgnjaxAjf/Stw17wFg4vCV1?=
 =?us-ascii?Q?csj7J9/Upb9l5B8NKUh8HP6OSexOwhG0eIu+5c1uS7aB8ybwQr98ezerEMfM?=
 =?us-ascii?Q?tPVrosGRO1sgbQ+In7NrBYgpLhgmCAZxlBr5Bts51YMS0q0p/zdbI5FeknJl?=
 =?us-ascii?Q?UTQuDYfKWMtUmmV01wanNe4Ni57w8MJix67eiPo3JRMjmuEWTVTLQVIwYwqc?=
 =?us-ascii?Q?hQ+tH771ygMG01Ma8VT13L0+DoV/HBLzgS8lrbXFmW7Na1S326Rfkb050/LD?=
 =?us-ascii?Q?xJEK99Iuko5pnDKJTCDN8jtNY3SM6BD6c8QckLXwSaptr7wM9vup17KT36cp?=
 =?us-ascii?Q?6qzUlaTgT7SP93PsJoAHmik/g2gxHD4eXFEIQfBXmFaVLqWJJisWi1df5r2/?=
 =?us-ascii?Q?NSiA4qXiwtTMhMLxQjZWN/q0FahcBtZUoA/R7ZqnicKAXNuH5d21jXScIami?=
 =?us-ascii?Q?I++pU0IJ9CPMsH/8YT6R6jSbwYVD1W8MHY6VcgT1A11r23Z84750v6IcC55d?=
 =?us-ascii?Q?bi8gX0y2J3rf2NOKMIj1vV+11p4wZ4PcpRhGcphPrjSpsjCJTrbP/bE8oUmf?=
 =?us-ascii?Q?WcE+kdf+uE70vD2CoQi4SV/oSr9mA0I8ZQquwnVf71eXxygZKnkTmp6myvf6?=
 =?us-ascii?Q?n/6c+2eU2AHmI4P2m8V8zbbuVFen+/u9mp6RMWbv+qABgicr7dI+Ae3Pwji8?=
 =?us-ascii?Q?lpslpZNuy86MpLNjzAwCgHm3X6gOZOggzTz5DbjsF+AppZDSMKF7WnrhtMEa?=
 =?us-ascii?Q?31FDkFksDMpb6WnPc2pA3iOa4KoeeE4lkaM9QeFwXA0/UMg1qNavCbYSpJzg?=
 =?us-ascii?Q?PLTR+FFWpINo8Ryo9GsE9PGnvFH0Qc3UCWd8qd3wacFyjLKoqflAdl1Urntn?=
 =?us-ascii?Q?oOrNGMACt98DiLPm0qwd0JJm0TDdRRxsqf96Q0/U5zUQ/EwhQqlBNCBg9moO?=
 =?us-ascii?Q?M+ciAZpzjHbPiU8iNXhb3vTwDZ67gFl0JHmcW2s6u3+l/a8B6tDynRmGngpq?=
 =?us-ascii?Q?jiOJH0nUbx2x2xUPxpP0ExEH/gPobM+e4ZPiL93P9c5j9cChGUkvuT5BbKvZ?=
 =?us-ascii?Q?pBt3FXOCakPCujg7LCIOU/EettZznVWar2mhsXzlWAIE3SYfHtcHixDYv1yr?=
 =?us-ascii?Q?Z6epGwMRU3+4i9Vy+WIUDfj9owdsAPc9ydk21yJZvdiSSAgfcP9JL8/Gy0sH?=
 =?us-ascii?Q?TpxzoQfPTOPCTiPNu2yoUXE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69e642d-963d-4931-8af7-08d9993ee238
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:42:41.3219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzbMmZwMelbeDcHGYCxn5NoXWNpYIFa7k6U4G6cilxJx5/wkaE0kE6focHCnqd58gm5cb0bmTOQ1xS6tnO7PFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270071
X-Proofpoint-GUID: 99-hRZFed_Nis5fzkTlplwX_zEuoPp5R
X-Proofpoint-ORIG-GUID: 99-hRZFed_Nis5fzkTlplwX_zEuoPp5R
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the status of a VirtIODevice, including
its corresponding vhost device status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

Next patch will also suppress the vhost device field from displaying
if no vhost device is active for a given VirtIODevice.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   5 +
 hw/virtio/virtio.c      |  96 ++++++++++++++++++
 qapi/virtio.json        | 255 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 356 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index d4a88f5..ddb592f 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ad17be7..8d13d27 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3933,6 +3933,102 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
     return list;
 }
 
+static VirtIODevice *virtio_device_find(const char *path)
+{
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+
+        if (strcmp(dev->canonical_path, path) != 0) {
+            continue;
+        }
+        return vdev;
+    }
+
+    return NULL;
+}
+
+VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtioStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    status = g_new0(VirtioStatus, 1);
+    status->vhost_dev = g_new0(VhostStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->device_id = vdev->device_id;
+    status->vhost_started = vdev->vhost_started;
+    status->guest_features = vdev->guest_features;
+    status->host_features = vdev->host_features;
+    status->backend_features = vdev->backend_features;
+
+    switch (vdev->device_endian) {
+    case VIRTIO_DEVICE_ENDIAN_LITTLE:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_LITTLE;
+        break;
+    case VIRTIO_DEVICE_ENDIAN_BIG:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_BIG;
+        break;
+    default:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_UNKNOWN;
+        break;
+    }
+
+    status->num_vqs = virtio_get_num_queues(vdev);
+    status->status = vdev->status;
+    status->isr = vdev->isr;
+    status->queue_sel = vdev->queue_sel;
+    status->vm_running = vdev->vm_running;
+    status->broken = vdev->broken;
+    status->disabled = vdev->disabled;
+    status->use_started = vdev->use_started;
+    status->started = vdev->started;
+    status->start_on_kick = vdev->start_on_kick;
+    status->disable_legacy_check = vdev->disable_legacy_check;
+    status->bus_name = g_strdup(vdev->bus_name);
+    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
+        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
+        status->vhost_dev->nvqs = hdev->nvqs;
+        status->vhost_dev->vq_index = hdev->vq_index;
+        status->vhost_dev->features = hdev->features;
+        status->vhost_dev->acked_features = hdev->acked_features;
+        status->vhost_dev->backend_features = hdev->backend_features;
+        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->max_queues = hdev->max_queues;
+        status->vhost_dev->backend_cap = hdev->backend_cap;
+        status->vhost_dev->log_enabled = hdev->log_enabled;
+        status->vhost_dev->log_size = hdev->log_size;
+    } else {
+        status->vhost_dev->n_mem_sections = 0;
+        status->vhost_dev->n_tmp_sections = 0;
+        status->vhost_dev->nvqs = 0;
+        status->vhost_dev->vq_index = 0;
+        status->vhost_dev->features = 0;
+        status->vhost_dev->acked_features = 0;
+        status->vhost_dev->backend_features = 0;
+        status->vhost_dev->protocol_features = 0;
+        status->vhost_dev->max_queues = 0;
+        status->vhost_dev->backend_cap = 0;
+        status->vhost_dev->log_enabled = false;
+        status->vhost_dev->log_size = 0;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 4490c2c..656a26f 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -65,3 +65,258 @@
 ##
 
 { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
+
+##
+# @VirtioStatusEndianness:
+#
+# Enumeration of endianness for VirtioDevice
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioStatusEndianness',
+  'data': [ 'unknown', 'little', 'big' ]
+}
+
+##
+# @VhostStatus:
+#
+# Information about a vhost device. This information will only be
+# displayed if the vhost device is active.
+#
+# @n-mem-sections: vhost_dev n_mem_sections
+#
+# @n-tmp-sections: vhost_dev n_tmp_sections
+#
+# @nvqs: vhost_dev nvqs. This is the number of virtqueues being used
+#        by the vhost device.
+#
+# @vq-index: vhost_dev vq_index
+#
+# @features: vhost_dev features
+#
+# @acked-features: vhost_dev acked_features
+#
+# @backend-features: vhost_dev backend_features
+#
+# @protocol-features: vhost_dev protocol_features
+#
+# @max-queues: vhost_dev max_queues
+#
+# @backend-cap: vhost_dev backend_cap
+#
+# @log-enabled: vhost_dev log_enabled flag
+#
+# @log-size: vhost_dev log_size
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VhostStatus',
+    'data': {
+        'n-mem-sections': 'int',
+        'n-tmp-sections': 'int',
+        'nvqs': 'uint32',
+        'vq-index': 'int',
+        'features': 'uint64',
+        'acked-features': 'uint64',
+        'backend-features': 'uint64',
+        'protocol-features': 'uint64',
+        'max-queues': 'uint64',
+        'backend-cap': 'uint64',
+        'log-enabled': 'bool',
+        'log-size': 'uint64'
+    }
+}
+
+##
+# @VirtioStatus:
+#
+# Full status of the virtio device with most VirtIODevice members.
+# Also includes the full status of the corresponding vhost device
+# if the vhost device is active.
+#
+# @name: VirtIODevice name
+#
+# @device-id: VirtIODevice ID
+#
+# @vhost-started: VirtIODevice vhost_started flag
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @num-vqs: VirtIODevice virtqueue count. This is the number of active
+#           virtqueues being used by the VirtIODevice.
+#
+# @status: VirtIODevice configuration status (e.g. DRIVER_OK,
+#          FEATURES_OK, DRIVER, etc.)
+#
+# @isr: VirtIODevice ISR
+#
+# @queue-sel: VirtIODevice queue_sel
+#
+# @vm-running: VirtIODevice vm_running flag
+#
+# @broken: VirtIODevice broken flag
+#
+# @disabled: VirtIODevice disabled flag
+#
+# @use-started: VirtIODevice use_started flag
+#
+# @started: VirtIODevice started flag
+#
+# @start-on-kick: VirtIODevice start_on_kick flag
+#
+# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
+#
+# @bus-name: VirtIODevice bus_name
+#
+# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
+#
+# @vhost-dev: corresponding vhost device info for a given VirtIODevice
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioStatus',
+    'data': {
+        'name': 'str',
+        'device-id': 'uint16',
+        'vhost-started': 'bool',
+        'guest-features': 'uint64',
+        'host-features': 'uint64',
+        'backend-features': 'uint64',
+        'device-endian': 'VirtioStatusEndianness',
+        'num-vqs': 'int',
+        'status': 'uint8',
+        'isr': 'uint8',
+        'queue-sel': 'uint16',
+        'vm-running': 'bool',
+        'broken': 'bool',
+        'disabled': 'bool',
+        'use-started': 'bool',
+        'started': 'bool',
+        'start-on-kick': 'bool',
+        'disable-legacy-check': 'bool',
+        'bus-name': 'str',
+        'use-guest-notifier-mask': 'bool',
+        'vhost-dev': 'VhostStatus'
+    }
+}
+
+##
+# @x-debug-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: Canonical QOM path of the VirtIODevice
+#
+# Returns: VirtioStatus of the virtio device
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -> { "execute": "x-debug-virtio-status",
+#      "arguments": {
+#          "path": "/machine/peripheral/crypto0/virtio-backend"
+#      }
+#    }
+# <- { "return": {
+#          "device-endian": "little",
+#          "bus-name": "",
+#          "disable-legacy-check": false,
+#          "name": "virtio-crypto",
+#          "started": true,
+#          "device-id": 20,
+#          "vhost-dev": {
+#               "n-tmp-sections": 0,
+#               "n-mem-sections": 0,
+#               "max-queues": 0,
+#               "backend-cap": 0,
+#               "log-size": 0,
+#               "backend-features": 0,
+#               "nvqs": 0,
+#               "protocol-features": 0,
+#               "vq-index": 0,
+#               "log-enabled": false,
+#               "acked-features": 0,
+#               "features": 0
+#          },
+#          "backend-features": 0,
+#          "start-on-kick": false,
+#          "isr": 1,
+#          "broken": false,
+#          "status": 15,
+#          "num-vqs": 2,
+#          "guest-features": 5100273664,
+#          "host-features": 6325010432,
+#          "use-guest-notifier-mask": true,
+#          "vm-running": true,
+#          "queue-sel": 1,
+#          "disabled": false,
+#          "vhost-started": false,
+#          "use-started": true
+#      }
+#    }
+#
+# 2. Poll for the status of virtio-net (vhost-net is active)
+#
+# -> { "execute": "x-debug-virtio-status",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[1]/virtio-backend"
+#      }
+#    }
+# <- { "return": {
+#          "device-endian": "little",
+#          "bus-name": "",
+#          "disabled-legacy-check": false,
+#          "name": "virtio-net",
+#          "started": true,
+#          "device-id": 1,
+#          "vhost-dev": {
+#               "n-tmp-sections": 4,
+#               "n-mem-sections": 4,
+#               "max-queues": 1,
+#               "backend-cap": 2,
+#               "log-size": 0,
+#               "backend-features": 0,
+#               "nvqs": 2,
+#               "protocol-features": 0,
+#               "vq-index": 0,
+#               "log-enabled": false,
+#               "acked-features": 5100306432,
+#               "features": 13908344832
+#          },
+#          "backend-features": 6337593319,
+#          "start-on-kick": false,
+#          "isr": 1,
+#          "broken": false,
+#          "status": 15,
+#          "num-vqs": 3,
+#          "guest-features": 5111807911,
+#          "host-features": 6337593319,
+#          "use-guest-notifier-mask": true,
+#          "vm-running": true,
+#          "queue-sel": 2,
+#          "disabled": false,
+#          "vhost-started": true,
+#          "use-started": true
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus'
+}
-- 
1.8.3.1


