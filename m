Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505841173ED
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 19:18:41 +0100 (CET)
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieNcF-0007qA-P2
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 13:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ieNZv-0006BF-V3
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:16:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ieNZu-0006vz-Hx
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:16:15 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ieNZu-0006vQ-9f
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:16:14 -0500
Received: by mail-ot1-x341.google.com with SMTP id o9so13053790ote.2
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 10:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CB1KjF3ZOT0dJgFx5/rOjrc7b02VK8tpDKAvB4NS60E=;
 b=XL8FnAMKMZwOwQm9O83ZMGUERbua4XP7KpF7b68IPgy4PpOcor39bmaEPr54JdXsXW
 eiuuWSKkacCjhcJ2eYKR5EqAhTmFEa4KMq28GwRq6k6ZNq8LsozGlSsULwGBzYr+nHhK
 UPOTE8N8GYg4BLosaTZxuUREb/G7Pl1DWYRHp6TOz+lnrgoYwZunSlLUtGsAIvIa9uTK
 SP+MaBOWlCdbf/7ZLRcbt/O5x0zLsg4LoFWpAJC34D2LTlgvRIPrZ/kmUfDm3UTf7Lup
 uQiXkNG2CVmC9Hyw2MLqenbTAUEJfPp+md/PZ5hF/vpRZ73HKHbANxO2Wb1DYoIPScAB
 KEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CB1KjF3ZOT0dJgFx5/rOjrc7b02VK8tpDKAvB4NS60E=;
 b=J8Or8U6N/q2XztH/735mL7c/UVLC2nseuX4q2boRXs4oIWsd5F0TcFwVEvdppcoxZw
 2Zl7ibMHLPLjYRSSbHVWXmTJfd4nbEbmjBwKLMVqoxUIMWaCYY8/Uek68jst3Mkiu/RE
 tO5DNixC/3aEAXXuQ9wpM5ucnWwZFl88Zod0slnmJo7mn7L51BogsGVXgWRoELoo1nTQ
 P45W65Yppt7X/LEYEDp7Nl9ltJtwYQzg1NtL5vRUqtQnlilqHTaAg06jHcuPXZ139NJ4
 oNhQ6BHbGg5qs7DYy+bAOMyo1scUKuf6WVSVNABZvL43r1uWCa/p6RpzNq+j14Lk8+IQ
 klyg==
X-Gm-Message-State: APjAAAXZRVlUDx9GFRucSdhy59IYENiXFrzNpSeIIy9LqTORClIacK8/
 tmCTDDG6FBVU17fq5w63Z2aye3JgQ85nVrkJfL4=
X-Google-Smtp-Source: APXvYqw2tu35+4zamET+3exp6Iq6vHplTOu+7ufm0JC4Dhn/QR5O5NEBVOCvqGiCze0F3dUJwWuRAjtmdmI6ppXzAFQ=
X-Received: by 2002:a9d:7305:: with SMTP id e5mr21692006otk.64.1575915373490; 
 Mon, 09 Dec 2019 10:16:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Mon, 9 Dec 2019 10:16:13 -0800 (PST)
In-Reply-To: <20191208183922.13757-18-mrolnik@gmail.com>
References: <20191208183922.13757-1-mrolnik@gmail.com>
 <20191208183922.13757-18-mrolnik@gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 9 Dec 2019 19:16:13 +0100
Message-ID: <CAL1e-=guE3xT3n2P5j0=UVoVDw8WKqbK02=otf+Pf90Mi8hfmQ@mail.gmail.com>
Subject: Re: [PATCH v38 17/22] target/avr: Register AVR support with the rest
 of QEMU
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000008754d05994964d0"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "me@xcancerberox.com.ar" <me@xcancerberox.com.ar>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000008754d05994964d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sunday, December 8, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:

> Add AVR related definitions into QEMU
>
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  qapi/machine.json          | 3 ++-
>  include/disas/dis-asm.h    | 6 ++++++
>  include/sysemu/arch_init.h | 1 +
>  arch_init.c                | 2 ++
>  4 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index ca26779f1a..8c6df54921 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -21,11 +21,12 @@
>  #        is true even for "qemu-system-x86_64".
>  #
>  # ppcemb: dropped in 3.1
> +# avr: since 5.0
>  #
>  # Since: 3.0
>  ##
>  { 'enum' : 'SysEmuTarget',
> -  'data' : [ 'aarch64', 'alpha', 'arm', 'cris', 'hppa', 'i386', 'lm32',
> +  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386',
> 'lm32',

              'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
>               'mips64el', 'mipsel', 'moxie', 'nios2', 'or1k', 'ppc',
>               'ppc64', 'riscv32', 'riscv64', 's390x', 'sh4',
> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
> index e9c7dd8eb4..8bedce17ac 100644
> --- a/include/disas/dis-asm.h
> +++ b/include/disas/dis-asm.h
> @@ -211,6 +211,12 @@ enum bfd_architecture
>  #define bfd_mach_m32r          0  /* backwards compatibility */
>    bfd_arch_mn10200,    /* Matsushita MN10200 */
>    bfd_arch_mn10300,    /* Matsushita MN10300 */
> +  bfd_arch_avr,       /* Atmel AVR microcontrollers.  */
> +#define bfd_mach_avr1          1
> +#define bfd_mach_avr2          2
> +#define bfd_mach_avr3          3
> +#define bfd_mach_avr4          4
> +#define bfd_mach_avr5          5


Incomplete list. I already explained why in reply to v37.



>    bfd_arch_cris,       /* Axis CRIS */
>  #define bfd_mach_cris_v0_v10   255
>  #define bfd_mach_cris_v32      32
> diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
> index 62c6fe4cf1..893df26ce2 100644
> --- a/include/sysemu/arch_init.h
> +++ b/include/sysemu/arch_init.h
> @@ -24,6 +24,7 @@ enum {
>      QEMU_ARCH_NIOS2 =3D (1 << 17),
>      QEMU_ARCH_HPPA =3D (1 << 18),
>      QEMU_ARCH_RISCV =3D (1 << 19),
> +    QEMU_ARCH_AVR =3D (1 << 20),
>  };
>
>  extern const uint32_t arch_type;
> diff --git a/arch_init.c b/arch_init.c
> index 705d0b94ad..6a741165b2 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -89,6 +89,8 @@ int graphic_depth =3D 32;
>  #define QEMU_ARCH QEMU_ARCH_UNICORE32
>  #elif defined(TARGET_XTENSA)
>  #define QEMU_ARCH QEMU_ARCH_XTENSA
> +#elif defined(TARGET_AVR)
> +#define QEMU_ARCH QEMU_ARCH_AVR
>  #endif
>
>  const uint32_t arch_type =3D QEMU_ARCH;
> --
> 2.17.2 (Apple Git-113)
>
>

--00000000000008754d05994964d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, December 8, 2019, Michael Rolnik &lt;<a href=3D"mailto:m=
rolnik@gmail.com">mrolnik@gmail.com</a>&gt; wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Add AVR related definitions into QEMU<br>
<br>
Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com">mrol=
nik@gmail.com</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com">philmd@redhat.com</a>&gt;<br>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om">amarkovic@wavecomp.com</a>&gt;<br>
---<br>
=C2=A0qapi/machine.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ++-<br>
=C2=A0include/disas/dis-asm.h=C2=A0 =C2=A0 | 6 ++++++<br>
=C2=A0include/sysemu/arch_init.h | 1 +<br>
=C2=A0arch_init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
2 ++<br>
=C2=A04 files changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qapi/machine.json b/qapi/machine.json<br>
index ca26779f1a..8c6df54921 100644<br>
--- a/qapi/machine.json<br>
+++ b/qapi/machine.json<br>
@@ -21,11 +21,12 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 is true even for &quot;qemu-system-x86_6=
4&quot;.<br>
=C2=A0#<br>
=C2=A0# ppcemb: dropped in 3.1<br>
+# avr: since 5.0<br>
=C2=A0#<br>
=C2=A0# Since: 3.0<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39; : &#39;SysEmuTarget&#39;,<br>
-=C2=A0 &#39;data&#39; : [ &#39;aarch64&#39;, &#39;alpha&#39;, &#39;arm&#39=
;, &#39;cris&#39;, &#39;hppa&#39;, &#39;i386&#39;, &#39;lm32&#39;,<br>
+=C2=A0 &#39;data&#39; : [ &#39;aarch64&#39;, &#39;alpha&#39;, &#39;arm&#39=
;, &#39;avr&#39;, &#39;cris&#39;, &#39;hppa&#39;, &#39;i386&#39;, &#39;lm32=
&#39;,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;m68k&#39;, &#39;micro=
blaze&#39;, &#39;microblazeel&#39;, &#39;mips&#39;, &#39;mips64&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;mips64el&#39;, &#39;m=
ipsel&#39;, &#39;moxie&#39;, &#39;nios2&#39;, &#39;or1k&#39;, &#39;ppc&#39;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ppc64&#39;, &#39;risc=
v32&#39;, &#39;riscv64&#39;, &#39;s390x&#39;, &#39;sh4&#39;,<br>
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h<br>
index e9c7dd8eb4..8bedce17ac 100644<br>
--- a/include/disas/dis-asm.h<br>
+++ b/include/disas/dis-asm.h<br>
@@ -211,6 +211,12 @@ enum bfd_architecture<br>
=C2=A0#define bfd_mach_m32r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 /* ba=
ckwards compatibility */<br>
=C2=A0 =C2=A0bfd_arch_mn10200,=C2=A0 =C2=A0 /* Matsushita MN10200 */<br>
=C2=A0 =C2=A0bfd_arch_mn10300,=C2=A0 =C2=A0 /* Matsushita MN10300 */<br>
+=C2=A0 bfd_arch_avr,=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Atmel AVR microcontrolle=
rs.=C2=A0 */<br>
+#define bfd_mach_avr1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
+#define bfd_mach_avr2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+#define bfd_mach_avr3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
+#define bfd_mach_avr4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
+#define bfd_mach_avr5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5</blockquote><div=
><br></div><div>Incomplete list. I already explained why in reply to v37.</=
div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0bfd_arch_cris,=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Axis CRIS */<br>
=C2=A0#define bfd_mach_cris_v0_v10=C2=A0 =C2=A0255<br>
=C2=A0#define bfd_mach_cris_v32=C2=A0 =C2=A0 =C2=A0 32<br>
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h<br>
index 62c6fe4cf1..893df26ce2 100644<br>
--- a/include/sysemu/arch_init.h<br>
+++ b/include/sysemu/arch_init.h<br>
@@ -24,6 +24,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0QEMU_ARCH_NIOS2 =3D (1 &lt;&lt; 17),<br>
=C2=A0 =C2=A0 =C2=A0QEMU_ARCH_HPPA =3D (1 &lt;&lt; 18),<br>
=C2=A0 =C2=A0 =C2=A0QEMU_ARCH_RISCV =3D (1 &lt;&lt; 19),<br>
+=C2=A0 =C2=A0 QEMU_ARCH_AVR =3D (1 &lt;&lt; 20),<br>
=C2=A0};<br>
<br>
=C2=A0extern const uint32_t arch_type;<br>
diff --git a/arch_init.c b/arch_init.c<br>
index 705d0b94ad..6a741165b2 100644<br>
--- a/arch_init.c<br>
+++ b/arch_init.c<br>
@@ -89,6 +89,8 @@ int graphic_depth =3D 32;<br>
=C2=A0#define QEMU_ARCH QEMU_ARCH_UNICORE32<br>
=C2=A0#elif defined(TARGET_XTENSA)<br>
=C2=A0#define QEMU_ARCH QEMU_ARCH_XTENSA<br>
+#elif defined(TARGET_AVR)<br>
+#define QEMU_ARCH QEMU_ARCH_AVR<br>
=C2=A0#endif<br>
<br>
=C2=A0const uint32_t arch_type =3D QEMU_ARCH;<br>
-- <br>
2.17.2 (Apple Git-113)<br>
<br>
</blockquote>

--00000000000008754d05994964d0--

