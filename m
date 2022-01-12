Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8681548BC7C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:33:43 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7SWE-0004KG-MR
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:33:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdv-0001E0-Mj
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:35 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdr-0005iN-9U
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:33 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMjadQ019916
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=cezNkDBG0fwfvE37BmpPJUDcwMtN5fTyd6COu6OBPYE=;
 b=hyPZkcjLTYayGdhb3wuhHH0tl/rTpzxaOoGVr+4iBS3tdaaSdD0tQoUnvMrjmXmQHPlv
 zjWQCUc2zx/piHRXAKpFiRSRU/frL+ttah7KM7b0OEdzyOM7yaDza3L3qLiaGssl9nU5
 6m83VRtqKKet42GgiG1IvQNr/9EwY9g24frMNsbvCRWpyZFCgRhI3T869Xg1YzzupkNZ
 oJmJORBG8PHYloX2Oe7o8LgviB5fsIbmGoaWSFDTO2g79xBV7FtCAs2uM27pWOSa5RiX
 AvjEJH9VTO6EvT/4Ev+rsYm3h6g/ypjrVRCSPQmNUKTKQRmEvfcpfUxyRHoYQeMwT6SB Tw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx4sjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KAjB069368
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:18 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3030.oracle.com with ESMTP id 3deyqy1gqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cwbiq9DI5o11GBd1sMgOkohIVXEumVNo5srqC2kPcareXTTOdw39j6Ct/P9udo9sJkg8YxWQIDfRt0W3Oh9dxLQcEFWiPMqcJ3yPVWg7olHxmiJFDbcWHd9batVCiTvhXhKUBWOeNCqUW+KPrONq/wf5BzPW5Bim1IhzohOqt7MvADOLK4EGhlahgXSV2ujQEazqPPDdfatG/u/T1x6FoWSS+yB8JC1efdf2b9r+ko6NAA+3O7bvFJr0BFxFf19jVzPZn2PU7KOxe84URWVWY5W8J4h1B6DsFObbY2DckJW/kkJV8j39iMikr/xac1uuK1kNYRMwiQr/h6zC7MKCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cezNkDBG0fwfvE37BmpPJUDcwMtN5fTyd6COu6OBPYE=;
 b=Xru7oeUdjt5aOUksvwL+/0qIZFVo6Fft3vxckN4D8HxsslJNUHAYPRUYzmfWeQrIyQ6zIINnhiJz9silp+qdSn0WJL6vpzkRqrhLyFp5SIdFwvgLk/xKLzYz+2iaBlbakaDuP0K5Tf5gMzEA1mCAR/NpjMoBFd68/zr9aTiFTTcp0tOrIHRivdNiZFnfPpAxGakc4vfym7vb36cwJtEfO1uUM6y648lSwGqnngL4JCvtjMA/hz2XC2segM9AgHrUG6s0ApZXnggRdVCauB+S5v4UZdVBsXlgFP4+yVVViPcMbrHlKA2rqlwaTvus0e5ZMRPBm2yx94CDWErCHiRhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cezNkDBG0fwfvE37BmpPJUDcwMtN5fTyd6COu6OBPYE=;
 b=IBWzTjEDTEDEc16l3HchmfyBQYNGevCl/+pdqZA+Xjq4kUV9q87yJp9mmqf0JswVDWPaQNeRPJn9n/rUJZEibSqdo1E+mdTduuycN10U/x8r571oJ+Ybht2ezycpP+h3gwCsTIHf5D02Se+5ozLo7NV64Wa+Xn/q+CzTUj8PsTk=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:08 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:08 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 16/21] vfio-user: dma map/unmap operations
