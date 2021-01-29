Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7414308AC7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:01:34 +0100 (CET)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X9J-0007xi-Ih
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvj-0007Gb-NV
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:32 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvN-0005kM-K5
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:28 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOJvl130352;
 Fri, 29 Jan 2021 16:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=fWMhblvM60DGaw0jnA04iCBb0XjAWmJNBccZWikiGDQ=;
 b=e7fltC3lSk35ElU6aWVul0mX3QJaBrLHd9allZxhXUmrrzYmzsxGU91BPVnqIrq80jzY
 0XhVECRL154HQvWzzqN7Eqgj50YY3JQXUL8CtyXX/IobUveRTt5XoW3ESPqcqOUogqlX
 A7vP0K5rgzAayA0RzV03/7v0pYTFaZP62MAXhTS3awYEmFdqXnD0v6GtQhEqyzD5o8Rv
 YZ6+0BRqQGJZmP+pJiTRanp2fKZJfz4N67S4FOZHeQ+i1PuJPfqZ1bf3rv83wkhllQvI
 pSqF49FdiorOw39H0p6BaKQHugyzs6Pgny3q5e+8FnAdW5pTXTxtG9WIbiv+LRvvi+7i 7w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 368b7ra9f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPuOl089786;
 Fri, 29 Jan 2021 16:46:53 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by userp3020.oracle.com with ESMTP id 36ceugw38k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJzL01qe/dWHmvNE4QQ3fUZD/z0tcuETkzIsfqTDlTSv/Tmha7L+vylxdg38pSHyKhfhnMDPcrGIfvOYw2sdsxxb21X/HJdufuBfz/PPCmTe1sV85uh1LlUvGeYCaQ91wpKoajnSCjVhq/XbsV7EutFu6lMV0K0FvBWcT3hEAtX7oXKtpFNwpuoX39pUF5M4Dw26HqBBScKOWAxe4LAomA1jb/bziHa0uBBxYAdJNpkT0b4v144JHvcYMmGGyve9v/kAeGh7Lnp7J9a0gSFFMBVQ/K4cLkLC8J3p3yYrsC92usoBTD6IFWTrGgiZUFOXM9V4ZF6HFlcWxVKJL8Kx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWMhblvM60DGaw0jnA04iCBb0XjAWmJNBccZWikiGDQ=;
 b=OgUCp9xTt9EGpHmO28gLIDn9aToNxtr5Xa2NA39gL69ifNqWA9a1ce3TMnp/XDRcYyHPf2WC5MusuxwfAMVwRLYs4Q+lRZToVaKG7/OMhY15m5G4Fl6ZaV9AhukFg4kRbZqHICyWIi3vvxpTsuhslU6AxVrpl1DcpT2ZuQT98mhCb4iMUddTBQL/peLpDtaU65d9ESCCA8YQ5dMQhlCRgplHBiENoBGze8NNnZ3IpnkKsX3bnd9264jo5kOyv6NOITI/nHvRvfw9qoOrLkLttGJUUlpI+FnG9lwq1P/gYTCA185iQ46mnXoeaZT9SoV/a+GzgNnwWvceZX+jQlQk6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWMhblvM60DGaw0jnA04iCBb0XjAWmJNBccZWikiGDQ=;
 b=I5Qdvj6Miw4xpUhGzLReW9taLoIt7zFvNyYY05UdLxCygJ7Nk5/Nhgvjevae0EGjLrLGvDwQbgVgQVlPf47+XptCkzbCD1nupoOIcLtZ8q59ouv7Kzd57d2Xnlx5U8GdyrdHHCFPb2NUwoIviOhd1cBTzTXvqGusTPmo+83iFXE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 16:46:51 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:50 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 09/20] multi-process: define MPQemuMsg format and
 transmission functions
