Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE2510FA8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 05:50:45 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njYhQ-0000vr-Ob
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 23:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hduweili@gmail.com>)
 id 1njYgA-0000Fk-Id
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:49:26 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:34340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hduweili@gmail.com>)
 id 1njYg8-0008Jt-B6
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:49:26 -0400
Received: by mail-io1-xd30.google.com with SMTP id r28so1355007iot.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 20:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=grA1PIFURDYRKxCnblL1BMN1Xhs7U+RCApcoSu5ooIU=;
 b=oFTkNz26UAEWfM8V3sjA6tlM5j4s89w30IEe2XZvuxi2SiqMxDqt6/mbcl/WLm+7Sv
 JQI0pJ1sV3SRBv2Wv2y7LUYS95X/VVVBPhmyQRvYrZ9arKJoAsfPBgQVvZj0eMEjTH37
 8FTa+lB/L/6WpiPNboV6r6j1+nczj0I7bLzVrllQ1GMh+MKA2X4bQWeoA4agy+ce5Xry
 4JXSJtI3deaVrzN6V9sfxTNH41GwmgMC1Rb3JxarkrkJlDf/SVcY375Cx+tFVGFItez6
 +wUPcMfg53F41cp36usw9BNL68UNab3DoMeBmUi3jdTAVyjl7pxPb/0WB75LvHiduc5P
 VhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grA1PIFURDYRKxCnblL1BMN1Xhs7U+RCApcoSu5ooIU=;
 b=gYdJGNogTpNITw/oghaRdxaGaf+kA/+y2ZSm5M/VldBSJ939LPMytFFE7fhwZwcfVs
 dsnSJIjrAJBW3pvQ0/CvnzorJEwCU1SPnnmYDf6OH+XxyN7KEEALljy8JBGZBukdTMX0
 crdDpbfc/TH8e3ETjIegTWU6Pyz4PqbTvO1/nHRlTmhAWEMyst/kdL26qPRVdgY2VjeH
 9gdRFZVu6e1qUmYWaWhzRU/GJvl+LBxj4pFLvzFjDDGUh8+g0C4lpPgKHlPbQ51VZ+k6
 f24ZYbGX+gKhhoO6S4onAuFEwCYZKDljuMVQ3xPxPyoYbtcfRc1iTXj+/6tulDkUyng6
 nlRQ==
X-Gm-Message-State: AOAM531hXlySlyVz7hOy4odT8xxpoYSl583R7Azo1MbmmTxM0ylD6gKr
 sFMe1JSfZ1tU8sSrfsTNtn/fLZQtzTlumU8+JZE=
X-Google-Smtp-Source: ABdhPJzLhHmzv6ZLt37Sbja0NghrejE1f1xpYz9QGotZM5ysiVta4TyHx9KUJ3lBqoDIfQcCUNe1Oy7hxHWoOTOBZtM=
X-Received: by 2002:a92:d2ca:0:b0:2ca:ca3a:de89 with SMTP id
 w10-20020a92d2ca000000b002caca3ade89mr10510511ilg.127.1651031362884; Tue, 26
 Apr 2022 20:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <54ec2a88.968d.1805473f2da.Coremail.xcd19@mails.tsinghua.edu.cn>
In-Reply-To: <54ec2a88.968d.1805473f2da.Coremail.xcd19@mails.tsinghua.edu.cn>
From: Wei Li <hduweili@gmail.com>
Date: Wed, 27 Apr 2022 11:49:08 +0800
Message-ID: <CAAHarUyf6XHfey4Wn7JTQNCv+2RLm-ZJ-eOCLkPazp=0x7CnQQ@mail.gmail.com>
Subject: Re: qemu questions about x86
To: =?UTF-8?B?6aG55pmo5Lic?= <xcd19@mails.tsinghua.edu.cn>
Content-Type: multipart/alternative; boundary="000000000000e5d90105dd9ab1fa"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=hduweili@gmail.com; helo=mail-io1-xd30.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e5d90105dd9ab1fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear =E9=A1=B9=E6=99=A8=E4=B8=9C

On Sat, Apr 23, 2022 at 3:57 PM =E9=A1=B9=E6=99=A8=E4=B8=9C <xcd19@mails.ts=
inghua.edu.cn> wrote:

