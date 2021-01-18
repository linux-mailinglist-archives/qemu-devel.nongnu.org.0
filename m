Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66592F97E0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:37:39 +0100 (CET)
Received: from localhost ([::1]:57022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KQE-00009O-FM
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l1KOu-00082y-Gl
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:36:21 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:46109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l1KOs-0000ql-72
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:36:16 -0500
Received: by mail-qk1-x732.google.com with SMTP id d14so17478437qkc.13
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 18:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2wyvwHhXT+kJjlJdUBpoNpgUn3iTqGj8x32qfPPgaEM=;
 b=alIjD8GQqiaZXDsxRezPKuIUIP4kZn+8D+rJ+XmW8Ux1oaAStWELmdjccg1BCTg7tw
 3r2jawgYHoqCDRZk9Z9yXZPpURdGok4zcBg3lg6oH2n015zaudtoVNCfnll92ipirQww
 UvW/Mf1BvqWOs2NUbP5/iEq4wXTmSUVpzoissGoZUZzaYzYjq85xOO8fiLGSPPc/3ySM
 XhJuzBnUwVTUBstSCcwoYnB9tIvJ438tkOVAh5DWZRFl4OLbQUf+dSalbyyf7trWzPfU
 ophxsD1+3KiU2TNu1cJaKauBpSRSD31NApwcFI2WR5cQksFfn4y562UiTXtuAF9RTTGk
 NoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2wyvwHhXT+kJjlJdUBpoNpgUn3iTqGj8x32qfPPgaEM=;
 b=MeE9hkWPw5z28HHY5VS2mNhlE13WA67MXfz0GwWSz5gnNvB8T56qq7I0KTJTTNRFRP
 Fdnf4EdtM5wQ2faZZN+u95PSPfAgDkvtsJQtI+smr9rvvYWjXf3ybIEPZPJHcnqpLkjL
 C6MUWXfSsUY9QAHXR5b0ncUIwk2YLQkongM/i1cBd3+FW2N6iZbif6C08SDPpDuNR3PD
 Ri7YzJ30n/9jaqc+/Q6VzaQM8XqXgjgy2m6c8T21r6a8TcIeIfeAXy51luW/m8ee6I3r
 IC7tdhao9wpmVwU4AadklwKMC6hbW16/Rxrolj81fqZrdMn/1tIF84WJZsUL9Zomzbqd
 AYCQ==
X-Gm-Message-State: AOAM531OdYFsaT7usRIrgvs3rE+zYbCdOOiS+fnNxBm3/Bl/supdAARV
 SSnexZ3WPEquEm61zuxE7wFO+EwWYX45xXDLLmbYfQ==
X-Google-Smtp-Source: ABdhPJw0ZyVKdrvaOf/4I5klX3A3r7O0I9nr+fwwYZNDDcakcW3ioFKPLU4aCCKTzrp8dvSOSxfq2Y+lQZxuXggU5CQ=
X-Received: by 2002:a37:4a4e:: with SMTP id x75mr22953825qka.89.1610937371399; 
 Sun, 17 Jan 2021 18:36:11 -0800 (PST)
MIME-Version: 1.0
References: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
 <6bdfc158-0f16-b19f-4c65-8c47338f1dcc@huawei.com>
In-Reply-To: <6bdfc158-0f16-b19f-4c65-8c47338f1dcc@huawei.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 17 Jan 2021 19:35:58 -0700
Message-ID: <CANCZdfos9ck76mZoaYUOe060ziexTNCH8SJiT_c=MY5=QwoxMA@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] bsd-user: space required after semicolon
To: shiliyang <shiliyang@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000c72e5405b92395db"
Received-SPF: none client-ip=2607:f8b0:4864:20::732;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x732.google.com
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
Cc: alex.chen@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c72e5405b92395db
Content-Type: text/plain; charset="UTF-8"

Can you submit this to our current fork at http://github.com/qemu-bsd-user
on the rebase-3.1 branch? Having churn like this upstream just slows us
down since we have extensive changes and these will conflict.

Warner

On Sun, Jan 17, 2021, 7:21 PM shiliyang <shiliyang@huawei.com> wrote:

