Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C81308AAC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:56:56 +0100 (CET)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X4p-0004Q0-EY
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvD-0007BQ-BT
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:59 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvB-0005iN-Co
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:59 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOh08121674;
 Fri, 29 Jan 2021 16:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=tITNisM76d2ptiLo4WZ9Z0oHxop9K3Kuk+IOTcDyeg0=;
 b=BSBuvxIrbHPttupTfgLrKKd2oVGldomde7VJKhh7EM779ga9bQ0T0dYMoUkDfL8WwPgB
 QKmBdYG47bpxbV0CvkJUHwucFMt8U/IAPql3jARaYz8xNXrD9EIQ3lbt0lgc1XT9bING
 c4ZpJ/x5LBcoC7raYBM8Z7VL06kV9BkZwN3j1jbs14ABB+aJ/cjON8IR2h+5gDgL755v
 hkFBCuFNcM0l2TnXD1xLtkC9rx+i3jqZHbfzbtJgeo+r3VVR9AfDqUX70hHy1w6dj+t9
 hhZypTDHQCKsLBNc32sb4l4C8xc4o54CedLuKyNu29b6W0YEMIsqELuEZOHZpry5bw6r yw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 36cmf88j29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGQKm9040077;
 Fri, 29 Jan 2021 16:46:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3030.oracle.com with ESMTP id 368wr25aqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXwC4z4z5LqPkGUgDkQ+JdqozJi6OrH2y8r5Da/+t57UVNfTZc5t9ks+hYcfDjWUZfuk6c8nl8vmomD5WN+V1+xQCwXH4FE7veUjDWIS8aLPY+yp2YsI2xq0FfQqcV2eckVJ3SlEff0358aP7ca0Pgu6QqWoeJXyHXyCEebs4RFATyluFL1xkiTXpCnKvKkutTUliS0mFBdfTGBm32uYelr85aGjzzoh+5Hpw53F5b0iBbksyvoLAm0LVovWp0lddDeow50zHFzvY9Y2wT+YyWVMmcnLQg2tPTuvFj3to0O4uc3UonuSoMfOBID5c8nVDORwYmHLWAL9dRy7KClIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tITNisM76d2ptiLo4WZ9Z0oHxop9K3Kuk+IOTcDyeg0=;
 b=En6KbE8WMKWEhOUn8aRxGCTzIPuO5F/jjQDiMEOwusKyqEKgy0NogoEJvTwDeEbwDhaZa31Ds11o/tzFWnuTMKwrETQZtRmArbP5ukwfciOeKkkwlivAOKJR4s8dcB4vsw+gAskCYn0pNV5n977w6sbbDXltJJv16OCplW/LUEM6TXXKm2KF5E1qH2oOJq6gx5I107hpSqRKa//lVzim01z0i0TzXLuLx55aGmslYWZJcYtgXp5vla1RlBRm1zH7t7v6F4a2TOn4lFYGFY1nCCaTdbBhP8rs6QtHhVQPuzgnXZWTZtkje71MNjfcGewrYh2hFb7naJ//2ieqZlT7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tITNisM76d2ptiLo4WZ9Z0oHxop9K3Kuk+IOTcDyeg0=;
 b=m76CQXi7gNJfeozmvFfZkIVRSH93s2SCNgM5mLjJXtbAeoh167xFKPVMDm32FciNtKtET/ePEBlFIweP7+nFng0RWsnE/bJ/EvpdZBVk3elpcM3MrytQ+8JCT/uJPHk266hx7OB7FRo2RXM36X2pE5ESPc4AzWt+sCsAF1hRLYY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 16:46:45 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:45 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 07/20] io: add qio_channel_writev_full_all helper
