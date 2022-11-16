Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB2D62CF2F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 00:56:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovSEq-0001JE-GE; Wed, 16 Nov 2022 18:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovSEo-0001Ir-TC
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 18:54:38 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovSEm-0007xr-Kf
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 18:54:38 -0500
Received: by mail-io1-xd2b.google.com with SMTP id 11so246882iou.0
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 15:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CrGtNnnpRa8MQlfIqtUhwUPqWOmxYCOfFCNEl/j0B7k=;
 b=zaRJ1yOL7IKB7MDGkJwPDvX0pIlWjVNPtwziwg1wOZjMWmwPZjAfIU+UAk15n68NJ8
 xS3Xj4VV204fKV07XSGi9CPI/wqeYlWTBTd6PxcB0zGnJ3I2sMxMJRfwICqT3QsZJr2/
 Qf6kp4sv/2fd41sVzY0xMnJyisUpYPj6ueTErKCBQ4TTi9ZXSJ6q99ccEfobOKYyxh7C
 aNNKYVTDLAMxfoYHA9F1Fmw/Hn1EG7lfHvXG14lM4NKU6RuJ9d3aektR1TnqEE8Tv07b
 e30YHIqxXqvVNJHA3Qj+uc6Q89J6Le4svN1KdXpLxkqmedwfjyKN729UMvmw4OrQIxvV
 64gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CrGtNnnpRa8MQlfIqtUhwUPqWOmxYCOfFCNEl/j0B7k=;
 b=wezDqKXD0yhgLT71AclwHTC3u+E9atYKPB5yjfnuek4UGYVFZgRYG7AeJNMe7207T4
 NWi7c6QvAUxDh5tuNSVxNqYxBX/JOr+CNFPDsTEY4RmoxcTm3IEx2Z5tw9WqCrX1wWaW
 Y/tBtW6OcKOb0R7VUHLdrHTQYw6g2BYs4QHd3j3hfd39lxuoKvvE0qDvR5W+Y9NACUeU
 G03sP1yyxzsgipBKZ5qJlF94CB+ZEGZtt4Bun6vEbymJTo26qOb8loby2SQ128Tiu+nj
 rNBWbUxMtU/mRtrB8jetNcyj04ZdDfpDbLHtsRsvfUDNi89YqcD6eMNIwBGbeJW3DLq6
 QLeg==
X-Gm-Message-State: ANoB5pmIUUuBrUutj8rA0p3rUbHxmadVw4qaoHbIaKWRhfVJQleJJSV6
 UbG7my6LTy44AAQhbbgwla06QG9j3FVrEkIIK+j6JQ==
X-Google-Smtp-Source: AA0mqf6uXoCM3DLjqoelDPcCS/8eBV4urrBxASslPsXtWjeo46OCOS5d2kvZRUja3rfgvwFo18NpINCXMHgWXip7/LM=
X-Received: by 2002:a02:604d:0:b0:375:616d:112b with SMTP id
 d13-20020a02604d000000b00375616d112bmr11185946jaf.48.1668642874283; Wed, 16
 Nov 2022 15:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
 <CAFn=p-bkTkpJxT6RyT2JGEF6Kn0FMFy+PU9Ux3eykehzJ+8u9w@mail.gmail.com>
In-Reply-To: <CAFn=p-bkTkpJxT6RyT2JGEF6Kn0FMFy+PU9Ux3eykehzJ+8u9w@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 17 Nov 2022 05:24:23 +0530
Message-ID: <CAARzgwyXZMoRAUjc6PR-DUDGYsscBX8321YFhd=5+wrVmJ+xSA@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: John Snow <jsnow@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c76dc205ed9f31dd"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000c76dc205ed9f31dd
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 16, 2022 at 11:31 PM John Snow <jsnow@redhat.com> wrote:

>
>
> On Tue, Nov 15, 2022, 10:24 PM Ani Sinha <ani@anisinha.ca> wrote:
>
>> On Wed, Nov 16, 2022 at 2:58 AM John Snow <jsnow@redhat.com> wrote:
>> >
>> > Instead of using a hardcoded timeout, just rely on Avocado's built-in
>> > test case timeout. This helps avoid timeout issues on machines where 60
>> > seconds is not sufficient.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>>
>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>>
>
> Alex's critique is valid, though: the way vm.wait() works is to
> immediately  terminate the serial console connection as it prepares for the
> VM to shut down. I forgot about this.
>
> (For historical reasons, it does this to avoid deadlocks when the pipe
> fills.)
>
> I think we definitely do want to make sure we watch the console *while* we
> wait for it to shut down, which is not a feature QEMUMachine really offers
> right now in a meaningful way.
>

Maybe  we can push your current patch while we consider these console
logging enhancements for the next release window. Console logging woikd
require some changes in bits and some more testing. I'm not sure if I'll
have time for it immediately at present.


