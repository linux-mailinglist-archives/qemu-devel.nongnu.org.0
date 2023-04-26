Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1669C6EF917
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:14:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prihr-0005qx-4k; Wed, 26 Apr 2023 13:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1priho-0005q0-T8
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:13:25 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1prihm-0006Mt-1a
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:13:24 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94a34a0b9e2so1091785266b.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1682529199; x=1685121199;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hk6hr0BbLjtp1NSSZxRblGtcFvBfgUUjBcowuICVNIc=;
 b=kzUE/XoBGCzXQD0i7ysH7S9V1mnho/xxydmIN2fmtxroWLidP8tBorkcMHEGhrfxEx
 bBoDMcp7P5rPwdZ4ImyruTvWIbsSEkg4PsVTdh8+lE7WZ6vdwLoqKHHtb6LiWxYt8O00
 bWXTBOx7uDN302H5LkExT9ffyVEafdDFoVCzHfltnKJUqI964WutnjAVzCZhIn16q4EH
 +nDx7lfZOZUksfHP9vbw+CQcgE5wFWjWujrJT6i6tXi/f8Et/xoKPMV+UQ5WwT55o4MO
 2M86pR1t9WallJx4LSl3a2xCc9y0WoFwyqoJE5+FubfgBN87Qryw/qsXzQ2R8EHcWuEK
 NhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682529199; x=1685121199;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hk6hr0BbLjtp1NSSZxRblGtcFvBfgUUjBcowuICVNIc=;
 b=SUBAoK2yaD+yneDG4UG0/JjsoY4oT+hRPv5ZZppDL+PoUEERd93UmJqkAEKysndKTq
 C7CeewZJ03VmUY6DyVelGUvbDpF7MDRcoYCt+XECzZLnXUzEGASmbnB+jxWG+JF+Llv5
 gPXeBHawOlGerYTb4Yn7fpk8CQg3JA80KC4bKkzmMSj0U7kQ0WgftHvb9VgboI7bMIfa
 5BREnZfdXk9eyI7DgAs6LYSblysAvJ6DKjIQC+nCNsC/ISh0qmFBWV5vXEGeIQf3C64u
 NQomoy+VpSc+3/3OYMVZ6NZvJchpojFPNutrQ7g9qd1Bg8aAGLTt9pHXS7u7ggFuC+8J
 Hheg==
X-Gm-Message-State: AAQBX9dgLV6KEj2qnqTWqweLLeGAZcxlPzyv9gTD2OIF8jXVEQCqXgZ4
 q1V+8JZvjX7W7rPu3kAsjG1WM4MKU3uZmQp5kSILDQ==
X-Google-Smtp-Source: AKy350Z3v3N47D8GtjV+vV6TloGjK3l0ognlPDUS5CrCYvSuYShOBcRNdL6zobAAu1UAHOaRAdZBUBB2SaW88BuRmr4=
X-Received: by 2002:a17:906:ecb7:b0:933:3a22:8513 with SMTP id
 qh23-20020a170906ecb700b009333a228513mr18031745ejb.53.1682529199461; Wed, 26
 Apr 2023 10:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230426133747.403945-1-tmaillart@freebox.fr>
In-Reply-To: <20230426133747.403945-1-tmaillart@freebox.fr>
From: =?UTF-8?Q?Th=C3=A9o_Maillart?= <tmaillart@freebox.fr>
Date: Wed, 26 Apr 2023 19:13:08 +0200
Message-ID: <CANDNypw=kZ_GGRMcQvM9+XPpFBK88v4fq_uVPBE=bbBW-P=XjQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: check inquiry buffer length to prevent crash
To: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000042286a05fa405b9e"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=tmaillart@freebox.fr; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000042286a05fa405b9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 26 avr. 2023 =C3=A0 15:38, Th=C3=A9o Maillart <tmaillart@freebox.fr=
> a =C3=A9crit :