Date: Tue, 11 Jan 2022 16:43:52 -0800
Message-Id: <f9064aabf7c36a32782973d28a26df0480b903e7.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12229bf3-53a9-47f2-bdc4-08d9d563a9f8
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742FF01DD193637D88C3223B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oBvczPocsBB9iSn+fQUHAJoFR6z9jVRWMIfUk1cQVxxvXhKhVTmhV29DBCy5u10J0NrkF6FtfCoaf629Ess6LX7DDfDfXn9fRkgoHaIyKWM9gZWdg2+X1Z+SCEP0PI+WtuE4i/hktPR2GyKovanoeaOp/0oXMeClCF85bii3BpPMJvq3XAdSS3ltkl9jaa1dCSwLPNdnvl9RmJZPQF/dxNnJ/mBzFhhVyN1JQISxweGV7vm5nGybC9kkOYZrd5Syt/kO0DIg9Cb0icyc1IfioA03MC3Vw9lVjbrVpg/snF8BXQTVmJjoOocefn202SgctjuFMda4TxVJ3S3vtHVsb3MqZxXloLtcDrPzHZje6FMQJxxjfXRgyMGSCbqNodERklGfzBwrpmHSXdtayICrYNXstdtvp/ErD0dujLO6sjT109lr+bhJAmF9iCkRDLtPQuFCagLHYa8UfI9dXWv4nYd0HePPopv8us5h13zI5p/fcqdqpkjeCqTlvk73XusDjhIdJzrj0tOZRnhp8L4g282kfxP3aTBafWnasp5U2WfKxPDvL2oVAVYzfWeowBskM3pLyKAM6HozfP2gUKHdoMM/p/Rxtc4qnfphk4q/QxPJRhdldAw1LgVBWlBLvoqIWjm4NypHsE4msk4lw4VHVfIphHe/aoFCWVtKLwZykfDKDNQGWKQ3ntRN8LjHGSinH/nx8V0AO+guXh46qOxnpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(30864003)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xBSzYg7T8dJINr05+9+qD5g9czgYN3q67zsOHmXVvOsSXPYTAZnnZs7rwRDo?=
 =?us-ascii?Q?3ME7gu+k+O/ToP5SgmhQs3oW5DiP0nIUQXYK6IAyieyfeeEWD74T3ZqjXgyp?=
 =?us-ascii?Q?PfoUc5hpBGlqv5HTvYEsPaSb6J8z98ypIYz9BQRULDgJMaeM/7GFN65ocB5E?=
 =?us-ascii?Q?M/C6+aooRHWay2B5RQhGYX1jpoL+9uZ7qeSghy6+bfOYY21QAu23/DMBq8j3?=
 =?us-ascii?Q?/UAXf2JVSpT+2qzW0h4hnwQWQ5YAHb9mY1J5R7icedwA9Y0dgH6hERlAsz6E?=
 =?us-ascii?Q?gyrcUG9bQ0g8k+EPgKtNN8LaB9SN3BxfkJ6Yj2CCdeNSjpv8XSFsdM/4Digo?=
 =?us-ascii?Q?91h1CR6SIgN7lWVmHfNlLGTz7+TnmRuwRYF7cmV6R8Y1g8Njl+S1DM3/GN5M?=
 =?us-ascii?Q?72pXiCpg4vY0gahfa/REiLwjSEAVOu9NQdQZwyVAu9hP7xAMMSZ+BVW3+cFm?=
 =?us-ascii?Q?Fg49+pYYFbfiAF2FYlzfvZZ8jT3Foy/5qHlxhVQO5WQf2aNJfbHdoRHCx9+k?=
 =?us-ascii?Q?hiOmznMYcBES64kPyVJ9joejDTvyTYnbUcmv14d5DOiGTPatS7cqghvXiH1b?=
 =?us-ascii?Q?AisMZC1f/JuXkeHDf55efxnK7usegKHa671XIop+xzWM7KZURZybxdx/uSCF?=
 =?us-ascii?Q?nx5p7gbbQKkS7WG0q6zW0quzlwtMD5f5ZiV9cvXnwHc++yB1CvRMNZ1DUESk?=
 =?us-ascii?Q?Wt68ZXI8MZqzxgUXYR0/z7DO495jdp/oBhr1OvPdInM27TIGq7G3WtZSJFSk?=
 =?us-ascii?Q?dp3lcGbECp0aybtUQKvg1c+1xTTMF1EGffORuauALzDVVmHHsEN31zfEIzVE?=
 =?us-ascii?Q?/UjYIelKp4p6t5g1d9OaPTKjDU6/Bt7BIlkspNjXuLk07LpgrUVpKTIE2syi?=
 =?us-ascii?Q?XW4ze9whuvzhtVrIN8/z6VfsYIWQtR/paIAdF1ikZQzd/VNNe29nmHqUixv+?=
 =?us-ascii?Q?dnNg2/Y8LVoWn5mIMvEDN3zBS3ZvvMNpBmFwo1Ns/4SoF/4ofNyjzGExZwe1?=
 =?us-ascii?Q?coUCWUocp8YvfCD9XMIw1DtjCZCPYfmPK8ZjSSE9IHc3ySudwGIP3BGiSxND?=
 =?us-ascii?Q?p/k0FFkca5MGAJrUTcNI2/25CGfQuQZfwnLKK6TCos8DguhIyqi1k/2rXbc9?=
 =?us-ascii?Q?VvJyuIROk4tELTslBGk5314pxMufoCHA4yUwxvsizM10K6pIxcqQeAFClXq/?=
 =?us-ascii?Q?C79XHKYKfZim9V5+PeYlUVCZ1pguy8Qxc5Dcn9lvLj9/RMSF9pIL8xkoLdFJ?=
 =?us-ascii?Q?biZvtclbVzNP88LNBNh59QZRcvRWH4sr+XWSzjxlukGI5BuQ6mGiVvtdGt9O?=
 =?us-ascii?Q?oLg6zbw+Tr7DXKPf105F1LdUEEU3lZgeS5b7UTBkvF9+sbm3dG6+0sFkMAXR?=
 =?us-ascii?Q?yHTJovwPCuZkopRyenIigEuoQz0727hS0fNmtvv3zV+3/5TjMgm3LTy45+F3?=
 =?us-ascii?Q?4ksOawj+f83QNBoENLbvjhbhU6mDQPVxegxEXhxUu2wZ1kz/cszCg/j6xl3b?=
 =?us-ascii?Q?wHXE9Bf39gynNx4UdDDOijWHseJ33ciF4hUfYoihJbC2gRV/dHbGDk6NShYu?=
 =?us-ascii?Q?A5uk4WQ5eYpORGFFncoJnMl54hczpl0gCn8ZZTvc5LS7jBTBtUjzeGQI9nsr?=
 =?us-ascii?Q?5EX6J5cWfQiytUnNIvY1jDAO30b2rrztAu+j66Cj7KEJwCs0MHyEY7at++aB?=
 =?us-ascii?Q?pQfZ/Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12229bf3-53a9-47f2-bdc4-08d9d563a9f8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:08.0858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dObyXzwQ2zqYx+CEuBBeZ6TNVEpCJMD0gpxKZo+SbOtTj0I/RGKk3H6FQ5xmcNA6iwcc7tr0yK7lgDI8MMF9otSGJR9itsf4wHxk8/9Bd8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: VFSrHOj5aHzaoJf9HoBVbcLDMeWUgPko
