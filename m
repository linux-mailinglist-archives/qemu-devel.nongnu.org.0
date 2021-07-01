Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93D3B953A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 19:07:40 +0200 (CEST)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz0A6-0007AK-Rm
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 13:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lz08O-00063S-55
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 13:05:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lz08J-0006QV-6j
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 13:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625159144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jsk2kWc9xLkzr+L55XBYcVlx3gvRjUcpVq4o1ykx79U=;
 b=X/MpuHwp+o6xj6DPzWEhqx8h4w0B3HLTziI8+OvM+0xjADCpaYWglaL6CkH44eIeh+mAb7
 1d+G1eTovPSLPA7p5m14evIIkGQYRJ3FJf64KJCyYtDzBeJ4SE7Bt+SKgZI1BUjcpKnNba
 fWbOQbI3K0LQliD+5pAGoCrA3la8rEw=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-7_AzkZyGNtCTK_AvCSrtCA-1; Thu, 01 Jul 2021 13:05:42 -0400
X-MC-Unique: 7_AzkZyGNtCTK_AvCSrtCA-1
Received: by mail-oi1-f197.google.com with SMTP id
 m13-20020a056808024db029023e63851e0dso3559410oie.8
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 10:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsk2kWc9xLkzr+L55XBYcVlx3gvRjUcpVq4o1ykx79U=;
 b=U91Oy6ds3QQYz/3SUHIEVp+t1/A3p+M+m7BbcJMc8cKZf2r5RNwHx3ZLPPn9WBRnPf
 yFfB08kApnxnCaB4wJjy502Q1swqeSnlzkhix48UCWRZCd1eJaOhQuhfv0kFpdqyfzOo
 Xs8Z4sEKhKAiUMM4pp91nLiSerGNwcTkOSv2MmiyKdNSnQ9pgom73BCGZjX3SBxP4HeT
 x9Fj48LKMnt4ytvroJuyxG2xvLq5qtwwCtaOtWY67D+rZkhsUiOKrWzV5OUOYVBiXINL
 x4FfyV72U2Ia+cpptUhMaoVAPUtrmlLSqL9MTEqW0YTnagZFohNe5K9z2NArWPjsWf/7
 GroQ==
X-Gm-Message-State: AOAM530Bp0I0LRQxKdQuUyhcsbt31bWgBt7fAGenlgUBk01w6f7JUqaw
 zPPl+gJpLH5JBAQJX7lSnzs4um0o2SsmE8CQ3Dm6c80+cHpxcEIaLONEhnIBaxhM9bapxLpN/mh
 rJ2CdA8/KVxOeSG0n/+fqe59ZV0TcdZ0=
X-Received: by 2002:a4a:8f93:: with SMTP id c19mr723152ooj.31.1625159141008;
 Thu, 01 Jul 2021 10:05:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOyDOOiUpmTvHWZbTb4G1pRsxh7Ps8e95e+evGv7Q4mtN/pL6qJU++V92F71gjtguvADvVlcRozXocEDEXulg=
X-Received: by 2002:a4a:8f93:: with SMTP id c19mr723132ooj.31.1625159140805;
 Thu, 01 Jul 2021 10:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <60dddf17d0dc7_12297986117@gitlab-sidekiq-catchall-v1-64cdb99dd8-btlhb.mail>
 <YN3xl9Hppi+3XxCL@work-vm>