> Using linux 6.x guest, at boot time, an inquiry makes qemu crash.
> Here is a trace of the scsi inquiry in question:
>
> scsi_req_parsed target 1 lun 0 tag 0x2cffb48 command 18 dir 1 length 4
> scsi_req_parsed_lba target 1 lun 0 tag 0x2cffb48 command 18 lba 110592
> scsi_req_alloc target 1 lun 0 tag 0x2cffb48
> scsi_inquiry target 1 lun 0 tag 0x2cffb48 page 0x01/0xb0
> scsi_generic_send_command Command: data=3D 0x12 0x01 0xb0 0x00 0x04 0x00
> scsi_req_continue target 1 lun 0 tag 0x2cffb48
> scsi_generic_read_data scsi_read_data tag=3D0x2cffb48
> scsi_generic_aio_sgio_command generic aio sgio: tag=3D0x2cffb48 cmd=3D0x1=
2
> timeout=3D30000
> scsi_generic_read_complete Data ready tag=3D0x2cffb48 len=3D4
> scsi_req_data target 1 lun 0 tag 0x2cffb48 len 4
> scsi_req_continue target 1 lun 0 tag 0x2cffb48
> scsi_generic_read_data scsi_read_data tag=3D0x2cffb48
> scsi_generic_command_complete_noio Command complete 0x7fb0870b80
> tag=3D0x2cffb48 status=3D0
> scsi_req_dequeue target 1 lun 0 tag 0x2cffb48
>
> And here is a backtrace from the crash:
>
>  #0  0x0000007face68580 in a_crash () at ./src/internal/atomic.h:250
>  #1  get_nominal_size (end=3D0x7f6758f92c "", p=3D0x7f6758f920 "") at
> src/malloc/mallocng/meta.h:168
>  #2  __libc_free (p=3D0x7f6758f920) at src/malloc/mallocng/free.c:110
>  #3  0x0000005592f93ed8 in scsi_free_request (req=3D0x7fac2c6b50) at
> ../hw/scsi/scsi-generic.c:70
>  #4  0x0000005592f869b8 in scsi_req_unref (req=3D0x7fac2c6b50) at
> ../hw/scsi/scsi-bus.c:1382
>  #5  0x0000005592f94b7c in scsi_read_complete (opaque=3D0x7fac2c6b50, ret=
=3D0)
> at ../hw/scsi/scsi-generic.c:354
>  #6  0x0000005593659b90 in blk_aio_complete (acb=3D0x7f66c206a0) at
> ../block/block-backend.c:1527
>  #7  0x000000559365a3c8 in blk_aio_ioctl_entry (opaque=3D0x7f66c206a0) at
> ../block/block-backend.c:1735
>  #8  0x00000055937dee64 in coroutine_bootstrap (self=3D0x7f672f77e0,
> co=3D0x7f672f77e0) at ../util/coroutine-sigaltstack.c:104
>  #9  0x00000055937deed8 in coroutine_trampoline (signal=3D12) at
> ../util/coroutine-sigaltstack.c:145
>  #10 <signal handler called>
>  #11 __cp_end () at src/thread/aarch64/syscall_cp.s:30
>  #12 0x0000007facea8214 in __syscall_cp_c (nr=3D133, u=3D<optimized out>,
> v=3D<optimized out>, w=3D<optimized out>, x=3D<optimized out>,
>      y=3D<optimized out>, z=3D<optimized out>) at
> src/thread/pthread_cancel.c:33
>  #13 0x0000007facefa020 in ?? ()
>
> Signed-off-by: Th=C3=A9o Maillart <tmaillart@freebox.fr>
> ---
>  hw/scsi/scsi-generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index ac9fa662b4..25246589b7 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -191,7 +191,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq
> *r, SCSIDevice *s, int len)
>      if ((s->type =3D=3D TYPE_DISK || s->type =3D=3D TYPE_ZBC) &&
>          (r->req.cmd.buf[1] & 0x01)) {
>          page =3D r->req.cmd.buf[2];
> -        if (page =3D=3D 0xb0) {
> +        if (page =3D=3D 0xb0 && r->buflen >=3D 12) {


Actually the test should be r->buflen > 12


>              uint64_t max_transfer =3D calculate_max_transfer(s);
>              stl_be_p(&r->buf[8], max_transfer);
>              /* Also take care of the opt xfer len. */
> --
> 2.40.0
>
>

--00000000000042286a05fa405b9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Le=C2=A0mer. 26 avr. 2023 =C3=A0 15:38, Th=C3=A9o Ma=
illart &lt;<a href=3D"mailto:tmaillart@freebox.fr">tmaillart@freebox.fr</a>=
&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">Using linux 6.x guest,=
 at boot time, an inquiry makes qemu crash.<br>
Here is a trace of the scsi inquiry in question:<br>
<br>
scsi_req_parsed target 1 lun 0 tag 0x2cffb48 command 18 dir 1 length 4<br>
scsi_req_parsed_lba target 1 lun 0 tag 0x2cffb48 command 18 lba 110592<br>
scsi_req_alloc target 1 lun 0 tag 0x2cffb48<br>
scsi_inquiry target 1 lun 0 tag 0x2cffb48 page 0x01/0xb0<br>
scsi_generic_send_command Command: data=3D 0x12 0x01 0xb0 0x00 0x04 0x00<br=
>
scsi_req_continue target 1 lun 0 tag 0x2cffb48<br>
scsi_generic_read_data scsi_read_data tag=3D0x2cffb48<br>
scsi_generic_aio_sgio_command generic aio sgio: tag=3D0x2cffb48 cmd=3D0x12 =
timeout=3D30000<br>
scsi_generic_read_complete Data ready tag=3D0x2cffb48 len=3D4<br>
scsi_req_data target 1 lun 0 tag 0x2cffb48 len 4<br>
scsi_req_continue target 1 lun 0 tag 0x2cffb48<br>
scsi_generic_read_data scsi_read_data tag=3D0x2cffb48<br>
scsi_generic_command_complete_noio Command complete 0x7fb0870b80 tag=3D0x2c=
ffb48 status=3D0<br>
scsi_req_dequeue target 1 lun 0 tag 0x2cffb48<br>
<br>
And here is a backtrace from the crash:<br>
<br>
=C2=A0#0=C2=A0 0x0000007face68580 in a_crash () at ./src/internal/atomic.h:=
250<br>
=C2=A0#1=C2=A0 get_nominal_size (end=3D0x7f6758f92c &quot;&quot;, p=3D0x7f6=
758f920 &quot;&quot;) at src/malloc/mallocng/meta.h:168<br>
=C2=A0#2=C2=A0 __libc_free (p=3D0x7f6758f920) at src/malloc/mallocng/free.c=
:110<br>
=C2=A0#3=C2=A0 0x0000005592f93ed8 in scsi_free_request (req=3D0x7fac2c6b50)=
 at ../hw/scsi/scsi-generic.c:70<br>
=C2=A0#4=C2=A0 0x0000005592f869b8 in scsi_req_unref (req=3D0x7fac2c6b50) at=
 ../hw/scsi/scsi-bus.c:1382<br>
=C2=A0#5=C2=A0 0x0000005592f94b7c in scsi_read_complete (opaque=3D0x7fac2c6=
b50, ret=3D0) at ../hw/scsi/scsi-generic.c:354<br>
=C2=A0#6=C2=A0 0x0000005593659b90 in blk_aio_complete (acb=3D0x7f66c206a0) =
at ../block/block-backend.c:1527<br>
=C2=A0#7=C2=A0 0x000000559365a3c8 in blk_aio_ioctl_entry (opaque=3D0x7f66c2=
06a0) at ../block/block-backend.c:1735<br>
=C2=A0#8=C2=A0 0x00000055937dee64 in coroutine_bootstrap (self=3D0x7f672f77=
e0, co=3D0x7f672f77e0) at ../util/coroutine-sigaltstack.c:104<br>
=C2=A0#9=C2=A0 0x00000055937deed8 in coroutine_trampoline (signal=3D12) at =
../util/coroutine-sigaltstack.c:145<br>
=C2=A0#10 &lt;signal handler called&gt;<br>
=C2=A0#11 __cp_end () at src/thread/aarch64/syscall_cp.s:30<br>
=C2=A0#12 0x0000007facea8214 in __syscall_cp_c (nr=3D133, u=3D&lt;optimized=
 out&gt;, v=3D&lt;optimized out&gt;, w=3D&lt;optimized out&gt;, x=3D&lt;opt=
