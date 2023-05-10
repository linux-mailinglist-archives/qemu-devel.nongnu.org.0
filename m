Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C619A6FD82B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:29:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweGA-0007gn-C4; Wed, 10 May 2023 03:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1pweG7-0007bk-EW
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:29:11 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1pweG3-0005Ia-Vi
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:29:11 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so1363066566b.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1683703744; x=1686295744;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9iBy8eTxFCs12QR2EOc0WfonR/M/eEe31Qfl8fDwTaI=;
 b=5r3CA1v7xxNQPzhCL8a4WoyhlFyRlDuq74i5TLDnRkzj7xkkFV3GuAYrmOBvYVyKBc
 E2PWL5IIoL8G2ZqSTpA5KEl6cP4/prkYklnY6eRweGbQbjYasoqz7/92wIC5Ya5rMNyk
 qEh9V1Owpk9xmWKgl42KEhj5sL7mLpsKE4JcxJHf3uyRuJeEXcOSJFJ7/ufsCzD61l/G
 SDSeHXlxeeN0/8qyQmEbPkCuq0snf9WPq4ZYxZxk23UkwuvqRAxtQuMpcsLAG+2QJZGb
 7TV7p/65HVdGmHYtre4BMrQ74DUWl3wJAAuvmMmevHUV+Kdbxjgev4KvWTu2kOnGhKAu
 hijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683703744; x=1686295744;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9iBy8eTxFCs12QR2EOc0WfonR/M/eEe31Qfl8fDwTaI=;
 b=MHs/uM/1McnvJEv8p/re3/023Iq14oAubX88KGXwPlup8zUm1+cJfwDcIwvxGxCbcW
 kPaU7TjE+hYnCd75ITIdvV9WfA+vVZiegvVl9scH/haW9WMWJ2CndsFGzVDxNRZCRckv
 bnt3QfczEbLDi6AoEjnXRThBeaSbUrmuzzoxNz59oWZwDZKrCSnslwyF/AvYaboOK2NC
 iFkKw3defDw/D+83rzQAPGZMTM91s0dtF+gsjRvj205R+cz0TiaJqsbqhuwtM/8QDq15
 c75U4J8OKPYCcvd3DNTb34N5vbieiN3rjrmjDfXiuFKQ+7XOH7zolEa/zQFQceVY1oYu
 xauA==
X-Gm-Message-State: AC+VfDztUg6WGlg6aHQM9J+UoDSzIg9vWzXlU+7vEnJdSJ2vvJAw1cYU
 H4IlmjjzCuPpiXhYwpP1BDH7ZR0Vt6KnLxAg4FiOGQ==
X-Google-Smtp-Source: ACHHUZ65NzAbh/a0lkBxiV9arL+Gk4St9nihXRe2kdqR/SQoyphaWr8H41GEQClErl1mGOIStCidPFw+XQebSf+0rx8=
X-Received: by 2002:a17:906:fd8d:b0:94f:3521:394 with SMTP id
 xa13-20020a170906fd8d00b0094f35210394mr13352370ejb.51.1683703744442; Wed, 10
 May 2023 00:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230426133747.403945-1-tmaillart@freebox.fr>
 <CANDNypw=kZ_GGRMcQvM9+XPpFBK88v4fq_uVPBE=bbBW-P=XjQ@mail.gmail.com>
In-Reply-To: <CANDNypw=kZ_GGRMcQvM9+XPpFBK88v4fq_uVPBE=bbBW-P=XjQ@mail.gmail.com>
From: =?UTF-8?Q?Th=C3=A9o_Maillart?= <tmaillart@freebox.fr>
Date: Wed, 10 May 2023 09:28:53 +0200
Message-ID: <CANDNypwPKC1Dp4BrY31kNp9aVHLpWsROkk_HhyeSgn2XaMe9KA@mail.gmail.com>
Subject: Re: [PATCH] scsi: check inquiry buffer length to prevent crash
To: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000098737305fb51d380"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=tmaillart@freebox.fr; helo=mail-ej1-x632.google.com
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

--00000000000098737305fb51d380
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This crash appeared on the latest linux guests, most likely because of
this commit from the linux kernel:

v5.18-rc1-157-gc92a6b5d6335


On Wed, Apr 26, 2023 at 7:13=E2=80=AFPM Th=C3=A9o Maillart <tmaillart@freeb=
ox.fr> wrote:

