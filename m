Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1B47EE69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:00:28 +0100 (CET)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iJH-0003QC-Ik
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:00:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1n0iFu-00012Z-Ki
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:56:58 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1n0iFs-0001UV-Nt
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:56:58 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BO9v0XY014161; 
 Fri, 24 Dec 2021 10:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wNzjQMFig+B6/uyMSIsp9836FlIt7bVZtrZwUBYIoqU=;
 b=HSJgq3M9MBZa9qzXK6OqAZaev+U9cJe/61QEAnb4q4mFKf+lfCsCYatpK0hScnomSCrQ
 sPRbo5SvaU+xzxwNv+PS6Y3pWxIObwUWefte78tL09B07wuABqohAgVrPJ7nzH7GQ34q
 +rxw0rgfYSRiMo/Y8TnljEEfuQbqU0cuf3OIkzu6lpITARywVlXrWD0dBoofbJa7z6q2
 D9YwzagUfHaQTgCG+H2ZbndPnyVt+//BGrpb4oMW1ElB28FfjfFfFLleiK4hXtJJs9tO
 7sup7sFUzLEwlfJj/vT2sTnP3s0yPiOlcMDUj6gAgH/paIyJtdIJOZIHsXC4ESAnm3C/ Tw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm5snr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Dec 2021 10:56:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BOAl7Ko056904;
 Fri, 24 Dec 2021 10:56:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3030.oracle.com with ESMTP id 3d14s1f5dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Dec 2021 10:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y46XkzB6Qi4pb25R1Uu5zJM5i0qawrEo8dzdNEASEYueV3mgT9kzSE9kXKVuqTEEBvitXZcDo8tSij1NxTliiC8BuIwuvA1R8SEoFo/Cvm6Zmx1WK9uev6TJIpfGfChAwxDLkJG+x2tQw11RCFWBKwVo9a8yJx3LURYBL03A3Y4H+57uCT7tbnAsHDQfIrAeObeRSOSvF/tQ06ZmEbzHa46iQoIyUVCYwV9rmhjYGbQ3e8cs3ZMUFbG51siRNeWvri0al/0mLXzNn6t7DgDpOEuElQlVyAA0c5SY7r/AKnsQyu4bQGN+WCDtI3nmdxNaay+FawRlzghFhLjJSC9VYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNzjQMFig+B6/uyMSIsp9836FlIt7bVZtrZwUBYIoqU=;
 b=TQR+fZrRrE52Too4kFPum55q3no7N5BYm7Vcib8rOe1dRnyvol2pSlBSDNR0UW0jsjD1v6SVTz2IbQ6qFOfVZK59uTZBqDTRR+YKqFtwx2ufKR3jgDwdgp0DdDLKVeqcpOcdq5zcaEK6m8CjoEIwuTlBS5S6KeCXL5UXMqtC5f4Dl0TYi/qJiTv+O6nSmQQuMTy9QsoDC5ekD3o/3qKDlw9t40zZ/+fWdOh/8GI5g49u/hKPn+yEr5mlQsBRQkRxl59kqBepYAjBVI7NnjTonUohfQJdqlDD/A1PGyZLg92GcnSTc7E/7svtnOx4wbyHnO7s9N4ZfTU/EingzGtmqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNzjQMFig+B6/uyMSIsp9836FlIt7bVZtrZwUBYIoqU=;
 b=XzTXvO8zh0yy6yP36m4qMX4d0R5PpyZABXSFG/Gy10yqku4KPiCaGtVsTgl10fgAT7SGAoWlnPeOWKOMv+RrEmGCviiODOzUCYCJScfCgnqit3afPHz0kPVVKxyjGW70D+10FO1cjkoQFAjim1jE2oC4BfQNVhDh5IrP7Y11l+w=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB4346.namprd10.prod.outlook.com (2603:10b6:5:223::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 10:56:52 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 10:56:52 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 7/8] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-8-peterx@redhat.com>
Date: Fri, 24 Dec 2021 10:56:47 +0000
In-Reply-To: <20211224065000.97572-8-peterx@redhat.com> (Peter Xu's message of
 "Fri, 24 Dec 2021 14:49:59 +0800")
