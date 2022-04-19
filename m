Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0CC506EDF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 15:47:34 +0200 (CEST)
Received: from localhost ([::1]:44614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngoCa-0003Nh-OU
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 09:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1ngoAU-0002XH-0W; Tue, 19 Apr 2022 09:45:22 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1ngoAM-00051M-BF; Tue, 19 Apr 2022 09:45:17 -0400
Received: by mail-lj1-x229.google.com with SMTP id w5so7361596lji.4;
 Tue, 19 Apr 2022 06:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8PL+cn88z4uqrpWrVCWXVnIwjqrlUijkPZDK8OdU84U=;
 b=EsRIV6LNQX1oIc+DbM99p6qlWJNWKOFV6tdE5Sbog9cmdpn1410t7B3E2fA6fwyrEN
 8H3+uBkCr5rsGcoa4tTFeqgpK156tE5ItKH99ybKEBuI119/Y3eUoV1MXyKCnAOJ0dfQ
 a3Gyqj91OwK7emildhXK5dmzx33AGQGv6TP2xRb9p2CllpRNg6vHNps1BNrvEvp6yHsv
 pBlBuvXDtfcuyNYjaWm3M+WSYiFMNFHO7bXlFzqrmkJ8vOW6tet7fMwoWuo7H8Pj1e3Q
 nAa1Jh1f0+z6x3ayMByYiZ1W7AxSdEiRLLwa8oGmYBUq3tIqXM9jdlnxNxJJsu2JuZNB
 /f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8PL+cn88z4uqrpWrVCWXVnIwjqrlUijkPZDK8OdU84U=;
 b=VfXEr9J9r5Kx71KmL6LtMbLKtKRvtTxySCfVFx7INE7E7Tpex3hfvMjh1UPMvTCrcq
 wCMjvMnMbMhUgiMYlB2F2ZC0tpnys+lJ79YA6cru7wYDkN3cM2wkoeyRgUqp8MLJxiMo
 IweHhCS7p56jPeaqFtB1an1mgRAzbWn2tRDG2blOWWch0K873xnpJlt0ijsh1hOgIPMu
 UDpXxrRCV+YvvnspQNGezqIxm+uUOgaeMkqn/l6z96bPfZKK/XWwN9jPznOpjNPSfvuL
 Q/l/MLy9lpHIOGq6EltFXy4GmOG5JFrMYZLa3WWN9O1IIw6O04ZZGanoMHC1RuOiY3iy
 O9iw==
X-Gm-Message-State: AOAM532R35A2x23NbC02Zt4AcVrS82h7OHC+GL+IAw1QFa7rtJgflhKk
 hTbC5h6CY26yYvHyVLjq/r0vZ+rlQS01VXum6Ms=
X-Google-Smtp-Source: ABdhPJwIKj0qmMI54hLyligCTrxp3ll/Th3UNwDEZJljLeNKaJfSxhSXjy1/ish3+vXon7iZewsdZvyD8XQkU71hVjM=
X-Received: by 2002:a2e:a78a:0:b0:24d:b9ba:c1b with SMTP id
 c10-20020a2ea78a000000b0024db9ba0c1bmr6838196ljf.268.1650375909073; Tue, 19
 Apr 2022 06:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <2a515431fdc02b0b2d3613f5d569305a32cfba30.1650370026.git.qemu_oss@crudebyte.com>
In-Reply-To: <2a515431fdc02b0b2d3613f5d569305a32cfba30.1650370026.git.qemu_oss@crudebyte.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 19 Apr 2022 09:44:57 -0400
Message-ID: <CAB26zV0UuWGb53zY1CX03=vvzP2PrO=GZhwfS0v3-CO0VRUxoA@mail.gmail.com>
Subject: Re: [PATCH 1/5] 9pfs: fix qemu_mknodat(S_IFREG) on macOS
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000ce673305dd021536"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x229.google.com
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ce673305dd021536
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 19, 2022 at 8:18 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> mknod() on macOS does not support creating regular files, so
> divert to openat_file() if S_IFREG is passed with mode argument.
>
> Furthermore, 'man 2 mknodat' on Linux says: "Zero file type is
> equivalent to type S_IFREG".
>
> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> Signed-off-by
> <https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/Signed-off-by>:
> Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-util-darwin.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index bec0253474..53e0625501 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -77,6 +77,10 @@ int fsetxattrat_nofollow(int dirfd, const char
> *filename, const char *name,
>  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>  {
>      int preserved_errno, err;
> +
> +    if (S_ISREG(mode) || !(mode & S_IFMT)) {
> +        return openat_file(dirfd, filename, O_CREAT, mode);
> +    }
>      if (!pthread_fchdir_np) {
>          error_report_once("pthread_fchdir_np() not available on this
> version of macOS");
>          return -ENOTSUP;
> --
> 2.32.0 (Apple Git-132)
>
Reviewed-by: Will Cohen <wwcohen@gmail.com>

>
>

--000000000000ce673305dd021536
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">On Tue, Apr 19, 2022 at 8:18 AM Christian Schoenebec=
k &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@=
crudebyte.com</a>&gt; wrote:</div><div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">mknod() on macOS does not support creating regular files, so<br>
divert to openat_file() if S_IFREG is passed with mode argument.<br>
<br>
Furthermore, &#39;man 2 mknodat&#39; on Linux says: &quot;Zero file type is=
<br>
equivalent to type S_IFREG&quot;.<br>
<br>
Link: <a href=3D"https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@sil=
ver/Signed-off-by" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel=
.org/qemu-devel/17933734.zYzKuhC07K@silver/<br>
Signed-off-by</a>: Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@cru=
debyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt;<br>
---<br>
=C2=A0hw/9pfs/9p-util-darwin.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c<br>
index bec0253474..53e0625501 100644<br>
--- a/hw/9pfs/9p-util-darwin.c<br>
+++ b/hw/9pfs/9p-util-darwin.c<br>
@@ -77,6 +77,10 @@ int fsetxattrat_nofollow(int dirfd, const char *filename=
, const char *name,<br>
=C2=A0int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int preserved_errno, err;<br>
+<br>
+=C2=A0 =C2=A0 if (S_ISREG(mode) || !(mode &amp; S_IFMT)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return openat_file(dirfd, filename, O_CREAT, m=
ode);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0if (!pthread_fchdir_np) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report_once(&quot;pthread_fchdir_np=
() not available on this version of macOS&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
-- <br>
2.32.0 (Apple Git-132)<br>
</blockquote><div dir=3D"auto">Reviewed-by: Will Cohen &lt;<a href=3D"mailt=
o:wwcohen@gmail.com">wwcohen@gmail.com</a>&gt;</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
</blockquote></div></div>
</div>

--000000000000ce673305dd021536--