X-Proofpoint-ORIG-GUID: VFSrHOj5aHzaoJf9HoBVbcLDMeWUgPko
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add ability to do async operations during memory transactions

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/user-protocol.h       |  32 +++++++
 include/hw/vfio/vfio-common.h |   9 +-
 hw/vfio/common.c              |  63 +++++++++---
 hw/vfio/user.c                | 217 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 305 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 4852882..ad63f21 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -94,6 +94,31 @@ typedef struct {
 
 
 /*
+ * VFIO_USER_DMA_MAP
+ * imported from struct vfio_iommu_type1_dma_map
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t offset;    /* FD offset */
+    uint64_t iova;
+    uint64_t size;
+} VFIOUserDMAMap;
+
+/*
+ * VFIO_USER_DMA_UNMAP
+ * imported from struct vfio_iommu_type1_dma_unmap
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t iova;
+    uint64_t size;
+} VFIOUserDMAUnmap;
+
+/*
  * VFIO_USER_DEVICE_GET_INFO
  * imported from struct_device_info
  */
@@ -157,4 +182,11 @@ typedef struct {
     char data[];
 } VFIOUserRegionRW;
 
+/*imported from struct vfio_bitmap */
+typedef struct {
+    uint64_t pgsize;
+    uint64_t size;
+    char data[];
+} VFIOUserBitmap;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 59a8299..a84e10a 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -90,6 +90,7 @@ typedef struct VFIOContainer {
     VFIOContIO *io_ops;
     bool initialized;
     bool dirty_pages_supported;
+    bool async_ops;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -199,7 +200,7 @@ struct VFIODevIO {
     ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
 
 struct VFIOContIO {
-    int (*dma_map)(VFIOContainer *container,
+    int (*dma_map)(VFIOContainer *container, MemoryRegion *mr,
                    struct vfio_iommu_type1_dma_map *map);
     int (*dma_unmap)(VFIOContainer *container,
                      struct vfio_iommu_type1_dma_unmap *unmap,
@@ -207,14 +208,16 @@ struct VFIOContIO {
     int (*dirty_bitmap)(VFIOContainer *container,
                         struct vfio_iommu_type1_dirty_bitmap *bitmap,
                         struct vfio_iommu_type1_dirty_bitmap_get *range);
+    void (*wait_commit)(VFIOContainer *container);
 };
 
-#define CONT_DMA_MAP(cont, map) \
-    ((cont)->io_ops->dma_map((cont), (map)))
+#define CONT_DMA_MAP(cont, mr, map) \
+    ((cont)->io_ops->dma_map((cont), (mr), (map)))
 #define CONT_DMA_UNMAP(cont, unmap, bitmap) \
     ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
 #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
     ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
+#define CONT_WAIT_COMMIT(cont) ((cont)->io_ops->wait_commit(cont))
 
 extern VFIODevIO vfio_dev_io_ioctl;
 extern VFIOContIO vfio_cont_io_ioctl;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9a67934..ca51baa 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -480,7 +480,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return CONT_DMA_UNMAP(container, &unmap, NULL);
 }
 
-static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
+static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
     struct vfio_iommu_type1_dma_map map = {
@@ -496,7 +496,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
-    ret = CONT_DMA_MAP(container, &map);
+    ret = CONT_DMA_MAP(container, mr, &map);
 
     if (ret < 0) {
         error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
@@ -559,7 +559,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 
 /* Called with rcu_read_lock held.  */
 static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
-                               ram_addr_t *ram_addr, bool *read_only)
+                               ram_addr_t *ram_addr, bool *read_only,
+                               MemoryRegion **mrp)
 {
     MemoryRegion *mr;
     hwaddr xlat;
@@ -640,6 +641,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         *read_only = !writable || mr->readonly;
     }
 
+    if (mrp != NULL) {
+        *mrp = mr;
+    }
+
     return true;
 }
 
@@ -647,6 +652,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
     VFIOContainer *container = giommu->container;
+    MemoryRegion *mr;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     void *vaddr;
     int ret;
@@ -665,7 +671,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
         bool read_only;
 
-        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
             goto out;
         }
         /*
@@ -675,14 +681,14 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
          * of vaddr will always be there, even if the memory object is
          * destroyed and its backing memory munmap-ed.
          */
-        ret = vfio_dma_map(container, iova,
+        ret = vfio_dma_map(container, mr, iova,
                            iotlb->addr_mask + 1, vaddr,
                            read_only);
         if (ret) {
             error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                         "0x%"HWADDR_PRIx", %p)",
                          container, iova,
-                         iotlb->addr_mask + 1, vaddr, ret);
+                         iotlb->addr_mask + 1, vaddr);
         }
     } else {
         ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
@@ -737,7 +743,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
                section->offset_within_address_space;
         vaddr = memory_region_get_ram_ptr(section->mr) + start;
 
-        ret = vfio_dma_map(vrdl->container, iova, next - start,
+        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
                            vaddr, section->readonly);
         if (ret) {
             /* Rollback */
@@ -845,6 +851,29 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+static void vfio_listener_begin(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /*
+     * When DMA space is the physical address space,
+     * the region add/del listeners will fire during
+     * memory update transactions.  These depend on BQL
+     * being held, so do any resulting map/demap ops async
+     * while keeping BQL.
+     */
+    container->async_ops = true;
+}
+
+static void vfio_listener_commit(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /* wait here for any async requests sent during the transaction */
+    CONT_WAIT_COMMIT(container);
+    container->async_ops = false;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -1044,12 +1073,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
     }
 
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+    ret = vfio_dma_map(container, section->mr, iova, int128_get64(llsize),
                        vaddr, section->readonly);
     if (ret) {
         error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                   container, iova, int128_get64(llsize), vaddr, ret);
+                   "0x%"HWADDR_PRIx", %p)",
+                   container, iova, int128_get64(llsize), vaddr);
         if (memory_region_is_ram_device(section->mr)) {
             /* Allow unexpected mappings not to be fatal for RAM devices */
             error_report_err(err);
@@ -1310,7 +1339,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 
     rcu_read_lock();
-    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
+    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
         int ret;
 
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
@@ -1428,6 +1457,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 
 static const MemoryListener vfio_memory_listener = {
     .name = "vfio",
+    .begin = vfio_listener_begin,
+    .commit = vfio_listener_commit,
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
     .log_global_start = vfio_listener_log_global_start,
@@ -2819,7 +2850,7 @@ VFIODevIO vfio_dev_io_ioctl = {
     .region_write = vfio_io_region_write,
 };
 
-static int vfio_io_dma_map(VFIOContainer *container,
+static int vfio_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
                            struct vfio_iommu_type1_dma_map *map)
 {
 
@@ -2879,8 +2910,14 @@ static int vfio_io_dirty_bitmap(VFIOContainer *container,
     return ret < 0 ? -errno : ret;
 }
 
+static void vfio_io_wait_commit(VFIOContainer *container)
+{
+    /* ioctl()s are synchronous */
+}
+
 VFIOContIO vfio_cont_io_ioctl = {
     .dma_map = vfio_io_dma_map,
     .dma_unmap = vfio_io_dma_unmap,
     .dirty_bitmap = vfio_io_dirty_bitmap,
+    .wait_commit = vfio_io_wait_commit,
 };
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 9e71cdb..5c27a5e 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -52,8 +52,11 @@ static void vfio_user_request(void *opaque);
 static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
 static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                  VFIOUserFDs *fds);
+static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize);
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql);
+static void vfio_user_wait_reqs(VFIOProxy *proxy);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags);
 