> This patch fixes error style problems found by checkpatch.pl:
> ERROR: space required after that ','
>
> Signed-off-by: Liyang Shi <shiliyang@huawei.com>
> ---
>  bsd-user/elfload.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 2842dfe56b..c89c998c22 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -636,8 +636,8 @@ int load_elf_binary(struct bsd_binprm *bprm, struct
> target_pt_regs *regs,
>
>  #ifndef __FreeBSD__
>      bprm->p = copy_elf_strings(1, &bprm->filename, bprm->page, bprm->p);
> -    bprm->p = copy_elf_strings(bprm->envc,bprm->envp,bprm->page,bprm->p);
> -    bprm->p = copy_elf_strings(bprm->argc,bprm->argv,bprm->page,bprm->p);
> +    bprm->p = copy_elf_strings(bprm->envc, bprm->envp, bprm->page,
> bprm->p);
> +    bprm->p = copy_elf_strings(bprm->argc, bprm->argv, bprm->page,
> bprm->p);
>      if (!bprm->p) {
>          retval = -E2BIG;
>      }
> @@ -739,7 +739,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct
> target_pt_regs *regs,
>              if (retval >= 0) {
>                  retval = lseek(interpreter_fd, 0, SEEK_SET);
>                  if(retval >= 0) {
> -                    retval = read(interpreter_fd,bprm->buf,128);
> +                    retval = read(interpreter_fd, bprm->buf, 128);
>                  }
>              }
>              if (retval >= 0) {
> @@ -769,7 +769,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct
> target_pt_regs *regs,
>          }
>
>          if (interp_elf_ex.e_ident[0] != 0x7f ||
> -                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF",3) != 0)
> {
> +                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF", 3) !=
> 0) {
>              interpreter_type &= ~INTERPRETER_ELF;
>          }
>
> @@ -792,7 +792,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct
> target_pt_regs *regs,
>              passed_p = passed_fileno;
>
>              if (elf_interpreter) {
> -                bprm->p =
> copy_elf_strings(1,&passed_p,bprm->page,bprm->p);
> +                bprm->p = copy_elf_strings(1, &passed_p, bprm->page,
> bprm->p);
>                  bprm->argc++;
>              }
>          }
> --
> 2.29.1.59.gf9b6481aed
>
>

--000000000000c72e5405b92395db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you submit this to our current fork at <a href=3D"htt=
p://github.com/qemu-bsd-user">http://github.com/qemu-bsd-user</a> on the re=
base-3.1 branch? Having churn like this upstream just slows us down since w=
e have extensive changes and these will conflict.<div dir=3D"auto"><br></di=
v><div dir=3D"auto">Warner=C2=A0</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 17, 2021, 7:21 PM shiliya=
ng &lt;<a href=3D"mailto:shiliyang@huawei.com">shiliyang@huawei.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">This patch fixes error styl=
e problems found by <a href=3D"http://checkpatch.pl" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">checkpatch.pl</a>:<br>
ERROR: space required after that &#39;,&#39;<br>
<br>
Signed-off-by: Liyang Shi &lt;<a href=3D"mailto:shiliyang@huawei.com" targe=
t=3D"_blank" rel=3D"noreferrer">shiliyang@huawei.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/elfload.c | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
index 2842dfe56b..c89c998c22 100644<br>
--- a/bsd-user/elfload.c<br>
+++ b/bsd-user/elfload.c<br>
@@ -636,8 +636,8 @@ int load_elf_binary(struct bsd_binprm *bprm, struct tar=
get_pt_regs *regs,<br>
<br>
=C2=A0#ifndef __FreeBSD__<br>
=C2=A0 =C2=A0 =C2=A0bprm-&gt;p =3D copy_elf_strings(1, &amp;bprm-&gt;filena=
me, bprm-&gt;page, bprm-&gt;p);<br>
-=C2=A0 =C2=A0 bprm-&gt;p =3D copy_elf_strings(bprm-&gt;envc,bprm-&gt;envp,=
bprm-&gt;page,bprm-&gt;p);<br>
-=C2=A0 =C2=A0 bprm-&gt;p =3D copy_elf_strings(bprm-&gt;argc,bprm-&gt;argv,=
bprm-&gt;page,bprm-&gt;p);<br>
+=C2=A0 =C2=A0 bprm-&gt;p =3D copy_elf_strings(bprm-&gt;envc, bprm-&gt;envp=
, bprm-&gt;page, bprm-&gt;p);<br>
+=C2=A0 =C2=A0 bprm-&gt;p =3D copy_elf_strings(bprm-&gt;argc, bprm-&gt;argv=
, bprm-&gt;page, bprm-&gt;p);<br>
=C2=A0 =C2=A0 =C2=A0if (!bprm-&gt;p) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D -E2BIG;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -739,7 +739,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct tar=
get_pt_regs *regs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval &gt;=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D ls=
eek(interpreter_fd, 0, SEEK_SET);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(retval &gt=
;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retv=
al =3D read(interpreter_fd,bprm-&gt;buf,128);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retv=
al =3D read(interpreter_fd, bprm-&gt;buf, 128);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval &gt;=3D 0) {<br>
@@ -769,7 +769,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct tar=
get_pt_regs *regs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (interp_elf_ex.e_ident[0] !=3D 0x7f ||=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strncmp((char *)&a=
mp;interp_elf_ex.e_ident[1], &quot;ELF&quot;,3) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strncmp((char *)&a=
mp;interp_elf_ex.e_ident[1], &quot;ELF&quot;, 3) !=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interpreter_type &amp;=3D ~=
INTERPRETER_ELF;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -792,7 +792,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct tar=
get_pt_regs *regs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0passed_p =3D passed_fileno;=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf_interpreter) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bprm-&gt;p =3D cop=
y_elf_strings(1,&amp;passed_p,bprm-&gt;page,bprm-&gt;p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bprm-&gt;p =3D cop=
y_elf_strings(1, &amp;passed_p, bprm-&gt;page, bprm-&gt;p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bprm-&gt;argc=
++;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.29.1.59.gf9b6481aed<br>
<br>
</blockquote></div>

--000000000000c72e5405b92395db--

