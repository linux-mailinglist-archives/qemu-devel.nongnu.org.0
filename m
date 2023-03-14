Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B86BA05E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 21:04:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcArR-0004P7-Hd; Tue, 14 Mar 2023 16:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pcArK-0004Np-RL; Tue, 14 Mar 2023 16:03:00 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pcArG-0002Js-Vo; Tue, 14 Mar 2023 16:02:57 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r1so4290656ybu.5;
 Tue, 14 Mar 2023 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678824170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V9LHoOomVCXSbu8tUWUGIJnQ6wR9qt/imnB9X1WcVVA=;
 b=ezyBV3kZ0gOuWEXxHIXQ4yukobkipKnEjLAuVWOvry8Y9Q/3mpikRTO/CCeU6D0c6f
 Ct3GI5Dl+ifFfq2mmh44oVB4zjD+uJrCpNkbWjFyKTQc4Bx9E1oiWKyZXn0rEJ+h3DTK
 MMYEydxUgLdV6YlmkImFG88RMyPhNXV1m5k0cCtDrkOyN0xUCqfaONL7DpSo94K0WL3C
 Y65df6WpryVLo3A/GB/m1UQyDZ9BuWrnnIbcQygR0PnQddBSqNpeEE6IlRuRzpwxJaZ0
 9Mou5+Wjix7OB5+0TQi5PrhpRHtg+JEVk8WQawmLhfneXufayGykjngyTcOngusI0jVd
 4Odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678824170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9LHoOomVCXSbu8tUWUGIJnQ6wR9qt/imnB9X1WcVVA=;
 b=PBdkwAn5qMTLJA+lbDEX1TlC02oe56oSEGSxdSDLNqWe69zxo6Xu8vSuWK8QmI7N9W
 MeBar7Fsie7kB2bC8c8fbu3jQRNnW0oQTaqXo3r8yDnV7WPaOa2d9zfih1unJYwORGXW
 ThEIuZANIpyw8D3gHGfrH9ImZ51LsjGYTtSrohoG1LWG/vDzMfBRXRYwouryEDh3SSnn
 eJnXminl1WRsXfNAoJ/1yRAXdam0YEUoMHuedaW6i7n5AT90nO5qCy2t0olndzzP46Rf
 30wdnWsYCwwyeREb3lilO8KpP9EEUS6HVMn5axSmQcNVF9HyK94Hxk903ZVuhDxT/EWS
 BItg==
X-Gm-Message-State: AO0yUKWCxZcxbYdDlYgISCy9CTP3jm6ijHNx01aRS7rcjQc6+cCqvF3O
 HT+8wDBRyvOcZ1gllZ/RV8dnCxaDMzR0uUjBOUel+A/kpp4=
X-Google-Smtp-Source: AK7set/ER+2rxMKUA1fVFsUnuI7nspYKs6vYThRH5UaDPvCWbB5SMbSy+drVNeVaA/q+L6eGzznvg0deaqgBVtDtZLw=
X-Received: by 2002:a05:6902:1024:b0:b4a:3896:bc17 with SMTP id
 x4-20020a056902102400b00b4a3896bc17mr744166ybt.0.1678824169830; Tue, 14 Mar
 2023 13:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
 <20230311144111.30468-5-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20230311144111.30468-5-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 14 Mar 2023 21:02:38 +0100
Message-ID: <CAPan3WpQUsz9rRbpYAAYtEOM=s7SF_VqMcXK+rR5k7dta2epQA@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/avocado: Add reboot tests to Cubieboard
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000487bf005f6e1b682"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000487bf005f6e1b682
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Strahinja,

Looks good! I re-ran the tests on my machine, and they work fine:

ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes
./build/tests/venv/bin/avocado --show=3Dapp,console run -t
machine:orangepi-pc -t machine:cubieboard
tests/avocado/boot_linux_console.py
...
|console: Tue Mar 14 19:56:37 UTC 2023
\console: Starting root file system check:
PASS (22.45 s)
RESULTS    : PASS 8 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 189.23 s

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

