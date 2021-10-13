Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFBB42C20B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:03:23 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeqo-0007dT-8C
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maeol-00054f-9c
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maeob-0003MT-7q
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634133663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=91P3CP2DrxSv1RjGRvwJ5XsYLpg6ej7E1PSy8hIrbGo=;
 b=Vs9N3ZtSqQSQ410FoU0FKRIFeXdFz03Sj5r7OPDJZRDdyEevFwylSu/5KnoSqvHvJdx/um
 A4BEudHyAD8iY4vh6BFRRiwDmXyNHjseXsx0YemmL1unbXsxRGXkBxUmp1d8now3+gt6E9
 t0E5CKy0XUbRa7pTAJOYbg6iUaCCluA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-GFUsVqtgNTWHRlxg2TDu0w-1; Wed, 13 Oct 2021 10:01:01 -0400
X-MC-Unique: GFUsVqtgNTWHRlxg2TDu0w-1
Received: by mail-vk1-f197.google.com with SMTP id
 n6-20020a1f2706000000b002a45b52f52dso915190vkn.22
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 07:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91P3CP2DrxSv1RjGRvwJ5XsYLpg6ej7E1PSy8hIrbGo=;
 b=d6A2KhPP3L0ikyZee5WX5wwpsdVwPDmR6238sihVddWetaOhzbMxX6AK6iWKTVsjxL
 l9RB3t/Rt46Lh1t6Zk/6ErZQ1ruPBQfysOkHVEGahTlhozuEMhcCEc3dVn27cT0322XX
 o/cEz/FJxFEqlWsfHI6OxaAz3MsTcwqsxV4QP1B6uVMmoPHpFwlT8uhykCsexpSEP1kn
 bQgHDIi5YtDdFP1JoQBwrxyTIPwIl7shwzTbXGUkrJfbKvuHEMzvWpqUe+XoXxMJSzOb
 iZicuv04woTmNgHNFbpBsKJfqmUEjYPswbyuECRGZvbJwR6sL2EKevNBwfC74Sj7atWd
 JgaA==
X-Gm-Message-State: AOAM532245NCS60hzgK8hL7eXG2/SNR+ReIsSIjvY8NwfMYrGv6AEcaB
 ZXsbL6nG/6THl6+RVYgos6uhWml07249pOQEaCkn0kT7oNP50VnuWZmSuDJIZtdl2YKcsHr2kcK
 s/Do3Ld3gA0OEjgqCaDzJVhYkD0OF6qQ=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr38041454vsp.59.1634133660929; 
 Wed, 13 Oct 2021 07:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeGdPrz2B8bjw4XLizoINoxfQ19wYg1ifpFMMj0rMoIanlRLeosMiq4E0WNHqK8Lhf5u/JvbbkayCE1LncJyI=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr38041428vsp.59.1634133660706; 
 Wed, 13 Oct 2021 07:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <5041f802-0b42-f130-ee68-56cd7464b75d@redhat.com>
 <CAFn=p-aJdGpCzkMHmMO9WO+rYn55OznyZ7K5BJz+Rv0GkRDhOA@mail.gmail.com>
In-Reply-To: <CAFn=p-aJdGpCzkMHmMO9WO+rYn55OznyZ7K5BJz+Rv0GkRDhOA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 13 Oct 2021 10:00:49 -0400
Message-ID: <CAFn=p-bdg3T0kt_QHDeeJCKbpugmSbzfjO+ZVDMk3TLP4fBoHg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Switch iotests to using Async QMP
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005cbb4905ce3c64d9"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005cbb4905ce3c64d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 8:51 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Wed, Oct 13, 2021 at 4:45 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>> On 13.10.21 00:34, John Snow wrote:
>> > Based-on: <20211012214152.802483-1-jsnow@redhat.com>
>> >            [PULL 00/10] Python patches
>> > GitLab:
>> https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
>> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/387210591
>> >
>> > Hiya,
>> >
>> > This series continues where the last two AQMP series left off and adds=
 a
>> > synchronous 'legacy' wrapper around the new AQMP interface, then drops
>> > it straight into iotests to prove that AQMP is functional and totally
>> > cool and fine. The disruption and churn to iotests is pretty minimal.
>> >
>> > In the event that a regression happens and I am not physically proxima=
te
>> > to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variabl=
e
>> > to any non-empty string as it pleases you to engage the QMP machinery
>> > you are used to.
>> >
>> > I'd like to try and get this committed early in the 6.2 development
>> > cycle to give ample time to smooth over any possible regressions. I've
>> > tested it locally and via gitlab CI, across Python versions 3.6 throug=
h
>> > 3.10, and "worksforme". If something bad happens, we can revert the
>> > actual switch-flip very trivially.
>>
>> So running iotests locally, I got one failure:
>>
>> $ TEST_DIR=3D/tmp/vdi-tests ./check -c writethrough -vdi 300
>> [...]
>> 300                             fail       [10:28:06] [10:28:11]
>> 5.1s                 output mismatch (see 300.out.bad)
>> --- /home/maxx/projects/qemu/tests/qemu-iotests/300.out
>> +++ 300.out.bad
>> @@ -1,4 +1,5 @@
>> -.......................................
>> +..............ERROR:qemu.aqmp.qmp_client.qemu-b-222963:Task.Reader:
>> ConnectionResetError: [Errno 104] Connection reset by peer
>> +.........................
>>   ----------------------------------------------------------------------
>>   Ran 39 tests
>> [...]
>>
>>
> Oh, unfortunate.
>
>
>>
>> I=E2=80=99m afraid I can=E2=80=99t really give a reproducer or anything.=
  It feels like
