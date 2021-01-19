Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD262FC1E2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:09:22 +0100 (CET)
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yFd-00087Z-95
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcr-00016R-Pt
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:17 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcp-0000FX-RM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:17 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKOoFS146175;
 Tue, 19 Jan 2021 20:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=tITNisM76d2ptiLo4WZ9Z0oHxop9K3Kuk+IOTcDyeg0=;
 b=RBPL1WeYf8CU2yEPWnUZqVGHB+C+1qoWDXD2U2RxqLlPh+wL5oz3qd2GaFbTyjYkdwmI
 nbCtJYsSOZzjDWhHTlEU+edvFgABVsctFVSl45tN7lbbaSMyT78T0X/jRiVga+THGRvV
 zEoNUB+M9dD/VusKoQGQpA9XUayW/PJNgqY4FFW9Yia3zjoM99Ml/q+hzpQwIQeGaJg/
 JN6U9Oe8LUEAuy5V8IhTivEheUjlH9Y3OJ9o7ccTatavfe7PkLEO6OeCNK3pZiwh7y4w
 YJQ3mYQIwgexkX2XqJX26hpFkJxgHsd8nR7IOR1eNff+jOOHjDQGJmAAx3bAwwgRRt8a 7Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 363nnak4v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPdR2128405;
 Tue, 19 Jan 2021 20:29:06 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2056.outbound.protection.outlook.com [104.47.37.56])
 by userp3030.oracle.com with ESMTP id 3661njtaer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJaqONV53O9/ICXc+2ezyY7p24CEBzwL8F9Liu2hjbONebhVhN3m8zLbzLLP3dNqlOaMHI25qbb+T6V2rd68JdEzpoUyBDi8MxHMbUMf/w4Yoe3D8WNiMl9+tEQAHHh0FgJsZAXZ+NqcMsFgzn7eJPRqBSWdolkEkDz+5fEPqTNE99kPWh39Oxx3GZ8SF9rJ1nNNbXatTVxUilWyGyA05zGWve4gBGiZwqL/j+JyYzHQHF1wp+QK20P8FL4VsKXcpq5d34Bu2mxETtaLI1G++98AmvubuH+J400tWK0RsPHOZRczWFcm+ZOvTXgaxUF0vt0O1Y3+d5nte2ebp+tuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tITNisM76d2ptiLo4WZ9Z0oHxop9K3Kuk+IOTcDyeg0=;
 b=inQe13LTUDqaJzBVHOfWmd7LZ0kPq38UbFROorSaryoOIDuhpX9/iwLR12/BKdBh2sTSdPDepeW1mPFLrtmD/wi752lxatZKBlvgquCtFAwc/j/HuOmnloj09CEOJ4DXwUsmTCaFc6ypxiXXbjKeyiEzmJTesbBUl1WWcCrq+OIk55pmgyTCEsEGn69lvIJh1ANDezNtkp09enkPmTspCixpaikih3b3TtnwiaTQj13aNRNRC0RDGueYfx/eBTjP5oIxdWq5SUddjznolDKIOQ+UoFZs80nydCSzmhlWk1T3Qt9kCT1dxe2NJZbMDbDbeT7yf8cT3SRup1DrNTDm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tITNisM76d2ptiLo4WZ9Z0oHxop9K3Kuk+IOTcDyeg0=;
 b=ew6l7VBwWAXaTAvU/1qdRoI6MFkEdEKm0xXZEbP1WCcGKx44nMh4WjOLFFiyc4WF4Lr25xsEPnJxTKJha16K9ehrzaY93fd7HmsFdXs6YNT3vJzucp++lzphOLyr1IIc6qDaU81iGWahVP6s86nPCJqO6DdmiogI5CiCojZPw88=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:04 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:04 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 07/20] io: add qio_channel_writev_full_all helper
