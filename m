Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCF30D56A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 09:39:41 +0100 (CET)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7DhM-0000Tw-I6
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 03:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l7DgO-0008U5-01
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 03:38:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l7DgK-0000Nz-DD
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 03:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612341514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4sGQ+0smv+nIrneWH/NyiW7dqycqJR0Z4YdC1e3apGA=;
 b=MJee5RzinlDzGGi/mBPf84ggzvnYop6mIRVfsl4MheOtRyRr9lsrVITXwmpks/VKAejyZW
 3MxbZ+YHesZZ5VbK5XCI2jNVZ7U3hqhj+4zHUnryAhondxbaVkV3ZBKm6NeWK+3I2nkgtQ
 J57+XB+fVuXuUF9+mhXp53F2sCaW95E=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-zaDua-mBPo2oxcOY-6aVIA-1; Wed, 03 Feb 2021 03:38:31 -0500
X-MC-Unique: zaDua-mBPo2oxcOY-6aVIA-1
Received: by mail-io1-f70.google.com with SMTP id r140so11637250iod.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 00:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4sGQ+0smv+nIrneWH/NyiW7dqycqJR0Z4YdC1e3apGA=;
 b=IVaqCRSlPzK1Q1eGp7IZBqKNC9tglCxruYkH3vyXRWaocQuWoFyIqvld541rT2xa42
 dKyrv5nZATStQ0pp6Y0iFqGGO1bWIN2YTlBnrICQnisWh6FU15UbsqVZjr+6mCLc3z7p
 i6zZkupnK+ME/XXP+Vifl4SaXsKQgc0/CNlVOpKMSqAo6uTC0q5bT09v+IOCtzGepT1G
 EE2nQBJFccbKm2R4sX30nvIkdQFAXMBFYHpkHaYOUZRhTTboZydGLwuGHcKTugDTFONP
 iQiUUSKunHHx6Ps4Zd+DWqXkPfHZRw1lXFIaztP4pNIl9fzc3OGOrPCwRuvfykSW1NIa
 884A==
X-Gm-Message-State: AOAM532lpP3UWT3YFmcZ11zxkrH4RyRKWjl4x50McTH79mgPOXSQmj25
 7W9Dy91gJMP6d0VezTcwRH+xleuqSDXQoUC1Zn8/UMkuIXcAHstwYzXVwaskEYoF7lM43p0Gv9o
 DFpNPa/Im9LOTxiJdO+qWnkEyge8Hvdg=
X-Received: by 2002:a05:6e02:194a:: with SMTP id
 x10mr1781500ilu.165.1612341510919; 
 Wed, 03 Feb 2021 00:38:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs6tI+fIuAquR800oNQZt9mIX3UN6RM3hSzC8x2NX8o2epyqPctHbuyxal9Lkb0CjScdrbFrZhs+l2pFJeI0w=
X-Received: by 2002:a05:6e02:194a:: with SMTP id
 x10mr1781495ilu.165.1612341510785; 
 Wed, 03 Feb 2021 00:38:30 -0800 (PST)
MIME-Version: 1.0
References: <161224971122.79781.8594358970645859667.stgit@pasha-ThinkPad-X280>
 <CAMxuvax4eUGGfLH4sQpS4ocD43bsMVFjiFsv2xcywwbXZ0-JJA@mail.gmail.com>
 <1a5d134b-c826-9620-094e-48fc6bb931b0@ispras.ru>
 <CAMxuvay_mLwsLB51Ar4-Usu610QnC7VAzD95BFmvL=VumCcRtA@mail.gmail.com>
 <3f9e991e-da3b-1df5-5124-06dc2e1b7e18@ispras.ru>
In-Reply-To: <3f9e991e-da3b-1df5-5124-06dc2e1b7e18@ispras.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 3 Feb 2021 12:38:19 +0400
Message-ID: <CAMxuvazS9PCiZM0XNCyLOg9C40XxDytQhsLb1KVrA9NtvU34Bw@mail.gmail.com>
Subject: Re: [PATCH] char: don't fail when client is not connected
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, "P. Berrange,
 Daniel" <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000001e7bd05ba6a8329"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000001e7bd05ba6a8329
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Feb 3, 2021 at 12:22 PM Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
wrote:

> On 03.02.2021 11:13, Marc-Andr=C3=A9 Lureau wrote:
>
> > Can you provide a reproducer?
>
>
> That was a record/replay scenario. I've used Fedora cloudinit images,
> that are used in acceptance tests:
>
> qemu-system-x86_64 \
>   -display none -vga none -machine pc -smp 1 -m 1024 \
>   -monitor tcp:127.0.0.1:8081,server,nowait \
>   -serial tcp:127.0.0.1:8082,server,nowait \
>   -object filter-replay,id=3Dreplay,netdev=3Dhub0port0 \
>   -drive
> file=3DFedora-Cloud-Base-31-1.9.x86_64.qcow2,snapshot,id=3Ddisk0,if=3Dnon=
e \
>   -drive driver=3Dblkreplay,id=3Ddisk0-rr,if=3Dnone,image=3Ddisk0 \
>   -device virtio-blk-pci,drive=3Ddisk0-rr,ioeventfd=3Dfalse \
>   -icount shift=3D1,rr=3Drecord,rrfile=3Dreplay.bin \
>   -drive file=3Dcloudinit.iso,snapshot,id=3Ddisk1,if=3Dnone \
>   -drive driver=3Dblkreplay,id=3Ddisk1-rr,if=3Dnone,image=3Ddisk1 \
>   -device virtio-blk-pci,drive=3Ddisk1-rr,ioeventfd=3Dfalse
>
>
> The failure occurred on replay stage:
>
> qemu-system-x86_64 \
>   -display none -vga none -machine pc -smp 1 -m 1024 \
>   -monitor tcp:127.0.0.1:8081,server,nowait \
>   -serial tcp:127.0.0.1:8082,server,nowait \
>   -object filter-replay,id=3Dreplay,netdev=3Dhub0port0 \
>   -drive
> file=3DFedora-Cloud-Base-31-1.9.x86_64.qcow2,snapshot,id=3Ddisk0,if=3Dnon=
e \
>   -drive driver=3Dblkreplay,id=3Ddisk0-rr,if=3Dnone,image=3Ddisk0 \
>   -device virtio-blk-pci,drive=3Ddisk0-rr,ioeventfd=3Dfalse \
>   -icount shift=3D1,rr=3Dreplay,rrfile=3Dreplay.bin \
>   -drive file=3Dcloudinit.iso,snapshot,id=3Ddisk1,if=3Dnone \
>   -drive driver=3Dblkreplay,id=3Ddisk1-rr,if=3Dnone,image=3Ddisk1 \
>   -device virtio-blk-pci,drive=3Ddisk1-rr,ioeventfd=3Dfalse
>