@@ -563,6 +566,36 @@ static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+/*
+ * nowait send - vfio_wait_reqs() can wait for it later
+ */
+static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize)
+{
+    VFIOUserMsg *msg;
+    int ret;
+
+    if (hdr->flags & VFIO_USER_NO_REPLY) {
+        error_printf("vfio_user_send_nowait on async message\n");
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = rsize ? rsize : hdr->size;
+    msg->type = VFIO_MSG_NOWAIT;
+
+    ret = vfio_user_send_queued(proxy, msg);
+    if (ret < 0) {
+        vfio_user_recycle(proxy, msg);
+        return;
+    }
+
+    proxy->last_nowait = msg;
+}
+
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql)
 {
@@ -612,6 +645,57 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+static void vfio_user_wait_reqs(VFIOProxy *proxy)
+{
+    VFIOUserMsg *msg;
+    bool iolock = false;
+
+    /*
+     * Any DMA map/unmap requests sent in the middle
+     * of a memory region transaction were sent nowait.
+     * Wait for them here.
+     */
+    qemu_mutex_lock(&proxy->lock);
+    if (proxy->last_nowait != NULL) {
+        iolock = qemu_mutex_iothread_locked();
+        if (iolock) {
+            qemu_mutex_unlock_iothread();
+        }
+
+        /*
+         * Change type to WAIT to wait for reply
+         */
+        msg = proxy->last_nowait;
+        msg->type = VFIO_MSG_WAIT;
+        while (!msg->complete) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+                QTAILQ_REMOVE(&proxy->pending, msg, next);
+                error_printf("vfio_wait_reqs - timed out\n");
+                break;
+            }
+        }
+
+        if (msg->hdr->flags & VFIO_USER_ERROR) {
+            error_printf("vfio_user_wait_reqs - error reply on async request ");
+            error_printf("command %x error %s\n", msg->hdr->command,
+                         strerror(msg->hdr->error_reply));
+        }
+
+        proxy->last_nowait = NULL;
+        /*
+         * Change type back to NOWAIT to free
+         */
+        msg->type = VFIO_MSG_NOWAIT;
+        vfio_user_recycle(proxy, msg);
+    }
+
+    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
+    qemu_mutex_unlock(&proxy->lock);
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -937,6 +1021,103 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
     return 0;
 }
 