imized out&gt;,<br>
=C2=A0 =C2=A0 =C2=A0y=3D&lt;optimized out&gt;, z=3D&lt;optimized out&gt;) a=
t src/thread/pthread_cancel.c:33<br>
=C2=A0#13 0x0000007facefa020 in ?? ()<br>
<br>
Signed-off-by: Th=C3=A9o Maillart &lt;<a href=3D"mailto:tmaillart@freebox.f=
r" target=3D"_blank">tmaillart@freebox.fr</a>&gt;<br>
---<br>
=C2=A0hw/scsi/scsi-generic.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c<br>
index ac9fa662b4..25246589b7 100644<br>
--- a/hw/scsi/scsi-generic.c<br>
+++ b/hw/scsi/scsi-generic.c<br>
@@ -191,7 +191,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r,=
 SCSIDevice *s, int len)<br>
=C2=A0 =C2=A0 =C2=A0if ((s-&gt;type =3D=3D TYPE_DISK || s-&gt;type =3D=3D T=
YPE_ZBC) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r-&gt;req.cmd.buf[1] &amp; 0x01)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D r-&gt;req.cmd.buf[2];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page =3D=3D 0xb0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page =3D=3D 0xb0 &amp;&amp; r-&gt;buflen &=
gt;=3D 12) {</blockquote><div dir=3D"auto"><span style=3D"border-color:rgb(=
0,0,0);color:rgb(0,0,0)"><br></span></div><div dir=3D"auto"><span style=3D"=
border-color:rgb(0,0,0);color:rgb(0,0,0)">Actually the test should be r-&gt=
;buflen &gt; 12</span><br></div><div dir=3D"auto"><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
" dir=3D"auto"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t max_transfer =3D c=
alculate_max_transfer(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stl_be_p(&amp;r-&gt;buf[8],=
 max_transfer);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Also take care of the op=
t xfer len. */<br>
-- <br>
2.40.0<br>
<br>
</blockquote></div></div>

--00000000000042286a05fa405b9e--

