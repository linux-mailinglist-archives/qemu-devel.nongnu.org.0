Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998B2FBC1E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:11:45 +0100 (CET)
Received: from localhost ([::1]:49994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tbc-0004P8-8D
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l1tBq-00067c-6u
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:45:06 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l1tBl-0006EL-SH
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:45:05 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JFXcYR021216;
 Tue, 19 Jan 2021 15:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=akurZsPJYdw70D4tLvILaUWCrLoCoWqObythyuzp6nc=;
 b=c5RO2kKHRVgZu/aMn8XM9mMTYKVju2z5fIDdq2Gq9ndYCbYhzXmAMHe3FfZFgRhQpajG
 bDacgVgtg3WQS+Pl+1uBzCdCvyb+VrruNyKInLIBziNvNHP//deCBgTORxqPvz1r6NZA
 vPgLkRxhJAnLWReMf2RB9C0GT0ON1fRHwDdc05LhUo0Ht0jwrVTTMk5n0QeJXVi6I0tK
 KKbuOfovyKiIWiTxzjEcz99g5nbvFOR/7vxNE7dKH5b6ohGG9FfLmF48Q4uOaM6PUsc+
 QbsoCxCqAog8iHqGK1cKjlNReT7SYfXAwbG8BM38tJa/UH4yx1SiVGswNI/pvOE/Nn1E mQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 363xyhs1uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 15:44:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JFaf1e193498;
 Tue, 19 Jan 2021 15:44:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3020.oracle.com with ESMTP id 3661khbk1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 15:44:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjGbdKoTzNpdGPJ/nMT7lQT8wsQdRcwDfUbKiIpe9xFCpzmHVk6YjaiE/OPePvmaSsAwRCKp4RnlxbZzKmRz42RemzXmUTl9bOqw+HfOI1ehF4Zts5b3A3Jnpq5tDjtdLEobctJIC32hR9oOQ1D9lPK2D6fdVm8SX6eFvenVmtXNX7R191UuBeJdgz+OvMd7fVwQQd3V075f7aXbyG3tSuQvfKBKruQ1EXBbGCcWijm0yFZm+q4wn2VUtJQ3tq955sWcYL5tJeno3+qXl74ArklIr/tOX8sh019FDA61Jj7XpxRGxeaf0hn2ePiQBbK4yRx+hqbr4gK+mfAu1t6Qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akurZsPJYdw70D4tLvILaUWCrLoCoWqObythyuzp6nc=;
 b=eTwGhMeYMY1CQq5D8ZfJJ84UC4aWeCBQVCHe6R312OFdUfZ3D5okAWl9pgcDGbh5+mtoeNRrSD0g46bHkrCaVmcINzgVAd2Dj0C3wL1h2RpN2G7H3sB/TTLMPueW7FvRAGSxbmfbIn7Z6P0mmFTIYJn6+u8Svs8h7INAp0Pp9JGDSxvdxi31Wfi+9zN3NsXJeX4eoO1/K6u5IIRfDaKNFscadBg6FhCvgw6lMJqeVeZXN+f5UrdKWRH6I5Ne11lqC0iwlzgNK2qq6l8nUm9fuoccDl0cshcWPNsnmxF35RaJrEenB6vRJTV2lFnzjwknjiYdphG8xU6On6RaGK4NQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akurZsPJYdw70D4tLvILaUWCrLoCoWqObythyuzp6nc=;
 b=Qb6zsYHnsWOyfDBiZ2Ih0rwzMNeYvJ77ZM5To179GbU+SOndaQv0rM7A3y68DiDLEISF7VkHM61L6h0FOFUq5P387TmbgQ2phIbRBHJDzMiUWX5RjYyEOtlaXTc6567rYtT4JP5z+u7Xwccef+Nwwe5tq3jh7S8LBYHb6os8kjE=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM5PR10MB2011.namprd10.prod.outlook.com (2603:10b6:3:111::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Tue, 19 Jan 2021 15:44:35 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::940f:7f4:abd5:9a4]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::940f:7f4:abd5:9a4%5]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 15:44:35 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v2 3/3] fuzz: add virtio-9p configurations for fuzzing