Ah, that helps. qemu_chr_write() will return
replay_char_write_event_load(), bypassing the current state. If the
connected state during replay doesn't match the state during recording, it
is possible to reach the bad condition. (there are probably many such
corner-cases situations with replay..)

Can you update the commit message to explain the relation with replay? with
that:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Daniel, could you review it too?
thanks

--00000000000001e7bd05ba6a8329
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 3, 2021 at 12:22 PM Pav=
el Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru">pavel.dovgaly=
uk@ispras.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 03.02.2021 11:13, Marc-Andr=C3=A9 Lureau wrote:<br>
<br>
&gt; Can you provide a reproducer?<br>
<br>
<br>
That was a record/replay scenario. I&#39;ve used Fedora cloudinit images, <=
br>
that are used in acceptance tests:<br>
<br>
qemu-system-x86_64 \<br>
=C2=A0 -display none -vga none -machine pc -smp 1 -m 1024 \<br>
=C2=A0 -monitor tcp:<a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" ta=
rget=3D"_blank">127.0.0.1:8081</a>,server,nowait \<br>
=C2=A0 -serial tcp:<a href=3D"http://127.0.0.1:8082" rel=3D"noreferrer" tar=
get=3D"_blank">127.0.0.1:8082</a>,server,nowait \<br>
=C2=A0 -object filter-replay,id=3Dreplay,netdev=3Dhub0port0 \<br>
=C2=A0 -drive <br>
file=3DFedora-Cloud-Base-31-1.9.x86_64.qcow2,snapshot,id=3Ddisk0,if=3Dnone =
\<br>
=C2=A0 -drive driver=3Dblkreplay,id=3Ddisk0-rr,if=3Dnone,image=3Ddisk0 \<br=
>
=C2=A0 -device virtio-blk-pci,drive=3Ddisk0-rr,ioeventfd=3Dfalse \<br>
=C2=A0 -icount shift=3D1,rr=3Drecord,rrfile=3Dreplay.bin \<br>
=C2=A0 -drive file=3Dcloudinit.iso,snapshot,id=3Ddisk1,if=3Dnone \<br>
=C2=A0 -drive driver=3Dblkreplay,id=3Ddisk1-rr,if=3Dnone,image=3Ddisk1 \<br=
>
=C2=A0 -device virtio-blk-pci,drive=3Ddisk1-rr,ioeventfd=3Dfalse<br>
<br>
<br>
The failure occurred on replay stage:<br>
<br>
qemu-system-x86_64 \<br>
=C2=A0 -display none -vga none -machine pc -smp 1 -m 1024 \<br>
=C2=A0 -monitor tcp:<a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" ta=
rget=3D"_blank">127.0.0.1:8081</a>,server,nowait \<br>
=C2=A0 -serial tcp:<a href=3D"http://127.0.0.1:8082" rel=3D"noreferrer" tar=
get=3D"_blank">127.0.0.1:8082</a>,server,nowait \<br>
=C2=A0 -object filter-replay,id=3Dreplay,netdev=3Dhub0port0 \<br>
=C2=A0 -drive <br>
file=3DFedora-Cloud-Base-31-1.9.x86_64.qcow2,snapshot,id=3Ddisk0,if=3Dnone =
\<br>
=C2=A0 -drive driver=3Dblkreplay,id=3Ddisk0-rr,if=3Dnone,image=3Ddisk0 \<br=
>
=C2=A0 -device virtio-blk-pci,drive=3Ddisk0-rr,ioeventfd=3Dfalse \<br>
=C2=A0 -icount shift=3D1,rr=3Dreplay,rrfile=3Dreplay.bin \<br>
=C2=A0 -drive file=3Dcloudinit.iso,snapshot,id=3Ddisk1,if=3Dnone \<br>
=C2=A0 -drive driver=3Dblkreplay,id=3Ddisk1-rr,if=3Dnone,image=3Ddisk1 \<br=
>
=C2=A0 -device virtio-blk-pci,drive=3Ddisk1-rr,ioeventfd=3Dfalse<br></block=
quote><div><br></div><div>Ah, that helps. qemu_chr_write() will return repl=
ay_char_write_event_load(), bypassing the current state. If the connected s=
tate during replay doesn&#39;t match the state during recording, it is poss=
ible to reach the bad condition. (there are probably many such corner-cases=
 situations with replay..)</div><div><br></div><div>Can you update the comm=
it message to explain the relation with replay? with that:<br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com">marcandre.lureau@redhat.com</a>&gt; </div><div><br></div><div>Dan=
iel, could you review it too?<br></div><div>thanks<br></div></div></div>

--00000000000001e7bd05ba6a8329--


