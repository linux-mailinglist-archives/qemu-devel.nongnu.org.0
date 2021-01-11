Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0B52F0B8F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 04:46:31 +0100 (CET)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyoA2-0007tu-Un
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 22:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kyo8g-0007Sf-R7
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:45:06 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:34042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kyo8f-00010b-33
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:45:06 -0500
Received: by mail-lj1-x22e.google.com with SMTP id m10so1992751lji.1
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 19:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=4SpCCzsVU5GqI3m5V/WjFmkbUQs/PkFeZF7A0wSlWHs=;
 b=snTi62DQDOiPVgluQCi/Ety4mwmAO+RSMd2mB85FA7CWJoAH+si1aXZBcOupo4d/wV
 xwQwBvCaQ/BCtqWlo7gnR3ocFtYph4VmdoiP78rqeifKoFFrCXrDYpi6SB/OOiZkGa14
 2zd1ZVwfub235NfFF91hv1uk9mcTwbWNKfA/aubkGwjLLzdBYAvpgiAvWgMt7NWORu95
 JAiQlIBT+cnwiHi5/BYtYh970xkVZJGUbMNXZulgs1/UwfCc6WvyEB1IPHgtPCpWTB8d
 YjujuNX1OyDhYMTpPzcOD5Jid8MI5SRcoAgVFxJjS5mysUv3xsfioQOxg4oZgBLeSPak
 4+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=4SpCCzsVU5GqI3m5V/WjFmkbUQs/PkFeZF7A0wSlWHs=;
 b=UndL/X22VUh/UcWMBHult9FKivRyEimTTJwUtVYTgk3XDX3E/jK8i1ZUzZindS8gSA
 6jG4H6V9INAMd0CBetA7aHs91idvYy9BT6/TE68yvOZARyFKbyTGfeHkfTCgBk+euS3O
 Dmn3Bae5WaL4tVUHUixRUpxnsSURA5DyqRBCQim7vmQVb58S6ReGw9wHkwnj4+RUFKP2
 jm1+QgzMhp4GkcqOIt7Euy+UJdwTC+A12nvdAWtyP3dgp1CZlgqzOPN7cg+567Ps0LgE
 LPR5ioOWHxm0hKVo5f/RPK2f7hmdiZeYFzj2ysN/QHfS85xs4hT69uRSBMr2DmDIVFBX
 MnHQ==
X-Gm-Message-State: AOAM531E+xMLZ/2i0TI+SpGSQP068V6hPqXz6QxjXr+xKFbl5rNqzwrz
 kwe6DPoP6mAkz6KCV03HQMcDCSwIIWlZ/JZkLrw=
X-Google-Smtp-Source: ABdhPJwGpni2KNkr49d5/0FRuIyqtXOgVwiu6Yy+HboD/a6S5KG1+OvaCmj9OMchM5wlv+ni9Jal7U7QwpUQ1UAWh5Y=
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr6379964ljo.490.1610336703115; 
 Sun, 10 Jan 2021 19:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20210111001606.1122983-1-f4bug@amsat.org>
In-Reply-To: <20210111001606.1122983-1-f4bug@amsat.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sun, 10 Jan 2021 19:44:50 -0800
Message-ID: <CAE2XoE8YaeuyWTzi6LZTQzO4W1WH8sfbAuFSCBOpaxMFfysKRQ@mail.gmail.com>
Subject: Re: [PATCH] util/oslib-win32: Fix _aligned_malloc() arguments order
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000002877a905b897bbb2"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x22e.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002877a905b897bbb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 10, 2021 at 4:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:
>
> Commit dfbd0b873a8 inadvertently swapped the arguments
> of _aligned_malloc(), correct it to fix [*]:
>
>
G_TEST_SRCDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-c=
i-build/tests
>
G_TEST_BUILDDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus=
-ci-build/build/tests
>   tests/test-qht.exe --tap -k
>   ERROR test-qht - too few tests run (expected 2, got 0)
>   make: *** [Makefile.mtest:256: run-test-30] Error 1
>
> [*] https://cirrus-ci.com/task/6055645751279616?command=3Dtest#L593
>
> Fixes: dfbd0b873a8 ("util/oslib-win32: Use _aligned_malloc for
qemu_try_memalign")
> Reported-by: Yonggang Luo <luoyonggang@gmail.com>
> Reported-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Suggested-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  util/oslib-win32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index e6f83e10edb..f68b8012bb8 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -59,7 +59,7 @@ void *qemu_try_memalign(size_t alignment, size_t size)
>
>      g_assert(size !=3D 0);
>      g_assert(is_power_of_2(alignment));
> -    ptr =3D _aligned_malloc(alignment, size);
> +    ptr =3D _aligned_malloc(size, alignment);
>      trace_qemu_memalign(alignment, size, ptr);
>      return ptr;
>  }
> --
> 2.26.2
>

