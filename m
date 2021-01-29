Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B697308A91
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:53:03 +0100 (CET)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X14-0000jV-J7
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvd-0007Fs-48
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:25 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvN-0005kB-K0
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:22 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGNxLI130080;
 Fri, 29 Jan 2021 16:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=MoqVSB+Dtjj64DS2tTGHuJFvOgUnf0S9FxFXISl4k/w=;
 b=RXn5x7j3ssAmFfR1ZqZB2xuXLgVE8JKHHddJcy09x0Dlsefp4pT2W1YkMTVxitS8N32A
 tLZdUOwn77wiWmkhU8wodHvEqafdJllKAVIwXAVqexlj/0Falid5nOPYXJXn1IKBjoTg
 pbI/SsyWjY1ZkTHVNNpclf4FAvqOTy8q1DASyP14RYeF80XrEA6u8T3NY8mdOIC92NGR
 SljhU9xiEcgkF+zUKsIrihqPq98een+Zt8DAMwvcLWaCpHyBiBniOjRc2Cjv1W0hRzbB
 Fjf2BTewg73Dgo7RW0wMfHaTtGHAd4pHqrI4PbuWVWkxf82TiTfLrZL0QNVBFIBtAEQz aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 368b7ra9ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPuOj089786;
 Fri, 29 Jan 2021 16:46:52 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by userp3020.oracle.com with ESMTP id 36ceugw38k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFmxcpGhpmc1SEGZzNH5h6350lo6h7r1gy++SOQ4RRdkpMQAPLrF/jBwyS8U1DUCZIZOmYwhynVUfFalP0ZG5qrZoKImk0xzDtiZQannYwNbII2fybxymrlBQUzr87Jlv00ZdEbJs35QO0QCuMmhsUoG/x0N1SoroWaTBrxqG5WMy3FgASBPZoeEme1X8ddN5VAOYb/uxb9SwJv/sM4WQQPHu/q3cNCyTRcHFyXS+C3+WADGoOJturFTb6LN+TpPz5whrk1mP52KVhZBBv6equ7IkkzxBQISwDc0DPiE+FMTGZmaE5adVRrAIdFMJ3YRgHwkeRcromi7aAxUZ8rEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoqVSB+Dtjj64DS2tTGHuJFvOgUnf0S9FxFXISl4k/w=;
 b=b1IIn1wIPzg2BcEM9RNYqxb9qiYGo2dwnIo+X/CWgx3k8xoy/0PSVbfhdpFeMvJg9c6JcQJKqTUHFD2+IPAB9IF9higLarjdI8e8N0Q77GN36imeXHjYFb4Q+wLCYQReoz+fGTtgAXnSfPjaimJ972JzrlnAVHum3qj8TFbnVqV9s3vWq3Q33ZYHNhoM6dXJIlVmJCrs2ukNCYDQ8vNZ9sOF05YE3PEdeFSTh/494ooU1HGbBcxNj1GmObVjM+XjCpV/u4ftnTZq0gQBNdQ93/iCj1vMeaR/N74KUi9DWPmeRuga7OI5CVKct8Xe1fmInu1GjrdJqc/zMqoX2Id5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoqVSB+Dtjj64DS2tTGHuJFvOgUnf0S9FxFXISl4k/w=;
 b=cwIPgUmX0RpzxnJHnhwEX2a8vwVy0dfvaVBmY3L5ybknnR2VDhK+XxzfddMjVrWcUkaiE7MFl4lBlFx8o8yGihcp2mjx/qQ7oOSsuXTfQLMY7lUI2YZtWxe/s6pTDThKCzfDkVD6jX8sJgBvrLOzlSZ6QTb4Ym74zcbRXLiHf5M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 16:46:48 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:48 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Date: Fri, 29 Jan 2021 11:46:09 -0500
