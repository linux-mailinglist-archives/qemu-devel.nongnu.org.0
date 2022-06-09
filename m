Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7A545919
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 02:18:53 +0200 (CEST)
Received: from localhost ([::1]:43934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzSMU-0005ls-En
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 20:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pobloxdev@gmail.com>)
 id 1nzRki-00083z-Lq
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 19:39:49 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:36717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pobloxdev@gmail.com>)
 id 1nzRkh-0003fM-5Q
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 19:39:48 -0400
Received: by mail-qt1-x830.google.com with SMTP id x18so15443077qtj.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 16:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:date:from:subject:thread-topic:message-id:to
 :content-transfer-encoding;
 bh=ovbfQFgkUoJAIclcbbyTEJJHP6GOFKEZHPto2B6xk/4=;
 b=A6Ox75TLXzigywdXhB4R4eTtAMNRVpP/EoSv+GHB912PyVaTjLbjb3YkO8twp7ypPx
 SDAKP/JUqSJFSqgxbJa0r8dXrYQJeJ7VkfL8MlIRz5luLbsvZnnwjq7rsgblDeP7jAB9
 DsPYny4D8I9fnRKAx23ep2w7N0Nx1Ot07E/y9J+9/H1Gc+XbCnWT7Z185AzB6s/3lJOT
 l8Pj3hmvitEQgmybBa7d8LQ7cB1/qOFViP82wQQxjIaFA8JfKVUU3AIpewm8xLpjCY8l
 xwVXkAftFxARc/zbSvGBF1fwSIV+SanCQc5V19HXKeim693TsTanf82qepyfjkNmwntV
 agug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :message-id:to:content-transfer-encoding;
 bh=ovbfQFgkUoJAIclcbbyTEJJHP6GOFKEZHPto2B6xk/4=;
 b=I3KduQpYjzxvax7XwOXBCWCUeQ9fqyI++sh4EPguejYr/8XQwufspJG8Xw8gRUAqr/
 3JlkUPv8UpcG2DgD2Z2S5kZ1XtqUuHFfdbQc6X24FRx60nJ+Dvj1Ruq9bLer+lQGHiuq
 B3g4ip8Fq+XUiRfbQwSC4Aak3biHwnGUIHhgjUJ0hKsLah5+2dKlkIhFuZtXVYA4vtXw
 fKQn6Wmct2C+948lv5qYdnJrPv/iYHTF186NZlUyJDd2AhGU70V/UR6zyctFWNm0b2fw
 iGQxYMNCJSfbOKgImQ+rj+zUiJ8NKGAlY9SgHGkiameGncpAyp+ygJch2DE5nmmhVbFw
 KEBw==
X-Gm-Message-State: AOAM532gsQE/kHfyc2Izqpi/qDCcfzEh4nJpkm8FITfWIp7sDllO8kcO
 d2hCsjvY579iEQ6UM/WA5gzymnjt8dMyhqsN/TsndA==
X-Google-Smtp-Source: ABdhPJxSgX8DhnmkGlBf0sTBw3PveX6dahcDT3+UMCV4UmSk7l89gpDx4MMFej97IdchJj9RrsGgeA==
X-Received: by 2002:ac8:7f4a:0:b0:305:8af:a789 with SMTP id
 g10-20020ac87f4a000000b0030508afa789mr7718415qtk.528.1654817984723; 
 Thu, 09 Jun 2022 16:39:44 -0700 (PDT)
Received: from win10 ([20.114.164.41]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05620a0d8600b006a693e46d5csm18209146qkl.11.2022.06.09.16.39.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jun 2022 16:39:44 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 9 Jun 2022 23:39:42 +0000
From: Block Roads <pobloxdev@gmail.com>
Subject: hw/display: Add nVidia GeForce (NV25) emulation
Thread-Topic: hw/display: Add nVidia GeForce (NV25) emulation
Message-ID: <B33FD4F7-739E-44FA-8331-67C844BCD713@hxcore.ol>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=pobloxdev@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 09 Jun 2022 20:15:56 -0400
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
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-US style=3D'word-wrap:break-word'><div cl=
ass=3DWordSection1><p class=3DMsoNormal>Hello, At least one machines, the P=
C (i440fx machine), have an NV25 graphic chip by default (GeForce4 Ti 4200)=
 and It must be pbus, pcrtc, pfb, pfifo, pgraph, pmc, pramdac, and ptimer s=
ame as NV2A GPU. It must be NV25 vendor ID and device ID to 10DE:0253.</p><=
p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>But sadly, I =
don<span lang=3DPT-BR>=E2=80=99t have an patch emulation of NV25 VGA chips,=
 but QEMU devs will create NV25 emulation.<o:p></o:p></span></p><p class=3D=
MsoNormal><span lang=3DPT-BR><o:p>&nbsp;</o:p></span></p><p class=3DMsoNorm=
al><span lang=3DPT-BR>It must be 2D</span>/3D card support to play any game=
s.</p></div></body></html>=