Oh, sorry, you 've fixed this. ignore my patch

Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000002877a905b897bbb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sun, Jan 10, 2021 at 4:16 PM Philippe Mathieu-D=
aud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wr=
ote:<br>&gt;<br>&gt; Commit dfbd0b873a8 inadvertently swapped the arguments=
<br>&gt; of _aligned_malloc(), correct it to fix [*]:<br>&gt;<br>&gt; =C2=
=A0 G_TEST_SRCDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/cirr=
us-ci-build/tests<br>&gt; =C2=A0 G_TEST_BUILDDIR=3DC:/Users/ContainerAdmini=
strator/AppData/Local/Temp/cirrus-ci-build/build/tests<br>&gt; =C2=A0 tests=
/test-qht.exe --tap -k<br>&gt; =C2=A0 ERROR test-qht - too few tests run (e=
xpected 2, got 0)<br>&gt; =C2=A0 make: *** [Makefile.mtest:256: run-test-30=
] Error 1<br>&gt;<br>&gt; [*] <a href=3D"https://cirrus-ci.com/task/6055645=
751279616?command=3Dtest#L593">https://cirrus-ci.com/task/6055645751279616?=
command=3Dtest#L593</a><br>&gt;<br>&gt; Fixes: dfbd0b873a8 (&quot;util/osli=
b-win32: Use _aligned_malloc for qemu_try_memalign&quot;)<br>&gt; Reported-=
by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@g=
mail.com</a>&gt;<br>&gt; Reported-by: Volker R=C3=BCmelin &lt;<a href=3D"ma=
ilto:vr_qemu@t-online.de">vr_qemu@t-online.de</a>&gt;<br>&gt; Suggested-by:=
 Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-o=
nline.de</a>&gt;<br>&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a =
href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>&gt; ---<br>&gt;=
 =C2=A0util/oslib-win32.c | 2 +-<br>&gt; =C2=A01 file changed, 1 insertion(=
+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/util/oslib-win32.c b/util/os=
lib-win32.c<br>&gt; index e6f83e10edb..f68b8012bb8 100644<br>&gt; --- a/uti=
l/oslib-win32.c<br>&gt; +++ b/util/oslib-win32.c<br>&gt; @@ -59,7 +59,7 @@ =
void *qemu_try_memalign(size_t alignment, size_t size)<br>&gt;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0g_assert(size !=3D 0);<br>&gt; =C2=A0 =C2=A0 =C2=A0g_asser=
t(is_power_of_2(alignment));<br>&gt; - =C2=A0 =C2=A0ptr =3D _aligned_malloc=
(alignment, size);<br>&gt; + =C2=A0 =C2=A0ptr =3D _aligned_malloc(size, ali=
gnment);<br>&gt; =C2=A0 =C2=A0 =C2=A0trace_qemu_memalign(alignment, size, p=
tr);<br>&gt; =C2=A0 =C2=A0 =C2=A0return ptr;<br>&gt; =C2=A0}<br>&gt; --<br>=
&gt; 2.26.2<br>&gt;<br><br>Oh, sorry, you &#39;ve fixed this. ignore my pat=
ch<br><br>Reviewed-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail=
.com">luoyonggang@gmail.com</a>&gt;
<br>=C2=A0<br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br=
>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincere=
ly,<br>Yonggang Luo<br></div>

--0000000000002877a905b897bbb2--

