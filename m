Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA89B3A4D1F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 08:39:23 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrxIf-0000ub-Ve
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 02:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lrwk1-0006kS-59
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 02:03:33 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lrwjz-0001H4-BQ
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 02:03:32 -0400
Received: by mail-oi1-x231.google.com with SMTP id x196so8216335oif.10
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 23:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=O8FM9eqyBLedaVhXuxy1OMJoAvfvBV+KFhyeVhD0AdE=;
 b=jeNmlwHLq2iKb2GBOdvOKQTUvzhG+5Mk0xg+94V1/2wB+FEhSPMpSQJyq/bJkT3eWs
 dlsPpk+jYfInOItejTBZuW4iYWCiefd7QDSSy4oHeHhspFhwyrZt6H6GHn3oAHm6XBrS
 dUD+Jg0B6wm5P1nb9NurjIrfNBH/97v7+sqn+YRJKelbAV9lO4/v5WQAb88QbQNqrbPA
 xppeuBnTH7g2SbEdz4n7lBKz/9Nb3M/iw2iGaMmhDj5GcUy9M7cAWGUPq1moe2jYpO8M
 V7oZRBx9ManhEk2VseevTfmtJ6najbMEpdM196YHXQr5cufhBabh3HMKZI6cf9CzHfX2
 xHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=O8FM9eqyBLedaVhXuxy1OMJoAvfvBV+KFhyeVhD0AdE=;
 b=AXmtn2wniymL9zekEY+/2mZ5ZVoNJ+3+NVVInxIfAEQqHjNSRSqLpvD7WdjXyYG2oX
 iYCv68ssO85NdD8wB2v1/5HX5AxBAUUZg2fufDEjrTPGUNjZTI9lx+l1s9CB7a6WfwTd
 W6d7NrX36OVMNMEoDQ2CSbNiK0BBhGt9VukIYxzcdx9pU+5Vb+042sgB3Oir11DBVjZb
 Oe2JH6y/y4Ean31oRSZpijCcOxz5lKqLSXPe687VCjJktj5V1stXlSpWH8FzZOz8/+jL
 uxP+XCFnnprQcCktCmbR8ySh4daDQXVr5tsJIgAwSl5+bOG9mXYaZDjZOBLZwbGfcRWz
 g/uA==
X-Gm-Message-State: AOAM531rxGITepJngH5T6tck7xryW4WjcvIMO5pKr2rGz1O7pMkalCoX
 EBnvy54gIphmOrV+mKcS3n42Qmd1XHS9m1exCVMWSXdP0LMfoA==
X-Google-Smtp-Source: ABdhPJxjczIxpugYbnepkgJT9HtB6Bn8ga9F2zaYT9T1OcpmFQCrnEObzygZcEQWL8xS3ee8FZSLJBCV3zu/9012Ew0=
X-Received: by 2002:a05:6808:68d:: with SMTP id
 k13mr4651017oig.83.1623477809036; 
 Fri, 11 Jun 2021 23:03:29 -0700 (PDT)
MIME-Version: 1.0
From: Liu Cyrus <cyruscyliu@gmail.com>
Date: Sat, 12 Jun 2021 14:03:17 +0800
Message-ID: <CAAKa2jmVMvbRviMTTC8d0cPhWVmOHBNcRE-d3aTTdot4aCZBxg@mail.gmail.com>
Subject: Subject: [PATCH] hw/vmxnet3: fix vmxnet3 g_assert_not_reached bug
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001bc0f705c48b625d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 12 Jun 2021 02:38:22 -0400
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

--0000000000001bc0f705c48b625d
Content-Type: text/plain; charset="UTF-8"

From: cyruscyliu <cyruscyliu@gmail.com>

A g_assert_not_reached of vmxnet3 can be triggered by a guest with the root
privilege.
Remove the VMXNET3_REG_ICR branch thus get rid of this crash.

