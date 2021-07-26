Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487E3D5AEF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:04:16 +0200 (CEST)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81DK-0004Pu-Q9
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyang51@ucsc.edu>) id 1m7yC1-0006hO-ES
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:50:41 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qyang51@ucsc.edu>) id 1m7yBz-0001HR-6f
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:50:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso7585327pjf.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ucsc.edu; s=ucsc-google-2018;
 h=mime-version:from:date:message-id:subject:to;
 bh=8RTcv5uZ0L4aCQeNJcksOWkG4fz26fEsOEq50JoMjz8=;
 b=gL0NZIygN7Gvq2GZdm9q4fjfw4lcXxy+Cqq4n0jzUkdl9uDJjzML2N1wH1b70JQrb3
 SgaZhnOgR308jbDXAzCZh5HyLlMWM7hWksDG2J0WX7qKsickmTHIwUzasQLq8BfLdyRz
 BAN9fGf+hD+UuX4d4TR34H4xlSL4fuHMWI9W/YkHwnqWCA8x1x+FlUAIOrVDZdcBcijj
 npYO0M0jrjI44uDkF/Tk+XplW6xYk+ysCgeeCNNhamOEEJmpSyDYvIbUo+KQHLgqJ9IT
 ESjLnfSXcwwmVPLUC1iH6+9C44o1HEZrAEKqFo+87W9MVwRw9UIPz+gOohiwdBdBLn1Z
 0BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8RTcv5uZ0L4aCQeNJcksOWkG4fz26fEsOEq50JoMjz8=;
 b=Va3C9iGtSVSAilixQYLFr1SDKvQc+N59uJwJ1zx27fGULLty2G+PID+bQprhsq14va
 fvWJh9dkM5quqle96Z1BzhVJdbLePs2ViD8HMv/b0ilZ9JHYegve/Cs8tSVEY6/2tMXM
 1E/vgaM0Czirwx75A9lRi/+vGj8iF/RBEbs9lGCs3OHuGKYI22mZcizM08AMbQf9yGVX
 JcnAXe2xBrnsyDFpxXJSOi+xkdaZ6g9nSN93VVZDH5lr+ktor+p+PzOATDm5OBv4s7ol
 fvtLLDurXiKcYREdhzDxOUTjOIGH6TbTFHOaLt04yUzp+KZHHGiSe5BsnHi1NnBLRDhy
 Il7A==
X-Gm-Message-State: AOAM530namuOu5+6GyZG2W1iJHPX39fHyRlGJ7llUpH6lFFxGK5gdx/a
 fNdYlEOKYMUIe+y9T7SGlghLaVnIAVoOLEEyBe5BlIgS940pzg==
X-Google-Smtp-Source: ABdhPJyIn7+i5vHHzrR3HjUrQFNNEnLG1pa0Q+jY5eBHIx3gn7DhrOVy4Bng3cXQfBKdgFT5G7N+C5iiNsvAfIYPRx8=
X-Received: by 2002:a17:90b:818:: with SMTP id
 bk24mr987696pjb.21.1627296636422; 
 Mon, 26 Jul 2021 03:50:36 -0700 (PDT)
MIME-Version: 1.0
From: qyang51 qyang51 <qyang51@ucsc.edu>
Date: Mon, 26 Jul 2021 18:50:25 +0800
Message-ID: <CANN5=8dreZMEbuSKMMntOy8UBJtNj_7E8NzSCEi8v-5OZG2ThQ@mail.gmail.com>
Subject: Adding a GPU simulator to QEMU
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f6207e05c8048555"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=qyang51@ucsc.edu; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Jul 2021 10:03:00 -0400
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

--000000000000f6207e05c8048555
Content-Type: text/plain; charset="UTF-8"

Hi,

I am writing to consult you on how to add a GPU simulator to QEMU.
Currently, I am using qemu-system-riscv64 with "machine -virt" and plan to
add a GPU to this SoC. Would you mind give me some suggestions?
Thank you very much!


Yours sincerely,
Qiaowen Yang

--000000000000f6207e05c8048555
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am writing to consult =
you on how to add a GPU simulator to QEMU. Currently, I am using qemu-syste=
m-riscv64 with &quot;machine -virt&quot; and plan to add a GPU to this SoC.=
 Would you mind give me some suggestions?</div><div>Thank you very much!</d=
iv><div><br></div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"lt=
r">Yours sincerely,<div>Qiaowen Yang</div></div></div></div></div></div>

--000000000000f6207e05c8048555--

