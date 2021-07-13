Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697AC3C698C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:53:38 +0200 (CEST)
Received: from localhost ([::1]:38862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3AQK-0003hd-WB
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1m3APT-00032a-1K
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:52:43 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:43716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1m3APQ-0007Qd-5v
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:52:42 -0400
Received: by mail-oi1-x22b.google.com with SMTP id w188so2730562oif.10
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 21:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stonybrook.edu; s=sbu-gmail;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=dN9ccz4utFDb79X//WXdP1dAQb5ezCHdVjljRK7zawA=;
 b=uoepc+V+B3Z7gyQQk4ymX/MKJeo/RHNquhCGBMk07ze5eanb5hsg3ulR633/PEwVFJ
 Ww9qm2jl6cg1+DO7rwJv2cGac2PkDFD5DueZrfi5tVhNybp2TSDgcgEdSCTYT/br3K+d
 5X/zw6vos/mFYY6GD1Qs+9WtSvvjZA10yr6ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=dN9ccz4utFDb79X//WXdP1dAQb5ezCHdVjljRK7zawA=;
 b=GTljyhdQPlpivcwLQZIIc4rkf7+rgj622eNgIpy+rF0zB7QrsuJpTUwGcfHDLRqj0u
 K3I89/1VFIHDjFwe9yr5Hd+ObTrf4jhZa40fev3Igi+5TID0OSkOAZlDKRujU/blh13W
 W51uYxD6pTtQPcFnRJ8BAfpXBMbeSp/GCcxL6+34HmgN+opdzX9EJjYIWe4CZHq8081c
 D0eLFQixvwMXuFGyqOWpaCdCRKmYgmwffqZvdtIXzjn9bVWGYdRlVzG4kEu8WEjo1jKw
 4rvFsFTOucEg/5+XdaQ0txKbE60nNh15DURS/wiz/3buFIrW1o4oUGNXF7g/Y6KMq0uT
 YVMA==
X-Gm-Message-State: AOAM530vbIPGCL6KB+SfkVSIMnzcs9xon6S5qtTZ/6uP3582I/b9cHEz
 2AAK4VrznQAeiDuIIhtJaxD1tinjg0Tee5+KJinL7eWSB5aL/A==
X-Google-Smtp-Source: ABdhPJwwgWvJc7Y7wuUr9/AXQuwbE1bkV74BpbT5tWpGG9H4LwsfbG2M9D4+Yl2/jAhkBYCoDns+afnX39Q7GeN4ox8=
X-Received: by 2002:aca:ac56:: with SMTP id v83mr1795118oie.178.1626151957933; 
 Mon, 12 Jul 2021 21:52:37 -0700 (PDT)
MIME-Version: 1.0
From: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>
Date: Tue, 13 Jul 2021 10:22:27 +0530
Message-ID: <CAJGDS+He0uxNKjRNqS+=DktDB=wKB-aifvRWArqV=7+8Eg2EaA@mail.gmail.com>
Subject: Block I/O in the middle of guest code execution
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cdcc0605c6fa01b4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=akalita@cs.stonybrook.edu; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cdcc0605c6fa01b4
Content-Type: text/plain; charset="UTF-8"

Hello Stefan/all,

I was reading your blog post on the QEMU overall architecture (link - "
http://blog.vmsplice.net/2011/03/qemu-internals-overall-architecture-and.html")
and I have a few questions with regards to executing I/O operations (block
I/O) in the middle of guest code execution.

I am running QEMU version 5.0.1 and my target and host architecture is
x86-64. I am using the virtio-blk block driver frontend with a qcow2 image
file as a backing file storage.

I want to do something like below (in TCG) -

static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock
*itb)
{
           log_cpu_state(cpu, flags);
           qemu_log_unlock(logfile);
    }
           #endif /* DEBUG_DISAS */
           if (cond is true) {
               virtio_blk_data_plane_handle_output(vdev, vq);  <- calling
block I/O function here
           }
           ret = tcg_qemu_tb_exec(env, tb_ptr);
           cpu->can_do_io = 1;
           last_tb = (TranslationBlock *)(ret & ~TB_EXIT_MASK);
           .......
}

I have a few questions regarding this.

- Is it possible to call block I/O functions like this? Or do I have to
"call" it from the event loop (main_loop_wait) ?

- Making a change like this requires me to actually finish the block
operation first before I start executing the next TCG block. I see that
"virtio_blk_data_plane_handle_output" makes a lot of aio thread usages and
coroutines. How do I make this call synchronous and essentially run it in
the same thread?

Thank you very much.

Best Regards,
Arnabjyoti Kalita

--000000000000cdcc0605c6fa01b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Stefan/all,</div><div><br></div><div>I was read=
ing your blog post on the QEMU overall architecture (link - &quot;<a href=
=3D"http://blog.vmsplice.net/2011/03/qemu-internals-overall-architecture-an=
d.html" target=3D"_blank">http://blog.vmsplice.net/2011/03/qemu-internals-o=
verall-architecture-and.html</a>&quot;) and I have a few questions with reg=
ards to executing I/O operations (block I/O) in the middle of guest code ex=
ecution.<br><br></div><div>I am running QEMU version 5.0.1 and my target an=
d host architecture is x86-64. I am using the virtio-blk block driver front=
end with a qcow2 image file as a backing file storage. <br></div><div><br><=
/div><div>I want to do something like below (in TCG) -</div><div><br></div>=
<div>static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationB=
lock *itb)<br>{</div><div>=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 log=
_cpu_state(cpu, flags);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 qe=
mu_log_unlock(logfile);<br>=C2=A0 =C2=A0 }<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #endif /* DEBUG_DISAS */</div><div>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cond is true) {<=
br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 virtio_blk_data_plane_handle_output(vdev, vq);=C2=A0 &lt;- callin=
g block I/O function here</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }<br>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ret =3D tcg_qemu_tb_exec(env, tb_ptr);<br>=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu-&gt;can_do_io =3D 1;<br>=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 last_tb =3D (TranslationBlock *)=
(ret &amp; ~TB_EXIT_MASK);<br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 .......</div><div>}</div><div><br></div><div>I =
have a few questions regarding this.</div><div><br></div><div>- Is it possi=
ble to call block I/O functions like this? Or do I have to &quot;call&quot;=
 it from the event loop (main_loop_wait) ?</div><div><br></div><div>- Makin=
g a change like this requires me to actually finish the block operation fir=
st before I start executing the next TCG block. I see that &quot;virtio_blk=
_data_plane_handle_output&quot; makes a lot of aio thread usages and corout=
ines. How do I make this call synchronous and essentially run it in the sam=
e thread?<br><br></div><div>Thank you very much.<br><br></div><div>Best Reg=
ards,<br></div><div>Arnabjyoti Kalita<br></div><div><br> <br></div><div><br=
></div><div><br></div><div><br></div></div>

--000000000000cdcc0605c6fa01b4--