On Sat, Mar 11, 2023 at 3:42=E2=80=AFPM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> Cubieboard tests end with comment "reboot not functioning; omit test".
> Fix this so reboot is done at the end of each test.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  tests/avocado/boot_linux_console.py | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/tests/avocado/boot_linux_console.py
> b/tests/avocado/boot_linux_console.py
> index 574609bf43..c0675809e6 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -581,7 +581,10 @@ def test_arm_cubieboard_initrd(self):
>                                                  'Allwinner sun4i/sun5i')
>          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
>                                                  'system-control@1c00000'=
)
> -        # cubieboard's reboot is not functioning; omit reboot test.
> +        exec_command_and_wait_for_pattern(self, 'reboot',
> +                                                'reboot: Restarting
> system')
> +        # Wait for VM to shut down gracefully
> +        self.vm.wait()
>
>      def test_arm_cubieboard_sata(self):
>          """
> @@ -625,7 +628,10 @@ def test_arm_cubieboard_sata(self):
>                                                  'Allwinner sun4i/sun5i')
>          exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
>                                                  'sda')
> -        # cubieboard's reboot is not functioning; omit reboot test.
> +        exec_command_and_wait_for_pattern(self, 'reboot',
> +                                                'reboot: Restarting
> system')
> +        # Wait for VM to shut down gracefully
> +        self.vm.wait()
>
>      @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage
> limited')
>      def test_arm_cubieboard_openwrt_22_03_2(self):
> @@ -672,7 +678,10 @@ def test_arm_cubieboard_openwrt_22_03_2(self):
>
>          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
>                                                  'Allwinner sun4i/sun5i')
> -        # cubieboard's reboot is not functioning; omit reboot test.
> +        exec_command_and_wait_for_pattern(self, 'reboot',
> +                                                'reboot: Restarting
> system')
> +        # Wait for VM to shut down gracefully
> +        self.vm.wait()
>
>      @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might
> timeout')
>      def test_arm_quanta_gsj(self):
> --
> 2.30.2
>
>

--=20
Niek Linnenbank

--000000000000487bf005f6e1b682
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Strahinja,</div><div><br></div><div>Looks good! I =
re-ran the tests on my machine, and they work fine:</div><div><br></div><di=
v>ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes ./build/=
tests/venv/bin/avocado --show=3Dapp,console run -t machine:orangepi-pc -t m=
achine:cubieboard tests/avocado/boot_linux_console.py</div><div>...<br></di=
v><div>|console: Tue Mar 14 19:56:37 UTC 2023<br>\console: Starting root fi=
le system check:<br>PASS (22.45 s)<br>RESULTS =C2=A0 =C2=A0: PASS 8 | ERROR=
 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0<br>JOB TIME =C2=A0 :=
 189.23 s</div><div><br></div><div>Reviewed-by: Niek Linnenbank &lt;<a href=
=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</div>=
<div>Tested-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.=
com">nieklinnenbank@gmail.com</a>&gt;<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 11, 2023 at 3:42=
=E2=80=AFPM Strahinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@gma=
il.com">strahinjapjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Cubieboard tests end with comment &quot=
;reboot not functioning; omit test&quot;.<br>
Fix this so reboot is done at the end of each test.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br>
---<br>
=C2=A0tests/avocado/boot_linux_console.py | 15 ++++++++++++---<br>
=C2=A01 file changed, 12 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux=
_console.py<br>
index 574609bf43..c0675809e6 100644<br>
--- a/tests/avocado/boot_linux_console.py<br>
+++ b/tests/avocado/boot_linux_console.py<br>
@@ -581,7 +581,10 @@ def test_arm_cubieboard_initrd(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Allwinner sun4i/sun5i&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_command_and_wait_for_pattern(self, &=
#39;cat /proc/iomem&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;system-control@1c00000&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cubieboard&#39;s reboot is not functioning; =
omit reboot test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;r=
eboot&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;reboot: Restarting system&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Wait for VM to shut down gracefully<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.wait()<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_arm_cubieboard_sata(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
@@ -625,7 +628,10 @@ def test_arm_cubieboard_sata(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Allwinner sun4i/sun5i&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_command_and_wait_for_pattern(self, &=
#39;cat /proc/partitions&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sda&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cubieboard&#39;s reboot is not functioning; =
omit reboot test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;r=
eboot&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;reboot: Restarting system&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Wait for VM to shut down gracefully<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.wait()<br>
<br>
=C2=A0 =C2=A0 =C2=A0@skipUnless(os.getenv(&#39;AVOCADO_ALLOW_LARGE_STORAGE&=
#39;), &#39;storage limited&#39;)<br>
=C2=A0 =C2=A0 =C2=A0def test_arm_cubieboard_openwrt_22_03_2(self):<br>
@@ -672,7 +678,10 @@ def test_arm_cubieboard_openwrt_22_03_2(self):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_command_and_wait_for_pattern(self, &=
#39;cat /proc/cpuinfo&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Allwinner sun4i/sun5i&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cubieboard&#39;s reboot is not functioning; =
omit reboot test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;r=
eboot&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;reboot: Restarting system&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Wait for VM to shut down gracefully<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.wait()<br>
<br>
=C2=A0 =C2=A0 =C2=A0@skipUnless(os.getenv(&#39;AVOCADO_TIMEOUT_EXPECTED&#39=
;), &#39;Test might timeout&#39;)<br>
=C2=A0 =C2=A0 =C2=A0def test_arm_quanta_gsj(self):<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div>

--000000000000487bf005f6e1b682--

