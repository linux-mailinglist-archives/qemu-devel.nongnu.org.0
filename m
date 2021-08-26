Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F73F8A61
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:46:28 +0200 (CEST)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGeB-0007DY-RE
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <testvacomp@gmail.com>)
 id 1mJ9t1-0004Dm-Br
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 03:33:19 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <testvacomp@gmail.com>)
 id 1mJ9sz-0007bD-Ks
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 03:33:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d26so3558764wrc.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:date:from:subject:thread-topic:message-id:to
 :content-transfer-encoding;
 bh=PsbrddkeDka/70ROQjuRYGMtgbriHeR1jfksFFjUZVo=;
 b=RnAZ4Z7Gq4iYfcxZtweWWFRH4Mh7UC/LE/wv1ECeO7SQ+zeDaXaog7vRLvZ3XBG7CL
 M+e28qp8NnpqKBNeKti7R3T+Pf77El1veFFOB9gidEx8Wvh58Phmw0xZjs06IcT2UnWN
 q2IVAENcudU7oecWGX+Tiec0uR20irBAwat77Sx9fwxxT54lJZPtdPySlmUgfc6afL+/
 +t8/NndH/SPsxa3b2ZGfm5WDQV9yTeFMiwtf4LiGi6asLELcYWTHYXdg4WUcsjDiTBZD
 CB8yT70gwshvr+8MwD5B50/n3OPh7I6vFblTFdCeBvgxFS5FPcBxNqk4NJ6dYpPAVGFy
 1JKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :message-id:to:content-transfer-encoding;
 bh=PsbrddkeDka/70ROQjuRYGMtgbriHeR1jfksFFjUZVo=;
 b=oPvXhHjMwWYT5gSrqIUC3+zeNyOfAGUZAdtTFX2GtF0oOzdo0RXA/Gm9vMNKr6tl9e
 Dqgfo6H2AHBCQmjYayTu4WW5SrcvtF1/+hnnbhHeYq13129gxcd056zjSRmPsJv2dodk
 Qb+9NSw2aaAAnDTp7Xb1LggAOV7Jb3e2YQOyf+pydzd0zjVDh1GuisPmIEPMJ2HzRyzT
 Pt+J/RGILVVEkn1qOhmA8zkdCz17HvWythnNDLxn7jaOO3M9zQfVBAVBcpy4Kt3Y0tG2
 IL7Bmy1jQbgW2DjDM5NBbdgeFypToE2LrXL3Pfx0ElaqDcD6vwJhz1X+Sku56a/KimGY
 6edA==
X-Gm-Message-State: AOAM530bNrgeRdqh1E7TzZCggba4MibwVqJIHWa8vDI2YmuUw3A9kgv0
 djGTl9CzhDq3QqdosuSHrt4smMhJnph31g==
X-Google-Smtp-Source: ABdhPJzxWoa3gBzqYcYnZbE3f3HnGcGaCp9/qdo5OVwmV3zrIrwpYboAQYob3mz/1XOvhYGTKKfoFQ==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr2335947wrn.66.1629963193908;
 Thu, 26 Aug 2021 00:33:13 -0700 (PDT)
Received: from DESKTOP-FE25A1B ([156.193.12.96])
 by smtp.gmail.com with ESMTPSA id t8sm2506154wrx.27.2021.08.26.00.33.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Aug 2021 00:33:13 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 09:33:05 +0200
From: Ammar Mohammed <testvacomp@gmail.com>
Subject: Looking for two missing files used in the `emu-master-dev` branch
 in the repo.
Thread-Topic: Looking for two missing files used in the `emu-master-dev`
 branch in the repo.
Message-ID: <F5CE910A-83CC-4425-871D-8471A5D76698@hxcore.ol>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=testvacomp@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Aug 2021 10:44:43 -0400
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

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-US link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><p>Hi!</p><p>I'm building =
<code><span style=3D'font-size:10.0pt'>qemu</span></code> which depends on =
<code><span style=3D'font-size:10.0pt'>ShaderTranslator.h</span></code> and=
 <code><span style=3D'font-size:10.0pt'>ShaderTranslator.cpp</span></code>.=
 There is a shell script, <a href=3D"https://android.googlesource.com/platf=
orm/external/qemu/+/emu-master-dev/android/scripts/unix/build-ANGLE.sh">bui=
ld-ANGLE.sh</a>, supposed to copy them from <code><span style=3D'font-size:=
10.0pt'>angle/src/libShaderTranslator</span></code> to where they are neede=
d. But <code><span style=3D'font-size:10.0pt'>src/libShaderTranslator</span=
></code> is not in <code><span style=3D'font-size:10.0pt'>angle</span></cod=
e> root dir. Why? Is there a way to get <code><span style=3D'font-size:10.0=
pt'>ShaderTranslator.h</span></code> and <code><span style=3D'font-size:10.=
0pt'>ShaderTranslator.cpp</span></code>? Plz, help me out</p><p>I informed =
<code><span style=3D'font-size:10.0pt'>ANGLE</span></code> maintainers too =
<a href=3D"https://bugs.chromium.org/p/angleproject/issues/detail?id=3D6311=
">here</a> but they said I should inform you!<br>And informed qemu maintain=
ers too [here]( <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/56=
2">https://gitlab.com/qemu-project/qemu/-/issues/562</a>) but there is no u=
se. Plz, let me know the right way to post the issue or how to find the fil=
es.<br>Thanks in advance.</p></div></body></html>=