> Dear qemu developers:
> hello~ I'm Xiang Chen dong, a student from Tsinghua University. recently =
I
> am trying to  accomplish new X86 feature named user-interrupts which can
> view here
> <https://www.intel.com/content/dam/develop/external/us/en/documents/archi=
tecture-instruction-set-extensions-programming-reference.pdf>
> .
> I worked for a couple of time, reaching status that new msrs added and
> access of msrs is work well, also add new CPUID infos to qemu64, also I
> could catch new instructions by modify `translate.c` file. my code could
> find here <https://github.com/Xiang-cd/qemu>, the correspond linux kernel
> version could find here <https://github.com/intel/uintr-linux-kernel>.
> but now I have some problems when trying to accomplish instructions named
> SENDUIPI and UIRET.
> for SENDUIPI, the main function of it is sending the user-interrupts. the
> detail way is, machine access memory(address saved in new msr), then read
> another address from memory, then write some content to this memory. I re=
ad
> the qemu source code, find a lot of functions like tcg_gen_qemu_ld,  but
> when i click into it from IDE(vscode), i could not find where the functio=
n
> body(maybe due to the macro). So I don't understand how the function work=
s
> and how can I wirte a new function to access guest machine memory and wri=
te
> back in qemu.
>

    tcg_frontend: gen_op_ld_v-->tcg_gen_qemu_ld_tl-->tcg_gen_qemu_ld_i64
(tcg/tcg-op.c)-->gen_ldst_i64
    tcg_backend: case INDEX_op_qemu_ld_i64:-->tcg_out_qemu_ld
(tcg-target.c.inc tcg/i386)
    You only need to focus on the frontend and learn from how to translate
other instructions.

another problem is that I am not quite get the idea of accomplishment of
> Interrupt, i could find functions like raise_interrupt and raise_exceptio=
n,
> but I don't understand how it interact with apic(how the control flow
> switched to other functions, i find cpu_loop_exit_restore, but can not fi=
nd
> the function body), either how the interrupt handled.
>

    hardware interrupt produce
pc_i8259_create-->i8259_init-->x86_allocate_cpu_irq-->pic_irq_request
pic_irq_request-->cpu_interrupt(cs, CPU_INTERRUPT_HARD)
-->softmmu/cpus.c/cpu_interrupt-->tcg_handle_interrupt
  -->cpu_reset_interrupt-->hw/core/cpu-common.c/cpu_reset_interrupt

     hardware interrupt handle
cpu_exec-->cpu_handle_interrupt-->cc->tcg_ops->cpu_exec_interrupt-->x86_cpu=
_exec_interrupt
-->cpu_get_pic_interrupt-->pic_read_irq
-->do_interrupt_x86_hardirq-->do_interrupt_all-->do_interrupt_protected-->
use siglongjmp or sigsetjmp

    exception handle
cpu_handle_exception-->cc->tcg_ops->fake_user_interrupt-->x86_cpu_do_interr=
upt-->do_interrupt_all


>
>
the problem is difficult in some ways, I discussed with my classmates and
> friends, but there is no answer.
> so I'm hoping to get important information from you. Is my way of reading
> code right? Is there any tools for development(finding the function
> body)=EF=BC=9FHow can I accomplish this quickly=EF=BC=9F
> thank you very very much=EF=BC=81
> best wishes=EF=BC=81
> Xiang Chen Dong
>

Everything here maybe have some mistakes.
Hope it is useful for you.
--=20
best wishes=EF=BC=81

Wei Li

--000000000000e5d90105dd9ab1fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Dear =E9=A1=B9=E6=99=A8=E4=B8=9C<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sa=
t, Apr 23, 2022 at 3:57 PM =E9=A1=B9=E6=99=A8=E4=B8=9C &lt;<a href=3D"mailt=
o:xcd19@mails.tsinghua.edu.cn">xcd19@mails.tsinghua.edu.cn</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dear qemu develop=
ers:<div><span style=3D"white-space:pre-wrap">	</span>hello~ I&#39;m Xiang =
Chen dong, a student from Tsinghua University. recently I am trying to=C2=
=A0 accomplish new X86 feature named user-interrupts which can view <a href=
=3D"https://www.intel.com/content/dam/develop/external/us/en/documents/arch=
itecture-instruction-set-extensions-programming-reference.pdf" target=3D"_b=
lank">here</a>.</div><div><span style=3D"white-space:pre-wrap">	</span>I wo=
rked for a couple of time, reaching status that new msrs added and access o=
f msrs is work well, also add new CPUID infos to qemu64, also I could catch=
 new instructions by modify `translate.c` file. my code could find <a href=