+static int vfio_user_dma_map(VFIOProxy *proxy,
+                             struct vfio_iommu_type1_dma_map *map,
+                             int fd, bool will_commit)
+{
+    VFIOUserFDs *fds = NULL;
+    VFIOUserDMAMap *msgp = g_malloc0(sizeof(*msgp));
+    int ret;
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DMA_MAP, sizeof(*msgp), 0);
+    msgp->argsz = map->argsz;
+    msgp->flags = map->flags;
+    msgp->offset = map->vaddr;
+    msgp->iova = map->iova;
+    msgp->size = map->size;
+
+    /*
+     * The will_commit case sends without blocking or dropping BQL.
+     * They're later waited for in vfio_send_wait_reqs.
+     */
+    if (will_commit) {
+        /* can't use auto variable since we don't block */
+        if (fd != -1) {
+            fds = vfio_user_getfds(1);
+            fds->send_fds = 1;
+            fds->fds[0] = fd;
+        }
+        vfio_user_send_nowait(proxy, &msgp->hdr, fds, 0);
+        ret = 0;
+    } else {
+        VFIOUserFDs local_fds = { 1, 0, &fd };
+
+        fds = fd != -1 ? &local_fds : NULL;
+        vfio_user_send_wait(proxy, &msgp->hdr, fds, 0, will_commit);
+        ret = (msgp->hdr.flags & VFIO_USER_ERROR) ? -msgp->hdr.error_reply : 0;
+        g_free(msgp);
+    }
+
+    return ret;
+}
+
+static int vfio_user_dma_unmap(VFIOProxy *proxy,
+                               struct vfio_iommu_type1_dma_unmap *unmap,
+                               struct vfio_bitmap *bitmap, bool will_commit)
+{
+    struct {
+        VFIOUserDMAUnmap msg;
+        VFIOUserBitmap bitmap;
+    } *msgp = NULL;
+    int msize, rsize;
+    bool blocking = !will_commit;
+
+    if (bitmap == NULL &&
+        (unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)) {
+        error_printf("vfio_user_dma_unmap mismatched flags and bitmap\n");
+        return -EINVAL;
+    }
+
+    /*
+     * If a dirty bitmap is returned, allocate extra space for it
+     * and block for reply even in the will_commit case.
+     * Otherwise, can send the unmap request without waiting.
+     */
+    if (bitmap != NULL) {
+        blocking = true;
+        msize = sizeof(*msgp);
+        rsize = msize + bitmap->size;
+        msgp = g_malloc0(rsize);
+        msgp->bitmap.pgsize = bitmap->pgsize;
+        msgp->bitmap.size = bitmap->size;
+    } else {
+        msize = rsize = sizeof(VFIOUserDMAUnmap);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DMA_UNMAP, msize, 0);
+    msgp->msg.argsz = rsize - sizeof(VFIOUserHdr);
+    msgp->msg.argsz = unmap->argsz;
+    msgp->msg.flags = unmap->flags;
+    msgp->msg.iova = unmap->iova;
+    msgp->msg.size = unmap->size;
+
+    if (blocking) {
+        vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, will_commit);
+        if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->msg.hdr.error_reply;
+        }
+        if (bitmap != NULL) {
+            memcpy(bitmap->data, &msgp->bitmap.data, bitmap->size);
+        }
+        g_free(msgp);
+    } else {
+        vfio_user_send_nowait(proxy, &msgp->msg.hdr, NULL, rsize);
+    }
+
+    return 0;
+}
+
 static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
 {
     VFIOUserDeviceInfo msg;
@@ -1251,5 +1432,41 @@ VFIODevIO vfio_dev_io_sock = {
 };
 
 
+static int vfio_user_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
+                                struct vfio_iommu_type1_dma_map *map)
+{
+    int fd = memory_region_get_fd(mr);
+
+    /*
+     * map->vaddr enters as a QEMU process address
+     * make it either a file offset for mapped areas or 0
+     */
+    if (fd != -1) {
+        void *addr = (void *)(uintptr_t)map->vaddr;
+
+        map->vaddr = qemu_ram_block_host_offset(mr->ram_block, addr);
+    } else {
+        map->vaddr = 0;
+    }
+
+    return vfio_user_dma_map(container->proxy, map, fd, container->async_ops);
+}
+
+static int vfio_user_io_dma_unmap(VFIOContainer *container,
+                                  struct vfio_iommu_type1_dma_unmap *unmap,
+                                  struct vfio_bitmap *bitmap)
+{
+    return vfio_user_dma_unmap(container->proxy, unmap, bitmap,
+                               container->async_ops);
+}
+
+static void vfio_user_io_wait_commit(VFIOContainer *container)
+{
+    vfio_user_wait_reqs(container->proxy);
+}
+
 VFIOContIO vfio_cont_io_sock = {
+    .dma_map = vfio_user_io_dma_map,
+    .dma_unmap = vfio_user_io_dma_unmap,
+    .wait_commit = vfio_user_io_wait_commit,
 };
-- 
1.8.3.1


