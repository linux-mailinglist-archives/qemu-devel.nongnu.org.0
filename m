Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C3F6ADD33
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVPt-0003Z9-KM; Tue, 07 Mar 2023 06:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidrah12a@gmail.com>)
 id 1pZVPo-0003Yi-LA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:23:32 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sidrah12a@gmail.com>)
 id 1pZVPm-0004f5-Si
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:23:32 -0500
Received: by mail-il1-x12d.google.com with SMTP id r4so8263163ila.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678188206;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qETsR/99zWS93AwhljGC2YVHAqkAaLkoXezE0lHn24g=;
 b=fDMywoEnTQcsHQT2oeOzXsm6S4ae7GCh5pHzdOyKkwgLrjTVHu4X415Sc3zvd/s+4I
 iszdUiBlKXpZb6KP0dznSBapCTg8lfWPUSdPgexbYKW7XBFT8lgm8GziBBP8bRhXvFk0
 y7vYMzDqIUA4tT58huQIQdp1Hbj7TfbocUNhOSoYVCemsV7F/6SrN/1pbBXakDb281h+
 fh4WkE7v0+L4cCmRref6Gl0TWs8DiXQgpn1Izo1yqDrJ45A2mFFrZjrjeOzbEgegPvzK
 08qftwl+wHxcz4XeXrA0U+zl9cbFr3T57AtkCd7bXJLR80NUqs1eXtn6z2SGPp7P+zPW
 h3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188206;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qETsR/99zWS93AwhljGC2YVHAqkAaLkoXezE0lHn24g=;
 b=smxKkJGdqjFfrB/Xad76zGJE4LMdVZR/2N3fPrYEmJ/fiNJQfb2OQLNh4V1bKUxO+t
 1+KrQb1q8oJ/8i31tat0ojFuUDjn/oPqQyl9OI1NTs/k3lUGuzJ+pMH+7GsFHhHcZnwx
 eb+Btq29eRZ1Cllo7zPhXDxVdHVYYJpJXYx3fpC2xLV513eBq7Y+s9fwjA56+5zcti2l
 3ElzNNJCylzoi7MxGQ5/49tdNszHsfXQV4WcPS5pi8QVa+Q1ATBaWvWG+WYsE9ksqQ4R
 JoWb1xQgPBzlYXFFIQ17OxYLY0dhUv6w0Sw5dbng4uTgheONpXjPY24POpXtHoi8H4ml
 uTWQ==
X-Gm-Message-State: AO0yUKUFJZfgl8ONsGrGbS/jP6LH/6C+Rh8nmVgBozttRxVcJBLk+hja
 2YQ8Dw8rwLjq61UbINLL3hQG+xKg2oou5iUuuQVKaZ5T6tWbWQ==
X-Google-Smtp-Source: AK7set8R0TdsgSyd72MGtLjkv1m1MSRekuQAfFBDix29F0hzdvw/adfnEVjrLMUEqBiQKViHJS9woMUyos5+9qWhbnc=
X-Received: by 2002:a05:6e02:934:b0:315:9a9a:2cd with SMTP id
 o20-20020a056e02093400b003159a9a02cdmr6995348ilt.4.1678188205832; Tue, 07 Mar
 2023 03:23:25 -0800 (PST)
MIME-Version: 1.0
From: Sidrah <sidrah12a@gmail.com>
Date: Tue, 7 Mar 2023 16:53:15 +0530
Message-ID: <CAEYj55Jsc0NUOwj9VsfVuLjoCmoP1QAPg+nY-ptU8eXzLCXvzQ@mail.gmail.com>
Subject: Requesting help for the Outreachy contribution Stage
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e0007505f64da3c4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=sidrah12a@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e0007505f64da3c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I am Sidrah Ahmed, an undergrad IT student. I've had my initial application
to Outreachy approved. I had ' Problem Solving using C' class in my last
semester and I have 'Data Structures using =E2=80=98C=E2=80=99 ' class this=
 semester, worth
4 credits each. I believe I possess the skills listed on the website for
the "Implement native library calls for QEMU user mode emulation" project.

Could you please help me know what I should get started with, something I
might need to install or something I may have to learn to make my first
contribution?

Thank you,
Sidrah Ahmed.

--000000000000e0007505f64da3c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>I am Sidrah Ahmed, an undergrad=C2=
=A0IT student. I&#39;ve had my initial application to Outreachy approved. I=
 had &#39; Problem Solving using C&#39; class in my last semester and I hav=
e &#39;Data Structures using =E2=80=98C=E2=80=99 &#39; class this semester,=
 worth 4 credits each. I believe=C2=A0I possess the skills listed on the we=
bsite for the &quot;Implement native library calls for QEMU user mode emula=
tion&quot; project.</div><div><br></div><div>Could you please help me know =
what I should get started with, something I might need to install or someth=
ing I may have to learn to make my first contribution?</div><div><br></div>=
<div>Thank you,=C2=A0</div><div>Sidrah Ahmed.</div></div>

--000000000000e0007505f64da3c4--

