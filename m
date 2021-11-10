Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849B744BEB6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:31:16 +0100 (CET)
Received: from localhost ([::1]:48878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkst-0003C3-Jp
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:31:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkm9-0002T7-UK; Wed, 10 Nov 2021 05:24:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkm4-0005CH-GK; Wed, 10 Nov 2021 05:24:17 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9SunC032063; 
 Wed, 10 Nov 2021 10:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=3ja9FUXs697vEIVbQ9OtJheeAZGn6AB2dzQRg0YijUQ=;
 b=lawXM+YYGHtMT/iyDqHL6lA/N7yNMBDLKi8DtTaJz2Zk7zkbej6/Bmjfhpv8XzpJDR3V
 4aNVnUeIC1Tj4a/R2Y2LP46oUFEnLQVAbx39aWXVrE2AIWVhs6lmmRCys6g7cOWguKm2
 hyROYc2owrNycysvUiNKqWU5ynaHPmnmkm+I+nGtKR14GsgCeKMWjAe5ktu6kGF/DeDX
 PNUuosXyNkdEOlV4So5iyzm6X6Ybe3zSnekwMk88LvpRHdXPRQDBmvMpgs+LWT1G0pZP
 v716lYmzZDsoHC0GbFRwfexcQ2xU7IFJUAeZX3Xvz12yXRdQjMwhs82ZV6OHdI0Y63DC 1Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c89bq934c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAH1tF156484;
 Wed, 10 Nov 2021 10:23:51 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by userp3020.oracle.com with ESMTP id 3c63fuebwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNzcevx6XmzBJ8sGgiCEw4pz6mAAdkn5r4EG8abT20vOKic1jxNtuWPAE6vtICysi19wumtxQ6e+86+/b3SY4XaS7EFJm9vl15fSCgagYDsm1PH2U00sW8TbC5Dl3bb4utKC5lhElynY3VqFcvP7+hEJOgxIGNaHjjAzujI0HiyhSiiAD5qC5BAzpLsOMf/XagJWv/GxuXLuen1Qc3JOokfGHc1EkzEvy67X/Hv4Si4pMLkXHVhCCEslU4AOwHDDDJ1gxit3nCfltsc56gxxaQkh32a4UBAjfxkSbnKp1ekO6G9NoIU5tMutlvO5SFsDV3GDhRbEt6HjLoq0BkenGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ja9FUXs697vEIVbQ9OtJheeAZGn6AB2dzQRg0YijUQ=;
 b=VuMaszRwaseXmBP7OFxgDjG9kkuQ/RkZb4AmzQBVevP3aU+9FssW256GwA8mG9MXIJ5aIkWk++pLBGSq4jvxNfzlcFdxqbDC8wIvn1og0f8wr+Zg+Ot/zEJbryzvMQMnBnxp8VL0j+GT7+PwrEL9qCuH8CBgtPV/a5IuAVeuCh1RIkLX59NrzhoDx/WL9ZKwCSt/NDz6RNckQbCo30SImA0ya6Nqd8mCvaysQPIT1xzZAygUJOMt3DWYVcR+nAqS42E+lH9aTGvfJ/sQhBtwF/EKRS6InwEU1jFju3wue0CK7uvfbyU9RiVTqKm0VYbV7FPC5sfT9BXJZphlQEiIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ja9FUXs697vEIVbQ9OtJheeAZGn6AB2dzQRg0YijUQ=;
 b=JccLY1m9r2oaukz0S3Z/i2tshpZEcZ4gM6NEgtjRypwy9vzgr0gCRcd2cYDcB9wtAWSgH0P85pMAIOnOzYF2erZeZmXccMA60Jyqy4rZu4JHX6b9JdHa+edV4tejnTL8xP0rRkm9ptAHcjRTt8RJv8ziJjiqSwrXUFI/s+QYOtI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5895.namprd10.prod.outlook.com (2603:10b6:510:14c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 10 Nov
 2021 10:23:49 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:49 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 4/8] qmp: add QMP command x-query-virtio-status
Date: Wed, 10 Nov 2021 05:23:08 -0500
Message-Id: <1636539792-20967-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.43) by
 SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Wed, 10 Nov 2021 10:23:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55813121-d119-4e59-dc16-08d9a4342f42
