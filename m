Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64789319D33
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:20:29 +0100 (CET)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWUu-0003U7-G5
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAWQy-0000i1-2b
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:16:24 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAWQt-0004fy-LB
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:16:23 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CBEu2u029036;
 Fri, 12 Feb 2021 11:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=tDwpISrITwUyBwEdKChRUvmb88XODLRDNhXMvHmA9D8=;
 b=YMp06CkXBKf8XedD3g5m/d78GQUeqwxLVbijDw9+FaHYyuD99qt8PFFTUFxPDd2okU/Y
 mXKGMq0AtnPkC/L/Ulg3G/yCnE1eMIte5UU0AVFz763G9Ov5MLE2mHSoy5AD9JOpe8kn
 wjNjm0/rPGkkQycgFdZb+BYSI0txk9RWsr++xPrdS+s8NFzi9bvEtoNG0FUAmcTi52yI
 dy2GlAVt01yfQdYsWtiaywiJ4z3kALprhQxAceawBm3quD2tRUC0ppF7zR9JpZdgDseC
 tdCsWdczZfY2R80LZjXre9pEFrlNcPfMczeDmpjx6U+k5y+9CAsLknSNPDcTiskuekj0 cA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36mv9dw1p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 11:16:16 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CBFalu069144;
 Fri, 12 Feb 2021 11:16:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3020.oracle.com with ESMTP id 36j515c414-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 11:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmXp5DrrhEpLUBv0q95o3Ao4nXNwvj0sA7VIrRDyVi8/cqWXBscIB6a4khfATGew8PuRZ7+kHO1rwxwebuUQ6RLnc97rSAp7QpXOHriT2+LTvb/1yK6HiKeoJHJFmf8U2x134mCOhohLgDSpLVFKQqmkp65kcCelGH0PiBmdnTLXEjXLRCGATfpqnNz+KM/dH0otwaYFLzJbkWvMARHslJwda1JxLblkWdeheYY3Vxqs6S2xWlDxQ3s7PwuWydtEDAT07ecpXDgvhtfXyl/1e69Vr3SIAYNaVjRASf7ApSMsRVlDtdxz6IkjMNlKe3lYy42WLSeG+luVRtz88KcOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDwpISrITwUyBwEdKChRUvmb88XODLRDNhXMvHmA9D8=;
 b=D+W3SEImpWgj14XkTunq/MHREsBJdalni15XOH/lPRixkyv13dWGSRAXm5X0wegoZLJl219XmpVV+3enEG3wGS0k9+XDcJaGo3/GlUZ3nvWmGkG8bqELO0MS88luN6sXuApY3vFq/drVZ/bmY+ARCgm7CW9Yscfq0ByxcUtR6/SBNm3o2isQLRZnFoy8vNislPq3zF/yvl87QejZ4mp0JAsXDVylzV/unrcOqtc1QeVznT3d2EdQxTY3FvfZ8Hj5u+MUu0xw+teIgJWzqr+SOlmPNlkLPdrCtlDCWVgjmKmr6FuqNPjB9Mrsc3x9M7mahMPWJksDaYkNOU2N7J6yKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDwpISrITwUyBwEdKChRUvmb88XODLRDNhXMvHmA9D8=;
 b=Ya/aXolckknqhFoIy4fD7gDFkZUZ8/qkZJ9y/M5rkKv9QKWS21vLyCmQjvjJ/IxTIHjkZ5hz/VT5F+vxWtJMciTi5yQhegPsjCOBNK3bdkzf63tVQa4zoRFKH6aJoOPKLsVV/C4IsLGuE2RfWfzP5bl02q9FBCJiSoh0c6Wn1bQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 11:16:14 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3846.030; Fri, 12 Feb 2021
 11:16:14 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: berrange@redhat.com
Subject: [PATCH] io: error_prepend() in qio_channel_readv_full_all() causes
 segfault
