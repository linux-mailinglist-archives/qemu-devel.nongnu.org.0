Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7099C3318A3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:34:00 +0100 (CET)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJMZj-0003rs-HQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lJMYU-00032D-Q2; Mon, 08 Mar 2021 15:32:42 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:32777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lJMYS-0000kn-PB; Mon, 08 Mar 2021 15:32:42 -0500
Received: by mail-io1-xd2c.google.com with SMTP id n132so11459482iod.0;
 Mon, 08 Mar 2021 12:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cB7RESq++gU8X3Z1jSwlbXmrp2OCbipUfhx7PCcAVes=;
 b=u8UG7BITYk+YW4Z1lb10sOJzeVmlRAX2HFamGLN/V2COcgw9NHHkmg+avs3jFCHxBI
 C628dUT7Ehz5jXS95VhfG62p8jkve9U6hqbL89SQvWjPae2KCUrvkfOZmf4Yj7n/2V3t
 j20lwAIRJlP8u5jGNlOKxjTSKeh93ZMMiESrjvsVnE3SNQhsZ1a4Egr0A88oIe+s1X47
 2niMJ7yj4XM5BGuJGnHd/qd7UFgQpyeIHcB8TOW/c+hL56XE6LlJMqyY+xef0YU+yCOj
 KRTA6Tww92dJKAyk1C6fFexpV/Y1O4yRFSskOZo85nQVUKHfCS6yXB3cY+nwfwP3E0yK
 8cKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cB7RESq++gU8X3Z1jSwlbXmrp2OCbipUfhx7PCcAVes=;
 b=IMLss6tgglRK2TrZYoVOROVb3pLKy3+b1mhAxgDZt6ysDEYFB6GmZe0yBnB+CLlbQS
 6M1+856i8aTmlE0MJ5L82AzU+u4Ao/AkxnLUL8JZrI9LfX3bM3HiUfY//jSm97ePDXJa
 qiuDyalc7d0Lxo+u5VEl/wMb7szIQVT45YucMYD0aDGaIrIPIUrzXAkh6ceGp1k6rz2V
 P2xjO/IfnN2xY0S1LNriC6WYQG2wuNRijFGLr+yEdkl9kZBEAnl67//L56i5Z2oKHHn1
 NTCUJdx9+x+EiE+95Vz49t8Y8Mlzb9iLNDRoxoC8STVXTwf/OYsqo/lsGYXT84BlxzCa
 A/CQ==
X-Gm-Message-State: AOAM533SZU4RJ7UUDtNnQ0XOsHkwkfOOwNT2s/Zew6wFm8KJBIfA/EVj
 RWz6YMxJ40+B3H8a2V+TsceDlgQLGN8flngJuKs=
X-Google-Smtp-Source: ABdhPJxMiUmLffbsd+Smk+zCc+gi7Xufi0kk2QWvwLMiyLjdXsEM5ANq2LQS1r1187jA9tDvlgxwrWKfNlAGtHiB08A=
X-Received: by 2002:a5d:80d5:: with SMTP id h21mr7667218ior.11.1615235559131; 
 Mon, 08 Mar 2021 12:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
In-Reply-To: <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 8 Mar 2021 21:32:28 +0100
Message-ID: <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bb0ec905bd0c5593"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>, qemu-devel <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bb0ec905bd0c5593
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe, Willian,