> I need to make some more drastic changes to machine.py, but in the
> meantime I can revise this patch to do something a bit smarter so we get
> console logging while we wait. This is a use case worth supporting.
>
> (Thanks for writing new and interesting tests!)
>
>
>> > ---
>> >  tests/avocado/acpi-bits.py | 10 ++--------
>> >  1 file changed, 2 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
>> > index 8745a58a766..ac13e22dc93 100644
>> > --- a/tests/avocado/acpi-bits.py
>> > +++ b/tests/avocado/acpi-bits.py
>> > @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
>> >          self._vm.launch()
>> >          # biosbits has been configured to run all the specified test
>> suites
>> >          # in batch mode and then automatically initiate a vm shutdown.
>> > -        # sleep for maximum of one minute
>> > -        max_sleep_time = time.monotonic() + 60
>> > -        while self._vm.is_running() and time.monotonic() <
>> max_sleep_time:
>> > -            time.sleep(1)
>> > -
>> > -        self.assertFalse(time.monotonic() > max_sleep_time,
>> > -                         'The VM seems to have failed to shutdown in
>> time')
>> > -
>> > +        # Rely on avocado's unit test timeout.
>> > +        self._vm.wait(timeout=None)
>>
>> I think this is fine. This just waits until the VM is shutdown on its
>> own and relies on the avocado framework to timeout if it doesn't. We
>> do not need to look into the console. The test issues a shutdown from
>> the VM itself once its done with the batch operations.
>
>
> Still, if it fails, we want to see the output, right? It's very
> frustrating if it doesn't, especially in an automated pipeline.
>
>
>> >          self.parse_log()
>> > --
>> > 2.37.3
>> >
>>
>>

--000000000000c76dc205ed9f31dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 16, 2022 at 11:31 PM John Snow &lt;<a href=3D"m=
ailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 15, 2022, 10:24 PM An=
i Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anisin=
ha.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Nov 16=
, 2022 at 2:58 AM John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=3D"=
noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Instead of using a hardcoded timeout, just rely on Avocado&#39;s built=
-in<br>
&gt; test case timeout. This helps avoid timeout issues on machines where 6=
0<br>
&gt; seconds is not sufficient.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=
=3D"noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" rel=3D"norefe=
rrer" target=3D"_blank">ani@anisinha.ca</a>&gt;<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Alex&#39;s critique is valid=
, though: the way vm.wait() works is to immediately=C2=A0 terminate the ser=
ial console connection as it prepares for the VM to shut down. I forgot abo=
ut this.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(For historical=
 reasons, it does this to avoid deadlocks when the pipe fills.)</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">I think we definitely do want to ma=
ke sure we watch the console *while* we wait for it to shut down, which is =
not a feature QEMUMachine really offers right now in a meaningful way.</div=
></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Maybe =C2=
=A0we can push your current patch while we consider these console logging e=
nhancements for the next release window. Console logging woikd require some=
 changes in bits and some more testing. I&#39;m not sure if I&#39;ll have t=
ime for it immediately at present.</div><div dir=3D"auto"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I need to make some more drastic chan=
ges to machine.py, but in the meantime I can revise this patch to do someth=
ing a bit smarter so we get console logging while we wait. This is a use ca=
se worth supporting.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(Th=
anks for writing new and interesting tests!)</div></div><div dir=3D"auto"><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 tests/avocado/acpi-bits.py | 10 ++--------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py<b=
r>
&gt; index 8745a58a766..ac13e22dc93 100644<br>
&gt; --- a/tests/avocado/acpi-bits.py<br>
&gt; +++ b/tests/avocado/acpi-bits.py<br>
&gt; @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm.launch()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # biosbits has been configured to ru=
n all the specified test suites<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # in batch mode and then automatical=
ly initiate a vm shutdown.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sleep for maximum of one minute<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sleep_time =3D time.monotonic() + 60<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 while self._vm.is_running() and time.mono=
tonic() &lt; max_sleep_time:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(time.monotonic() &gt; ma=
x_sleep_time,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;The VM seems to have failed to shutdown in time&#=
39;)<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Rely on avocado&#39;s unit test timeout=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm.wait(timeout=3DNone)<br>
<br>
I think this is fine. This just waits until the VM is shutdown on its<br>
own and relies on the avocado framework to timeout if it doesn&#39;t. We<br=
>
do not need to look into the console. The test issues a shutdown from<br>
the VM itself once its done with the batch operations.</blockquote></div></=
div><div dir=3D"auto"><br></div></div><div dir=3D"auto"><div dir=3D"auto">S=
till, if it fails, we want to see the output, right? It&#39;s very frustrat=
ing if it doesn&#39;t, especially in an automated pipeline.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parse_log()<br>
&gt; --<br>
&gt; 2.37.3<br>
&gt;<br>
<br>
</blockquote></div></div></div>
</blockquote></div></div>

--000000000000c76dc205ed9f31dd--