X-MS-TrafficTypeDiagnostic: PH0PR10MB5895:
X-Microsoft-Antispam-PRVS: <PH0PR10MB5895F9143165667681818150E8939@PH0PR10MB5895.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VnwNltRZNJ1EZYhgYDsH2aCAW4rbsuY+JocZwSdYxulf8ASm7LTDlmH9kdd66gsJVLo2BXhjwZVbbaE2trRBMIW7POKZamlcpQhbi20FZbQnNxfOw8nycglkClh0f3Hokk+ud4MRwnmg8j/xJZ8fz4/BwwZNglJaBava4co39hFWHJBnL7fY2zEV8Ue/nNnkKy1rFVPzGZqV38IvHwDljSErcmRyLObkrbXDQhJPXYpy8eS002/LVg7Ob4D3+K9fC6wwcP9vwl8wSuUafSgxmbeNnnLWD/MtGdGt5IKfVTKqH1Jt2+l63KURLt70nAXCcyjWb5BGiBXBywJ+pkg9zjFbTLdRO8mv4DBiu+fS6l6hwv1pPoaClBIry6f3rlqpZaiBlX7CqOyecQSuh9Sv5A51YmaaQhhoMu+qVvKobr1u2t1MkbzXu4W5oDE7vCQ/545brk6Iq7sYg4AzrSd/1GGP4nv4v77ycmypv+ZunLLXbOv6GMrx/WOl8paL20KSkjjB9yrsQ9SPW9mTihe5tu3sFq4QHciGniFabsrTsRy0DSl8MHjVPRZi4X2rHU7nPlr9cDcDFyr2L8q+Jj/woj8YS9hJTpT7bpw6Sqh+3FhZqq1DvzUO0uyQQXXUdZdqbamW6qKBQ+OSZj63I3sfuU230MNd4G5UwQVwUGL+ISyUpf5+Bzxq9LQlsl4/jPl3ZKwGO894cHm2X3Z3FceXng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(7696005)(44832011)(83380400001)(956004)(2616005)(7416002)(5660300002)(6666004)(36756003)(2906002)(26005)(186003)(30864003)(86362001)(4326008)(8676002)(38100700002)(8936002)(52116002)(6916009)(38350700002)(6486002)(66556008)(508600001)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7wp9OY6AhkbHyReKfh0Xg3lD77iAod63N/onBDP5YHnouRLCZmnz8piaKZbO?=
 =?us-ascii?Q?XngM/tH0a/jKYBE7id8KnmElJfGq7byK1fvIZTxpj6eDGz2n3d9M+9VuZjkK?=
 =?us-ascii?Q?SATt6EuJ1Zn9+pWjM+8J3uq36YlToqXyKKUeouJexErMJ6ImsFCA+C5nxEtJ?=
 =?us-ascii?Q?l1sxFJcx8elh1AwKWfOzSVrxlImxO9bkZJJbb0KBgg+5Hphoh7e3iyM7NmmP?=
 =?us-ascii?Q?2xNT62/F1W2aXE8J/v+bzkmDzVC0IYaHD5e4A6aUQSc1RDAIGSf+ewqRtL0M?=
 =?us-ascii?Q?jurRlEW41i5CZ8bEco25Xq5M0ByzYmehzH/5+ZN7GyCcoCMBgmAwhjfnJ5Zs?=
 =?us-ascii?Q?S15Jcn5FlE7CCupSVRPWoV+qzemZfMdpp1k22NDG0jf77CqMr5eZ8x3EshqQ?=
 =?us-ascii?Q?JOn4PaL/KZG9AIB9eI4KGIJwt8RJtIWbj0wLBWG3+HsM5h0H/zprvky0kJzo?=
 =?us-ascii?Q?6/ubivkoi7nly7wy+jqj0gKtAMWbCoOXXVUn/fXDeCTWitKJd6tMEz4/MfUv?=
 =?us-ascii?Q?pbwMFLTDYK9+DX1SQKOAtCJAmqfdMYt3JH0G95T568XIh5RoLAlh0/BPbuFP?=
 =?us-ascii?Q?W3b3pDn1pLTeANd8U6sU7uQWrJAFKKgajGN1op+NXaLhDol9ySfY97zpOh20?=
 =?us-ascii?Q?7a9S6jXyU2Tel1TwqatO2x5QnBGkZWWABRRtc9XLon3hpO1kOInrhp46tqqc?=
 =?us-ascii?Q?F65svRYjZsRT9ruPe2jEHYVgjqLXIxNj07dweWAjISf1V4JHtne89GQbOGmL?=
 =?us-ascii?Q?2bmRNSS11Q2ixZwKfi/gcitvBI7I++N6S3Rf5O4/vJJmDwnvsACdwKh92UkV?=
 =?us-ascii?Q?V5hYuVosOKgSv487T+Ojkp/JT+vHl5D8GZqr0nEkpcflEFhGRrHt/+xRdqVp?=
 =?us-ascii?Q?AwChJND9lwXNBwvuDK2lRdAO5JwBwdh/OOUWzq1RSleqSc63GwaJ5QMEmjOT?=
 =?us-ascii?Q?ZlphvOiYAm3j7+QdzCudWKQcIro+5+/C8PVrT1lCAF7f2Z7hVa9scHZdzOQM?=
 =?us-ascii?Q?Upec7S+aCKcX2XHBFxNhyi3QFUj8mbCgW0lkDfMOeNASVdU74aF+vXTBxsH3?=
 =?us-ascii?Q?HiMRLOMA5ECYMruPDvPOaIjhejU4/KeEI5Rmjd/Edh2V/DRToHrthsPKETPL?=
 =?us-ascii?Q?SVNl8gaRkpKNOKSiR6fz5rMF4V2QnhkHkDP0jLxj1xZ2eUBtyrbqt5JP0Wd1?=
 =?us-ascii?Q?3dcHL8obaCLPmuzX2RKQ19omabJYBjeUUaTnQ8V2Nm/hE0nLJnUOQH/HxSzY?=
 =?us-ascii?Q?Tlt6ZBFshEYjU959NihRQ2aHYrqdU++qGOC0Po4QRXxgMG5WGTwsoBmktntj?=
 =?us-ascii?Q?pzGiGoFJJ89TTQVNBxUigQ9Yw15uAeJft/m8uQ/zHbZApS8qxeQ+ChRemhTS?=
 =?us-ascii?Q?+EvA5z+oRb8Hf+mUdB1s/EDW2Y+sGnq4meS27NG82+kNEhdYJ2wBQWzCBEX+?=
 =?us-ascii?Q?FEmfc8Cya5lzhugoomomU2HIHZLTU2Ri60WGG/iHSx2iEXv8ECk2xohpiZbI?=
 =?us-ascii?Q?dhZX/uYQxTPAcjl8KAiM2d3IMRJHKvGnYx5Xl0doWxFtctQQrEC8WPqlEHRv?=
 =?us-ascii?Q?92i6BKOxZW60kVxrC9kpkCOZS4KCOnnRprubd75hpBKOB0rce+j8bcxNHFHy?=
 =?us-ascii?Q?DSpIDeGKTpwOMXluNrih13Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55813121-d119-4e59-dc16-08d9a4342f42
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:48.9583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grhqQnYTa5nuMDxroUcjCnMuqp2FoHT/FWmmTTVGqxluzquGBlRn1bPsMBfcQUdP12+RfTkirN3oXwD6QuFXqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5895
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100056
X-Proofpoint-GUID: TciSTCmSGJG51CEnfe1jXe0Pe-akY2_P
X-Proofpoint-ORIG-GUID: TciSTCmSGJG51CEnfe1jXe0Pe-akY2_P
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 hw/virtio/virtio.c      |  96 +++++++++++++++++++
 qapi/virtio.json        | 246 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 347 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 05a81ed..acd4148 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioStatus *qmp_x_query_virtio_status(const char* path, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index aad554b..580d9a8 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3933,6 +3933,102 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
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
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
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
index 324ba8c..54212f2 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -53,3 +53,249 @@
 
 { 'command': 'x-query-virtio', 'returns': ['VirtioInfo'],
   'features': [ 'unstable' ] }
+
+##
+# @VirtioStatusEndianness:
+#
+# Enumeration of endianness for VirtioDevice
+#
+# Since: 6.3
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
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VhostStatus',
+  'data': { 'n-mem-sections': 'int',
+            'n-tmp-sections': 'int',
+            'nvqs': 'uint32',
+            'vq-index': 'int',
+            'features': 'uint64',
+            'acked-features': 'uint64',
+            'backend-features': 'uint64',
+            'protocol-features': 'uint64',
+            'max-queues': 'uint64',
+            'backend-cap': 'uint64',
+            'log-enabled': 'bool',
+            'log-size': 'uint64' } }
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
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': { 'name': 'str',
+            'device-id': 'uint16',
+            'vhost-started': 'bool',
+            'guest-features': 'uint64',
+            'host-features': 'uint64',
+            'backend-features': 'uint64',
+            'device-endian': 'VirtioStatusEndianness',
+            'num-vqs': 'int',
+            'status': 'uint8',
+            'isr': 'uint8',
+            'queue-sel': 'uint16',
+            'vm-running': 'bool',
+            'broken': 'bool',
+            'disabled': 'bool',
+            'use-started': 'bool',
+            'started': 'bool',
+            'start-on-kick': 'bool',
+            'disable-legacy-check': 'bool',
+            'bus-name': 'str',
+            'use-guest-notifier-mask': 'bool',
+            'vhost-dev': 'VhostStatus' } }
+
+##
+# @x-query-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: Canonical QOM path of the VirtIODevice
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioStatus of the virtio device
+#
+# Since: 6.3
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend" }
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
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend" }
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
+{ 'command': 'x-query-virtio-status', 'data': { 'path': 'str' },
+  'returns': 'VirtioStatus', 'features': [ 'unstable' ] }
-- 
1.8.3.1


