Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5043BB34
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 21:48:00 +0200 (CEST)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfSQR-0000fq-J0
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 15:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfSOm-0008Av-Hn
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfSOj-0003N9-Bs
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635277571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A+JrhHmtAy3A79UqCNmaJUKBlyOQ7MBGPDnnGxAcagk=;
 b=J737Y/koxkqzMFTVGQul5Hzs6Ufc1mxK2mjG7uDwC5BOgFtWlTmLDBTc1oXvOLgLkrhvss
 Njju1LVdL/LZA+mxADaBWZcUsMql6J2oMrq0Fdezz5ZmPKj9XNgtv8eHxDB5pbyVwPIUVE
 y68l2+vEjQJ7jSjcTmXLUWg+G0W8fQY=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-32w0nZdvMSGZbzWryFcYMQ-1; Tue, 26 Oct 2021 15:46:09 -0400
X-MC-Unique: 32w0nZdvMSGZbzWryFcYMQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 d11-20020ac5c54b000000b002dc649cb6b7so263739vkl.8
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 12:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+JrhHmtAy3A79UqCNmaJUKBlyOQ7MBGPDnnGxAcagk=;
 b=xusCZqSg5xl/mVmg0Zofw3KZ6KyYSLgveTyNS2/4J8NuethS52DXEq2IkxzWgD25eV
 xBBY1uGiNph1NkwDiRFMmt9qWWWOa7bh/FJBFT5QopUyKLmhty8lyJJIHJXcVbRWu6vr
 EEd3S52z7XSWKHGO4Dxu7gZ1YcApgsT6XnfOgPGZRvIKzGrlwQfL2Qc4HFaai/1g0jdK
 nJuurT2jdcvb1X6exGKOvj59vDpbdbTRB9q8Qn0nzVfzoRne7v/405nnXty9n2Q+Imq1
 8vsIfT2bbXIlcXhxp5arkF1qoSW/blsty4cLJ/MEyIa4371z5q/zNMd0FiDdC1mPDB4r
 26Tg==
X-Gm-Message-State: AOAM531DNTbJrxUE3WDBd6FpVMFDX7c2dfSfLkRA4xs1MlyTJuejvXB7
 BHlVBJJCHZnlC0peYFex1V2yNyQ/3vAWqntMLbNkCLai3cm+M93utI4ryQPZioZoSm6CicEbUWt
 ngBO0x4ZdeO/5VyRKbolq7Scd6VtX0is=
X-Received: by 2002:a67:f685:: with SMTP id n5mr25721097vso.31.1635277569150; 
 Tue, 26 Oct 2021 12:46:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU9TifzMEQV4LUkOr1FTuFJpGRWJfrNdYDSyvBRmyuRL505nMzYpRQg3GB2D5oXwonkG0J1sqrMesqIRCULAg=
X-Received: by 2002:a67:f685:: with SMTP id n5mr25721055vso.31.1635277568899; 
 Tue, 26 Oct 2021 12:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-13-jsnow@redhat.com>
 <df8bd300-1d04-7df8-7916-8b004766d173@redhat.com>
 <CAFn=p-ZrKaxnefmOJZRxt718jcSAe3TqeJAUch3DOaEne92cwg@mail.gmail.com>
In-Reply-To: <CAFn=p-ZrKaxnefmOJZRxt718jcSAe3TqeJAUch3DOaEne92cwg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 15:45:58 -0400
Message-ID: <CAFn=p-Z-4UYQJ+fLpwYUkLQoPwJGGuwS3tszs=6x2tCy0NgkoA@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] iotests/linters: Add entry point for linting via
 Python CI
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009a8d6205cf46ba8a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009a8d6205cf46ba8a
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 2:36 PM John Snow <jsnow@redhat.com> wrote:

>
>
> On Tue, Oct 26, 2021 at 6:57 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>> On 19.10.21 16:49, John Snow wrote:
>> > We need at least a tiny little shim here to join test file discovery
>> > with test invocation. This logic could conceivably be hosted somewhere
>> > in python/, but I felt it was strictly the least-rude thing to keep the
>> > test logic here in iotests/, even if this small function isn't itself an
>> > iotest.
>> >
>> > Note that we don't actually even need the executable bit here, we'll be
>> > relying on the ability to run this module as a script using Python CLI
>> > arguments. No chance it gets misunderstood as an actual iotest that way.
>> >
>> > (It's named, not in tests/, doesn't have the execute bit, and doesn't
>> > have an execution shebang.)
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> > ---
>> >   tests/qemu-iotests/linters.py | 27 +++++++++++++++++++++++++++
>> >   1 file changed, 27 insertions(+)
>>
>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>>
>>
> Thanks! I'll endeavor to try and clean up the list of exempted files to
> continue cleaning up this mess, but it's not a top priority right now. I'll
> put it on the backburner after I finish typing the QAPI generator. A lot of
> the weird compatibility goop will go away over time as I consolidate more
> of the venv logic.
>
> (I think this series is good to go, now? I think it could be applied in
> any order vs my other series. If you want, if/when you give the go-ahead
> for the other series, I could just stage them both myself and make sure
> they work well together and save you the headache.)
>

Update: I pre-emptively staged both series (the iotests one first, followed
by the AQMP one) to jsnow/python and verified that all of the python tests
pass for each commit between:

[14] python-add-iotest-linters-to   # python: Add iotest linters to test
suite
...
[22] python-iotests-replace-qmp     # python, iotests: replace qmp with aqmp

and I'm running the CI on all of that now at
https://gitlab.com/jsnow/qemu/-/pipelines/396002744

(I just wanted to double-check they didn't conflict with each other in any
unanticipated ways. Let me know if I should send the PR or if that'll just
create hassle for you.)

--js

--0000000000009a8d6205cf46ba8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 2:36 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 6:57 AM Hanna Reitz &lt;<a =
href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 19.=
10.21 16:49, John Snow wrote:<br>
&gt; We need at least a tiny little shim here to join test file discovery<b=
r>
&gt; with test invocation. This logic could conceivably be hosted somewhere=
<br>
&gt; in python/, but I felt it was strictly the least-rude thing to keep th=
e<br>
&gt; test logic here in iotests/, even if this small function isn&#39;t its=
elf an<br>
&gt; iotest.<br>
&gt;<br>
&gt; Note that we don&#39;t actually even need the executable bit here, we&=
#39;ll be<br>
&gt; relying on the ability to run this module as a script using Python CLI=
<br>
&gt; arguments. No chance it gets misunderstood as an actual iotest that wa=
y.<br>
&gt;<br>
&gt; (It&#39;s named, not in tests/, doesn&#39;t have the execute bit, and =
doesn&#39;t<br>
&gt; have an execution shebang.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/linters.py | 27 +++++++++++++++++++++++=
++++<br>
&gt;=C2=A0 =C2=A01 file changed, 27 insertions(+)<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks! I&#39;ll endeavor to try and c=
lean up the list of exempted files to continue cleaning up this mess, but i=
t&#39;s not a top priority right now. I&#39;ll put it on the backburner aft=
er I finish typing the QAPI generator. A lot of the weird compatibility goo=
p will go away over time as I consolidate more of the venv logic.<br><br></=
div><div>(I think this series is good to go, now? I think it could be appli=
ed in any order vs my other series. If you want, if/when you give the go-ah=
ead for the other series, I could just stage them both myself and make sure=
 they work well together and save you the headache.)<br></div></div></div><=
/blockquote><div><br></div><div>Update: I pre-emptively staged both series =
(the iotests one first, followed by the AQMP one) to jsnow/python and verif=
ied that all of the python tests pass for each commit between:</div><div><b=
r></div><div>[14] python-add-iotest-linters-to =C2=A0 # python: Add iotest =
linters to test suite</div><div>...<br>[22] python-iotests-replace-qmp =C2=
=A0 =C2=A0 # python, iotests: replace qmp with aqmp</div><div><br></div><di=
v>and I&#39;m running the CI on all of that now at <a href=3D"https://gitla=
b.com/jsnow/qemu/-/pipelines/396002744">https://gitlab.com/jsnow/qemu/-/pip=
elines/396002744</a></div><div><br></div><div>(I just wanted to double-chec=
k they didn&#39;t conflict with each other in any unanticipated ways. Let m=
e know if I should send the PR or if that&#39;ll just create hassle for you=
.)</div><div><br></div><div>--js<br></div></div></div>

--0000000000009a8d6205cf46ba8a--


