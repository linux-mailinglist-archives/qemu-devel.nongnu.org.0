Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D793E11A7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:52:57 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBa3b-0001Nk-NV
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1mBa2V-0008OB-Hy
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:51:47 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:42669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1mBa2T-0007tG-KY
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:51:46 -0400
Received: by mail-io1-xd2d.google.com with SMTP id h1so5902715iol.9
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MZhRgnPJXAtFNBok5myzWjWpvaesAZ+OeCYJKAiWYcY=;
 b=Oai+J8MITqRoWXSSv1SvpBND0nqsrDIHQV4jMUql0q1ErrPqrM3YomXS1cy3UA47PM
 voaeuoef5Jqk6mrK0MuyBKxuP9U6sZjXVQ+FVnFznknQNmkeUAny2FH4YSI701ZL6mHF
 wtxLuuN5niKWhnZG0K0n8sDnQYF9qHl47wKmXCbjlTYHM3ti/gyD5Dj2oFPiIzNk9QE+
 U5ibYNv13Ihv2TcZ11gcwqTbSZSqbUZxv+txd7pJ6MbRUvafxWVLhQABOWw1fUiGtr7w
 2abJL4x12z0+CpJcjirrNHKEoD9RuVoHrFOGYjStgIbje8ERnBUXLMWAYoURFH+p0Vy4
 ROLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MZhRgnPJXAtFNBok5myzWjWpvaesAZ+OeCYJKAiWYcY=;
 b=B+2tMkVOOJvddtNxysmxhlmegmHHl/K4O41vVO2EBDT2S8oo26WFPvT7KeCzZlUIP5
 XunmdjKnR0webknGbq+zbr/f0XNQbBOtV+Ze/cJ5TNVa0gXEqrA2AXHepm51lyKpHyOP
 poGH6RUQc0wx5mEHND6LKah1Ttn4JykSua9MFYhILkocrdpHFacE8hiYgw4TBa0QoKDq
 tE+R5r76mamTvgMLZnk2UBfYAOxrFTelPyjJT86ceHRd714tgpI6/UzWrOwvH8OyYw3f
 OXeCKKjj42jkxIlmf86J62RkMROMfARmUBuxmAiM92S1ZuseGAG0ByM56EMYjMESY8b3
 KIKw==
X-Gm-Message-State: AOAM531B9RluMFbVi7nLwg80as5eMFLp+28RnyWYl9xn1S9hJYc3QlEe
 /oDq0QKj/kAVKwmC42e7lthI58JbcrkZQW2qh0KlhaEKfMYIeUsz
X-Google-Smtp-Source: ABdhPJwlitNmwUvJDaDX8CHXfR87tIXC9Pj5DjFG1Kqs8GcHBBOb4viCTqb8aR6fp2+Zxc7C4GynPlabsO41q5pN5nA=
X-Received: by 2002:a5e:d918:: with SMTP id n24mr1154946iop.173.1628157103146; 
 Thu, 05 Aug 2021 02:51:43 -0700 (PDT)
MIME-Version: 1.0
From: Stevie Lavern <stevie.lavern@gmail.com>
Date: Thu, 5 Aug 2021 11:51:32 +0200
Message-ID: <CADV2EAvr0Sb55TE=uffkb4Z17ZHNBCZGLm0nA94qKZrx1WM35A@mail.gmail.com>
Subject: [Bug] x86 EFLAGS refresh is not happening correctly
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c5881105c8ccdd02"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=stevie.lavern@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5881105c8ccdd02
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm posting this here instead of opening an issue as it is not clear to me
if this is a bug or not.

The issue is located in function "cpu_compute_eflags" in target/i386/cpu.h
(https://gitlab.com/qemu-project/qemu/-/blob/master/target/i386/cpu.h#L2071)

This function is exectued in an out of cpu loop context.
It is used to synchronize TCG internal eflags registers (CC_OP, CC_SRC,
etc...) with the CPU eflags field upon loop exit.
It does:
    eflags |= cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);

Shouldn't it be:
     eflags = cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
as eflags is entirely reevaluated by "cpu_cc_compute_all" ?

Thanks,
Kind regards,
Stevie

--000000000000c5881105c8ccdd02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m posting this here instea=
d of opening an issue as it is not clear to me if this is a bug or not.</di=
v><div><br></div><div>The issue is located in function &quot;cpu_compute_ef=
lags&quot; in target/i386/cpu.h</div><div>(<a href=3D"https://gitlab.com/qe=
mu-project/qemu/-/blob/master/target/i386/cpu.h#L2071">https://gitlab.com/q=
emu-project/qemu/-/blob/master/target/i386/cpu.h#L2071</a>)</div><div><br><=
/div><div>This function is exectued in an out of cpu loop context.</div><di=
v>It is used to synchronize TCG internal eflags registers (CC_OP, CC_SRC,=
=C2=A0 etc...) with the CPU eflags field upon loop exit.</div><div>It does:=
</div><div><span class=3D"gmail-n">=C2=A0 =C2=A0 eflags</span> <span class=
=3D"gmail-o">|=3D</span> <span class=3D"gmail-n">cpu_cc_compute_all</span><=
span class=3D"gmail-p">(</span><span class=3D"gmail-n">env</span><span clas=
s=3D"gmail-p">,</span> <span class=3D"gmail-n">CC_OP</span><span class=3D"g=
mail-p">)</span> <span class=3D"gmail-o">|</span> <span class=3D"gmail-p">(=
</span><span class=3D"gmail-n">env</span><span class=3D"gmail-o">-&gt;</spa=
n><span class=3D"gmail-n">df</span> <span class=3D"gmail-o">&amp;</span> <s=
pan class=3D"gmail-n">DF_MASK</span><span class=3D"gmail-p">);</span></div>=
<div><br></div><div>Shouldn&#39;t it be:</div><div>=C2=A0 =C2=A0 =C2=A0<spa=
n class=3D"gmail-n">eflags</span> <span class=3D"gmail-o">=3D</span> <span =
class=3D"gmail-n">cpu_cc_compute_all</span><span class=3D"gmail-p">(</span>=
<span class=3D"gmail-n">env</span><span class=3D"gmail-p">,</span> <span cl=
ass=3D"gmail-n">CC_OP</span><span class=3D"gmail-p">)</span> <span class=3D=
"gmail-o">|</span> <span class=3D"gmail-p">(</span><span class=3D"gmail-n">=
env</span><span class=3D"gmail-o">-&gt;</span><span class=3D"gmail-n">df</s=
pan> <span class=3D"gmail-o">&amp;</span> <span class=3D"gmail-n">DF_MASK</=
span><span class=3D"gmail-p">);</span></div><div>as eflags is entirely reev=
aluated by &quot;cpu_cc_compute_all&quot; ?</div><div><span class=3D"gmail-=
p"><br></span></div><div><span class=3D"gmail-p">Thanks,</span></div><div><=
span class=3D"gmail-p">Kind regards,</span></div><div><span class=3D"gmail-=
p">Stevie</span></div></div>

--000000000000c5881105c8ccdd02--