Date: Fri, 29 Jan 2021 11:46:10 -0500
Message-Id: <56ca8bcf95195b2b195b08f6b9565b6d7410bce5.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f44f724d-c441-456e-9e08-08d8c47579bd
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB468669C39E281CF3A7F9AA3C90B99@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CLH9BGaxwAO4YZu4H/DC+iq82QTu8FoHnNqHJ8dhPlwEvjw7KkxLzMCTe98pJ5UEy8eAtmZjpwB8gTwOHfRO13jkELtiLIC4L0gz4Ue/1qFYAQnuGp//6QFfr9fT78dK6mIf1RJXoXm0/guQKr4/Gdhe5kVEb6FKqPPfSVPhmrEP/HQiyTdSgzaOZ/1g6j5APwfJF/nne7msMv7T+9yWBSgXTdJEf1ivRaxXwucXxQ9vBe73qfPTJHowvlv5ZHUuRlfSIshcaEcAcy2EaCi9ELVJUcwiXmU58k7+IqsrLc2H1hUVtMMpPnUkLZrQShxNfggXlo6jfHLm2tlST/VWMuZP00YRx0SjWpb4ytAAA5D+uv9xVRGho9dVmWjgF/9olj3xsochsyd7yQZRFXxiAUlmp8jcnGIhXXvBiXCXQFoR5+yQ9wGL5/z8nDffTw5oso2PBz3LBsTJP/lnF+Qwq/E2JYnr+Sb1qLfm69GMVf3gWJC1a7szfoyxIG+0TcvUfUs71xQDo4/OcrYIgR9hHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(30864003)(5660300002)(52116002)(478600001)(6916009)(7696005)(36756003)(4326008)(83380400001)(8676002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(2906002)(6486002)(107886003)(86362001)(8936002)(6666004)(7416002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QnlvVUwydURrWWZQUUs0eXdZRnNpcmVOUDZadmowTUV1V0dSMWRvK2RpR1c0?=
 =?utf-8?B?QUN0ZmNSdHpJQmNFclQvd0Yvc0U1WjBncVNkTU5ha2huTUJtMnlKZ3dIbzk2?=
 =?utf-8?B?cnpwZGhTT0dmcTV5Nkh2NzFtSkhRWFZpY0Nkd3F0V0lGc3E4ekxUTGdNT0tX?=
 =?utf-8?B?S3NHSXZmYmJOQW1aVHpXL1ozOVdhWU5WMkdSYlNKZkJmOXJ6eUdVak1iQVc5?=
 =?utf-8?B?Z1czaEM5M24zYlVzcUg4eWhNZnFoWS9WR3lFT3hyWVh5Y084a2ZRZVhIdmpB?=
 =?utf-8?B?aHhWVDV2dGVjTjVHNG96eEdrbG5SWjJqUnNCeVlHZ2x5VWNyUllxUmIwaVNF?=
 =?utf-8?B?OWpxcDZUcm5tN0hNd25laFZnWis4YkNScTVkK0lQaCsvMVIvNS94TTFkOHp1?=
 =?utf-8?B?bEMwR2x3TXM5bUNiSWdJQ2wzTkhFZXJGTDh2RUU2TisxZ2NVTzVpSUU0UFRz?=
 =?utf-8?B?NVhxNjhuN0pnNXNCZ0pwY01tN2ltZHpTVVArWHVoVCtxMmNGL1Y5VnFwUVM2?=
 =?utf-8?B?TFk2TE5WamIyaHdDQVUra0hDelBIVm9qUFF2ZmNFU0pjblFHZWFFRXZUdjcr?=
 =?utf-8?B?c0xjektlVkhVZmJyemg4VGJObVdERmt3RkNxQ3pKY0N6UGR0b2ZGRTVVQ0Z4?=
 =?utf-8?B?UXVBVVZ1dGNYQ0R6dVpHMjFqeUlDZzU0R25ISWY0TkhGdmI1azBhNVJOdXVq?=
 =?utf-8?B?RDI5L3pNU2R4Z3Uyd2VxSnBPZVRMMS9TQldjWUdiR1VtZS9Fb2tHVHJrcGFO?=
 =?utf-8?B?M2g3eDg5QUpQWHZaMUN6c3dsTWhuT1d6VzVYcThhaHlwNVE5T1pDYWxOM2Rh?=
 =?utf-8?B?bWw4ZG51Zy9TODhRM0Q0WFlyYjZiTTZ6YUFDRzV4MGRLM3pOMWJyVEE2VnR5?=
 =?utf-8?B?Q3JCSkZ4VGFPR1hCTnJIMUQwTEJZTDlxMmN6cEV2cER3dkZCUCtOdllmUmVI?=
 =?utf-8?B?d1Z5K21qcU1ZK0tYVXBSWGZLQWt1MlB1NVJqS01pTU5LcVlVa3BpaUtPNGJZ?=
 =?utf-8?B?MTdES2ZZWmllT1IwckN2MXY0UWtIbWtvM1pyT1FNdGtjc2xOa2xDSjR4WEl0?=
 =?utf-8?B?cmpxeGlKaGRZWmVTcHZWRG1DQTg0bDFIckpiT25wMnd6RW1WQTdvdlhzY1dl?=
 =?utf-8?B?TzQzOEdiMjh6bGRGbkZUT0EvMlozT1FOQytLbFBzRlJKQXJTWTQ5MkFmTU1a?=
 =?utf-8?B?Z083aVk2NHgrOTUxSDRpcGhXcnBYZk52RW0vZ3R3NEMyY0REdnd2VkNocENB?=
 =?utf-8?B?U2NZeFhZdVB6N2lJZVFVWXA5MERySVZrMjMxZkJPVnNsbE9ObWUzTDhPcFFk?=
 =?utf-8?B?VkxtOWlwV1hsOUVicmx3WUF6K3o4cWZ0R3ExQ1I4Z2Z1a2FhTmhPT3NDaVM3?=
 =?utf-8?B?clZLUEd6RUFaMDFEMmdpR3U5Y2pLOS9BVGtnNEN0bnNFNlBsVkJqTVJ4czN5?=
 =?utf-8?Q?XLmd6Pi5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44f724d-c441-456e-9e08-08d8c47579bd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:50.7641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogyhYum36lbJm0xdcTUFXkf31bH31XvN/jTfDwTY0VKP2GIJCKjp5jfq0GchRc49SS1NusJYlZwvqF8GQb6XXg==
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