In-Reply-To: <20210119151229.2xnmks65g6xxe6ey@mozz.bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
 <20210117230924.449676-4-alxndr@bu.edu> <23015364.U02QJlgKXI@silver>
 <20210118153033.w27g3cxl5dlaf2dn@mozz.bu.edu> <m235yyfe3z.fsf@oracle.com>
 <20210119151229.2xnmks65g6xxe6ey@mozz.bu.edu>
Date: Tue, 19 Jan 2021 15:44:31 +0000
Message-ID: <m27do9nd7k.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DB9PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::22) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:10:1db::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 15:44:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54ddf4a6-c527-41ca-e3d5-08d8bc911f20
X-MS-TrafficTypeDiagnostic: DM5PR10MB2011:
X-Microsoft-Antispam-PRVS: <DM5PR10MB201131C83B8ECC7ADC9FAC60F4A30@DM5PR10MB2011.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xrMdk2hiX67j7iPwlGADznwb5f73QbktI92zyVG3sVx48+FCpCprymmdUeB2xWmzdqRArSjVMWHSQroc6UV6RzeFpJOabXTWg0umYHrTOJbRnhpQ1Z1A2UJS0Z44e7hRFmHqxDZbxZFWzQYajVsgP9LvjL9VftFH9+xQLUzd6kfntZPJ0btuntUE6N2cRy5W8nHMss7YEwCqCHDATZhgQvvoSIoUiNtVKz7FlfouhIlpXHkQjxSZR0Eyg9QiBw80JhQiHXmcFOEJ68sh/MtOs2N16XRBWVpO0xZ9viDLmmORjqkhut7UvhDOkeYHPkXl5JfedLadDd4F/zH2qHmTpl+SFGl+2IZ9bkplzARE4tqJXhA3x2LyHRv84Gd65QXBc1DR2zdrhbC8To9VN57q5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(346002)(136003)(39860400002)(8676002)(16526019)(8936002)(2906002)(83380400001)(478600001)(6666004)(5660300002)(7696005)(66946007)(316002)(54906003)(956004)(66476007)(55016002)(4326008)(6916009)(2616005)(44832011)(86362001)(186003)(8886007)(52116002)(26005)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CBtOgh/z0OpQRkWOq20lGgHTD1vTkupiqt/vr6mYLmfv3IgSy72wD0v2xQRX?=
 =?us-ascii?Q?pyVrYs/ofseQ8Bo3IW3/QA/mR5vWqDq63Ha8+g6/tnxJMXkeSXF+vqm6m11n?=
 =?us-ascii?Q?c9gQAyTt+BNEpMwS5Juvi72MMZpDJ/55BkBmw9Brut6k0c66aLaLI14aC6lJ?=
 =?us-ascii?Q?F61RoCT47LmA2D+YT4JB1fzuyMyEid/rqczFbCPcMiRLAN5aUaCg38JjEwzZ?=
 =?us-ascii?Q?P3U6tG2WavXcNrkGGz2MFR1bPfKUVSsnt6T9yMrUblnghz0WGEVkpz72Ll3P?=
 =?us-ascii?Q?+2lU3fZ45W+slgJY+9VEyQ/tlFCCDBAWljJbL1EVfH+ztjFxuoCOPC6y2b06?=
 =?us-ascii?Q?MHFy8VX2a1ZFRUZJnivTU9TsZf//eAsPXSA2iHzGvGiGcFWHFyiyZar2FgEd?=
 =?us-ascii?Q?NKEt7Y51tV5iyvhocrFfIzpfTogh9tN8FAhL6II6+8fmGbPix0YTgG1gBoa1?=
 =?us-ascii?Q?1GXB7nOVonGwC9kMhrFdlqUzaN86QjqNBvrhrntwRX//2wIrRZaXFyA6W9fy?=
 =?us-ascii?Q?8wL9XAEd/MyRW4cPsMu/R1g0Vh+GUZSugREPqiTgCa858ccoy0+pER6zTN5A?=
 =?us-ascii?Q?B+xdYrdTC9355T4r89ZVQB+dHw7VDGdv4SB5mrj2lhUtNicP9jubT59ddeaz?=
 =?us-ascii?Q?KjL6Of0V8d/dDhWAwxnRKXYwq2zekaTUqA4OIfBHIu1YWMEkgvMPevIwZ+MV?=
 =?us-ascii?Q?f49lEE242ufbjR0Uqv/d395m1spr3J2tntWUGiLi5mCfES5Zcgh5asKOeyLX?=
 =?us-ascii?Q?jkxpTc6XGsAwmiiETiWaMRrND8HcsYKpDTsljr2tTXR0BVlQnbbbsi4rPSrK?=
 =?us-ascii?Q?34SRUr4vLtOeAODB2tbl4MxRdYFwPQeb8jcrqzqHNp+Gc1vBMPUyVrsloOGR?=
 =?us-ascii?Q?KbwRmP8lkxvMslfQbCgMa6YjkArtI8CmvXrGrP/5d2quCTrerZcXV96/O/F/?=
 =?us-ascii?Q?phswqIF7PLBHRtNfplcoj1LAAyKxED2JCDAs0bMr+fvhNR0fU5VJrJUpxnmO?=
 =?us-ascii?Q?L2acFGhZfA16r7q70vaz4ohKgiA5s9Hcxd6uCgGKMUxAJ71Q6HMPE9piR6kx?=
 =?us-ascii?Q?LgOqkP9X?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ddf4a6-c527-41ca-e3d5-08d8bc911f20
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 15:44:35.2786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBa4HGQjou3JM8ymU5FWBhC1TaWMymEdWIBxc0cOi7S8+7gEXwUSiLn60pb2eZU1Aje1c+WD/LUp6mPw43iW0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB2011
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9868
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9868
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190094
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=darren.kenny@oracle.com; helo=userp2130.oracle.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-01-19 at 10:12:29 -05, Alexander Bulekov wrote:
> On 210118 1540, Darren Kenny wrote:
>> On Monday, 2021-01-18 at 10:30:33 -05, Alexander Bulekov wrote:
>> > On 210118 1334, Christian Schoenebeck wrote:
>> >> On Montag, 18. Januar 2021 00:09:24 CET Alexander Bulekov wrote:
>> >> > virtio-9p devices are often used to expose a virtual-filesystem to the
>> >> > guest. There have been some bugs reported in this device, such as
>> >> > CVE-2018-19364, and CVE-2021-20181. We should fuzz this device
>> >> > 
>> >> > This patch adds two virtio-9p configurations:
>> >> >  * One with the widely used -fsdev local driver. This driver leaks some
>> >> >    state in the form of files/directories created in the shared dir.
>> >> >  * One with the synth driver. While it is not used in the real world, this
>> >> >    driver won't leak leak state between fuzz inputs.
>> >> > 
>> >> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> >> > ---
>> >> > CC: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> >> > CC: Greg Kurz <groug@kaod.org>
>> >> > 
>> >> > I considered adding an atexit handler to remove the temp directory,
>> >> > however I am worried that there might be some error that results in a
>> >> > call to exit(), rather than abort(), which will cause problems for
>> >> > future fork()-ed fuzzers. I don't think there are such calls in the 9p
>> >> > code, however there might be something in the APIs used by 9p. As this
>> >> > code is primarily for ephemeral OSS-Fuzz conainers, this shouldn't be
>> >> > too much of an issue.
>> >> 
>> >> Yes, dealing with signal handlers for that is probably a bit intransparent and 
>> >> would leave a questionable feeling about its reliability.
>> >> 
>> >> What about __attribute__((destructor)) to auto delete the fuzzer directory, 
>> >> like virtio-9p-test.c does for the same task?
>> >> 
>> >
>> > My worry is that we will end up deleting it while it is still in use.
>> > The scenario I am worried about:
>> > [parent process ] set up temp directory for virtio-9p
>> > [parent process ] initialize QEMU 
>> > [parent process ] fork() and wait()
>> > [child process 1] Run the fuzzing input.
>> > [child process 1] Once the input has been executed, call _Exit(). This
>> > should skip the atexit()/__attribute((destructor)) handlers. For reasons
>> > related to libfuzzer, we need to do this so that libfuzzer doesn't treat
>> > each child exit()-ing as a crash.
>> > [parent process ] wait() returns.
>> > [parent process ] generate a new input.. fork() and wait()
>> > [child process 2] Run the fuzzing input.
>> > [child process 2] Somewhere we hit an abort(). libfuzzer hooks the abort
>> > and dumps the crashing input and stack trace. Since abort() doesn't call
>> > exit handlers, it will skip over atexit()/__attribute((destructor)) handlers
>> > [parent process ] wait() returns.
>> > [parent process ] generate a new input.. fork() and wait()
>> > [child process 3] Run the fuzzing input.
>> > [child process 3] Somewhere we hit an exit(). This will dump the
>> > input/stacktrace and it will run the exit handlers (removing the shared
>> > 9p directory)
>> > [parent process ] wait() returns. generate a new input.. fork() and wait()
>> > [child process 4] ...
>> 
>> OK, that answer's my question :)
>> 
>> > Now all the subsequent forked children will refer to a shared directory
>> > that we already removed. Ideally, we would run the cleanup handler only
>> > after the parent process exit()s. I think there are some ways to do
>> > this, by placing the atexit() call in a place only reachable by the
>> > parent. However, on OSS-Fuzz this shouldn't be a problem as everything
>> > is cleaned up automatically anyway..
>> 
>> Yep, agreed.
>> 
>> > I am more worried about the fact that files/directories/links that are
>> > created by 9p in the child processes, persist across inputs. I think
>> > Thomas suggested a way to work-around this for PATCH 1/3. We could have
>> > a function that runs in the parent after each wait() returns, that would
>> > remove all the files in the temp directory and scrub the extended
>> > attributes applied by 9p to the shared dir.
>> 
>> Hmm, that sounds like something to consider, but it may also end up
>> slowing down the execution during the turn-around - guess it depends on
>> how much noise is being generated.
>> 
>
> I've ben running the fuzzer for a couple days, and I haven't noticed any
> issues with unreproducible inputs (yet). Is this something we can add
> later, if it becomes a problem?

