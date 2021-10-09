Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F4427AE4
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 16:42:01 +0200 (CEST)
Received: from localhost ([::1]:57258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZDXz-0004vu-DL
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 10:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mZDWN-0003yx-3q
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 10:40:19 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:45621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mZDWK-0000PV-BQ
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 10:40:18 -0400
Received: by mail-vk1-xa35.google.com with SMTP id n201so4664075vkn.12
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tdo+lPR8l6EZ1T7PCFWd+Rx4pjCGe7jlE+x6J5GJAy8=;
 b=OvELH0WMV+TL/pu6YegHoEBCKjpvZ6KoZmp1uDYnn419LqTnmGO+7vuhPRVLOBmygL
 +HyL6foc3ndbGn6JLG8iM6/P3UIK4RNPnK+PcZAajRALM9ac8vKS9AhLvZ2yGI3LZi3x
 /cXGd7MWOxLv5B90oDUlWDgDAdqSYu4ys7kZ0HYgQ54ORhbS1E7XZ288dF/ChX+vou0u
 LeXaXAz8xSS78NlV5n8+13LU3MaAFm4fuEOzPKMTivmg93XbSKncNK+3BUaZhkFJXxwo
 2fjN6PwgFOnXGb/+Hu/9Mo+xIxRvY7AneN5hgDWrqYaTUKxJwjOWjjf9BSiOwkUXy9Fj
 R+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tdo+lPR8l6EZ1T7PCFWd+Rx4pjCGe7jlE+x6J5GJAy8=;
 b=2twQ6ugqP1Q6Ri2Lw4budpsENbBBWlhohDvNZetrINllKnx8VnYgUjglkknEZ+t7Ar
 RsbQsWlqYehjVC/M7dPY0xYNslgesyCxW9RwTIsWd8p1ymQ0+NXhLbUpKR6zw5aUbX76
 7W3KbvDzyJZwGiZmWP5dtVPW+V/yCb6wqrIh+VWHoNH5hdMyH3UyU95DmvcldnPVXOlC
 RXuMaGhfCprUYLbBbReVxdIEgD6R4GEy82pzZOHtFr6CKlYkYGrI3EhckAvFsu9Rbmwi
 tsJgOL2HIa4FXkRkJWhC/bDKManu4PRjBQZ5wVErnxsUaEnepnDBftAftbWWc/5FKwXL
 XKPg==
X-Gm-Message-State: AOAM533bbmX5f2rKV/uoNrO5LNn3Hqhhb1y9O1NGjdjx5t9g8YAxzD3r
 iV2zmeVYQz/bG1h/++ZXskeKVLL8dRgcxPNUmow6DxIG+Bk=
X-Google-Smtp-Source: ABdhPJz6SyYqrE5hsRQFh319PJCY/slAKZItpPeA31nyGINWT8x6+gqRyCSW+/RzCOPLq3Mc51gIAXApGMJsVlBoMQc=
X-Received: by 2002:a1f:2d83:: with SMTP id t125mr14259319vkt.23.1633790413832; 
 Sat, 09 Oct 2021 07:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-2-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-2-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 9 Oct 2021 08:40:03 -0600
Message-ID: <CANCZdfrtXDx2y195eHj--YHRMo=jRZmJc4TDGbfuS99aO9rhcA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] meson: *-user: only descend into *-user when
 configured
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000041141c05cdec79e2"
Received-SPF: none client-ip=2607:f8b0:4864:20::a35;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000041141c05cdec79e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(looks like Paolo's email bounced, so try again with cut and paste)

On Fri, Oct 8, 2021 at 5:15 PM Warner Losh <imp@bsdimp.com> wrote:

> To increase flexibility, only descend into *-user when that is
> configured. This allows *-user to selectively include directories based
> on the host OS which may not exist on all hosts. Adopt Paolo's
> suggestion of checking the configuration in the directories that know
> about the configuration.
>
> Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
> Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Warner Losh <wlosh@bsdimp.com>
> Acked-by: Paolo Bonzini <pbonzinni@redhat.com>
>
> Sponsored by:           Netflix
> ---
>  bsd-user/meson.build   | 4 ++++
>  linux-user/meson.build | 4 ++++
>  meson.build            | 3 +--
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 0369549340..243fb78930 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_target.has_key('CONFIG_BSD_USER')
> +   subdir_done()
> +endif
> +
>  bsd_user_ss.add(files(
>    'bsdload.c',
>    'elfload.c',
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index 9549f81682..602255a3d6 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_target.has_key('CONFIG_LINUX_USER')
> +   subdir_done()
> +endif
> +
>  linux_user_ss.add(files(
>    'elfload.c',
>    'exit.c',
> diff --git a/meson.build b/meson.build
> index 99a0a3e689..1f2da5f7d9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2303,10 +2303,9 @@ subdir('ebpf')
>
>  common_ss.add(libbpf)
>
> -bsd_user_ss.add(files('gdbstub.c'))
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>
> -linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
> +linux_user_ss.add(files('thunk.c'))
>  specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
>
>  # needed for fuzzing binaries
> --
> 2.32.0
>
>

--00000000000041141c05cdec79e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(looks like Paolo&#39;s email bounced, so try again with c=
ut and paste)</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Oct 8, 2021 at 5:15 PM Warner Losh &lt;<a href=3D"mail=
to:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">To increase flexibility, only descend into=
 *-user when that is<br>
configured. This allows *-user to selectively include directories based<br>
on the host OS which may not exist on all hosts. Adopt Paolo&#39;s<br>
suggestion of checking the configuration in the directories that know<br>
about the configuration.<br>
<br>
Message-Id: &lt;<a href=3D"mailto:20210926220103.1721355-2-f4bug@amsat.org"=
 target=3D"_blank">20210926220103.1721355-2-f4bug@amsat.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210926220103.1721355-3-f4bug@amsat.org"=
 target=3D"_blank">20210926220103.1721355-3-f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:wlosh@bsdimp.com" target=
=3D"_blank">wlosh@bsdimp.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzinni@redhat.com" target=
=3D"_blank">pbonzinni@redhat.com</a>&gt;<br>
<br>
Sponsored by:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netflix<br>
---<br>
=C2=A0bsd-user/meson.build=C2=A0 =C2=A0| 4 ++++<br>
=C2=A0linux-user/meson.build | 4 ++++<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +--<br>
=C2=A03 files changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/bsd-user/meson.build b/bsd-user/meson.build<br>
index 0369549340..243fb78930 100644<br>
--- a/bsd-user/meson.build<br>
+++ b/bsd-user/meson.build<br>
@@ -1,3 +1,7 @@<br>
+if not config_target.has_key(&#39;CONFIG_BSD_USER&#39;)<br>
+=C2=A0 =C2=A0subdir_done()<br>
+endif<br>
+<br>
=C2=A0bsd_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;bsdload.c&#39;,<br>
=C2=A0 =C2=A0&#39;elfload.c&#39;,<br>
diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
index 9549f81682..602255a3d6 100644<br>
--- a/linux-user/meson.build<br>
+++ b/linux-user/meson.build<br>
@@ -1,3 +1,7 @@<br>
+if not config_target.has_key(&#39;CONFIG_LINUX_USER&#39;)<br>
+=C2=A0 =C2=A0subdir_done()<br>
+endif<br>
+<br>
=C2=A0linux_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;elfload.c&#39;,<br>
=C2=A0 =C2=A0&#39;exit.c&#39;,<br>
diff --git a/meson.build b/meson.build<br>
index 99a0a3e689..1f2da5f7d9 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2303,10 +2303,9 @@ subdir(&#39;ebpf&#39;)<br>
<br>
=C2=A0common_ss.add(libbpf)<br>
<br>
-bsd_user_ss.add(files(&#39;gdbstub.c&#39;))<br>
=C2=A0specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;, if_true: bsd_use=
r_ss)<br>
<br>
-linux_user_ss.add(files(&#39;gdbstub.c&#39;, &#39;thunk.c&#39;))<br>
+linux_user_ss.add(files(&#39;thunk.c&#39;))<br>
=C2=A0specific_ss.add_all(when: &#39;CONFIG_LINUX_USER&#39;, if_true: linux=
_user_ss)<br>
<br>
=C2=A0# needed for fuzzing binaries<br>
-- <br>
2.32.0<br>
<br>
</blockquote></div>

--00000000000041141c05cdec79e2--

