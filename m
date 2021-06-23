Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90CC3B2240
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 23:10:46 +0200 (CEST)
Received: from localhost ([::1]:55724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwA8z-0005eR-EW
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 17:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sraasch@gmail.com>) id 1lw9Gw-0005yW-5K
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 16:14:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sraasch@gmail.com>) id 1lw9Gq-00059e-8F
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 16:14:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a11so3973632wrt.13
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=GQxeG2CgffAY8Bbp9MeCEDJR6S7r5bLjacy14P/A8B0=;
 b=aFO6wCxYRz6n1rzCKyhVMUQXpa9+sQ+9Gzh+QK+kEt8AovT+GMTt1KRA+UMOIjOJo4
 QFL9Y9KVQM/ghTsvUzeQ4/2zzLqpCDvM0+1a1DDQkSxukRStLoE+eCWdbyfSc4G8lRFZ
 /S+0Ez2Q85H02lrJjE9q3AL352JPH9t8C4jaDzme3zM1L77j3OTnAfhh+ZdvJphbJiXr
 z+sNrBXa9eQX600SWSH9EgK6mGeuGEv8sO4tFxIrEqz2DQk3KFTTUHV8cB3ozHNPJLIp
 JVN3N+Dgy6d7vqjaAlPuzYu0gWRkTbp0Ebtm5HLAfurqIWsi2yt9y3BGavf63DFglSZX
 kBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=GQxeG2CgffAY8Bbp9MeCEDJR6S7r5bLjacy14P/A8B0=;
 b=h2bssfDM3PbWiRg2p5pKKrU6rTFETALiylcHZJ8AupSiP9x6oQEPxcQfPpTk6QUKXc
 qzPHOvzM5G6HVCzCAGK0sVhPOxQiYAS2keZbdyH06JvbqbnvlYGVGXg88pqw/El+wv8c
 yK5seQYg3PiVdu8xCIthAUXI5EMLAFmwfASkl6P7JLXu2fN3K7rfyn32zo7EdMfVj+/+
 K+2DLiOkwuhHU2+bw/3brzSz/IJ+oco6XRmspTbBuNeRZT4ZGUExVsqypq0wwFo4v3M5
 V/2Z+Bp/ReQoH6QfoBJkGBjeVgk27ofIekj5X/r51+pnMV0l8UANnvOtS6DE04r2+6dF
 xAgg==
X-Gm-Message-State: AOAM530Evyrnj63sZA8jfM4VvsH83z5yCcAbHboLmq3hx9AlHlz3ggmJ
 zhld4FOpK+4ELlBZRFsu/3y/iP8+uvuKp/KfA3j5sLQauK+pbA==
X-Google-Smtp-Source: ABdhPJwL4Nn9M+uUhZLBX2BhfdK/KY6y8GW+PIhblbOu757GUFH7nwUsVAHsTajt1OQgBJE8NTJCUHTk94Z1Riz+Q/A=
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr2166702wrr.49.1624479284071; 
 Wed, 23 Jun 2021 13:14:44 -0700 (PDT)
MIME-Version: 1.0
From: Steven Raasch <sraasch@gmail.com>
Date: Wed, 23 Jun 2021 15:14:28 -0500
Message-ID: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
Subject: Extracting PC information from QEMU/KVM during single-step
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ac0ffb05c5748eac"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=sraasch@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Jun 2021 17:09:36 -0400
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
Reply-To: sraasch@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ac0ffb05c5748eac
Content-Type: text/plain; charset="UTF-8"

Hi -

I'm trying to create a hack that will allow me to extract an instruction
trace from QEMU/KVM (i386). The KVM part is important (see below).

