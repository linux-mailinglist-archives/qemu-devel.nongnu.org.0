Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563042FA504
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:44:01 +0100 (CET)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WhE-0008Q3-EN
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l1Wfz-0007h1-PR
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:42:43 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:46260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l1Wfx-0005oM-QL
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:42:43 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IFUG3I156363;
 Mon, 18 Jan 2021 15:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=iPtRzpynJVd3jLyfXWlz4Cn9P3UeJaSp2v33VLovjYc=;
 b=NfX+QgXzVIhytzu1Q1QxsrF+OgAFP68UKv7a+bAEwtB6ulgzBJ4bWY5/HWM5B/elc5qu
 OkRKsYBUkkrb4PZByErA2HWGNQ2bGP0ZRdNk6uzMuL+QKYatt1bu+M7uEIbipuA4AD13
 zWrzUBlf97PkkJMFzfmTHbuQkJKXnp1uAQZt5+Z6pAPmoglHG12ElF1QVftkG2AfaD8+
 sTQDQNsXDfOuNnPX8uEKxMFSwVrMV744TNNxZoU5ed2SKM4Rr73u+a+8AcFcwW5yLUa6
 TVb2tRyE7yyP61AvkDqLlrT6JfLmAK7GDihUfgJNMh8LLnZFg2r6cJKMX1AKzVJEAf27 wA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 363nnadx3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 15:42:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IFgBUP169327;
 Mon, 18 Jan 2021 15:42:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 3649wq6kxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 15:42:18 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10IFduJK016766;
 Mon, 18 Jan 2021 15:39:56 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 18 Jan 2021 07:39:55 -0800
Received: from starbug-mbp (localhost [127.0.0.1])
 by starbug-mbp.localdomain (Postfix) with ESMTP id 21F662E6B7B9;
 Mon, 18 Jan 2021 15:40:00 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 3/3] fuzz: add virtio-9p configurations for fuzzing
In-Reply-To: <20210118153033.w27g3cxl5dlaf2dn@mozz.bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
 <20210117230924.449676-4-alxndr@bu.edu> <23015364.U02QJlgKXI@silver>
 <20210118153033.w27g3cxl5dlaf2dn@mozz.bu.edu>
Date: Mon, 18 Jan 2021 15:40:00 +0000
Message-ID: <m235yyfe3z.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180094
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=darren.kenny@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-01-18 at 10:30:33 -05, Alexander Bulekov wrote:
> On 210118 1334, Christian Schoenebeck wrote:
>> On Montag, 18. Januar 2021 00:09:24 CET Alexander Bulekov wrote:
>> > virtio-9p devices are often used to expose a virtual-filesystem to the
>> > guest. There have been some bugs reported in this device, such as
>> > CVE-2018-19364, and CVE-2021-20181. We should fuzz this device
>> > 
>> > This patch adds two virtio-9p configurations:
>> >  * One with the widely used -fsdev local driver. This driver leaks some
>> >    state in the form of files/directories created in the shared dir.
>> >  * One with the synth driver. While it is not used in the real world, this
>> >    driver won't leak leak state between fuzz inputs.
>> > 
>> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> > ---
>> > CC: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> > CC: Greg Kurz <groug@kaod.org>
>> > 
>> > I considered adding an atexit handler to remove the temp directory,
>> > however I am worried that there might be some error that results in a
>> > call to exit(), rather than abort(), which will cause problems for
>> > future fork()-ed fuzzers. I don't think there are such calls in the 9p
>> > code, however there might be something in the APIs used by 9p. As this
>> > code is primarily for ephemeral OSS-Fuzz conainers, this shouldn't be
>> > too much of an issue.
>> 
>> Yes, dealing with signal handlers for that is probably a bit intransparent and 
>> would leave a questionable feeling about its reliability.
>> 
>> What about __attribute__((destructor)) to auto delete the fuzzer directory, 
>> like virtio-9p-test.c does for the same task?
>> 
>
> My worry is that we will end up deleting it while it is still in use.
> The scenario I am worried about:
> [parent process ] set up temp directory for virtio-9p
> [parent process ] initialize QEMU 
> [parent process ] fork() and wait()
> [child process 1] Run the fuzzing input.
> [child process 1] Once the input has been executed, call _Exit(). This
> should skip the atexit()/__attribute((destructor)) handlers. For reasons
> related to libfuzzer, we need to do this so that libfuzzer doesn't treat
> each child exit()-ing as a crash.
> [parent process ] wait() returns.
> [parent process ] generate a new input.. fork() and wait()
> [child process 2] Run the fuzzing input.
> [child process 2] Somewhere we hit an abort(). libfuzzer hooks the abort
> and dumps the crashing input and stack trace. Since abort() doesn't call
> exit handlers, it will skip over atexit()/__attribute((destructor)) handlers
> [parent process ] wait() returns.
> [parent process ] generate a new input.. fork() and wait()
> [child process 3] Run the fuzzing input.
> [child process 3] Somewhere we hit an exit(). This will dump the
> input/stacktrace and it will run the exit handlers (removing the shared
> 9p directory)
> [parent process ] wait() returns. generate a new input.. fork() and wait()
> [child process 4] ...

OK, that answer's my question :)

> Now all the subsequent forked children will refer to a shared directory
> that we already removed. Ideally, we would run the cleanup handler only
> after the parent process exit()s. I think there are some ways to do
> this, by placing the atexit() call in a place only reachable by the
> parent. However, on OSS-Fuzz this shouldn't be a problem as everything
> is cleaned up automatically anyway..

Yep, agreed.

> I am more worried about the fact that files/directories/links that are
> created by 9p in the child processes, persist across inputs. I think
> Thomas suggested a way to work-around this for PATCH 1/3. We could have
> a function that runs in the parent after each wait() returns, that would
> remove all the files in the temp directory and scrub the extended
> attributes applied by 9p to the shared dir.

Hmm, that sounds like something to consider, but it may also end up
slowing down the execution during the turn-around - guess it depends on
how much noise is being generated.

Thanks,

Darren.

> -Alex
>
>
>> >  tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
>> >  1 file changed, 20 insertions(+)
>> > 
>> > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h
>> > b/tests/qtest/fuzz/generic_fuzz_configs.h index 1a133655ee..f99657cdbc
>> > 100644
>> > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
>> > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
>> > @@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
>> >      gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
>> >  } generic_fuzz_config;
>> > 
>> > +static inline gchar *generic_fuzzer_virtio_9p_args(void){
>> > +    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
>> > +    g_assert_nonnull(mkdtemp(tmpdir));
>> > +
>> > +    return g_strdup_printf("-machine q35 -nodefaults "
>> > +    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
>> > +    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
>> > +    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
>> > +}
>> > +
>> >  const generic_fuzz_config predefined_configs[] = {
>> >      {
>> >          .name = "virtio-net-pci-slirp",
>> > @@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
>> >          .name = "virtio-mouse",
>> >          .args = "-machine q35 -nodefaults -device virtio-mouse",
>> >          .objects = "virtio*",
>> > +    },{
>> > +        .name = "virtio-9p",
>> > +        .argfunc = generic_fuzzer_virtio_9p_args,
>> > +        .objects = "virtio*",
>> > +    },{
>> > +        .name = "virtio-9p-synth",
>> > +        .args = "-machine q35 -nodefaults "
>> > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
>> > +        "-fsdev synth,id=hshare",
>> > +        .objects = "virtio*",
>> >      },{
>> >          .name = "e1000",
>> >          .args = "-M q35 -nodefaults "
>> 
>> 
>> 