Date: Fri, 12 Feb 2021 06:16:07 -0500
Message-Id: <be476bcdb99e820fec0fa09fe8f04c9dd3e62473.1613128220.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1613128220.git.jag.raman@oracle.com>
References: <cover.1613128220.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.42]
X-ClientProxiedBy: SJ0PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::29) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.42) by
 SJ0PR03CA0234.namprd03.prod.outlook.com (2603:10b6:a03:39f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Fri, 12 Feb 2021 11:16:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceab3887-6486-4e18-12ae-08d8cf479bf5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4686F867C55BAE0EB75CAD7B908B9@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xlf2UyuHWfRD6VtlNyuAVWwUMtJsVOtRkL7t0vdRCBOUxbn27IL/OtguSLRVl6wG2QdbF1drHf8lHiuqTEbDY4bf+0+a3727B6n/Bx1agPYynO1qahLwxSPRdLhg9ZqnKHTtKymwdLXRNC3FLZfs+tmzSECqF8h6O95W6MSpDq3+I7swuMubMFUNHl7hoQokfdfQP9f2DiVSuhGjY4Vmf/p4x5VW7+okCfEWEDTVfeRvRd/+C4ITBqAWQ8DdToCAhA9iZHFrmH5vLB1dGNCLZ3CfEQtvHlA3c6AJ8CtQ/x8pCId9jsdDs+ndGCKp0BlIY/XgIpOe/mfgYEFA9+7Te5IcDXB8nBwxe6Um8yqJ2/c0LOlKck2fmi1ZpqRgoZWUo7l0DO7RxvDJbyLG5Gn6A0p45+puEivZ7j8gMrV9aZ/9b1CDtu+yV9g3KB130eqhC8nuO0HQyNJKCkt+fqHVTrKrpmQS16nUCBhroI8RZ8hcczdbolfu5wiFeZpzJhe6VeKDlr0zu9JMv8tHxTo8pQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(366004)(396003)(83380400001)(6916009)(52116002)(66556008)(66476007)(66946007)(8676002)(6666004)(7696005)(2906002)(4744005)(26005)(8936002)(6486002)(478600001)(4326008)(36756003)(86362001)(16526019)(5660300002)(186003)(2616005)(956004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a2YFRkFt0r9FF+lODMEO9Mux6Pzqoa9ZxG7K02dQ99N9Evb96hHbhe0JUSfB?=
 =?us-ascii?Q?VP++4YgNNKANGhYxFGo/+U8h/07JlZmZVZk76Wru5bn+vg1Ecdz8gIszzLhX?=
 =?us-ascii?Q?7JlzrwZ1LYXAX727K3T4gBXv6Z8eVivktZ20iIsolo/7gVY9M6QD3eHby1yJ?=
 =?us-ascii?Q?QttF2VP0GeYQrtHDP1TxJdA73D2TdO63MsbKY6TcGA5V0zWod5XXP6jGiJ/r?=
 =?us-ascii?Q?wD1I5DsIOm8qpuxnDjAeDp8ETOmsHwz3Ijeg6pQftcpSfUtg32EGZP0uWipB?=
 =?us-ascii?Q?pZ+VGPGiVoEKrQK1EOxvGZ15V7448P5XjMacL/UrgFVFPVXbJrheP4wKnF8c?=
 =?us-ascii?Q?8sd+3VDSdRlgY/ocAHRLogKWl9BKnkzkY6BlA2t/f9QHCAtU8Bxpey1XNF3E?=
 =?us-ascii?Q?aXrdG1MlZMj+8qa5f50Ry/i1Doi4EOToaU5zUcQHpI2dIWaX0PgASSBgTuSs?=
 =?us-ascii?Q?m6k3+stJXAhWTcVkVrkDJI7gSfxdEzAR+hvYr/ehhzzgiSW7lb3Cn/L2OtwY?=
 =?us-ascii?Q?eFyyMrnSSJUby7svolkmhkr+71bQ6Ev7NL6/T2dq5bGm4t629PS94+Xm2/Er?=
 =?us-ascii?Q?lopsepCiqFFBmI9VPa1GCM0zh0JcaVGNweHfZAwwJKojffNYA7NG8Qe9fxTc?=
 =?us-ascii?Q?07f0jqAvrYLycV06B52CarAQT3yY+14hlZSDRhqya1yClIL5AOsmkCW5xKH4?=
 =?us-ascii?Q?Z8YzEw9EiDVWCemFi2VxklAeUFJkIsB9cHJE0cIYIz5OeWsFW8FBkWSovU3T?=
 =?us-ascii?Q?EtrvyeR/2oOCNZ1TNpg66F82sxcj35uUO3hMkUKv8uV5n16ydSAvnkiPOkYq?=
 =?us-ascii?Q?NZu56huxDUlW1XzKWS5pNLAp/aVwX2kuVIebWWzhDkAl1kwPjIFgl8GPQx71?=
 =?us-ascii?Q?i55aQS5w4tUMGPFVqBWJ6gmGdiucOILQc7LAoL+YJC8ey0YDzAMkhfOopPmm?=
 =?us-ascii?Q?wtCMV29uRPGWolWq/TwsPpWconCfwUJESgjTTrBWWaJ2KrBpXjo9zbluIiKe?=
 =?us-ascii?Q?7DBeyJD74W0tWhQ1j9WOFV5bs0Yz6PyjCGgA6qz69n+RarUMu6a60cNdQAxi?=
 =?us-ascii?Q?8ZsJZmYek525xMAGsyz1+pfIk8brdGAHN10f4VAj0domaImxpxVYNLNlVfQV?=
 =?us-ascii?Q?yXJNi/wm+xOCT1NmjwUIBXlfeJ6qNK7yrxPg2dYZR7vjFnUur/8NvFD3Baxa?=
 =?us-ascii?Q?iIThxoOOaWzTVkMKsAwpANNjOVZeip6ymQE2HqmZDPSwQnSmcmmtlVpRBDn5?=
 =?us-ascii?Q?FQsTTV6QRM7SFXT5UJja4vjP+J1xpQKs/DlQJIJzBROSG9JYX3RCEgSQGzcc?=
 =?us-ascii?Q?3n7TPFpHZ4zLnbvdlTcGjGua?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceab3887-6486-4e18-12ae-08d8cf479bf5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 11:16:14.4999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIR/CBAr079kII835XHu5JqLSaZNpU5EygdKyqldUU8RxzC65OlNab0+Fq6wZetgK3Mcl6UMeR+eQHK1d+Ulmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102120088
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxlogscore=999
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102120088
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
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
Cc: elena.ufimtseva@oracle.com, stefanha@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using error_prepend() in qio_channel_readv_full_all() causes a segfault
as errp is not set when ret is 0. This results in the failure of iotest
83. Replacing with error_setg() fixes the problem.

Additionally, removes a full stop at the end of error message

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 io/channel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/io/channel.c b/io/channel.c
index 4555021..e8b019d 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -202,8 +202,7 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
     int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
 
     if (ret == 0) {
-        error_prepend(errp,
-                      "Unexpected end-of-file before all data were read.");
+        error_setg(errp, "Unexpected end-of-file before all data were read");
         return -1;
     }
     if (ret == 1) {
-- 
1.8.3.1