Message-Id: <b059c4cc0fb741e794d644c144cc21372cad877d.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd8d86f9-bb07-4563-227c-08d8c4757838
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4686A624B4AE4FBA2E34658990B99@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BXuowne+FHj5n+5sDb1qwKtSUEZ70vpXHVLze1mkzeOeY5x/uVVVdJyxaDTWolsNUsyD0SQeiM1GTIxYG6AYeyS5S1wLdrlX5IB5mGzbLFc0fCL8OoydGAE0JQuVTxH28WJcB+7U5Wi5xHBCyyTAS/sqNPtbiCVWSaefR4yJz9k9kMpxTg3RogSup3Dmx8QmwhMAxK2qfpU25X3EYiwFR+WrHlXIyJcAHjW8ga/ih800zGGrd4XydJQ4BOUk7KQthyFnK3+Tqd1HPe8RG0kxQI37z+Tf2KryQLqVVkwy+kj5hn4zU+38BxJigRNl5y9Po9o5wa7zKVeDF/6Rh4azW0CvdScp+4OA9lgKcnv9DQK+96mv/xQ2giMjxIseZFt3R+j1RWvd+Id7PqCKqgYyTJza+GmA0Nd3rgyKdpbgk0ESz1LCzaN8QYsqmhBRsQyVZE+tjKBbwxF5chVUONgndtN0LOZTBCtZKD34SEX/+weDW1rVsLUlCFjNahlPj5KWxPa5KigU8AOsBY33Ja/T5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(5660300002)(52116002)(478600001)(6916009)(7696005)(36756003)(4326008)(83380400001)(8676002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(2906002)(6486002)(107886003)(86362001)(8936002)(6666004)(7416002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?C9IAsno0iWbitLVzwzFU7znCR1knVbfLyOCrL9L9O3cWLr4XxuTxRfqfqAns?=
 =?us-ascii?Q?2iqy/zH1mO4UBtPyHgt0wa9oabd/PG6z6Ok1NU6VffAGCvrC6f/msetKkONs?=
 =?us-ascii?Q?/CgQUyKWlcxfGOm0ir3yAaVsdHSK4x4ng6RpPplWhHjuOrjCXi0qyMPFxjMA?=
 =?us-ascii?Q?Ab1a3I4AE45HUEg8dhC4H7qKcXNrpsTDIs/N8qGU246Xa6fmsaAgcwv2H/2w?=
 =?us-ascii?Q?WNlq3zT0wWykUzF0SXdMZtK2+rVhLy3JzDy5oU3YLeqqPghcEvkeVKZHAO//?=
 =?us-ascii?Q?W63cZDObyHCZKMEUbvJs60/ic5w51klvfFUGgFfTNKos4DRCwvG+1bOtPiaQ?=
 =?us-ascii?Q?DuuvGMzfbX4Xu+cNrode++d6NbNxyu/ErJHms/aWgzdA2SKD3zfI3nTxHOqq?=
 =?us-ascii?Q?HgV30zvDEspGGy2yAGMQtpSICtn2hQIp3j/vj59TX/ANv8lx30OGujfCo1Hh?=
 =?us-ascii?Q?aIhvupAbc2y4ci/v1cHe+4Q74jpUFkNpKdUQxLCCJflgNZSHXrNPsx9pAkSX?=
 =?us-ascii?Q?iAA9ssJlNWTPwMF6UhbHaI/hQDx8Ev2/NeYScbYy3gdHHz+2qa+s/Y/0V7md?=
 =?us-ascii?Q?i6xYxoIHX1gp/3+6IQZpy5OQaDiWWtLU829W65xJhEArBw+rPCdTqIhEN4kp?=
 =?us-ascii?Q?w9PS3Q08de7XAOf6LsNBGPqomysx9hk0AoAowoU8VdFA1RPcs1WpFJ5R/Dro?=
 =?us-ascii?Q?q40B7dhvXzFxQWS0fAqEvu69TU6umO5iSkjdtUgReoVuOpGjWvXmJP4EGQcA?=
 =?us-ascii?Q?h9cpY2zN9OEzLuFlFxfA0QPbdZIOH4KQ0aj9hTWIZoj3aQ78X5DbpMeT7Us2?=
 =?us-ascii?Q?jA70/+aIjBNmNUh+sBCERvpFV241cizeG3d0KIozqviZxUjyUP1ebom2LLSa?=
 =?us-ascii?Q?KyVxbvaZxLntvC43vJka+zxLb79RURS73NXAwZ6A57XvMCKUQ1rB7kqn+s33?=
 =?us-ascii?Q?mMe8CPCNELqwZLa//6q7CCf5bgoQbAII1fbk8+XAbExnoG5oHr3IG4zsWrdt?=
 =?us-ascii?Q?PTjmj2E3ygfN1xyo7cTDsZgamSbtSOOI/7RwYziA1teVL2FkLji9jr9ITUbe?=
 =?us-ascii?Q?yhjEuY1W?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8d86f9-bb07-4563-227c-08d8c4757838
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:48.1856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIGZXSzcbJjQCiDOPNrHlF9bv/fMG1MdhLIfgmA6YU0Dusf2tECyp95tGfktH2FyXev/ucf0Pg9ppjeYBgNXnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Adds qio_channel_readv_full_all_eof() and qio_channel_readv_full_all()
to read both data and FDs. Refactors existing code to use these helpers.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/io/channel.h |  53 +++++++++++++++++++++++++++
 io/channel.c         | 101 +++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 134 insertions(+), 20 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 19e76fc..8898897 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -778,6 +778,59 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
                                     void *opaque);
 
 /**
+ * qio_channel_readv_full_all_eof:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data to
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to read
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Performs same function as qio_channel_readv_all_eof.
+ * Additionally, attempts to read file descriptors shared
+ * over the channel. The function will wait for all
+ * requested data to be read, yielding from the current
+ * coroutine if required. data refers to both file
+ * descriptors and the iovs.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+
+int qio_channel_readv_full_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   int **fds, size_t *nfds,
+                                   Error **errp);
+
+/**
+ * qio_channel_readv_full_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data to
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to read
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Performs same function as qio_channel_readv_all_eof.
+ * Additionally, attempts to read file descriptors shared
+ * over the channel. The function will wait for all
+ * requested data to be read, yielding from the current
+ * coroutine if required. data refers to both file
+ * descriptors and the iovs.
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               int **fds, size_t *nfds,
+                               Error **errp);
+
+/**
  * qio_channel_writev_full_all:
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
diff --git a/io/channel.c b/io/channel.c
index 0d4b8b5..4555021 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -92,19 +92,47 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                               size_t niov,
                               Error **errp)
 {
+    return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
+}
+
+int qio_channel_readv_all(QIOChannel *ioc,
+                          const struct iovec *iov,
+                          size_t niov,
+                          Error **errp)
+{
+    return qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
+}
+
+int qio_channel_readv_full_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   int **fds, size_t *nfds,
+                                   Error **errp)
+{
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
     struct iovec *local_iov_head = local_iov;
     unsigned int nlocal_iov = niov;
+    int **local_fds = fds;
+    size_t *local_nfds = nfds;
     bool partial = false;
 
+    if (nfds) {
+        *nfds = 0;
+    }
+
+    if (fds) {
+        *fds = NULL;
+    }
+
     nlocal_iov = iov_copy(local_iov, nlocal_iov,
                           iov, niov,
                           0, iov_size(iov, niov));
 
-    while (nlocal_iov > 0) {
+    while ((nlocal_iov > 0) || local_fds) {
         ssize_t len;
-        len = qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
+        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
+                                     local_nfds, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -112,20 +140,50 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                 qio_channel_wait(ioc, G_IO_IN);
             }
             continue;
-        } else if (len < 0) {
-            goto cleanup;
-        } else if (len == 0) {
-            if (partial) {
-                error_setg(errp,
-                           "Unexpected end-of-file before all bytes were read");
-            } else {
+        }
+
+        if (len == 0) {
+            if (local_nfds && *local_nfds) {
+                /*
+                 * Got some FDs, but no data yet. This isn't an EOF
+                 * scenario (yet), so carry on to try to read data
+                 * on next loop iteration
+                 */
+                goto next_iter;
+            } else if (!partial) {
+                /* No fds and no data - EOF before any data read */
                 ret = 0;
+                goto cleanup;
+            } else {
+                len = -1;
+                error_setg(errp,
+                           "Unexpected end-of-file before all data were read");
+                /* Fallthrough into len < 0 handling */
+            }
+        }
+
+        if (len < 0) {
+            /* Close any FDs we previously received */
+            if (nfds && fds) {
+                size_t i;
+                for (i = 0; i < (*nfds); i++) {
+                    close((*fds)[i]);
+                }
+                g_free(*fds);
+                *fds = NULL;
+                *nfds = 0;
             }
             goto cleanup;
         }
 
+        if (nlocal_iov) {
+            iov_discard_front(&local_iov, &nlocal_iov, len);
+        }
+
+next_iter:
         partial = true;
-        iov_discard_front(&local_iov, &nlocal_iov, len);
+        local_fds = NULL;
+        local_nfds = NULL;
     }
 
     ret = 1;
@@ -135,20 +193,23 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
     return ret;
 }
 
-int qio_channel_readv_all(QIOChannel *ioc,
-                          const struct iovec *iov,
-                          size_t niov,
-                          Error **errp)
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               int **fds, size_t *nfds,
+                               Error **errp)
 {
-    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
+    int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
 
     if (ret == 0) {
-        ret = -1;
-        error_setg(errp,
-                   "Unexpected end-of-file before all bytes were read");
-    } else if (ret == 1) {
-        ret = 0;
+        error_prepend(errp,
+                      "Unexpected end-of-file before all data were read.");
+        return -1;
     }
+    if (ret == 1) {
+        return 0;
+    }
+
     return ret;
 }
 
-- 
1.8.3.1


