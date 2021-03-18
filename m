Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540CD340AB6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:54:52 +0100 (CET)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvv9-0005gq-ES
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXv-0003y3-NQ; Thu, 18 Mar 2021 12:30:51 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:43780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXo-0008At-Qi; Thu, 18 Mar 2021 12:30:51 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGU5A3167553;
 Thu, 18 Mar 2021 16:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=VsWqU1eg7lglppe+YUgBuvOoRHh0k1V4+YYTSssmORk=;
 b=SCU2a2WCmU/Qa/QGQpH0dQzp6rzbQ6cR0sxXKFclm6dcWcJqXyYxqcOl4dWFjkmjaZyP
 ppoI2OGN6HoynfDWosEjFtlC6g/wc+nU4OBmD/2Cm6MjnWNtboiPh7vA2grB3Cia0eGk
 MVvyqvneUFuxy+xopakrFUSYitnY/7x+ZqVhF9R5HhcLcYYyASFmJKmW4MUiwGS4QYr8
 zUBRSdHMnB87isegzvM+FpPljcX1YrfJd7xroUs7Hy370iyGX65Vm/Bkwfw+ku6hWTVh
 Q1yC4R2wWGbmVoWmGzjZsTazTFIjrZyaV+z6b8pupHS10AgbES61QMVpAXi+E+bb+GMQ pQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 378jwbr7dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGUAvE053881;
 Thu, 18 Mar 2021 16:30:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3030.oracle.com with ESMTP id 3797b352yq-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYijj27M/fLY+CMlWn5LlHBcKXASferTN38PlLdRe1gwsGaLew+/KBnhaub13PUTAcKwpn60693UeET3LSqWUaRHI5+3ZG2/u5TLM/Yy/XxHbJsytbxjB+TqS3CCp9pwsVWRnY3R1G8iWCpJxsr3uSO/uVzwTLb4u7807uQBikEVgWFXB/KIh2GV69cfmmbK+hhUz0zEEhtpPbVUCm2z7GXJC9h3vt2tsVgYkU6SxiMx9BiXykyQqQqadR3+qUbtWerU9tua+sJfmHWKDsKLlMZBNArX+SU1JGM669VbQGRght+5PA7kScQ6KZ7N7joe4Em0h0UZOQnYS1cAevlJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsWqU1eg7lglppe+YUgBuvOoRHh0k1V4+YYTSssmORk=;
 b=ca+PD8WCLe3rdUV9bqwBGnx1XDgwRIR1oeg4Zz0Dk9Yu4gpWjgzdK57AMRH9fcuQM/TpLJ7QIJscKc1GhjpTCHAfuirwQIgCylM3tjvemyxpCT1GHuRNAD+fkiccUKfi/dj1GaAsLR78yUj3faJlfVWcEr5Pu64F5R1hU5LRJoucC+k3RxLgbg3t7JeVlc67sArDHYYlxDt9YBfOd765NQIl6ABxH8yHBTXHx5hsV4karzDM/L8hhgpyHfnRIfy0eq+/QQG8OtNHmCGWT3ZvcRXLwh3mxtTFwPz4GEzE6jBCd2F+7b1ouWbWlA3ipAjzmeDGBUhoG/G5tCxAwnZ+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsWqU1eg7lglppe+YUgBuvOoRHh0k1V4+YYTSssmORk=;
 b=LFxHbH7rrlrLiEa09m60JhSkHbccEEhY+vYUp7XftdPfQ/vuBqr4SeBU2rXQMbHqOs2QzaOfzsmyUU9G/XSgnD/AXXjSENFgnDt2nsNYX0d7/90E2esLWQq+5lrqKNki/R9S80C347m1ZaHXv80C+rnx8GlZQoW1WCU893pXrG0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4565.namprd10.prod.outlook.com (2603:10b6:510:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 16:30:10 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db%2]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 16:30:10 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 2/6] qmp: add QMP command x-debug-virtio-status
Date: Thu, 18 Mar 2021 12:29:40 -0400
Message-Id: <1616084984-11263-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-Originating-IP: [24.147.51.11]
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (24.147.51.11) by
 SJ0PR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:332::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Thu, 18 Mar 2021 16:30:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b67f2153-44ad-4888-7fe6-08d8ea2b1921