Date: Fri, 29 Jan 2021 11:46:08 -0500
Message-Id: <480fbf1fe4152495d60596c9b665124549b426a5.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c81a8028-0f3e-4b4f-483d-08d8c47576a8
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4686684512B902986708DAE890B99@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mNxeuATQH05RNmPvBFvEO06TunXDxfQwm33+CHyCse9D+bTxGetATJ8Ad4ZJOAdDxb8JXc5bI82W+Lb/MA4Y9QFkCWkKTtKdEAto2nlb5Geyppkab6piIjV+Bm8nWepoA0ha9XyDamU9wq9J79OBEOTHH9KApDZzlGTLG2zzzcn1tnBJ60bNjkGQ1KJsAAOSF6zwvkUEsiIkmfGMdU8faz0PN1n/Bvp+DCF76103w74QseXNsZSE2nK4s10kLBzVgXNffX7exTAH2jvONTbS2uRsOZIGAwi3WMk+46K+xS0NCcxil5eXjmhsiO0CbbTEnbz3h+lwkW7l01XrF8UPu0siTfoq8rbBdpj0UjQWddfR53NzWV9Gu/PSiXHn4Q6hDNnbI77CAfZOUG0FuLZ2+km+LvSF+r6gDdz0Ms815w+MmdJDKfFLjWK7oWxLcbDzEj9y/E/DuBNNP/TlWAAXBZHP33UYSELnLD9IoO8+lkOxLg+ayYxePjv6+0sOTFran9JOlix7S87qxgVchqu8mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(5660300002)(52116002)(478600001)(6916009)(7696005)(36756003)(4326008)(83380400001)(8676002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(2906002)(6486002)(107886003)(86362001)(8936002)(6666004)(7416002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OG5ZQU5aaGtHMWIwdEEzWkc4bDg3Yk5ydVJkUXoreEpuTkpwZmxzR0x4KzYz?=
 =?utf-8?B?S3lPYmlFa21XRVFkWmlSLzJwWU5CZEhCcFVIOUtxUkNXMG0yS0VkcmxDRldt?=
 =?utf-8?B?VloxTXlvdStBeVZ6QUMrbDZFSFZtV2k5UlRCeUl3TnVZbkV3M2hBb3dnUHEr?=
 =?utf-8?B?Smp2MWlLRXc0THNZWnpCcFlodVJVSWNSMDdNRXJLcU44TC9zNGViMFRXVEg0?=
 =?utf-8?B?alhaTU1USEVReU9oKzJSSWlPRGNZR2JybzF0U2E3UStSYkd1c1ZzeFBCOEkx?=
 =?utf-8?B?aWxHVE93a2hWU05UMDdrNkMzTmFmYUMrZGdOSkxFd0NtWXAwbmVlVGF3WCto?=
 =?utf-8?B?SGFDUndOd0tac0xERmdRU1FEOEN1TjBnL2dxR2x5eEV3clVrZWE5c0pGdEFs?=
 =?utf-8?B?M3A0ZzRUc29TZm5VNkxHUWFDWk5tcXdxTTRzeEtETjNsSWg1NUFXSmw0ckE5?=
 =?utf-8?B?emFtYjVacVNFQnA2TjM0Ym5ROFEwWFI0NmMvSlFKRVFMcUtoZWpGdVE0djJX?=
 =?utf-8?B?ZUczNXErc1k2Tk44bjNBVk54TDVvWVk3b3pZZGNaWG95Y000VU9RTitZTzR1?=
 =?utf-8?B?V0ZCem1mdkhzSHNJLzVLNm1HSmc2dE5BUDV3WnFmcGVPYVJrREpIenRPbVQ1?=
 =?utf-8?B?ZUhtVEFieFZPclRxcTJLZjMvSnp6eG5jT1U4R1BRMmVsbkhSc1RQVXNkakM2?=
 =?utf-8?B?T25WYmFmNmV4TmUzM0V1R3FpY0dZQmRrWW1ld1NJR1h6NXBCaFYxWndKYUp4?=
 =?utf-8?B?OGlkb0dqc1NreTBnNEhzb2c0a1l2NTVmTHdEd1FoNlFPaDVzaGMveUVsQjhR?=
 =?utf-8?B?dW1FWnRDVEtLaXhBY1pyb290RlJSZzVuUWVETGNKM05LS0pzTjZsTk9BeUo0?=
 =?utf-8?B?aHRjbW03S3pLRmdWZTh3eGdrVTZVZFBiSmFqdzE4QXRoaDM3VEtZWGlESGhY?=
 =?utf-8?B?bE5wdnAwSWM2RUVjYnh1NWxwcU0rbUtIRjNLVEN3U3NJM2hiTjVHSVR4L3JJ?=
 =?utf-8?B?NUxoU0NsTzliZmZvVkFCN09XL2V3UFFZVnFhTWhyT3c2cEMxbitVdnVDVWZS?=
 =?utf-8?B?aHpHZllYNnVrdzNqaW5RWm9UUGNQMEl5Rk1wTFg0SjgwM1J6NDJRazFqV2Yy?=
 =?utf-8?B?b2lpVzBrc3RWekNzM2tDb1o2enR3QUdPdU1WRUkrSUhaUzFXN0E5a1puSmw4?=
 =?utf-8?B?V041ZEN2UThueHZzRHh1T2hhS2tlVnNDS0FJRnUwTk54UE1YRVhpYkF3cXk0?=
 =?utf-8?B?S05pbERoa3VqN0trckZUY1Q1Nk9pY0tSeDR0TVB4dkpJMlNMMnVSZ3M3aHIr?=
 =?utf-8?B?ZW4vbHFVQVFwVjZOMHpFZzJNa3MzRzNsMUpzd3Z5UkhaZ3BQRHJCUFk3VlVJ?=
 =?utf-8?B?TVpOUG1uMjJjdC85Q2dyQVFrSk1ZRkJiTVlpSnJ5SDFlZzd0a2Q0U2JYd1hj?=
 =?utf-8?Q?bp6YZSXo?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81a8028-0f3e-4b4f-483d-08d8c47576a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:45.5891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uqusjshNCRRJov5Pnkuz/Nfl4HqKmMd/tVtDGvIVWNEWbtCxxlvrhd/TLJruHb4bU6Gz4q2Eu7dTMfU4DzIHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
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


