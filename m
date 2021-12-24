Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9489047EE6B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:02:46 +0100 (CET)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iLV-0005Vu-NZ
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1n0iGQ-0001yq-U2
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:57:30 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1n0iGP-0001Zp-0p
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:57:30 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BO9s6dx022633; 
 Fri, 24 Dec 2021 10:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=7ysPYGC9dyfuLRQt2NtCsc+Yk/IX5xztvt5DKsuMeDo=;
 b=lNEUHzwUXYtZxhfHPaKXqoMmGxOPjAiOBrJAoSwtDqpfx4di1vSWOYngC7yP1koZVPjo
 yVWsg45/EO0VMxiqda32s5Taq8c/xVX+8X/Je29h8IdJNCBXeUBxESY2fSesURlnKMjC
 U3/b/NQWiyKaN6wjz/Sx7kGSd14m2Nn0J69qT1eWKzIn8daXJjZK+2En8pjy/X0Hrxpn
 ng/b2Zub5U4cnMxR9LGj5LusCzNJARehnQSlDNaBRqiyb0nrMQc8xuFYNNjQBDY/XrCg
 rYcAU5qESdvB/KYt+8oOyJ+UKhLCSr/i0RjTi7K8i0ZuenDyGwuVv6bS5fHo5OJQSo6+ Bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d47a0mcvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Dec 2021 10:57:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BOAueBT056337;
 Fri, 24 Dec 2021 10:57:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3020.oracle.com with ESMTP id 3d193t1djr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Dec 2021 10:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSLshGiaHiYoK7NhN3YuBvV46vjrejuqw5uO4WGaPWeqH1bNlLu0MSEFIeuwn5qplRL37N0SjCQtHy5PRU1xXwFrxB7D0oKQkn73AX2jm110Qrm/lUFg8V2qwAJkOcLpgfzjZZxMKj0we8e3JA9AaQcV7WZ4djMq2Wg58Mu2l444Vqb67TmsTEfuCPGTuuS6iwS4zfFJa/10XbwcHNdRbN57JOGvQFDkWbxZK6hbQiRLdpPjEcAf9scQeXENDXlswGAPt13BHrLOPTJjaN3Z94rDLY02ezFAAry0bvnIP5jK8rFTN7f+xKxYKrJbTGsPBLymB8CIdSMHeWl4JfQt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ysPYGC9dyfuLRQt2NtCsc+Yk/IX5xztvt5DKsuMeDo=;
 b=PxMDvEBrVZTqWhJggCzcHALSgy2BJpyRBRznF47d3/wENbDQyrd0dnismSx+0lONRX9qENsWNlAMrfYR+Sv8rNxj9p4YBUIvCMoEjMpbQT0adegEhTfpbezQo+cGZ0dfxCjBggh7hdaeBaAAQK4F8RkuS50RmhzYwUefHMxrWZ0kSh5pP3+X6w+7TZG49L2Pq9tSEhlTPzm0TLDxHUk44jAZswfkpIENO1/l1L4zxTol2twc2x4oUwaXKw9Pr/AZ/jzK7piF0/QxT4Y/+WYm1xPy14YFXCwYV7EVfiBpfdkApKFrvaI6HTez2cvR6ttoLZhUWBxGUZ9Mco5RlViUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ysPYGC9dyfuLRQt2NtCsc+Yk/IX5xztvt5DKsuMeDo=;
 b=pffMQZWy1uyRqylg+mLn0tWHUd2jYZiT4j5JfPpv/rC7T41hBTux+UzcHhSqXbreUDdPxBSHig7LnCVd76UECJcsFBgLplgQa2fTEO2Ov665sKZc3+b4T9UYjWJBz2prkJCWF1VjXszBgXDBCG0vnETVYL5NYtTvApHEEsQ4H/4=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB4346.namprd10.prod.outlook.com (2603:10b6:5:223::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 10:57:21 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 10:57:21 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 8/8] migration: Tracepoint change in postcopy-run
 bottom half
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-9-peterx@redhat.com>
Date: Fri, 24 Dec 2021 10:57:16 +0000
In-Reply-To: <20211224065000.97572-9-peterx@redhat.com> (Peter Xu's message of
 "Fri, 24 Dec 2021 14:50:00 +0800")