X-MS-TrafficTypeDiagnostic: PH0PR10MB4565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4565139FED4E13851B30A81AE8699@PH0PR10MB4565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4i02n14/WvAHG/lnPPNZhLZ/5AtaciFsMu8jTGeIEmWF1BZYNntN0EdqsOliSI/LNtWVKj5dqPkTgd8WB20R2DQjcjh5NCTaMCWIHXSs4JYhAR33269MM5JGdKLMC7IoUo+5V8RNAZR7KN7UClYmQfx6+MdV92+QOBo0PfchMyduUJTjKrfQpqxYyo18dankaFIx6t+I8wJXE6J2CQdlWSaBgS4AF7cYxVGbQeIOt2dwujjhF0J4xzjSxUklkTk/s39QKTMM/0VMLQYzVXBQqwF874NRA/JhELgET7maClm6KTW37YWOGeW02MvRub43qeP2RDrUGBJJamjML0esWX2QaLP09odqfKloBdB6UvTUJS081eLTwCaDooJ/nYB6j8fSsN31Ec+MCus+QB07v366xmmHtafMpR+t/JfsLhwPMa6y1zwKPzWxeFBReU36MjMpaRHRrCo7nwvGy6Vhq+xYSobc8dGMLW0XRNC7mhCncmFxO556Uf7U9RiiqPfAR9Jnwdpp1QYEbQejF6bhWc95PrQmmIgjWel4Ek/YBhVOhmB0gGkXpUgggjURt/x3SBTKLblJgdXjFf03J7AQwNDWeJ+VxQgEzwnfnF05kE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39860400002)(376002)(136003)(8676002)(66476007)(66556008)(66946007)(38100700001)(36756003)(186003)(5660300002)(2906002)(478600001)(86362001)(52116002)(7696005)(8936002)(316002)(16526019)(956004)(26005)(7416002)(6666004)(44832011)(2616005)(6916009)(107886003)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vb3DC8kl0MN5MYbCvKiG8FUqXXbpIjhmk0I9Gu15NvN5U2C9s15tx6UbTjUG?=
 =?us-ascii?Q?u21bsb2kmUxhz80QYHL68A9Bo7zUqaNKn4bdUPm6gf3ZxbYKeRBFhF6yNFfw?=
 =?us-ascii?Q?L96atJliPpANbcxtTGLaRjalSBcAIHiOcw6aHgCJ32uHIziGv7Vhh82QnNEA?=
 =?us-ascii?Q?Tkc/kzlZy277vjf638yCvtw5Xs0cpQdnpMAYZPC0oaojUfyggotHuhtgmZuI?=
 =?us-ascii?Q?tAC36KD26xFms52QPDK8UDL9bPTGm3AtSmiPm3PJQoGtU9XvwrwFftZSg17D?=
 =?us-ascii?Q?Hjgmo78l7+FaPGedDuvRs9HJFJWoAF/+ZZY1gTEMosK/yrY/qbKI3Xi5AviI?=
 =?us-ascii?Q?hWPFA/IlXEGOP3nfHZNTIBCm7QSraoeWmcBGywg1kerLEBFZ4Y6xLTmjx1Cq?=
 =?us-ascii?Q?kf1zVcZTYvvoOSamkvqbkcKPKUHPIup4TtoL+75feD0QZkCOLTjhU2xbUUTJ?=
 =?us-ascii?Q?JwDTTB5odYBZO2ZKKVa7XW/e1HmJzNpoZ5ZPt7uZBgpWSsynewCYo18NPVcS?=
 =?us-ascii?Q?TgYvTHXsGoHdbuZLAl5aFOLO1DhPwU4v65ULN8N2xGJtMb4FInE5qjl9rp9Z?=
 =?us-ascii?Q?DRsTUPYKSasnppWvgi89Mxg81ipc1eafF5m9Q5Iy55cKUFbZgmg3660YbLkR?=
 =?us-ascii?Q?ymL0dRFVrx8HWo08MNL0g4WYeHHAEUkJP4H4JdJUClYyDp8r0ABK+qhFrmdl?=
 =?us-ascii?Q?mVPnt9fTZqA9GlRqu7q7+zkbSS6ITNcMhH7WKaOqljKE51NBzo5AwjeuswYL?=
 =?us-ascii?Q?3nB5rDrC4o6aMPX/uZ3ZVpPv5wx42lbPKf4lHPSvtgghyd6GI7Av9VSHVpgM?=
 =?us-ascii?Q?ZlCbYcVTeG6CySagKmAo+28XZGekDSwixIQecWyJSNnPaj5B9IAxSEzJLAfe?=
 =?us-ascii?Q?+avESJ84UqSGI5qqiLoYXR6EU1SVcWaLXkpTyE11/UQ8x2x673KWtR1Ga9f3?=
 =?us-ascii?Q?q06kuS6wnkGgBUuCtWWnbk6AzyKqBwavAjPDDXBL2HhutWNAB4JacaZtjZN9?=
 =?us-ascii?Q?v34EXU4jLz9Q2Yuf4sfDjqlcwD4uqdfkczNir0UYEXm3tmLWRugbnRrDAmSv?=
 =?us-ascii?Q?tVpnO83CnNF9fxMQXCUK+nxdhAizTqgVVFGWBAUwtr7zOEzSD5GWwTTyBwdO?=
 =?us-ascii?Q?TRCwswB9P3F6J63Nos4SLfQDc9qBzXvMmZU+VvZ188rsBrSm3J1IkNnaavfc?=
 =?us-ascii?Q?rxgtI8d6Fl1HoYL7O4EGBHmVbuGBfylzvYQHKGa6HPB/llBkQ49yqdPEOb15?=
 =?us-ascii?Q?trx67cirrxW6jLxBl3WmJypicaxfMi7iNSjyvV6SB9+Tkd4KEYXSHAqo9fxN?=
 =?us-ascii?Q?OOFt9RzD5FokPLKkp63tl1gX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67f2153-44ad-4888-7fe6-08d8ea2b1921
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:30:10.0965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myigQCXXCTg6IM3S/NTlazd6WsCYXw0hyM1lR9iIkBva4XvkhahptfMuR27snkBwiARHaibmNQGRHtppKGBJ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=jonah.palmer@oracle.com; helo=aserp2130.oracle.com
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the status of a VirtIODevice
(features, endianness and number of virtqueues)

