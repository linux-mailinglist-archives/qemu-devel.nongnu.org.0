Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC953A4D20
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 08:39:34 +0200 (CEST)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrxIr-00010g-DZ
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 02:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lrx4f-00052K-JW
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 02:24:53 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lrx4d-0001uZ-EY
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 02:24:53 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 w23-20020a9d5a970000b02903d0ef989477so5397505oth.9
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 23:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gAlr+CPeUFoaZex5yQVMUJrwDV7ksXMkHqnC+rl+/mI=;
 b=MAxnJApUKh7w1B9WlrZR74SbwxcoETUJURedE4PfJDz4abZ2Y0E5MhsWVsKzrOgm0U
 RJV0Omws+0LAqdYN6R90Uw3tWQ9+Lk6mB1Mnb+i9F/Z/Bu/WOZMYJFwbeuiJaqeerqas
 IrOf2V5riz/jPqU7HDXV5tNTwHDYRjiYVl6II4jHRZAXh4iCsmkVi3FAnNkC8RS2p76B
 PPv0g7SZNhCxUsMuRt7+3id7WCA1gzA+6Wjzits6pIv/eF8JBsY2MYhHuIL0TzN/5306
 GbxX80EC8fxTzZBJxXCc6w+SCTEZx2TIo6FFx0/qabDP8SrrBY4rTsx+Iz0ZQ2YuBozN
 vCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gAlr+CPeUFoaZex5yQVMUJrwDV7ksXMkHqnC+rl+/mI=;
 b=bGm23EWnriw/xsXjsJENWnN8mjcfwvuK5gUNBXx3diDF8l5k/Cs2S3Ax6e2oOSfAYn
 RS6Oxa+VHHkylx1r3Ckk99TCCvjTbeurGnJdxEGSctoosLS15NRMbrLeaK6navSS+BLy
 74S4PlP171w4W3k1xyjDb4T0WHpkushue4fd0br31LY7lRMQQtxDNiaOSZu+clBwda1+
 FuSFzRvA4pMxkk3UtlCwPn7CjhuBTntl3ZPS7r7izd2mV4yukG9eTD10uK0SUBlURcgu
 zmN3TT3AWP/CsLmcJVrhSfeZGPxnN0FjY7XQ2uBwz76F7+OHXAMnVoaRwYnfvF5UJzdo
 jfhw==
X-Gm-Message-State: AOAM530HbCmENwbboz/NowiXK7nuzOlePcVdl5lVywaT4IxZ72L9DW3E
 309HPsScrECfk4NnA6VSGU5AcKd3TG+LkMXKhjuyfqrovrt+yA==
X-Google-Smtp-Source: ABdhPJyKQZsQUJ8hujxGcLnGAMY0uPPOEK/UtMfHDCGOVJ1iTK6AXYi+1hO/9PqA2thU0oRNAoENg3oCPQ39WZrhWo8=
X-Received: by 2002:a9d:3e5:: with SMTP id f92mr5844724otf.181.1623479089837; 
 Fri, 11 Jun 2021 23:24:49 -0700 (PDT)
MIME-Version: 1.0
From: Liu Cyrus <cyruscyliu@gmail.com>
Date: Sat, 12 Jun 2021 14:24:38 +0800
Message-ID: <CAAKa2jn2vwC6oZtrL6CtbQ5U7r7tS4GXmmALjCMSby6KiupeAQ@mail.gmail.com>
Subject: [PATCH] Fix assertion failure in lsi53c810 emulator
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000073387505c48baed6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 12 Jun 2021 02:38:24 -0400
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

--00000000000073387505c48baed6
Content-Type: text/plain; charset="UTF-8"

From: cyruscyliu <cyruscyliu@gmail.com>

An assertion failure can be triggered in the lsi53c810 emulator by a guest
when ((s->sstat1 & 0x7) == PHASE_DO) || (s->sstat1 & 0x7) == PHASE_DI)) &&
(!s->current) holds.
Check s->sstat1 and s->current in lsi_reg_writeb before lsi_execute_script()
to discard this MMIO write.