>
> Le mer. 26 avr. 2023 =C3=A0 15:38, Th=C3=A9o Maillart <tmaillart@freebox.=
fr> a
> =C3=A9crit :
>
>> Using linux 6.x guest, at boot time, an inquiry makes qemu crash.
>> Here is a trace of the scsi inquiry in question:
>>
>> scsi_req_parsed target 1 lun 0 tag 0x2cffb48 command 18 dir 1 length 4
>> scsi_req_parsed_lba target 1 lun 0 tag 0x2cffb48 command 18 lba 110592
>> scsi_req_alloc target 1 lun 0 tag 0x2cffb48
>> scsi_inquiry target 1 lun 0 tag 0x2cffb48 page 0x01/0xb0
>> scsi_generic_send_command Command: data=3D 0x12 0x01 0xb0 0x00 0x04 0x00
>> scsi_req_continue target 1 lun 0 tag 0x2cffb48
>> scsi_generic_read_data scsi_read_data tag=3D0x2cffb48
>> scsi_generic_aio_sgio_command generic aio sgio: tag=3D0x2cffb48 cmd=3D0x=
12
>> timeout=3D30000
>> scsi_generic_read_complete Data ready tag=3D0x2cffb48 len=3D4
>> scsi_req_data target 1 lun 0 tag 0x2cffb48 len 4
>> scsi_req_continue target 1 lun 0 tag 0x2cffb48
>> scsi_generic_read_data scsi_read_data tag=3D0x2cffb48
>> scsi_generic_command_complete_noio Command complete 0x7fb0870b80
>> tag=3D0x2cffb48 status=3D0
>> scsi_req_dequeue target 1 lun 0 tag 0x2cffb48
>>
>> And here is a backtrace from the crash:
>>
>>  #0  0x0000007face68580 in a_crash () at ./src/internal/atomic.h:250
>>  #1  get_nominal_size (end=3D0x7f6758f92c "", p=3D0x7f6758f920 "") at
>> src/malloc/mallocng/meta.h:168
>>  #2  __libc_free (p=3D0x7f6758f920) at src/malloc/mallocng/free.c:110
>>  #3  0x0000005592f93ed8 in scsi_free_request (req=3D0x7fac2c6b50) at
>> ../hw/scsi/scsi-generic.c:70
>>  #4  0x0000005592f869b8 in scsi_req_unref (req=3D0x7fac2c6b50) at
>> ../hw/scsi/scsi-bus.c:1382
>>  #5  0x0000005592f94b7c in scsi_read_complete (opaque=3D0x7fac2c6b50,
>> ret=3D0) at ../hw/scsi/scsi-generic.c:354
>>  #6  0x0000005593659b90 in blk_aio_complete (acb=3D0x7f66c206a0) at
>> ../block/block-backend.c:1527
>>  #7  0x000000559365a3c8 in blk_aio_ioctl_entry (opaque=3D0x7f66c206a0) a=
t
>> ../block/block-backend.c:1735
>>  #8  0x00000055937dee64 in coroutine_bootstrap (self=3D0x7f672f77e0,
>> co=3D0x7f672f77e0) at ../util/coroutine-sigaltstack.c:104
>>  #9  0x00000055937deed8 in coroutine_trampoline (signal=3D12) at
>> ../util/coroutine-sigaltstack.c:145
>>  #10 <signal handler called>
>>  #11 __cp_end () at src/thread/aarch64/syscall_cp.s:30
>>  #12 0x0000007facea8214 in __syscall_cp_c (nr=3D133, u=3D<optimized out>=
,
>> v=3D<optimized out>, w=3D<optimized out>, x=3D<optimized out>,
>>      y=3D<optimized out>, z=3D<optimized out>) at
>> src/thread/pthread_cancel.c:33
>>  #13 0x0000007facefa020 in ?? ()
>>
>> Signed-off-by: Th=C3=A9o Maillart <tmaillart@freebox.fr>
>> ---
>>  hw/scsi/scsi-generic.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
>> index ac9fa662b4..25246589b7 100644
>> --- a/hw/scsi/scsi-generic.c
>> +++ b/hw/scsi/scsi-generic.c
>> @@ -191,7 +191,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq
>> *r, SCSIDevice *s, int len)
>>      if ((s->type =3D=3D TYPE_DISK || s->type =3D=3D TYPE_ZBC) &&
>>          (r->req.cmd.buf[1] & 0x01)) {
>>          page =3D r->req.cmd.buf[2];
>> -        if (page =3D=3D 0xb0) {
>> +        if (page =3D=3D 0xb0 && r->buflen >=3D 12) {
>
>
> Actually the test should be r->buflen > 12
>
>
>>              uint64_t max_transfer =3D calculate_max_transfer(s);
>>              stl_be_p(&r->buf[8], max_transfer);
>>              /* Also take care of the opt xfer len. */
>> --
>> 2.40.0
>>
>>

--00000000000098737305fb51d380
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This crash appeared on the latest linux guests, most =
likely because of</div><div>this commit from the linux kernel:</div><div><b=
r></div><div>v5.18-rc1-157-gc92a6b5d6335</div><div><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 26=
, 2023 at 7:13=E2=80=AFPM Th=C3=A9o Maillart &lt;<a href=3D"mailto:tmaillar=
t@freebox.fr">tmaillart@freebox.fr</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"auto"><br></div><div><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 26 av=
r. 2023 =C3=A0 15:38, Th=C3=A9o Maillart &lt;<a href=3D"mailto:tmaillart@fr=
eebox.fr" target=3D"_blank">tmaillart@freebox.fr</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Using linux 6.=
x guest, at boot time, an inquiry makes qemu crash.<br>
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
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex" dir=3D"auto"><br>
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
</blockquote></div>

--00000000000098737305fb51d380--