Message-ID: <cunczlml18w.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::22) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9ece7db-fbf6-4de9-559a-08d9c6cc17bd
X-MS-TrafficTypeDiagnostic: DM6PR10MB4346:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB4346C80BA639E5FB25854802887F9@DM6PR10MB4346.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2eJJVag8ymwZMildW3reiQpsF+K+dmjA6GnYNosebinMz8JwCpPolDFQYQuDnmIXx5lfclVJlu7rJ1ISne+d/XpwmC7ukQ9j0OVM6qxrFJ1GULZXUe0h4j2ZMag+7uNX9wqcf8RoTrXN3DsFBhDlFC0qhxOpHoG3Q1hzMlBimgo3bVJBHLmHptSeNA962YSW9s8JfF43MUAMUO10NtsDXbqONLjbUHXMYyLwAeeVyGvsUID1JXEZPD2pQAwuIwjb5THQc8FYhWgHevCHJamxlpVM4thlOpQx1MHVBwYmEdWy4dm8O+XGwFsuBUMaAd17GDeBrlZX15irUJShFJA+JjvXdJBh3tkKe7dN0YTWav5tjd2AuGFjXcaXRpJNqgtFGZJE8hZJI2JlC2kv/SommV4DVgoR9i0FgLTknyNlCd17BbhJgeN5qLnC8bpWWmdh2H+DpsIVIvO7hmr9Yh2JQhZSfqNoqS/cblTDd18aAjUxqqitGvuo4wGh4Wotv8UnPPukDuTzczBSjFJwE3Vl1U3/hOf4I8CnCDlSQJdvoZpzlOFtI2NLzclxTi17owNEGNS6loDRRgvFOycAtn92vUaXaTgdZJB9pwEOq4sGwWnNLBLuidUZP/Nc+jbRDlf7NKjAo8FU0wbGxLuaU2fMCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(2616005)(6486002)(66556008)(508600001)(44832011)(4326008)(83380400001)(6512007)(66946007)(4001150100001)(8936002)(36756003)(52116002)(186003)(8676002)(5660300002)(2906002)(86362001)(6916009)(54906003)(316002)(38100700002)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?44H3Yr7lxauTp5xG1jDjZTeaOLeSXk2Eh4Op0iM4BMqnz/US9dVYGqrFMZCn?=
 =?us-ascii?Q?9y8BrXAjc+xHCqfdaDbzzCGhq7DcM0H9VsJ41aUx6X5yTLAm7hmebqS9kwOg?=
 =?us-ascii?Q?ceWo2jwlewkRgkJwRzwEekIJ/2vhzwGtKqTihQvDPomOltZKe1UTxeZgAZBb?=
 =?us-ascii?Q?hEnSwt+fRahbsbPvXvCQ8AEG/3Qi5WGQEk5yC9a16FBrzBOGYLimn40cXx+R?=
 =?us-ascii?Q?eiherCh+/Tfm/2St2olLKF0Bm1SkfrnOsiFazITur14wAJwuA9Hvo6ZiOd6+?=
 =?us-ascii?Q?XjXU8gidwNfuzqDR4zzuS4O8GP2W6k//CtGlDQ0xfRMCASjVuoctKQfmaH5P?=
 =?us-ascii?Q?Ni/3KOhbEHVy91ZBWu29tAuobYksgl8p8u8IilfYq8zXaafMLNe0y/XMl3Hg?=
 =?us-ascii?Q?q9E6ewcZsF4uU4argrEFCdKOWPYpOie9AF2trjL0ibMDiFSdDVUC57oOetK0?=
 =?us-ascii?Q?zCXcYXqvNjn9xJ1btqx8smBAhS4COSqYsncTfK4NOkyJ3X3Tbitwk6x2LAgc?=
 =?us-ascii?Q?2ymZJPL0DMmDohRHPksYuwf5iuZZ1S4bOXxom0yHvW99x1LJWCLgbZxK5nhq?=
 =?us-ascii?Q?0uTSiiyfkp/5GNxkUv10xBZjtzkKzIR9YxGaXPblP33Qfz0Sf76LpVC1m26s?=
 =?us-ascii?Q?Asv8mfIXoNzYILjvEhIeDlIkfeinoENvrZQSFvT/p5+XikV0lhw1o3sRbVbY?=
 =?us-ascii?Q?5wQOdZdhnDtx07RDQKnxkQH2SxBDZXn06FBEx8gtf6tZsS9+1Vd4t0yK87er?=
 =?us-ascii?Q?HV2PVmj8iirTI9+CuVnRKTT6XEVhyPXHCEW2pz+yGUY1K0A1KfonsNXnYm2X?=
 =?us-ascii?Q?HL8i98ylnIy0A+efGvyqTPll5m5af74A8UtdU6aTnnZYZmrXTBqAhfkZ5NGI?=
 =?us-ascii?Q?eRyq+azxFcFrSNVURqv+8o7pUoegt+j/LYMEFQJN1IAtQJwN2Z9ms9oDS/fZ?=
 =?us-ascii?Q?Z46l2NitzTVEui3cmMXKlyJJiW1UmlQGb0gxHA6aaGg4+vtUlmrJLNfVR1NT?=
 =?us-ascii?Q?fPCwWeDHqskt16BwxggQ+48LG0PpSFO4FtWbpQsU6zRODQ9EvOa1bmsELdq6?=
 =?us-ascii?Q?Y7Un+yFeYahSlTXmICBA71wmhT2fClcXx40YyJ5db7swuHJlO2rhDPK9oX7E?=
 =?us-ascii?Q?X8KqgVOGRQYpN2m5uP47C6vQkdzoURpOWJCVV0VSBqMbR4nG4Q5fib8xLdDd?=
 =?us-ascii?Q?VwslBHuf7PGzf28iFyb8Zz50CLwB7pWcGBMdsipH0qQ4+Y+8XUM43IhKcaVZ?=
 =?us-ascii?Q?XrnqyVUXZSXAV27GaA85U/cMFaDG+p81B4264wlMDWJ52dXa0EdnHtIYrVJX?=
 =?us-ascii?Q?qTsfqcqE+ysz4aARJ6W8GuuV1GeU71PbsUJ3wcgLho5FaT1CnekXUxiCxI1x?=
 =?us-ascii?Q?5YnzuAT3iz0xoPvii6j8ScUvdHbeRG21gZ02GjJ59YqT4T5Tva8GERT2YKuV?=
 =?us-ascii?Q?Tnl97D2FW1XBkn8oOH/mgzNhuEJoaoNyqk8fyo0xxDngxpgn9dm8xHLg9oVz?=
 =?us-ascii?Q?iCXJsVwXNNayYp8xlwsx0nG2dhIzOgC7xDLxoyetgG5riMVRNOQsURyGHRbT?=
 =?us-ascii?Q?55ZOoLQdLTYG6vlOLDAaMrp0rXexqxU2vtkAokjAwis+KNOfXYQ8jF9naA/T?=
 =?us-ascii?Q?6GExV5RxXwu17zW2pPmWLNyDDi3hTEZA1LSVbZxLYMxxvWFdOaaLPWCcCFLN?=
 =?us-ascii?Q?5aoYUcvfChIRIixoyWBq0+i0dcVVU6dwW1ZRz6MrlDKEcYaZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ece7db-fbf6-4de9-559a-08d9c6cc17bd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 10:56:52.4437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCJ0zS6vIFVrbRi7GC5qsJK1wmMrt2g03+W70/AoW2nT97h0RvVJY62nfEhQc0oS2XOyhwRCenq3U/DTDSK2ahACGHbY3OwwTMMJz/cMxJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4346
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10207
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112240052
X-Proofpoint-GUID: knXst8LTXSXw6mNcG1H_n34YLa-8R5v-
X-Proofpoint-ORIG-GUID: knXst8LTXSXw6mNcG1H_n34YLa-8R5v-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-12-24 at 14:49:59 +08, Peter Xu wrote:

> The enablement of postcopy listening has a few steps, add a few tracepoints to
> be there ready for some basic measurements for them.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/savevm.c     | 9 ++++++++-
>  migration/trace-events | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 7f7af6f750..592d550a2f 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1947,9 +1947,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
>  static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>  {
>      PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
> -    trace_loadvm_postcopy_handle_listen();
>      Error *local_err = NULL;
>
> +    trace_loadvm_postcopy_handle_listen("enter");
> +
>      if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
>          error_report("CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
>          return -1;
> @@ -1964,6 +1965,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>          }
>      }
>
> +    trace_loadvm_postcopy_handle_listen("after discard");
> +
>      /*
>       * Sensitise RAM - can now generate requests for blocks that don't exist
>       * However, at this point the CPU shouldn't be running, and the IO
> @@ -1976,6 +1979,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>          }
>      }
>
> +    trace_loadvm_postcopy_handle_listen("after uffd");
> +
>      if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
>          error_report_err(local_err);
>          return -1;
> @@ -1990,6 +1995,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>      qemu_sem_wait(&mis->listen_thread_sem);
>      qemu_sem_destroy(&mis->listen_thread_sem);
>
> +    trace_loadvm_postcopy_handle_listen("return");
> +
>      return 0;
>  }
>
> diff --git a/migration/trace-events b/migration/trace-events
> index d63a5915f5..77d1237d89 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -14,7 +14,7 @@ loadvm_handle_cmd_packaged_main(int ret) "%d"
>  loadvm_handle_cmd_packaged_received(int ret) "%d"
>  loadvm_handle_recv_bitmap(char *s) "%s"
>  loadvm_postcopy_handle_advise(void) ""
> -loadvm_postcopy_handle_listen(void) ""
> +loadvm_postcopy_handle_listen(const char *str) "%s"
>  loadvm_postcopy_handle_run(void) ""
>  loadvm_postcopy_handle_run_cpu_sync(void) ""
>  loadvm_postcopy_handle_run_vmstart(void) ""

dme.
-- 
If I could buy my reasoning, I'd pay to lose.