Defines MPQemuMsg, which is the message that is sent to the remote
process. This message is sent over QIOChannel and is used to
command the remote process to perform various tasks.
Define transmission functions used by proxy and by remote.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson.build                     |   1 +
 hw/remote/trace.h               |   1 +
 include/hw/remote/mpqemu-link.h |  63 ++++++++++++
 include/sysemu/iothread.h       |   6 ++
 hw/remote/mpqemu-link.c         | 205 ++++++++++++++++++++++++++++++++++++++++
 iothread.c                      |   6 ++
 MAINTAINERS                     |   2 +
 hw/remote/meson.build           |   1 +
 hw/remote/trace-events          |   4 +
 9 files changed, 289 insertions(+)
 create mode 100644 hw/remote/trace.h
 create mode 100644 include/hw/remote/mpqemu-link.h
 create mode 100644 hw/remote/mpqemu-link.c
 create mode 100644 hw/remote/trace-events

diff --git a/meson.build b/meson.build
index 29b1be6..12949df 100644
--- a/meson.build
+++ b/meson.build
@@ -1772,6 +1772,7 @@ if have_system
     'net',
     'softmmu',
     'ui',
+    'hw/remote',
   ]
 endif
 trace_events_subdirs += [
diff --git a/hw/remote/trace.h b/hw/remote/trace.h
new file mode 100644
index 0000000..5d5e3ac
--- /dev/null
+++ b/hw/remote/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_remote.h"
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
new file mode 100644
index 0000000..cac699c
--- /dev/null
+++ b/include/hw/remote/mpqemu-link.h
@@ -0,0 +1,63 @@
+/*
+ * Communication channel between QEMU and remote device process
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef MPQEMU_LINK_H
+#define MPQEMU_LINK_H
+
+#include "qom/object.h"
+#include "qemu/thread.h"
+#include "io/channel.h"
+
+#define REMOTE_MAX_FDS 8
+
+#define MPQEMU_MSG_HDR_SIZE offsetof(MPQemuMsg, data.u64)
+
+/**
+ * MPQemuCmd:
+ *
+ * MPQemuCmd enum type to specify the command to be executed on the remote
+ * device.
+ *
+ * This uses a private protocol between QEMU and the remote process. vfio-user
+ * protocol would supersede this in the future.
+ *
+ */
+typedef enum {
+    MPQEMU_CMD_MAX,
+} MPQemuCmd;
+
+/**
+ * MPQemuMsg:
+ * @cmd: The remote command
+ * @size: Size of the data to be shared
+ * @data: Structured data
+ * @fds: File descriptors to be shared with remote device
+ *
+ * MPQemuMsg Format of the message sent to the remote device from QEMU.
+ *
+ */
+typedef struct {
+    int cmd;
+    size_t size;
+
+    union {
+        uint64_t u64;
+    } data;
+
+    int fds[REMOTE_MAX_FDS];
+    int num_fds;
+} MPQemuMsg;
+
+bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
+bool mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
+
+bool mpqemu_msg_valid(MPQemuMsg *msg);
+
+#endif
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index 0c5284d..f177142 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -57,4 +57,10 @@ IOThread *iothread_create(const char *id, Error **errp);
 void iothread_stop(IOThread *iothread);
 void iothread_destroy(IOThread *iothread);
 
+/*
+ * Returns true if executing withing IOThread context,
+ * false otherwise.
+ */
+bool qemu_in_iothread(void);
+
 #endif /* IOTHREAD_H */
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
new file mode 100644
index 0000000..b3d380e
--- /dev/null
+++ b/hw/remote/mpqemu-link.c
@@ -0,0 +1,205 @@
+/*
+ * Communication channel between QEMU and remote device process
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
+#include "qemu/module.h"
+#include "hw/remote/mpqemu-link.h"
+#include "qapi/error.h"
+#include "qemu/iov.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "io/channel.h"
+#include "sysemu/iothread.h"
+#include "trace.h"
+
+/*
+ * Send message over the ioc QIOChannel.
+ * This function is safe to call from:
+ * - main loop in co-routine context. Will block the main loop if not in
+ *   co-routine context;
+ * - vCPU thread with no co-routine context and if the channel is not part
+ *   of the main loop handling;
+ * - IOThread within co-routine context, outside of co-routine context
+ *   will block IOThread;
+ * Returns true if no errors were encountered, false otherwise.
+ */
+bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
+{
+    ERRP_GUARD();
+    bool iolock = qemu_mutex_iothread_locked();
+    bool iothread = qemu_in_iothread();
+    struct iovec send[2] = {0};
+    int *fds = NULL;
+    size_t nfds = 0;
+    bool ret = false;
+
+    send[0].iov_base = msg;
+    send[0].iov_len = MPQEMU_MSG_HDR_SIZE;
+
+    send[1].iov_base = (void *)&msg->data;
+    send[1].iov_len = msg->size;
+
+    if (msg->num_fds) {
+        nfds = msg->num_fds;
+        fds = msg->fds;
+    }
+
+    /*
+     * Dont use in IOThread out of co-routine context as
+     * it will block IOThread.
+     */
+    assert(qemu_in_coroutine() || !iothread);
+
+    /*
+     * Skip unlocking/locking iothread lock when the IOThread is running
+     * in co-routine context. Co-routine context is asserted above
+     * for IOThread case.
+     * Also skip lock handling while in a co-routine in the main context.
+     */
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_unlock_iothread();
+    }
+
+    if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
+                                    fds, nfds, errp)) {
+        ret = true;
+    } else {
+        trace_mpqemu_send_io_error(msg->cmd, msg->size, nfds);
+    }
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        /* See above comment why skip locking here. */
+        qemu_mutex_lock_iothread();
+    }
+
+    return ret;
+}
+
+/*
+ * Read message from the ioc QIOChannel.
+ * This function is safe to call from:
+ * - From main loop in co-routine context. Will block the main loop if not in
+ *   co-routine context;
+ * - From vCPU thread with no co-routine context and if the channel is not part
+ *   of the main loop handling;
+ * - From IOThread within co-routine context, outside of co-routine context
+ *   will block IOThread;
+ */
+static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int **fds,
+                           size_t *nfds, Error **errp)
+{
+    ERRP_GUARD();
+    struct iovec iov = { .iov_base = buf, .iov_len = len };
+    bool iolock = qemu_mutex_iothread_locked();
+    bool iothread = qemu_in_iothread();
+    int ret = -1;
+
+    /*
+     * Dont use in IOThread out of co-routine context as
+     * it will block IOThread.
+     */
+    assert(qemu_in_coroutine() || !iothread);
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_unlock_iothread();
+    }
+
+    ret = qio_channel_readv_full_all_eof(ioc, &iov, 1, fds, nfds, errp);
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_lock_iothread();
+    }
+
+    return (ret <= 0) ? ret : iov.iov_len;
+}
+
+bool mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
+{
+    ERRP_GUARD();
+    g_autofree int *fds = NULL;
+    size_t nfds = 0;
+    ssize_t len;
+    bool ret = false;
+
+    len = mpqemu_read(ioc, msg, MPQEMU_MSG_HDR_SIZE, &fds, &nfds, errp);
+    if (len <= 0) {
+        goto fail;
+    } else if (len != MPQEMU_MSG_HDR_SIZE) {
+        error_setg(errp, "Message header corrupted");
+        goto fail;
+    }
+
+    if (msg->size > sizeof(msg->data)) {
+        error_setg(errp, "Invalid size for message");
+        goto fail;
+    }
+
+    if (!msg->size) {
+        goto copy_fds;
+    }
+
+    len = mpqemu_read(ioc, &msg->data, msg->size, NULL, NULL, errp);
+    if (len <= 0) {
+        goto fail;
+    }
+    if (len != msg->size) {
+        error_setg(errp, "Unable to read full message");
+        goto fail;
+    }
+
+copy_fds:
+    msg->num_fds = nfds;
+    if (nfds > G_N_ELEMENTS(msg->fds)) {
+        error_setg(errp,
+                   "Overflow error: received %zu fds, more than max of %d fds",
+                   nfds, REMOTE_MAX_FDS);
+        goto fail;
+    }
+    if (nfds) {
+        memcpy(msg->fds, fds, nfds * sizeof(int));
+    }
+
+    ret = true;
+
+fail:
+    if (*errp) {
+        trace_mpqemu_recv_io_error(msg->cmd, msg->size, nfds);
+    }
+    while (*errp && nfds) {
+        close(fds[nfds - 1]);
+        nfds--;
+    }
+
+    return ret;
+}
+
+bool mpqemu_msg_valid(MPQemuMsg *msg)
+{
+    if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
+        return false;
+    }
+
+    /* Verify FDs. */
+    if (msg->num_fds >= REMOTE_MAX_FDS) {
+        return false;
+    }
+
+    if (msg->num_fds > 0) {
+        for (int i = 0; i < msg->num_fds; i++) {
+            if (fcntl(msg->fds[i], F_GETFL) == -1) {
+                return false;
+            }
+        }
+    }
+
+    return true;
+}
diff --git a/iothread.c b/iothread.c
index b9f2751..7f08638 100644
--- a/iothread.c
+++ b/iothread.c
@@ -369,3 +369,9 @@ IOThread *iothread_by_id(const char *id)
 {
     return IOTHREAD(object_resolve_path_type(id, TYPE_IOTHREAD, NULL));
 }
+
+bool qemu_in_iothread(void)
+{
+    return qemu_get_current_aio_context() == qemu_get_aio_context() ?
+                    false : true;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c032d4..ceabcfb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3192,6 +3192,8 @@ F: hw/pci-host/remote.c
 F: include/hw/pci-host/remote.h
 F: hw/remote/machine.c
 F: include/hw/remote/machine.h
+F: hw/remote/mpqemu-link.c
+F: include/hw/remote/mpqemu-link.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 197b038..a2b2fc0 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -1,5 +1,6 @@
 remote_ss = ss.source_set()
 
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
new file mode 100644
index 0000000..0b23974
--- /dev/null
+++ b/hw/remote/trace-events
@@ -0,0 +1,4 @@
+# multi-process trace events
+
+mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
+mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
-- 
1.8.3.1