Date: Tue, 19 Jan 2021 15:28:24 -0500
Message-Id: <a18dca8276a637abf672282fa79f05a8e6136236.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91371649-b44b-4526-4208-08d8bcb8dd00
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3349CA1375DBF288BFE36BA390A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: okD2umQcyXEup6iLSd7sj44opLyC0KdSOBNQkEYy3zjLfShfL4sh5sAPaGYTGKnRghqEAx+nVROvnjqzXCowY1NkK9Yf1V/roUPSgG/tUoiHXHpB28qgmQsjYvp9U+FnU63P/xiZCP/ZVUPGlR4u/LneWzV5MDtItIN7eontt80wESqQu5IF6NmQh6HUoskkLdH6qCDjhi0Q7t8FDBVhBDYpik3NUi9HrsmfYNs7bU6n3uhSKsVZUzOP8h/qnSQl/H6OigZ+fK1su4H3C8bIa4K4VrtYkXpZKPUnAqY7359oXWL/UjlmPPEM8diOzhqDSXeTYXloSQhsyIAhj16Lhn+xuizgmBH6f4TAoAd12j7MB0ep/6OTyXF/Y9wxi3nZPkaK37MAmMzsUdv9y0YtSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VDdGMHlKMVN1aEFFZUs2dlJlc2szakg0S3YrbHJRa3JRcXdFVCtOMWljazY3?=
 =?utf-8?B?NmRVVENYUU44SUU4cHY5QTFUNnRjQnRsRXk4bFdvakdVU2hzc1p3cFljVVQ0?=
 =?utf-8?B?THlOWkZYVmRiTXlpQy9HSzMzc3JOVHB0VWtrQUdjV09rK2s3MjBHVlp4STV0?=
 =?utf-8?B?VkNYeWtrelg0eGlkSndjUDR4RHJvREZLcFhWcXpUM09SdXBIL05lbU90bi9Y?=
 =?utf-8?B?dkJvSllrK0dxYkJnZXdSL29MWGJsTncwVDF3UExaMXoxbmlaKzR3SGRlUE9y?=
 =?utf-8?B?VnRBZWhMQXNYK1BYTGJYMmFEU1V2YXpyeDlqaXVJZFd4UjhnY2txNXB4NnIv?=
 =?utf-8?B?Yit1eUZ0ekdTM3BKZVJkZ2YrRVJTMHo4SEVIT0pyeUdySEJFVXRGRTJBYTdo?=
 =?utf-8?B?QXlxTFgwQVo2ajZ0NTllVXRZSU9YeGNuOXI4MndUSFV6YnNrdW1CZElzSGN6?=
 =?utf-8?B?UCtINUlEbmt0cmpkZzhUV2pmQjZNby9WMjY3SXVkdlAvMjFXWWVzUEdiQlJq?=
 =?utf-8?B?Qit5Skk1cmFqclBWODhKUExEeXhZQUVJczVqa2podHFrWmtGbnFCZXQ5SEQ3?=
 =?utf-8?B?RDdGSU9GUEF1Ujh5Zm1IMzFWTTNEVzU2UzIvbGkxbGZ6U0xRVFF6bnZuNkhW?=
 =?utf-8?B?eUxrTjg5OVIyT0szN0JKQTVLRGxoYkUrcmpkVWZLNWE5QnNmODJ0cGFZL2to?=
 =?utf-8?B?QXI4YktmekJOM2l1bXJPczk1bldBemRCK1R2S2dHYjFNbUE5TlhiMEhnU2tM?=
 =?utf-8?B?WVhMNDZBUFlXVXl5Rmxza3hVUnU3YWpvWHd3TFlBbWorb2h6VXRnS2hJSWhy?=
 =?utf-8?B?SUxmenJXNUtzTVVUTEZKM2J3V3dpc0tyOVJzQTNFWFRPRU1PMUFxcUdzV0p3?=
 =?utf-8?B?OFRXMDlITFRzVEdoWHpFcFJXcjhyUEgxemxLSFhSd1FQRHVBcXRUbFZjVmN5?=
 =?utf-8?B?UEFwamJYa243aDhmOFVia0NUS0tKbEhDbHE2YjRhMUx2aUNwN0piSVdtQ2U4?=
 =?utf-8?B?Z2I4VS9CcmY2Z2FGenYyYzkxZVVRcjc1U2huVjN2VVV6UEkzRUwzREd4WHhN?=
 =?utf-8?B?dC9ZVE1UYmFEUjdlaGw2SDR5andkaHRhUFZ3ak85bDdNcW5ZQ0VVazR6WFpo?=
 =?utf-8?B?NHVtb0p4aHZGYzFjWVhlVk1ZcmFJK1o3YjMvSzlhcUI4aWNCYnZiTDFRR3hS?=
 =?utf-8?B?MnR6d25zYjVDNmNmOURzK3RWcGpCR3lJaFk1YU5IK3g0dEFmdW5QWjdCV1pu?=
 =?utf-8?B?N05pV3oyYllxYk5aMGFBUEVGZnVIcjRGb0pNS2JoREh2VHo2bFVobFluSmEz?=
 =?utf-8?Q?Wg8/W1X5iGHrI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91371649-b44b-4526-4208-08d8bcb8dd00
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:04.2969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McquHyhaz2uADogOJY0wobJZsgVn1w+4q7vdDhcAFpbBcX6WM8UOVmJeHFBw8QDdNiuhBQEpxCtnYt4y99e77A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
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

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Adds qio_channel_writev_full_all() to transmit both data and FDs.
Refactors existing code to use this helper.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/io/channel.h | 25 +++++++++++++++++++++++++
 io/channel.c         | 15 ++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index ab9ea77..19e76fc 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -777,4 +777,29 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
                                     IOHandler *io_write,
                                     void *opaque);
 
+/**
+ * qio_channel_writev_full_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to write data from
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to send
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Behaves like qio_channel_writev_full but will attempt
+ * to send all data passed (file handles and memory regions).
+ * The function will wait for all requested data
+ * to be written, yielding from the current coroutine
+ * if required.
+ *
+ * Returns: 0 if all bytes were written, or -1 on error
+ */
+
+int qio_channel_writev_full_all(QIOChannel *ioc,
+                                const struct iovec *iov,
+                                size_t niov,
+                                int *fds, size_t nfds,
+                                Error **errp);
+
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel.c b/io/channel.c
index 93d449d..0d4b8b5 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -157,6 +157,15 @@ int qio_channel_writev_all(QIOChannel *ioc,
                            size_t niov,
                            Error **errp)
 {
+    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
+}
+
+int qio_channel_writev_full_all(QIOChannel *ioc,
+                                const struct iovec *iov,
+                                size_t niov,
+                                int *fds, size_t nfds,
+                                Error **errp)
+{
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
     struct iovec *local_iov_head = local_iov;
@@ -168,7 +177,8 @@ int qio_channel_writev_all(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
+        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
+                                      errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -182,6 +192,9 @@ int qio_channel_writev_all(QIOChannel *ioc,
         }
 
         iov_discard_front(&local_iov, &nlocal_iov, len);
+
+        fds = NULL;
+        nfds = 0;
     }
 
     ret = 0;
-- 
1.8.3.1