Sure, I'm good with that:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> -Alex
>
>> Thanks,
>> 
>> Darren.
>> 
>> > -Alex
>> >
>> >
>> >> >  tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
>> >> >  1 file changed, 20 insertions(+)
>> >> > 
>> >> > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h
>> >> > b/tests/qtest/fuzz/generic_fuzz_configs.h index 1a133655ee..f99657cdbc
>> >> > 100644
>> >> > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
>> >> > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
>> >> > @@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
>> >> >      gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
>> >> >  } generic_fuzz_config;
>> >> > 
>> >> > +static inline gchar *generic_fuzzer_virtio_9p_args(void){
>> >> > +    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
>> >> > +    g_assert_nonnull(mkdtemp(tmpdir));
>> >> > +
>> >> > +    return g_strdup_printf("-machine q35 -nodefaults "
>> >> > +    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
>> >> > +    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
>> >> > +    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
>> >> > +}
>> >> > +
>> >> >  const generic_fuzz_config predefined_configs[] = {
>> >> >      {
>> >> >          .name = "virtio-net-pci-slirp",
>> >> > @@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
>> >> >          .name = "virtio-mouse",
>> >> >          .args = "-machine q35 -nodefaults -device virtio-mouse",
>> >> >          .objects = "virtio*",
>> >> > +    },{
>> >> > +        .name = "virtio-9p",
>> >> > +        .argfunc = generic_fuzzer_virtio_9p_args,
>> >> > +        .objects = "virtio*",
>> >> > +    },{
>> >> > +        .name = "virtio-9p-synth",
>> >> > +        .args = "-machine q35 -nodefaults "
>> >> > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
>> >> > +        "-fsdev synth,id=hshare",
>> >> > +        .objects = "virtio*",
>> >> >      },{
>> >> >          .name = "e1000",
>> >> >          .args = "-M q35 -nodefaults "
>> >> 
>> >> 
>> >> 