Fixes: 786fd2b0f87b ("VMXNET3 device implementation")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/309
Buglink: https://bugs.launchpad.net/qemu/+bug/1913923
Signed-off-by: cyruscyliu <cyruscyliu@gmail.com>
---
 hw/net/vmxnet3.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eff299f..a388918 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1786,13 +1786,6 @@ vmxnet3_io_bar1_write(void *opaque,
         vmxnet3_set_variable_mac(s, val, s->temp_mac);
         break;

-    /* Interrupt Cause Register */
-    case VMXNET3_REG_ICR:
-        VMW_CBPRN("Write BAR1 [VMXNET3_REG_ICR] = %" PRIx64 ", size %d",
-                  val, size);
-        g_assert_not_reached();
-        break;
-
     /* Event Cause Register */
     case VMXNET3_REG_ECR:
         VMW_CBPRN("Write BAR1 [VMXNET3_REG_ECR] = %" PRIx64 ", size %d",
--
2.7.4

Hi folks, this is a suggestion for fixing this bug.
I'm willing to discuss this with you because I'm new to contribute to QEMU.

Best,
Qiang

--0000000000001bc0f705c48b625d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>From: cyruscyliu &lt;<a href=3D"mailto:cyruscyliu@gma=
il.com">cyruscyliu@gmail.com</a>&gt;<br></div><div><br></div><div>A g_asser=
t_not_reached of vmxnet3 can be triggered by a guest with the root privileg=
e.</div><div>Remove the VMXNET3_REG_ICR branch thus get rid of this crash.<=
/div><br>Fixes: 786fd2b0f87b (&quot;VMXNET3 device implementation&quot;)<br=
>Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/309">ht=
tps://gitlab.com/qemu-project/qemu/-/issues/309</a><div>Buglink:=C2=A0<a hr=
ef=3D"https://bugs.launchpad.net/qemu/+bug/1913923">https://bugs.launchpad.=
net/qemu/+bug/1913923</a><br><div>Signed-off-by: cyruscyliu &lt;<a href=3D"=
mailto:cyruscyliu@gmail.com">cyruscyliu@gmail.com</a>&gt;<br>---<br>=C2=A0h=
w/net/vmxnet3.c | 7 -------<br>=C2=A01 file changed, 7 deletions(-)<br><br>=
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c<br>index eff299f..a388918 =
100644<br>--- a/hw/net/vmxnet3.c<br>+++ b/hw/net/vmxnet3.c<br>@@ -1786,13 +=
1786,6 @@ vmxnet3_io_bar1_write(void *opaque,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vmxnet3_set_variable_mac(s, val, s-&gt;temp_mac);<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0break;<br><br>- =C2=A0 =C2=A0/* Interrupt Cause Reg=
ister */<br>- =C2=A0 =C2=A0case VMXNET3_REG_ICR:<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0VMW_CBPRN(&quot;Write BAR1 [VMXNET3_REG_ICR] =3D %&quot; PRIx64 &quot=
;, size %d&quot;,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0val, size);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached(=
);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>-<br>=C2=A0 =C2=A0 =C2=A0/* Ev=
ent Cause Register */<br>=C2=A0 =C2=A0 =C2=A0case VMXNET3_REG_ECR:<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMW_CBPRN(&quot;Write BAR1 [VMXNET3_REG_ECR]=
 =3D %&quot; PRIx64 &quot;, size %d&quot;,<br>--<br>2.7.4<br></div></div><d=
iv><br></div><div>Hi folks, t<span style=3D"font-family:sans-serif;font-siz=
e:14px">his is a suggestion for fixing this bug.=C2=A0</span></div><div><sp=
an style=3D"font-family:sans-serif;font-size:14px">I&#39;m willing to discu=
ss this with you because I&#39;m new to contribute to QEMU.</span></div><di=
v><span style=3D"font-family:sans-serif;font-size:14px"><br></span></div><d=
iv><span style=3D"font-family:sans-serif;font-size:14px">Best,</span></div>=
<div><span style=3D"font-family:sans-serif;font-size:14px">Qiang</span></di=
v></div>

--0000000000001bc0f705c48b625d--

