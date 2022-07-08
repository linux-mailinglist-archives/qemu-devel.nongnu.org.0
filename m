Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7A56B9FE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 14:47:03 +0200 (CEST)
Received: from localhost ([::1]:33330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9nNt-0001no-Mo
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 08:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9nJ6-0005wt-Tk
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 08:42:05 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:33654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9nJ4-00085j-Hc
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 08:42:04 -0400
Received: by mail-lj1-x232.google.com with SMTP id c15so25835698ljr.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 05:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N1e4+2cocgBv5wQNyc9lspLGxN7LkUEdKXf1iJjGpho=;
 b=RwdxGbjagb8TxnVmRljGguxagfYFRfHKWE9XP6yF/WsypCUKcCcq20iNs+PA0HVppK
 UJpwKMYtrjLXUB+dTIXp4+7IaIGsGTCOYAL2SVyUQKWTLf8fJ88VpkBHLrG+t+MCe1OP
 6RiAaapFpsfYpvwdAb9pcWgIDh4vgNtzGT0iQQKcW6BklrC/x/rGr2DyLcjWEXp34ho/
 qRk0z/N4R6XgaMFgau5jhKxOrMBhqgb/GJIedqYbNe1O42a5IjKdGidHJZyYijaF+yb8
 qc+6x8ZbJUbvTFh5xyz8yZnnZo1YqRq0+a9F+4mV0MVeCuW9krx+PCbBlQHR4sITaT+I
 adBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N1e4+2cocgBv5wQNyc9lspLGxN7LkUEdKXf1iJjGpho=;
 b=GTPXiuwUIknqtcYbDDl6rP+5nRdVa/RPLg1Ud0kpm/ivqR9rFJcddpL7aMwLlVwkHF
 MV/+23/qJxIH0S4enfGgH5Yykx7c3qI8mpG3lOzE97kYlJZ+bC87iI5Wn6csvhgzK6t6
 hWCiP1XeC06g0XRXVeP7f/2o1h5pi1fq+CBpYClZh0osynXgtJ6MBq/9Hd45RyFqkiZ+
 /dDp9irW/mbkC8SpIHvh5Zb6lOZ1R3dp+KuUA488ku/XqgtLmZZd4UaK38wZkFxCBmZ/
 c+faUbSmEneJ1sPUhM6/th3dBHVJgvkeiQXU8kFtBFmE5g+CqzWmVOCnIfpg+4srwcwS
 lq/A==
X-Gm-Message-State: AJIora+U4cpmVbm2J4hSFh0XqrsuzDUGQd91RsO0cqqkpdeUSNBqo8ex
 /zOa3eEzSG/rIoUTLnmujZoUqNUFrHF6J1VCUpw=
X-Google-Smtp-Source: AGRyM1vtjaxbjGWKQSZTiRBcN5gcVyCO2NB0w/OukdymP7jzQYV83qkPOgVDxFXdLiuCpiTzdg9S9geo71aUfFtctxw=
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id
 y2-20020a05651c154200b002495d863164mr1851543ljp.500.1657284119928; Fri, 08
 Jul 2022 05:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <c27c93e9-c6e9-1d12-8b45-41c34065a977@linaro.org>
In-Reply-To: <c27c93e9-c6e9-1d12-8b45-41c34065a977@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Jul 2022 16:41:48 +0400
Message-ID: <CAJ+F1CLQ6Y-tzcjwQeL=EO21+v+_49F85E2fnEcN170Gb89kjw@mail.gmail.com>
Subject: Re: Intermittent meson failures on msys2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000042a30505e34a87ef"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000042a30505e34a87ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 27, 2022 at 6:41 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Hi guys,
>
> There's an occasional failure on msys2, where meson fails to capture the
> output of a build
> script.  E.g.
>
> https://gitlab.com/qemu-project/qemu/-/jobs/2642051161
>
> FAILED: ui/input-keymap-qcode-to-linux.c.inc
> "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe=
"
> "C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py" "--internal"
> "exe" "--capture"
> "ui/input-keymap-qcode-to-linux.c.inc" "--"
> "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe=
"
> "../ui/keycodemapdb/tools/keymap-gen" "code-map" "--lang" "glib2"
> "--varname"
> "qemu_input_map_qcode_to_linux" "../ui/keycodemapdb/data/keymaps.csv"
> "qcode" "linux"
> [301/1665] Generating input-keymap-qcode-to-qnum.c.inc with a custom
> command (wrapped by
> meson to capture output)
> ninja: build stopped: subcommand failed.
>
>
> https://gitlab.com/qemu-project/qemu/-/jobs/2625836697
>
> FAILED: ui/shader/texture-blit-frag.h
> "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe=
"
> "C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py" "--internal"
> "exe" "--capture"
> "ui/shader/texture-blit-frag.h" "--" "perl"
> "C:/GitLab-Runner/builds/qemu-project/qemu/scripts/shaderinclude.pl"
> "../ui/shader/texture-blit.frag"
> [313/1663] Generating texture-blit-vert.h with a custom command (wrapped
> by meson to
> capture output)
> ninja: build stopped: subcommand failed.
>
>
> Could you have a look please?
>
>
>
Ah, we don't have artifacts for msys2 builds it seems, that would perhaps
help. It would make sense to at least take meson-logs/*.txt. I'll work on a
patch.

My guess is that CI randomly fails with "too many opened files", as I have
seen that regularly on various projects with Windows runners. And here,
it's probably reaching limits when running python/perl scripts
simultaneously... I don't see an easy way to solve that if that's the issue=
.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000042a30505e34a87ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 27, 2022 at 6:41 AM Ric=
hard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi guys,<br>
<br>
There&#39;s an occasional failure on msys2, where meson fails to capture th=
e output of a build <br>
script.=C2=A0 E.g.<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/2642051161" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/26=
42051161</a><br>
<br>
FAILED: ui/input-keymap-qcode-to-linux.c.inc<br>
&quot;C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.=
exe&quot; <br>
&quot;C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py&quot; &quot;=
--internal&quot; &quot;exe&quot; &quot;--capture&quot; <br>
&quot;ui/input-keymap-qcode-to-linux.c.inc&quot; &quot;--&quot; <br>
&quot;C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.=
exe&quot; <br>
&quot;../ui/keycodemapdb/tools/keymap-gen&quot; &quot;code-map&quot; &quot;=
--lang&quot; &quot;glib2&quot; &quot;--varname&quot; <br>
&quot;qemu_input_map_qcode_to_linux&quot; &quot;../ui/keycodemapdb/data/key=
maps.csv&quot; &quot;qcode&quot; &quot;linux&quot;<br>
[301/1665] Generating input-keymap-qcode-to-qnum.c.inc with a custom comman=
d (wrapped by <br>
meson to capture output)<br>
ninja: build stopped: subcommand failed.<br>
<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/2625836697" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/26=
25836697</a><br>
<br>
FAILED: ui/shader/texture-blit-frag.h<br>
&quot;C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.=
exe&quot; <br>
&quot;C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py&quot; &quot;=
--internal&quot; &quot;exe&quot; &quot;--capture&quot; <br>
&quot;ui/shader/texture-blit-frag.h&quot; &quot;--&quot; &quot;perl&quot; <=
br>
&quot;C:/GitLab-Runner/builds/qemu-project/qemu/scripts/<a href=3D"http://s=
haderinclude.pl" rel=3D"noreferrer" target=3D"_blank">shaderinclude.pl</a>&=
quot; <br>
&quot;../ui/shader/texture-blit.frag&quot;<br>
[313/1663] Generating texture-blit-vert.h with a custom command (wrapped by=
 meson to <br>
capture output)<br>
ninja: build stopped: subcommand failed.<br>
<br>
<br>
Could you have a look please?<br>
<br>
<br></blockquote><div><br></div>Ah, we don&#39;t have artifacts for msys2 b=
uilds it seems, that would perhaps help. It would make sense to at least ta=
ke meson-logs/*.txt. I&#39;ll work on a patch.</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">My guess is that CI randomly fails=
 with &quot;too many opened files&quot;, as I have seen that regularly on v=
arious projects with Windows runners. And here, it&#39;s probably reaching =
limits when running python/perl scripts simultaneously... I don&#39;t see a=
n easy way to solve that if that&#39;s the issue.<br clear=3D"all"></div><b=
r>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<=
br></div></div>

--00000000000042a30505e34a87ef--