Fixes: 7d8406be69ce ("PCI SCSI HBA emulation.")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/305
Buglink: https://bugs.launchpad.net/qemu/+bug/1908515
Signed-off-by: cyruscyliu <cyruscyliu@gmail.com>
---
 hw/scsi/lsi53c895a.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index e2c1918..5c08f7f 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1919,6 +1919,10 @@ static void lsi_reg_writeb(LSIState *s, int offset,
uint8_t val)
             lsi_update_irq(s);
         }
         if (s->waiting == LSI_WAIT_RESELECT && val & LSI_ISTAT0_SIGP) {
+            if (!(((((s->sstat1 & 0x7) == PHASE_DO)
+                    || (s->sstat1 & 0x7) == PHASE_DI))
+                    && s->current))
+                break;
             trace_lsi_awoken();
             s->waiting = LSI_NOWAIT;
             s->dsp = s->dnad;
@@ -1980,8 +1984,13 @@ static void lsi_reg_writeb(LSIState *s, int offset,
uint8_t val)
          * instruction.  Is this correct?
          */
         if ((s->dmode & LSI_DMODE_MAN) == 0
-            && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
+                && (s->istat1 & LSI_ISTAT1_SRUN) == 0) {
+            if (!(((((s->sstat1 & 0x7) == PHASE_DO)
+                    || (s->sstat1 & 0x7) == PHASE_DI))
+                    && s->current))
+                break;
             lsi_execute_script(s);
+        }
         break;
     CASE_SET_REG32(dsps, 0x30)
     CASE_SET_REG32(scratch[0], 0x34)
@@ -2001,8 +2010,13 @@ static void lsi_reg_writeb(LSIState *s, int offset,
uint8_t val)
          * FIXME: if s->waiting != LSI_NOWAIT, this will only execute one
          * instruction.  Is this correct?
          */
-        if ((val & LSI_DCNTL_STD) && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
+        if ((val & LSI_DCNTL_STD) && (s->istat1 & LSI_ISTAT1_SRUN) == 0) {
+            if (!(((((s->sstat1 & 0x7) == PHASE_DO)
+                    || (s->sstat1 & 0x7) == PHASE_DI))
+                    && s->current))
+                break;
             lsi_execute_script(s);
+        }
         break;
     case 0x40: /* SIEN0 */
         s->sien0 = val;
--
2.7.4

Hi folks, this is a suggestion for fixing this bug.
I'm willing to discuss this with you because I'm new to contribute to QEMU.

Best,
Qiang Liu

--00000000000073387505c48baed6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From: cyruscyliu &lt;<a href=3D"mailto:cyruscyliu@gmail.co=
m">cyruscyliu@gmail.com</a>&gt;<div><br></div><div>An assertion failure can=
 be triggered in the lsi53c810 emulator by a guest</div><div>when ((s-&gt;s=
stat1 &amp; 0x7) =3D=3D PHASE_DO) || (s-&gt;sstat1 &amp; 0x7) =3D=3D PHASE_=
DI)) &amp;&amp; (!s-&gt;current) holds.</div><div>Check s-&gt;sstat1 and s-=
&gt;current in lsi_reg_writeb before=20

lsi_execute_script()</div><div>to discard this MMIO write.</div><div><br>Fi=
xes:=C2=A07d8406be69ce (&quot;PCI SCSI HBA emulation.&quot;)<br>Resolves:=
=C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/305">https:/=
/gitlab.com/qemu-project/qemu/-/issues/305</a><div>Buglink:=C2=A0<a href=3D=
"https://bugs.launchpad.net/qemu/+bug/1908515">https://bugs.launchpad.net/q=
emu/+bug/1908515</a><br>Signed-off-by: cyruscyliu &lt;<a href=3D"mailto:cyr=
uscyliu@gmail.com">cyruscyliu@gmail.com</a>&gt;<br>---<br>=C2=A0hw/scsi/lsi=
53c895a.c | 18 ++++++++++++++++--<br>=C2=A01 file changed, 16 insertions(+)=
, 2 deletions(-)<br><br>diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c8=
95a.c<br>index e2c1918..5c08f7f 100644<br>--- a/hw/scsi/lsi53c895a.c<br>+++=
 b/hw/scsi/lsi53c895a.c<br>@@ -1919,6 +1919,10 @@ static void lsi_reg_write=