Background:

   - I have used KVM to create a snapshot of a windows-10 guest running a
   graphics-intensive app. The *original* issue is that the app does not
   execute correctly when re-started from the snapshot using TCG (it doesn't
   crash, but it doesn't run correctly, either). So, using the existing "-d
   in_asm" won't work. It seemed to me that hacking in tracing to KVM should
   be easier than figuring out why the app doesn't work.
   - I've poked around the tracing mechanism in the TCG, and extracted what
   I need to dump instructions and then added that to kvm_cpu_exec().
   - I'm setting DEBUG & single-step modes by calling cpu_single_step()
   from the top of kvm_vcpu_thread_fn().
   - in kvm_cpu_exec() I wait until I get a KVM_EXIT_DEBUG signal before
   logging the instruction.

I have the output of TCG "-d in_asm" from the beginning of the execution,
and I'm comparing the KVM output with that.

What I don't have right is the PC of the instruction that's been executed.
The TCG is clearly sane, but the KVM output is not.

My best thought was to extract the PC from kvm_run (run->debug.arch.pc)
after the KVM_RUN ioctl, but that doesn't match up. I also tried
kvm_vcpu_ioctl() with KVM_GET_REGS, and grabbing the rip from cpu->env.rip.
I didn't expect any of these to be *exactly* right, but I thought they
would lead me to something sane.

Using run->debug.arch.pc gives me the right address for the first
instruction, but nothing makes sense after that.

Can anyone help me get onto the right track?

Thanks!

-Steve

--000000000000ac0ffb05c5748eac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin-top:0px;margin-right:0px;margin-left:0p=
x;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asi=
an:inherit;font-stretch:inherit;line-height:inherit;font-family:-apple-syst=
em,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans=
-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:both=
;color:rgb(36,39,41)"><br></p><p style=3D"margin-top:0px;margin-right:0px;m=
argin-left:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-var=
iant-east-asian:inherit;font-stretch:inherit;line-height:inherit;font-famil=
y:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Liberation Sa=
ns&quot;,sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inher=
it;clear:both;color:rgb(36,39,41)">Hi -</p><p style=3D"margin-top:0px;margi=
n-right:0px;margin-left:0px;padding:0px;border:0px;font-variant-numeric:inh=
erit;font-variant-east-asian:inherit;font-stretch:inherit;line-height:inher=
it;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;=
Liberation Sans&quot;,sans-serif;font-size:15px;vertical-align:baseline;box=
-sizing:inherit;clear:both;color:rgb(36,39,41)">I&#39;m trying to create a =
hack that will allow me to extract an instruction trace from QEMU/KVM (i386=
). The KVM part is important (see below).<br></p><p style=3D"margin-top:0px=
;margin-right:0px;margin-left:0px;padding:0px;border:0px;font-variant-numer=
ic:inherit;font-variant-east-asian:inherit;font-stretch:inherit;line-height=
:inherit;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,=
&quot;Liberation Sans&quot;,sans-serif;font-size:15px;vertical-align:baseli=
ne;box-sizing:inherit;clear:both;color:rgb(36,39,41)">Background:</p><ul st=
yle=3D"margin-top:0px;margin-right:0px;margin-left:30px;padding:0px;border:=
0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-stret=
ch:inherit;line-height:inherit;font-family:-apple-system,BlinkMacSystemFont=
,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px=
;vertical-align:baseline;list-style-position:initial;box-sizing:inherit;col=
or:rgb(36,39,41)"><li style=3D"margin-top:0px;margin-right:0px;margin-left:=
0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-wei=
ght:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;ve=
rtical-align:baseline;box-sizing:inherit">I have used KVM to create a snaps=
hot of a windows-10 guest running a graphics-intensive app. The *original* =
issue is that the=C2=A0app does not execute correctly when re-started from =
the snapshot using TCG (it doesn&#39;t crash, but it doesn&#39;t run correc=
tly, either). So, using the existing &quot;-d in_asm&quot; won&#39;t work. =
It seemed to me that hacking in tracing to KVM should be easier than figuri=
ng out why the app doesn&#39;t work.</li><li style=3D"margin-top:0px;margin=
-right:0px;margin-left:0px;padding:0px;border:0px;font-style:inherit;font-v=
ariant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit=
;font-family:inherit;vertical-align:baseline;box-sizing:inherit">I&#39;ve p=
oked around the tracing mechanism in the TCG, and extracted what I need to =
dump instructions and then added that to kvm_cpu_exec().</li><li style=3D"m=
argin-top:0px;margin-right:0px;margin-left:0px;padding:0px;border:0px;font-=
style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit=
;line-height:inherit;font-family:inherit;vertical-align:baseline;box-sizing=
:inherit">I&#39;m setting DEBUG &amp; single-step modes by calling cpu_sing=
le_step() from the top of kvm_vcpu_thread_fn().</li><li style=3D"margin:0px=
;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weight=
:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;verti=
cal-align:baseline;box-sizing:inherit">in kvm_cpu_exec() I wait until I get=
 a KVM_EXIT_DEBUG signal before logging the instruction.</li></ul><p style=
=3D"margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;border:0px;=
font-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:i=
nherit;line-height:inherit;font-family:-apple-system,BlinkMacSystemFont,&qu=
ot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;ver=
tical-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)">I h=
ave the output of TCG &quot;-d in_asm&quot; from the beginning of the execu=
tion, and I&#39;m comparing the KVM output with that.</p><p style=3D"margin=
-top:0px;margin-right:0px;margin-left:0px;padding:0px;border:0px;font-varia=
nt-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;lin=
e-height:inherit;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe U=
I&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;vertical-alig=
n:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)">What I don&#3=
9;t have right is the PC of the instruction that&#39;s been executed. The T=
CG is clearly sane, but the KVM output is not.</p><p style=3D"margin-top:0p=
x;margin-right:0px;margin-left:0px;padding:0px;border:0px;font-variant-nume=
ric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;line-heigh=
t:inherit;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;=
,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;vertical-align:basel=
ine;box-sizing:inherit;clear:both;color:rgb(36,39,41)">My best thought was =
to extract the PC from kvm_run (run-&gt;debug.arch.pc) after the KVM_RUN io=
ctl, but that doesn&#39;t match up. I also tried kvm_vcpu_ioctl() with KVM_=
GET_REGS, and grabbing the rip from cpu-&gt;env.rip. I didn&#39;t expect an=
y of these to be=C2=A0<em style=3D"margin:0px;padding:0px;border:0px;font-v=
ariant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit=
;font-family:inherit;vertical-align:baseline;box-sizing:inherit">exactly</e=
m>=C2=A0right, but I thought they would lead me to something sane.</p><p st=
yle=3D"margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;border:0=
px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretc=
h:inherit;line-height:inherit;font-family:-apple-system,BlinkMacSystemFont,=
&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;=
vertical-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)">=
Using run-&gt;debug.arch.pc gives me the right address for the first instru=
ction, but nothing makes sense after that.</p><p style=3D"margin-top:0px;ma=
rgin-right:0px;margin-left:0px;padding:0px;border:0px;font-variant-numeric:=
inherit;font-variant-east-asian:inherit;font-stretch:inherit;line-height:in=
herit;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&qu=
ot;Liberation Sans&quot;,sans-serif;font-size:15px;vertical-align:baseline;=
box-sizing:inherit;clear:both;color:rgb(36,39,41)">Can anyone help me get o=
nto the right track?</p><p style=3D"margin:0px;padding:0px;border:0px;font-=
variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inheri=
t;line-height:inherit;font-family:-apple-system,BlinkMacSystemFont,&quot;Se=
goe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;vertical=
-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)">Thanks!<=
/p><p style=3D"margin:0px;padding:0px;border:0px;font-variant-numeric:inher=
it;font-variant-east-asian:inherit;font-stretch:inherit;line-height:inherit=
;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Li=
beration Sans&quot;,sans-serif;font-size:15px;vertical-align:baseline;box-s=
izing:inherit;clear:both;color:rgb(36,39,41)">-Steve</p><p style=3D"margin:=
0px;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-a=
sian:inherit;font-stretch:inherit;line-height:inherit;font-family:-apple-sy=
stem,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sa=
ns-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:bo=
th;color:rgb(36,39,41)"><br></p></div>

--000000000000ac0ffb05c5748eac--