=3D"https://github.com/Xiang-cd/qemu" target=3D"_blank">here</a>, the=C2=A0=
correspond linux kernel version could find <a href=3D"https://github.com/in=
tel/uintr-linux-kernel" target=3D"_blank">here</a>.</div><div><span style=
=3D"white-space:pre-wrap">	</span>but now I have some problems when trying =
to accomplish instructions named SENDUIPI and UIRET.</div><div><span style=
=3D"white-space:pre-wrap">	</span>for SENDUIPI, the main function of it is =
sending the user-interrupts. the detail way is, machine=C2=A0access memory(=
address saved in new msr), then read another address from memory, then writ=
e some content to this memory. I read the qemu source code, find a lot of f=
unctions like tcg_gen_qemu_ld,=C2=A0 but when i click into it from IDE(vsco=
de), i could not find where the function body(maybe due to the macro). So I=
 don&#39;t understand how the function works and how can I wirte a new func=
tion to access guest machine memory and write back in qemu.</div></blockquo=
te><div>=C2=A0</div>=C2=A0 =C2=A0 tcg_frontend: gen_op_ld_v--&gt;tcg_gen_qe=
mu_ld_tl--&gt;tcg_gen_qemu_ld_i64 (tcg/tcg-op.c)--&gt;gen_ldst_i64<br>=C2=
=A0 =C2=A0 tcg_backend: case INDEX_op_qemu_ld_i64:--&gt;tcg_out_qemu_ld (tc=
g-target.c.inc tcg/i386)<br><div>=C2=A0 =C2=A0 You only need to focus on th=
e frontend and learn from how to translate other instructions.=C2=A0</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><span =
style=3D"white-space:pre-wrap">	</span>another problem is that I am not qui=
te get the idea of accomplishment of Interrupt, i could find functions like=
 raise_interrupt and raise_exception, but I don&#39;t understand how it int=
eract with apic(how the control flow switched to other functions, i find cp=
u_loop_exit_restore, but can not find the function body), either how the in=
terrupt handled.</div></blockquote><div><br></div><div>=C2=A0 =C2=A0 hardwa=
re interrupt produce<br>pc_i8259_create--&gt;i8259_init--&gt;x86_allocate_c=
pu_irq--&gt;pic_irq_request<br>pic_irq_request--&gt;cpu_interrupt(cs, CPU_I=
NTERRUPT_HARD)<br>--&gt;softmmu/cpus.c/cpu_interrupt--&gt;tcg_handle_interr=
upt<br>=C2=A0 --&gt;cpu_reset_interrupt--&gt;hw/core/cpu-common.c/cpu_reset=
_interrupt<br><br>=C2=A0 =C2=A0 =C2=A0hardware interrupt handle<br>cpu_exec=
--&gt;cpu_handle_interrupt--&gt;cc-&gt;tcg_ops-&gt;cpu_exec_interrupt--&gt;=
x86_cpu_exec_interrupt<br>--&gt;cpu_get_pic_interrupt--&gt;pic_read_irq<br>=
--&gt;do_interrupt_x86_hardirq--&gt;do_interrupt_all--&gt;do_interrupt_prot=
ected--&gt;<br>use siglongjmp or sigsetjmp<br><br>=C2=A0 =C2=A0 exception h=
andle<br>cpu_handle_exception--&gt;cc-&gt;tcg_ops-&gt;fake_user_interrupt--=
&gt;x86_cpu_do_interrupt--&gt;do_interrupt_all<br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div>=C2=A0</div></blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div><span style=3D"wh=
ite-space:pre-wrap">	</span>the problem is difficult in some ways, I discus=
sed with my classmates and friends, but there is no answer.</div><div><span=
 style=3D"white-space:pre-wrap">	</span>so I&#39;m hoping to get important =
information from you. Is my way of reading code right? Is there any tools f=
or development(finding the function body)=EF=BC=9FHow can I accomplish this=
 quickly=EF=BC=9F</div><div><span style=3D"white-space:pre-wrap">	</span>th=
ank you very very much=EF=BC=81</div><div><span style=3D"white-space:pre-wr=
ap">	</span>best wishes=EF=BC=81<span style=3D"white-space:pre-wrap">			</s=
pan></div><div><span style=3D"white-space:pre-wrap">																							=
				</span>Xiang Chen Dong</div><div><span style=3D"white-space:pre-wrap">	=
																											</span></div></blockquote></div><br clear=3D"all=
"><div>Everything here maybe have some mistakes.<br>Hope it is useful for y=
ou.<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><div>best wishes=EF=BC=81</div><div><br></div><div>Wei Li</div><div><b=
r></div></div></div></div>

--000000000000e5d90105dd9ab1fa--