b(LSIState *s, int offset, uint8_t val)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0lsi_update_irq(s);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;waiting =3D=3D LSI_WAIT_RESE=
LECT &amp;&amp; val &amp; LSI_ISTAT0_SIGP) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (!(((((s-&gt;sstat1 &amp; 0x7) =3D=3D PHASE_DO)<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (s-=
&gt;sstat1 &amp; 0x7) =3D=3D PHASE_DI))<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; s-&gt;current))<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_lsi_awoken();<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;waiting =3D LSI_NOWAIT;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;dsp =3D s-&gt;dnad;<br>@@ -1=
980,8 +1984,13 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8=
_t val)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * instruction.=C2=A0 Is this =
correct?<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ((s-&gt;dmode &amp; LSI_DMODE_MAN) =3D=3D 0<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (s-&gt;istat1 &amp; LSI_ISTAT1_SR=
UN) =3D=3D 0)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
amp;&amp; (s-&gt;istat1 &amp; LSI_ISTAT1_SRUN) =3D=3D 0) {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(((((s-&gt;sstat1 &amp; 0x7) =3D=3D PHA=
SE_DO)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|| (s-&gt;sstat1 &amp; 0x7) =3D=3D PHASE_DI))<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; s-&gt;curren=
t))<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsi_execute_script(s);<br>+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<b=
r>=C2=A0 =C2=A0 =C2=A0CASE_SET_REG32(dsps, 0x30)<br>=C2=A0 =C2=A0 =C2=A0CAS=
E_SET_REG32(scratch[0], 0x34)<br>@@ -2001,8 +2010,13 @@ static void lsi_reg=
_writeb(LSIState *s, int offset, uint8_t val)<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * FIXME: if s-&gt;waiting !=3D LSI_NOWAIT, this will only execut=
e one<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * instruction.=C2=A0 Is this co=
rrect?<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if ((val &amp; LSI_DCNTL_STD) &amp;&amp; (s-&gt;istat1 &amp; LSI_ISTA=
T1_SRUN) =3D=3D 0)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((val &amp; LSI_DCNTL=
_STD) &amp;&amp; (s-&gt;istat1 &amp; LSI_ISTAT1_SRUN) =3D=3D 0) {<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(((((s-&gt;sstat1 &amp; 0x7) =3D=
=3D PHASE_DO)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|| (s-&gt;sstat1 &amp; 0x7) =3D=3D PHASE_DI))<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; s-&gt=
;current))<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0brea=
k;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsi_execute_script(s)=
;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br=
eak;<br>=C2=A0 =C2=A0 =C2=A0case 0x40: /* SIEN0 */<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0s-&gt;sien0 =3D val;<br>--<br>2.7.4<br><div><br></div><div><di=
v>Hi folks, t<span style=3D"font-family:sans-serif;font-size:14px">his is a=
 suggestion for fixing this bug.=C2=A0</span></div><div><span style=3D"font=
-family:sans-serif;font-size:14px">I&#39;m willing to discuss this with you=
 because I&#39;m new to contribute to QEMU.</span></div><div><span style=3D=
"font-family:sans-serif;font-size:14px"><br></span></div><div><span style=
=3D"font-family:sans-serif;font-size:14px">Best,</span></div><div><span sty=
le=3D"font-family:sans-serif;font-size:14px">Qiang Liu</span></div></div></=
div></div></div>

--00000000000073387505c48baed6--