>>
>
> Thank you for the report!
>
>
>> just some random spurious timing-related error.  Although then again,
>> 300 does have an `except machine.AbnormalShutdown` clause at one
>> point...  So perhaps that=E2=80=99s the culprit, and we need to disable =
logging
>> there.
>>
>>
> I'll investigate!
>

Unfortunately, even in a loop some 150 times I couldn't reproduce this one.
As you point out, it appears to be just a failure caused by logging. The
test logic itself completes as expected.

Still, I would expect, on a "clean" shutdown of the destination host (where
the destination process fails to load the migration stream and voluntarily
exits with an error code) to end with a FIN/ACK for TCP or ... uh, whatever
happens for a UNIX socket. Where's the Connection Reset coming from? Did
the destination VM process *crash*?

I'm not so sure that I *should* silence this error, but I also can't
reproduce it at all to answer these questions, so uh. uhhh. I guess I will
just hammer it on a loop a few hundred times more and see if I get lucky.

--0000000000005cbb4905ce3c64d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 8:51 AM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 4:45 AM Hanna Reitz &lt;<a =
href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 13.=
10.21 00:34, John Snow wrote:<br>
&gt; Based-on: &lt;<a href=3D"mailto:20211012214152.802483-1-jsnow@redhat.c=
om" target=3D"_blank">20211012214152.802483-1-jsnow@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [PULL 00/10] Python patches<b=
r>
&gt; GitLab: <a href=3D"https://gitlab.com/jsnow/qemu/-/commits/python-aqmp=
-iotest-wrapper" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/js=
now/qemu/-/commits/python-aqmp-iotest-wrapper</a><br>
&gt; CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/387210591" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipeline=
s/387210591</a><br>
&gt;<br>
&gt; Hiya,<br>
&gt;<br>
&gt; This series continues where the last two AQMP series left off and adds=
 a<br>
&gt; synchronous &#39;legacy&#39; wrapper around the new AQMP interface, th=
en drops<br>
&gt; it straight into iotests to prove that AQMP is functional and totally<=
br>
&gt; cool and fine. The disruption and churn to iotests is pretty minimal.<=
br>
&gt;<br>
&gt; In the event that a regression happens and I am not physically proxima=
te<br>
&gt; to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variabl=
e<br>
&gt; to any non-empty string as it pleases you to engage the QMP machinery<=
br>
&gt; you are used to.<br>
&gt;<br>
&gt; I&#39;d like to try and get this committed early in the 6.2 developmen=
t<br>
&gt; cycle to give ample time to smooth over any possible regressions. I&#3=
9;ve<br>
&gt; tested it locally and via gitlab CI, across Python versions 3.6 throug=
h<br>
&gt; 3.10, and &quot;worksforme&quot;. If something bad happens, we can rev=
ert the<br>
&gt; actual switch-flip very trivially.<br>
<br>
So running iotests locally, I got one failure:<br>
<br>
$ TEST_DIR=3D/tmp/vdi-tests ./check -c writethrough -vdi 300<br>
[...]<br>
300=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fail=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [10:28:06] [=
10:28:11] <br>
5.1s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 output mismatch (see 300.out.bad)<br>
--- /home/maxx/projects/qemu/tests/qemu-iotests/300.out<br>
+++ 300.out.bad<br>
@@ -1,4 +1,5 @@<br>
-.......................................<br>
+..............ERROR:qemu.aqmp.qmp_client.qemu-b-222963:Task.Reader: <br>
ConnectionResetError: [Errno 104] Connection reset by peer<br>
+.........................<br>
=C2=A0=C2=A0---------------------------------------------------------------=
-------<br>
=C2=A0=C2=A0Ran 39 tests<br>
[...]<br>
<br></blockquote><div><br></div><div>Oh, unfortunate.<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I=E2=80=99m afraid I can=E2=80=99t really give a reproducer or anything.=C2=
=A0 It feels like <br></blockquote><div><br></div><div>Thank you for the re=
port!<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
just some random spurious timing-related error.=C2=A0 Although then again, =
<br>
300 does have an `except machine.AbnormalShutdown` clause at one <br>
point...=C2=A0 So perhaps that=E2=80=99s the culprit, and we need to disabl=
e logging <br>
there.<br>
<br></blockquote><div><br></div>I&#39;ll investigate!<br></div></div></bloc=
kquote><div><br></div><div>Unfortunately, even in a loop some 150 times I c=
ouldn&#39;t reproduce this one. As you point out, it appears to be just a f=
ailure caused by logging. The test logic itself completes as expected.<br><=
/div><div><br></div><div>Still, I would expect, on a &quot;clean&quot; shut=
down of the destination host (where the destination process fails to load t=
he migration stream and voluntarily exits with an error code) to end with a=
 FIN/ACK for TCP or ... uh, whatever happens for a UNIX socket. Where&#39;s=
 the Connection Reset coming from? Did the destination VM process *crash*?<=
br></div><div><br></div>I&#39;m not so sure that I *should* silence this er=
ror, but I also can&#39;t reproduce it at all to answer these questions, so=
 uh. uhhh. I guess I will just hammer it on a loop a few hundred times more=
 and see if I get lucky.</div><div class=3D"gmail_quote"><br></div></div>

--0000000000005cbb4905ce3c64d9--