In-Reply-To: <YN3xl9Hppi+3XxCL@work-vm>
From: John Snow <jsnow@redhat.com>
Date: Thu, 1 Jul 2021 13:05:29 -0400
Message-ID: <CAFn=p-ZGfSijL-O4ndXODJr5Xg-xmyiZa1t4cZcYpr_r9Hkpwg@mail.gmail.com>
Subject: Re: Failed pipeline for migration.next | qemu | 9c21e614
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004aa27b05c612d98a"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004aa27b05c612d98a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 12:49 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * GitLab (gitlab@mg.gitlab.com) wrote:
> >
> >
> > Pipeline #330351156 has failed!
> >
> > Project: qemu ( https://gitlab.com/dagrh/qemu )
> > Branch: migration.next (
> https://gitlab.com/dagrh/qemu/-/commits/migration.next )
> >
> > Commit: 9c21e614 (
> https://gitlab.com/dagrh/qemu/-/commit/9c21e61435e09a7a67f951a096b93183a7a5ad89
> )
> > Commit Message: migration/rdma: Use error_report to suppress er...
> > Commit Author: Li Zhijian
> > Committed by: Dr_ David Alan Gilbert ( https://gitlab.com/dagrh )
> >
> > Pipeline #330351156 (
> https://gitlab.com/dagrh/qemu/-/pipelines/330351156 ) triggered by Dr_
> David Alan Gilbert ( https://gitlab.com/dagrh )
> > had 2 failed jobs.
> >
> > Job #1392645834 ( https://gitlab.com/dagrh/qemu/-/jobs/1392645834/raw )
> >
> > Stage: build
> > Name: build-disabled
> > Job #1392645971 ( https://gitlab.com/dagrh/qemu/-/jobs/1392645971/raw )
>
> Hmm,  that's:
>
> Running test qtest-mips64/qom-test
> Running test qtest-s390x/qom-test
> Running test qtest-arm/npcm7xx_pwm-test
> Running test qtest-i386/migration-test
> ../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from signal
> 11 (Segmentation fault) (core dumped)
> ERROR qtest-i386/migration-test - too few tests run (expected 13, got 2)
> make: *** [Makefile.mtest:72: run-test-7] Error 1
>
> so perhaps that's a real migration-test failure running a 32bit qemu;
> running the test on 32bit guest and making sure I had a /dev/kvm in my
> 32bit world (which I didn't in my pre-pull test), I see:
>
> /i386/migration/fd_proto: [Detaching after fork from child process 201847]
> [Detaching after fork from child process 201855]
> qemu-system-i386: kvm_log_clear_one_slot: KVM_CLEAR_DIRTY_LOG failed,
> slot=0, start=0x0, size=0xa0, errno=-14
> qemu-system-i386: kvm_log_clear: kvm log clear failed: mr=pc.ram offset=0
> size=a0000
> qemu-system-i386: check_section_footer: Read section footer failed: -5
> Broken pipe
> qemu-system-i386: load of migration failed: Invalid argument
>
> Thread 1 "migration-test" received signal SIGABRT, Aborted.
> 0xf7fd2559 in __kernel_vsyscall ()
> (gdb) where
> #0  0xf7fd2559 in __kernel_vsyscall ()
> #1  0xf7bb7382 in __libc_signal_restore_set (set=0xffffce9c) at
> ../sysdeps/unix/sysv/linux/internal-signals.h:84
> #2  __GI_raise (sig=6) at ../sysdeps/unix/sysv/linux/raise.c:48
> #3  0xf7ba12b6 in __GI_abort () at abort.c:79
> #4  0x565603f5 in qmp_fd_receive (fd=4) at
> ../home/source/tests/qtest/libqtest.c:618
> #5  0x5656044b in qtest_qmp_receive_dict (s=0x565cebe0) at
> ../home/source/tests/qtest/libqtest.c:646
> #6  0x56560491 in qtest_qmp_receive (s=0x565cebe0) at
> ../home/source/tests/qtest/libqtest.c:634
> #7  0x56560d1a in qtest_vqmp (s=0x565cebe0, fmt=0x56594f90 "{ 'execute':
> 'query-migrate' }", ap=0xffffd218 "") at
> ../home/source/tests/qtest/libqtest.c:747
> #8  0x5655ec77 in wait_command (who=0x565cebe0, command=0x56594f90 "{
> 'execute': 'query-migrate' }") at
> ../home/source/tests/qtest/migration-helpers.c:63
> #9  0x5655ef1d in migrate_query (who=0x565cebe0) at
> ../home/source/tests/qtest/migration-helpers.c:107
> #10 0x5655c79a in read_ram_property_int (who=<optimized out>,
> property=0x56594166 "dirty-sync-count") at
> ../home/source/tests/qtest/migration-test.c:176
> #11 0x5655c851 in get_migration_pass (who=0x565cebe0) at
> ../home/source/tests/qtest/migration-test.c:215
> #12 wait_for_migration_pass (who=0x565cebe0) at
> ../home/source/tests/qtest/migration-test.c:215
> #13 0x5655e773 in test_migrate_fd_proto () at
> ../home/source/tests/qtest/migration-test.c:1038
> #14 0xf7effbd7 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0
> #15 0xf7effa77 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0
> #16 0xf7effa77 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0
> #17 0xf7effec9 in g_test_run_suite () from
> /lib/i386-linux-gnu/libglib-2.0.so.0
> #18 0xf7effeed in g_test_run () from /lib/i386-linux-gnu/libglib-2.0.so.0
> #19 0x5655b424 in main (argc=<optimized out>, argv=<optimized out>) at
> ../home/source/tests/qtest/migration-test.c:1496
>
> which hmm, doesn't look like a new test, I see kvm_log_clear has had a
> fix to it's error handling in January from thuth, but perhaps that means
> it's broken on 32bit on 64 for a while?
>
>
> > Stage: test
> > Name: check-python-tox
>
> That one hmm I dunno, it's tox stuff.
>
>
The python stuff is known, fix is here:
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg08108.html

It's just a warning message, ignore it for now.

--js

--0000000000004aa27b05c612d98a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 1, 2021 at 12:49 PM Dr. D=
avid Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">* GitLab (<a href=3D"mailto:gitlab@mg.gitlab.com" target=3D"_blank">gi=
tlab@mg.gitlab.com</a>) wrote:<br>
&gt; <br>
&gt; <br>
&gt; Pipeline #330351156 has failed!<br>
&gt; <br>
&gt; Project: qemu ( <a href=3D"https://gitlab.com/dagrh/qemu" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.com/dagrh/qemu</a> )<br>
&gt; Branch: migration.next ( <a href=3D"https://gitlab.com/dagrh/qemu/-/co=
mmits/migration.next" rel=3D"noreferrer" target=3D"_blank">https://gitlab.c=
om/dagrh/qemu/-/commits/migration.next</a> )<br>
&gt; <br>
&gt; Commit: 9c21e614 ( <a href=3D"https://gitlab.com/dagrh/qemu/-/commit/9=
c21e61435e09a7a67f951a096b93183a7a5ad89" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.com/dagrh/qemu/-/commit/9c21e61435e09a7a67f951a096b93183a=
7a5ad89</a> )<br>
&gt; Commit Message: migration/rdma: Use error_report to suppress er...<br>
&gt; Commit Author: Li Zhijian<br>
&gt; Committed by: Dr_ David Alan Gilbert ( <a href=3D"https://gitlab.com/d=
agrh" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/dagrh</a> )<b=
r>
&gt; <br>
&gt; Pipeline #330351156 ( <a href=3D"https://gitlab.com/dagrh/qemu/-/pipel=
ines/330351156" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/dag=
rh/qemu/-/pipelines/330351156</a> ) triggered by Dr_ David Alan Gilbert ( <=
a href=3D"https://gitlab.com/dagrh" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.com/dagrh</a> )<br>
&gt; had 2 failed jobs.<br>
&gt; <br>
&gt; Job #1392645834 ( <a href=3D"https://gitlab.com/dagrh/qemu/-/jobs/1392=
645834/raw" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/dagrh/q=
emu/-/jobs/1392645834/raw</a> )<br>
&gt; <br>
&gt; Stage: build<br>
&gt; Name: build-disabled<br>
&gt; Job #1392645971 ( <a href=3D"https://gitlab.com/dagrh/qemu/-/jobs/1392=
645971/raw" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/dagrh/q=
emu/-/jobs/1392645971/raw</a> )<br>
<br>
Hmm,=C2=A0 that&#39;s:<br>
<br>
Running test qtest-mips64/qom-test<br>
Running test qtest-s390x/qom-test<br>
Running test qtest-arm/npcm7xx_pwm-test<br>
Running test qtest-i386/migration-test<br>
../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from signal =
11 (Segmentation fault) (core dumped)<br>
ERROR qtest-i386/migration-test - too few tests run (expected 13, got 2)<br=
>
make: *** [Makefile.mtest:72: run-test-7] Error 1<br>
<br>
so perhaps that&#39;s a real migration-test failure running a 32bit qemu;<b=
r>
running the test on 32bit guest and making sure I had a /dev/kvm in my<br>
32bit world (which I didn&#39;t in my pre-pull test), I see:<br>
<br>
/i386/migration/fd_proto: [Detaching after fork from child process 201847]<=
br>
[Detaching after fork from child process 201855]<br>
qemu-system-i386: kvm_log_clear_one_slot: KVM_CLEAR_DIRTY_LOG failed, slot=
=3D0, start=3D0x0, size=3D0xa0, errno=3D-14<br>
qemu-system-i386: kvm_log_clear: kvm log clear failed: mr=3Dpc.ram offset=
=3D0 size=3Da0000<br>
qemu-system-i386: check_section_footer: Read section footer failed: -5<br>
Broken pipe<br>
qemu-system-i386: load of migration failed: Invalid argument<br>
<br>
Thread 1 &quot;migration-test&quot; received signal SIGABRT, Aborted.<br>
0xf7fd2559 in __kernel_vsyscall ()<br>
(gdb) where<br>
#0=C2=A0 0xf7fd2559 in __kernel_vsyscall ()<br>
#1=C2=A0 0xf7bb7382 in __libc_signal_restore_set (set=3D0xffffce9c) at ../s=
ysdeps/unix/sysv/linux/internal-signals.h:84<br>
#2=C2=A0 __GI_raise (sig=3D6) at ../sysdeps/unix/sysv/linux/raise.c:48<br>
#3=C2=A0 0xf7ba12b6 in __GI_abort () at abort.c:79<br>
#4=C2=A0 0x565603f5 in qmp_fd_receive (fd=3D4) at ../home/source/tests/qtes=
t/libqtest.c:618<br>
#5=C2=A0 0x5656044b in qtest_qmp_receive_dict (s=3D0x565cebe0) at ../home/s=
ource/tests/qtest/libqtest.c:646<br>
#6=C2=A0 0x56560491 in qtest_qmp_receive (s=3D0x565cebe0) at ../home/source=
/tests/qtest/libqtest.c:634<br>
#7=C2=A0 0x56560d1a in qtest_vqmp (s=3D0x565cebe0, fmt=3D0x56594f90 &quot;{=
 &#39;execute&#39;: &#39;query-migrate&#39; }&quot;, ap=3D0xffffd218 &quot;=
&quot;) at ../home/source/tests/qtest/libqtest.c:747<br>
#8=C2=A0 0x5655ec77 in wait_command (who=3D0x565cebe0, command=3D0x56594f90=
 &quot;{ &#39;execute&#39;: &#39;query-migrate&#39; }&quot;) at ../home/sou=
rce/tests/qtest/migration-helpers.c:63<br>
#9=C2=A0 0x5655ef1d in migrate_query (who=3D0x565cebe0) at ../home/source/t=
ests/qtest/migration-helpers.c:107<br>
#10 0x5655c79a in read_ram_property_int (who=3D&lt;optimized out&gt;, prope=
rty=3D0x56594166 &quot;dirty-sync-count&quot;) at ../home/source/tests/qtes=
t/migration-test.c:176<br>
#11 0x5655c851 in get_migration_pass (who=3D0x565cebe0) at ../home/source/t=
ests/qtest/migration-test.c:215<br>
#12 wait_for_migration_pass (who=3D0x565cebe0) at ../home/source/tests/qtes=
t/migration-test.c:215<br>
#13 0x5655e773 in test_migrate_fd_proto () at ../home/source/tests/qtest/mi=
gration-test.c:1038<br>
#14 0xf7effbd7 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0<br>
#15 0xf7effa77 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0<br>
#16 0xf7effa77 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0<br>
#17 0xf7effec9 in g_test_run_suite () from /lib/i386-linux-gnu/libglib-2.0.=
so.0<br>
#18 0xf7effeed in g_test_run () from /lib/i386-linux-gnu/libglib-2.0.so.0<b=
r>
#19 0x5655b424 in main (argc=3D&lt;optimized out&gt;, argv=3D&lt;optimized =
out&gt;) at ../home/source/tests/qtest/migration-test.c:1496<br>
<br>
which hmm, doesn&#39;t look like a new test, I see kvm_log_clear has had a<=
br>
fix to it&#39;s error handling in January from thuth, but perhaps that mean=
s<br>
it&#39;s broken on 32bit on 64 for a while?<br>
<br>
<br>
&gt; Stage: test<br>
&gt; Name: check-python-tox<br>
<br>
That one hmm I dunno, it&#39;s tox stuff.<br>
<br></blockquote><div><br></div><div><div>The python stuff is known, fix is=
 here: <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg=
08108.html">https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg08108.=
html</a></div><div><br></div><div>It&#39;s just a warning message, ignore i=
t for now.</div><div><br></div><div>--js</div></div><div>=C2=A0</div></div>=
</div>

--0000000000004aa27b05c612d98a--