On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
> > On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail.co=
m>
> wrote:
> >>
> >> The image for Armbian 19.11.3 bionic has been removed from the armbian
> server.
> >> Without the image as input the test arm_orangepi_bionic_19_11 cannot
> run.
> >>
> >> This commit removes the test completely and merges the code of the
> generic function
> >> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
> >>
> >> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >> ---
> >>  tests/acceptance/boot_linux_console.py | 72 ++++++++-----------------=
-
> >>  1 file changed, 23 insertions(+), 49 deletions(-)
> >>
> >> diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> >> index eb01286799..9fadea9958 100644
> >> --- a/tests/acceptance/boot_linux_console.py
> >> +++ b/tests/acceptance/boot_linux_console.py
> >> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
> >>          # Wait for VM to shut down gracefully
> >>          self.vm.wait()
> >>
> >> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> >> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> >> +                'Test artifacts fetched from unreliable
> apt.armbian.com')
> >> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage
> limited')
> >> +    def test_arm_orangepi_bionic_20_08(self):
> >> +        """
> >> +        :avocado: tags=3Darch:arm
> >> +        :avocado: tags=3Dmachine:orangepi-pc
> >> +        :avocado: tags=3Ddevice:sd
> >> +        """
> >> +
> >> +        # This test download a 275 MiB compressed image and expand it
> >> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
> >> +        # As we expand it to 2 GiB we are safe.
> >> +
> >> +        image_url =3D ('https://dl.armbian.com/orangepipc/archive/'
> >> +
>  'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
> >
> > The Armbian 20 is not available on this link anymore. I can browse just
> 21.
>
> Cat-and-mouse game *sigh*.
>
>
Just to clarify here: in this patch I wanted to only make the change to
remove the test for the 19.11.3 image.
And in the 3rd patch (tests/acceptance/boot_linux_console: change URL for
test_arm_orangepi_bionic_20_08)
do the update for to correct the 20.08 link. So each patch fixes one
problem at a time.

Does that make sense, or do you prefer that I combine them in a single
patch instead?

Regards,
Niek

--=20
Niek Linnenbank

--000000000000bb0ec905bd0c5593
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Philippe, Willian,</div><div><br>=
</div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D=
"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 3/5/21 4:16 PM, Willian Ramp=
azzo wrote:<br>
&gt; On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank &lt;<a href=3D"mailto:n=
ieklinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; The image for Armbian 19.11.3 bionic has been removed from the arm=
bian server.<br>
&gt;&gt; Without the image as input the test arm_orangepi_bionic_19_11 cann=
ot run.<br>
&gt;&gt;<br>
&gt;&gt; This commit removes the test completely and merges the code of the=
 generic function<br>
&gt;&gt; do_test_arm_orangepi_uboot_armbian back with the 20.08 test.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenban=
k@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 tests/acceptance/boot_linux_console.py | 72 ++++++++--------=
----------<br>
&gt;&gt;=C2=A0 1 file changed, 23 insertions(+), 49 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/tests/acceptance/boot_linux_console.py b/tests/accept=
ance/boot_linux_console.py<br>
&gt;&gt; index eb01286799..9fadea9958 100644<br>
&gt;&gt; --- a/tests/acceptance/boot_linux_console.py<br>
&gt;&gt; +++ b/tests/acceptance/boot_linux_console.py<br>
&gt;&gt; @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Wait for VM to shut down grace=
fully<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.wait()<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 def do_test_arm_orangepi_uboot_armbian(self, image_=
path):<br>
&gt;&gt; +=C2=A0 =C2=A0 @skipUnless(os.getenv(&#39;ARMBIAN_ARTIFACTS_CACHED=
&#39;),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Test=
 artifacts fetched from unreliable <a href=3D"http://apt.armbian.com" rel=
=3D"noreferrer" target=3D"_blank">apt.armbian.com</a>&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 @skipUnless(os.getenv(&#39;AVOCADO_ALLOW_LARGE_STOR=
AGE&#39;), &#39;storage limited&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 def test_arm_orangepi_bionic_20_08(self):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:arm<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:orangepi-pc<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:sd<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test download a 275 MiB compre=
ssed image and expand it<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to 1036 MiB, but the underlying fil=
esystem is 1552 MiB...<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # As we expand it to 2 GiB we are saf=
e.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_url =3D (&#39;<a href=3D"https:=
//dl.armbian.com/orangepipc/archive/" rel=3D"noreferrer" target=3D"_blank">=
https://dl.armbian.com/orangepipc/archive/</a>&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz&#3=
9;)<br>
&gt; <br>
&gt; The Armbian 20 is not available on this link anymore. I can browse jus=
t 21.<br>
<br>
Cat-and-mouse game *sigh*.<br>
<br></blockquote><div><br></div><div>Just to clarify here: in this patch I =
wanted to only make the change to remove the test for the 19.11.3 image.</d=
iv><div>And in the 3rd patch (tests/acceptance/boot_linux_console: change U=
RL for test_arm_orangepi_bionic_20_08)</div><div>do the update for to corre=
ct the 20.08 link. So each patch fixes one problem at a time.<br></div><div=
><br></div><div>Does that make sense, or do you prefer that I combine them =
in a single patch instead?</div><div><br></div><div>Regards,</div><div>Niek=
<br></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div></div>

--000000000000bb0ec905bd0c5593--