Next patch will improve output by decoding feature bits.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  5 ++++
 hw/virtio/virtio.c      | 50 ++++++++++++++++++++++++++++++++
 qapi/virtio.json        | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 131 insertions(+)

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
index 0e12561..69ef890 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3882,6 +3882,56 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
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
+VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
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
+    status->guest_features = vdev->guest_features;
+    status->host_features = vdev->host_features;
+    status->backend_features = vdev->backend_features;
+    status->device_id = vdev->device_id;
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
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 0fbe542..4af95a0 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -66,3 +66,79 @@
 ##
 
 { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
+
+##
+# @VirtioStatusEndianness:
+#
+# Enumeration of endianness for VirtioDevice
+#
+# Since: 6.0
+##
+{ 'enum': 'VirtioStatusEndianness',
+  'data': [ 'unknown', 'little', 'big' ]
+}
+
+##
+# @VirtioStatus:
+#
+# @device-id: VirtIODevice status
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @num-vqs: number of VirtIODevice queues
+#
+# Since: 6.0
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': {
+    'device-id': 'int',
+    'device-endian': 'VirtioStatusEndianness',
+    'guest-features': 'uint64',
+    'host-features': 'uint64',
+    'backend-features': 'uint64',
+    'num-vqs': 'uint16'
+  }
+}
+
+##
+# @x-debug-virtio-status:
+#
+# Return the status of virtio device
+#
+# @path: QOBject path of the VirtIODevice
+#
+# Returns: status of the VirtIODevice
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "x-debug-virtio-status",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[3]/virtio-backend"
+#      }
+#   }
+# <- { "return": {
+#          "backend-features": 0,
+#          "guest-features": 5111807911,
+#          "num-vqs": 3,
+#          "host-features": 6337593319,
+#          "device-endian": "little",
+#          "device-id": 1
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


