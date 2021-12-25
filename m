Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8A47F43F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 19:35:27 +0100 (CET)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1Bt8-0001RU-HS
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 13:35:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <goushifs@gmail.com>)
 id 1n1AzG-0004e6-A5
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 12:37:43 -0500
Received: from [2a00:1450:4864:20::52e] (port=33730
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <goushifs@gmail.com>)
 id 1n1AzE-0007Hs-BG
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 12:37:42 -0500
Received: by mail-ed1-x52e.google.com with SMTP id m21so45969300edc.0
 for <qemu-devel@nongnu.org>; Sat, 25 Dec 2021 09:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=57g8i8f4aA8IVdxJW7AVSJdUbcos0qVgdK7IwIJ+8Fc=;
 b=BGL2QT7JpsJ4s1p1coZ/sY1Jjzd2mGbij7Lm2/n580V4fbGAEzY4US2oRVspX3i7zv
 ftrTCUE16CMaDjgyJJxsEN8DwUxU4sIj2sUviOU2QnRMFYv0fcVpzf+CJbEpz5wvqijX
 F7PUm2ykRJ/sSesWt/JiHJ9/xwNnHvwZnmQL48J9X1qw63QsuLihPCjmn1ZnqbfHXniz
 Em6a2KEq4nQR0dHMGeEy/Zb7mh0Be3M3qSiDhs6m58XzUFm/1hLJcyewhxE3QCIKoCvW
 QX3B2l+xzBjaWHeTV1bwr4PTrtZJhnJoE28ieoo7BcTYkivVLVjcxJICDFk9Gq76kFjS
 kwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=57g8i8f4aA8IVdxJW7AVSJdUbcos0qVgdK7IwIJ+8Fc=;
 b=YNRhssyVK41nHxaYjybY2fy02fBjJxnNMkZtA69QZ5wKOGCNoo86mUTUhmaNh/vtDH
 aIvUYx/ZNj8yinUZbS4o8s2hFutnp6jRt4gB2L63svQAw9nDNwdJUfRbbXOzmd8BWaHk
 nPUuUEP2/eUqMjK+7tFHoA8jm7ZjVTG4H3K4VjjbFbPB9U8n3GsHBa3/USkOcsKHMf5R
 cvqdMQYBdMP/vf74UmIMvvbThZeP58Df4yMfn3Ike0GtkMUEobQAtKVFLToL2cfuXGBi
 JPhikWesDTZCgdUOdl9e/eM+nk2kP62TUjUKbpPj/18lNWxN/UV0Z7FWaarVFuyhM0Z7
 Thiw==
X-Gm-Message-State: AOAM532g/P5g0QfQrql0mr+J1nyEC6QonwOE3HzFzx4CHjLWThafJI4U
 U7AsCMC+EL/zF2//zo20dH2ROpY8TRU5UJVcnk/FW5WW/jE=
X-Google-Smtp-Source: ABdhPJz6+YOmgs0l/P7jZX+lIBakzk+VbCo4VCwr1V4tmnV+cRy2D2rcHfPXcWs8psZRASBOyNSZWZQFw+3hbjOLM18=
X-Received: by 2002:a17:907:7b9e:: with SMTP id
 ne30mr9066389ejc.24.1640453843422; 
 Sat, 25 Dec 2021 09:37:23 -0800 (PST)
MIME-Version: 1.0
From: g dom <goushifs@gmail.com>
Date: Sun, 26 Dec 2021 01:37:12 +0800
Message-ID: <CANm0wKAbJYuxemoKMkJSF_ieVN7GZM8QGHhUmpbCqy=CuBCtdQ@mail.gmail.com>
Subject: About source level debugging
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009b933605d3fbecaa"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=goushifs@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Dec 2021 13:33:40 -0500
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

--0000000000009b933605d3fbecaa
Content-Type: text/plain; charset="UTF-8"

Hi staffs at qemu, I'm a newcomer to qemu project. I'm currently trying to
understand this great masterpiece, and in order to achieve this task.
Source code level debugging is mandatory and necessary for me. Which IDE on
Linux would you recommend to import the latest QEMU project? Could you
provide me some helpful articles/resources to help me achieve this goal?

Best regards,
G.

--0000000000009b933605d3fbecaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi staffs at qemu, I&#39;m a newcomer to qemu project=
. I&#39;m currently trying to understand this great masterpiece, and in ord=
er to achieve this task. Source code level debugging is mandatory and neces=
sary for me. Which IDE on Linux would you recommend to import the latest QE=
MU project? Could you provide me some helpful articles/resources to help me=
 achieve this goal?=C2=A0 <br></div><div><br></div><div>Best regards,</div>=
<div>G.<br></div></div>

--0000000000009b933605d3fbecaa--