Message-ID: <cun8rwal183.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0395.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::22) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9e067e8-7d3e-4ef6-10ba-08d9c6cc28ea
X-MS-TrafficTypeDiagnostic: DM6PR10MB4346:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB4346D50E4EAB6EE566CC10AC887F9@DM6PR10MB4346.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PaEVi48yxMCQTRyKLQtT898z049aO2Qye/cl4Y6qQJY74fpvpo4N5K+9Ev+suqyIOZg4ejj+Zoe6i5SS7vtTvcrRfm6Lh2jPyiH51FpH0WKJI78qi6WMhpFx8ATF22WjZHeqrjiqTygpD0+VIzH6IrZA/Tt7Mkl3NeEdyue5dMeOXKicfRTtIKW71MG8/Y/y+wb37dRbzyhnxwwwXgVHwJmzvWTcvY+46mhuHlkGbq5b6UoLgimGCr717A8HHEfiHTA/JlEevpkRX4G2UwJMHmhAmp6lVTjhyUpLEl6n7hlI/LkECT7QdCaBBGT3f2wexbu8wtG/+UhIwCEYkdMvgfg4fx1RFOJa6bNJ5ZHarlZ/JuLj/N1qKXFrtmrfQAbAnXnFIRGZHVxmEbfYixY1AqmqhDjsjPoLFfdL1vDlmh1dexIjNfLaCp3CjXKsNdWAxbJxROQMege5kVQbaasqz5dzp5P38X8gpsK8iaqUI91FE7+FTXB4Wtki0W7W+fXbj6F9EE1cZpiYSc0rjsga7OyFpmEnOlx9EeI0ptWdIzBp+agAgMt69wm8qpSDaqFOUZsdXz4QaSIx7dEViQzD/xmep4iC8+1m7DXdvDf1Y2ZowVMRLAcYnwynQ5C7r9j+y2d6BPfwvf7WwtwFvgSMLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(2616005)(6486002)(66556008)(508600001)(44832011)(4326008)(83380400001)(6512007)(66946007)(4001150100001)(8936002)(36756003)(52116002)(186003)(8676002)(5660300002)(2906002)(86362001)(6916009)(54906003)(316002)(38100700002)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5P6d3Ip5RLwokRiZBwb5H4x42JZGNTTcpURjgjSuP+uMW2cOo6gs10IBjt9r?=
 =?us-ascii?Q?ttwJY+vwV/RS3zjQEpwCaGdVN9nhVvke7fkXApkxSZwTr+USuhMSTpnXg3py?=
 =?us-ascii?Q?IZDpeVzAfJqlzIIqh6ETd0A/aM3jyhLx01XqMm+9kO8du4o81dX7W8owq/Ue?=
 =?us-ascii?Q?GYRs8yujWqVEf0hsFyT2Y4hvcp+UQ3QE4QustU4h9FyDc4T5zuJT4IuH2ejw?=
 =?us-ascii?Q?D6o0BImzZI3wr+ajiqwGmAwmi9jyNQqb+LaOAQ/F0KQwO2hS07n2ytZR60Pw?=
 =?us-ascii?Q?UtaPnugmCZ7bFsChYEP/cP4mv1tHEgmPzBExaVPMpHVcB9kTqZMLOX5nLLQk?=
 =?us-ascii?Q?M72zpFAxjaco733V+SjMY0gnH+qq4P/6cOJ+2OmL0yaRJhjp6WKYucm28Ize?=
 =?us-ascii?Q?UMLjxrHgTrwcUSLVCW5LyWicm9TAj4nv+EQw6v4B8NgHYLDTTfNxYYuuFEpT?=
 =?us-ascii?Q?QzCziN/6ajAPSdETGVHoP9MW9O8CpePLGKbBy34jSjyAF9/0oezjQZhLiBf5?=
 =?us-ascii?Q?314g6GG8jMMp61F+yFnBrmau64jjkPytUAEaddRMDcQi0f3jHoz+eRPOhgOZ?=
 =?us-ascii?Q?Okje1q/K0a2C029WPnMPckqV7CM8W1e2xEbRUOsJwXWjTJuP8gl3urh8O4RH?=
 =?us-ascii?Q?14jlOr/eyqTVn+lVowTOSkZ6ZemTNXZfBzezA0mEFa+ljBOjoyhOk5yQ7c2W?=
 =?us-ascii?Q?w15j6MdLzzS4BAKkvVlXMwXY1mK1LvMJzfHfwSQqCQRZerQYlQPD1hMt4WhK?=
 =?us-ascii?Q?VHIkxUv8l9xH0CI2nTx41fkVBLKYQ300SgOHs8Iwo2+XvbNIqAUEYi8hSUvH?=
 =?us-ascii?Q?+1B1P3+FuIu47tRvEt6ME1/oYNLjixeZZjX88GGCLGR76bPV8vZCU8abRqIU?=
 =?us-ascii?Q?KwSLIiSwSLSwcyLBEbF3mT/yrwvYTB26G+k+zVSwigXApDuJElgbC/7/cwGj?=
 =?us-ascii?Q?d4lprU+dXmRVK4MgXwY8J47y2P+YTC8Hw6EMZHI135ARABQiWoXUCfYJO+Ta?=
 =?us-ascii?Q?Y9Mbr5EYe/1PpFGNeVi1ueVXFdm4k2JO2XSi4KAXjEuX7ZaHrZGXSkHK6JOU?=
 =?us-ascii?Q?DoKBNCyzYJBmUbicRi8ljqJDVbfR80jG3Uec1pn2xNpn9V50PXk5SF6cujNg?=
 =?us-ascii?Q?VcRhZwIYnTu6kCCqlWEd564MTbWwzaQfJua+Bma/ZFrMs4mb/WHrSfEK24We?=
 =?us-ascii?Q?M7PlxxB25guEZmHr6VjWrWYp1ekSr2iAE/Z5S9bNu4ZxG4ibp816YrYQJj/y?=
 =?us-ascii?Q?2RIIaM1sONuTkWj8Q59NG1a3AgeDEKmvC3xEhYh3KW4t7wfdlJeWqoBEB0nk?=
 =?us-ascii?Q?HAvUDSSxpmvekoGGEk1rkaeC8I7t6oKj2Q383za6Foo1t905DRqR5cgDUMg+?=
 =?us-ascii?Q?fDmuj4zoyAj5JZ+Y/Ss538jAvGExfhVRkezyqBkadboHls+PXlQsRk1+jsGV?=
 =?us-ascii?Q?aRYX5JSf4W6htix1dnwfCBHAITcFPtyYt4UTj6hAsUgJn5NOJMkjKfd3hbyl?=
 =?us-ascii?Q?iz8f4SQlMY87gMhMCz2tKAuttRBhxYT8m0eN/9Onq/WNvzRnAbCI/+wIBCIx?=
 =?us-ascii?Q?Ca4CXraG364CPWwiolesku1RmwJBjIFXA72uEIkqex3Xl22Dsy91ORkFOvyh?=
 =?us-ascii?Q?VioN/q/33/zHn6TToLVxzB4uYZctNFmqFpsYQDxOtesORpeoCSB6P/DezQno?=
 =?us-ascii?Q?qrAGzUAFEwKI1D44aRWeoAmppRlqpztLjo8mI4uxusjV4+li?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e067e8-7d3e-4ef6-10ba-08d9c6cc28ea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 10:57:21.2751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNsejuGKAx8V6qQJ4Zmgs7J6ecC1pRm1f1MZbwJIHlnoPU32SjyGPYJ6yJu5AhxvL4FLJCHrpuq3UxkNRpJiHVktY9PcmWTaujHNdt0+dws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4346
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10207
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112240053
X-Proofpoint-ORIG-GUID: Rlug7V7dWmk5s3Hpono8b3pX45cB1MbB
X-Proofpoint-GUID: Rlug7V7dWmk5s3Hpono8b3pX45cB1MbB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Friday, 2021-12-24 at 14:50:00 +08, Peter Xu wrote:

> Remove the old two tracepoints and they're even near each other:
>
>     trace_loadvm_postcopy_handle_run_cpu_sync()
>     trace_loadvm_postcopy_handle_run_vmstart()
>
> Add trace_loadvm_postcopy_handle_run_bh() with a finer granule trace.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/savevm.c     | 12 +++++++++---
>  migration/trace-events |  3 +--
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 592d550a2f..3b8f565b14 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2005,13 +2005,19 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
>      Error *local_err = NULL;
>      MigrationIncomingState *mis = opaque;
>
> +    trace_loadvm_postcopy_handle_run_bh("enter");
> +
>      /* TODO we should move all of this lot into postcopy_ram.c or a shared code
>       * in migration.c
>       */
>      cpu_synchronize_all_post_init();
>
> +    trace_loadvm_postcopy_handle_run_bh("after cpu sync");
> +
>      qemu_announce_self(&mis->announce_timer, migrate_announce_params());
>
> +    trace_loadvm_postcopy_handle_run_bh("after announce");
> +
>      /* Make sure all file formats flush their mutable metadata.
>       * If we get an error here, just don't restart the VM yet. */
>      bdrv_invalidate_cache_all(&local_err);
> @@ -2021,9 +2027,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
>          autostart = false;
>      }
>
> -    trace_loadvm_postcopy_handle_run_cpu_sync();
> -
> -    trace_loadvm_postcopy_handle_run_vmstart();
> +    trace_loadvm_postcopy_handle_run_bh("after invalidate cache");
>
>      dirty_bitmap_mig_before_vm_start();
>
> @@ -2036,6 +2040,8 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
>      }
>
>      qemu_bh_delete(mis->bh);
> +
> +    trace_loadvm_postcopy_handle_run_bh("return");
>  }
>
>  /* After all discards we can start running and asking for pages */
> diff --git a/migration/trace-events b/migration/trace-events
> index 77d1237d89..e165687af2 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -16,8 +16,7 @@ loadvm_handle_recv_bitmap(char *s) "%s"
>  loadvm_postcopy_handle_advise(void) ""
>  loadvm_postcopy_handle_listen(const char *str) "%s"
>  loadvm_postcopy_handle_run(void) ""
> -loadvm_postcopy_handle_run_cpu_sync(void) ""
> -loadvm_postcopy_handle_run_vmstart(void) ""
> +loadvm_postcopy_handle_run_bh(const char *str) "%s"
>  loadvm_postcopy_handle_resume(void) ""
>  loadvm_postcopy_ram_handle_discard(void) ""
>  loadvm_postcopy_ram_handle_discard_end(void) ""

dme.
-- 
Jane was in her turtle neck, I was much happier then.

