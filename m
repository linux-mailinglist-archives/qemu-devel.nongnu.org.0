Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CA159FD77
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 16:43:01 +0200 (CEST)
Received: from localhost ([::1]:33460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQrat-0005Xm-VL
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 10:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oQrZM-00044L-Bd
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 10:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oQrZI-0006x2-HK
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 10:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661352078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9FyT3GuJs7MYtgUIJphn3dv9Ziupz30r6WqgJHDyfqQ=;
 b=XJTkUdYkcKsqMbfdceP1RVE0AA2DNN4zeNKFqIhubGGv6NGdPYUsq3TxMAUHBcHGbBtLH0
 STBCL2hh9Fx8NMPdoEARcTJTXU58+ow4Yi719TDOBGU3AhFoG9+d8imgZGZtdpVgRbGBw2
 iua2RPFDW7mJPzwXH7ApMbyh5Ll4Zi0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-wmzPj7UqOdWuBg8f78aLWA-1; Wed, 24 Aug 2022 10:41:17 -0400
X-MC-Unique: wmzPj7UqOdWuBg8f78aLWA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-333f0d49585so292011577b3.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 07:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9FyT3GuJs7MYtgUIJphn3dv9Ziupz30r6WqgJHDyfqQ=;
 b=lXUIM6t3pXQKc3hKrsnFMxRXq+SWJYL2qo+EJ03Fa+uatHHSAchJNbaPMcbmP5LDg4
 l1t238JHeWH1Y2000MbcCHk5Z/PPnNPwShtIM5qXQv9jzTG3L0v4d+eDI9ASjkJN+7kh
 D5vvH6y3bw/gnB1gkb4KaitsSCBh6XfRtmOpglvGuP0kwy4+uwTimvSVpCsezmGQQbU0
 39C6GrLekSU1/2tMYG2PAYOJca4z91Jl8VFRX2Kb90oruMfysmppuWk9kyj683cKB3yF
 9cN6x/h+m1jXY5UjFBNeuGF6NLrv6rgKoz3aTXvhr5d+GwQv0KAKuNcZJANLNqk9oUzh
 4ZUw==
X-Gm-Message-State: ACgBeo30x3YR9ZqnRqfS4vz7bZ+O/+gwSgoBWjD/HyVMOMl2OPqKcE4y
 PzcrqoTya7B2gqn5AhkR67ja3ovNgrPMUW009/VdXeuQNBwD10RG5oSYRMjCtId8gAYPAi4P9R1
 UumwOIpU/LKGRFueeDI0e0vMLzu8aA2w=
X-Received: by 2002:a25:7d82:0:b0:695:dec9:8359 with SMTP id
 y124-20020a257d82000000b00695dec98359mr9607174ybc.22.1661352075365; 
 Wed, 24 Aug 2022 07:41:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5AHB2a8cQCn9eORHNj4vKyxYJPbyWlw2aihMXCuK1hQifTuGPPaJjhoIOI+qw2mzJiNT6LVLFb8Qfe1HeazFA=
X-Received: by 2002:a25:7d82:0:b0:695:dec9:8359 with SMTP id
 y124-20020a257d82000000b00695dec98359mr9607158ybc.22.1661352075134; Wed, 24
 Aug 2022 07:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-12-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-12-bmeng.cn@gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 24 Aug 2022 17:41:03 +0300
Message-ID: <CAPMcbCqVSx1Y59PH8d95QffCVfUqzUCeufiatsS79k+o4dckSw@mail.gmail.com>
Subject: Re: [PATCH 11/51] qga/commands-posix-ssh: Use g_mkdir_with_parents()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="00000000000049237b05e6fdac3f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--00000000000049237b05e6fdac3f
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Aug 24, 2022 at 12:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> g_mkdir() is a deprecated API and newer codes should use
> g_mkdir_with_parents().
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  qga/commands-posix-ssh.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix-ssh.c b/qga/commands-posix-ssh.c
> index f3a580b8cc..2460112a38 100644
> --- a/qga/commands-posix-ssh.c
> +++ b/qga/commands-posix-ssh.c
> @@ -59,7 +59,7 @@ static bool
>  mkdir_for_user(const char *path, const struct passwd *p,
>                 mode_t mode, Error **errp)
>  {
> -    if (g_mkdir(path, mode) == -1) {
> +    if (g_mkdir_with_parents(path, mode) == -1) {
>          error_setg(errp, "failed to create directory '%s': %s",
>                     path, g_strerror(errno));
>          return false;
> --
> 2.34.1
>
>

--00000000000049237b05e6fdac3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 2=
4, 2022 at 12:42 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmen=
g.cn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" =
target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
<br>
g_mkdir() is a deprecated API and newer codes should use<br>
g_mkdir_with_parents().<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0qga/commands-posix-ssh.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-posix-ssh.c b/qga/commands-posix-ssh.c<br>
index f3a580b8cc..2460112a38 100644<br>
--- a/qga/commands-posix-ssh.c<br>
+++ b/qga/commands-posix-ssh.c<br>
@@ -59,7 +59,7 @@ static bool<br>
=C2=A0mkdir_for_user(const char *path, const struct passwd *p,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_t mode, Error =
**errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (g_mkdir(path, mode) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 if (g_mkdir_with_parents(path, mode) =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;failed to create d=
irectory &#39;%s&#39;: %s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path,=
 g_strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--00000000000049237b05e6fdac3f--


