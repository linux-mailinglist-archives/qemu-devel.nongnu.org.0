Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378526C73D8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 00:04:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfTxg-0005Rm-6P; Thu, 23 Mar 2023 19:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pfTxe-0005Px-58
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 19:03:10 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pfTxb-0005P1-Kx
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 19:03:08 -0400
Received: by mail-il1-x12c.google.com with SMTP id l9so122635iln.1
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 16:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679612583;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vccmni4EiheHbYyDohHlPnBslSY1+n+UNrn7P7f1SRs=;
 b=DUtAS1EvHZJYMt2SiJQo3M6Tr/lu1g907dAvRtA+3KL03p2bEFmgtOBJ4RBIfm7ANb
 FAlRRNkV+vVM6x/XXFqJc8TiYbZbIBjw6DvhY8+Mdy/87WHPWqCEWQaNpqaItQ6CQqhq
 FGnGHpHonq1kB01ufBLJ4KDgf7QYJ5VR25qwRr/y15nlXM5Edt+0Xvm+A+36+bphltuE
 gMTSN9KVJuI6R1C03YqOnU6FPZSmbNgSM/H6tJQDaaH/NuK9VCceWG08w4LrAmDXSZz7
 Bykn71DIQ3E0UoPGPSqqJXUhDEz5GAa9zoseRLQXUTYBIRskRgizlmo58zqIOSCOinfp
 pbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679612583;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vccmni4EiheHbYyDohHlPnBslSY1+n+UNrn7P7f1SRs=;
 b=iN9gw8nWavaKqcuYNa0DdVPKnwtcFEdZ773fEMNXz/9vmII1WXOuuTOOveE17aS0v0
 XMTk1CavR4m2qW8TORNE9Rz02paSH/EwGlkBioHoF4lY4J15XVZkffqFLKpg6F4/4MsZ
 jSDgXHaqB+/HAQyYFEUoCe7gfR+ezU1D0hDJn5i9YBsGO2pZUjUHGd6skxeStDcln+V4
 pmg+rknBmrXCnzkbZV72Wi45heZGeS70gY2F7JcUrj1a3yGeaPI3m8jFYRtAO6f/es4w
 I+bfxfYUAzBoVCkdfRZF+klzX+sBk92oLoxbMqrDhTBCN0ch7S8CW6TWNCfXe57rQrDH
 JfKQ==
X-Gm-Message-State: AAQBX9cJlWcPI1ZIaY1Pu0P2VTsqhx9O5meLqeD3oHAbJf/rbcWaAxuX
 7IXku/EagGaM3gXzWcIxQjFGZ2x0AXuEn44I0xo6l/MG
X-Google-Smtp-Source: AKy350YDYiAFpA61kw4Mw0kuN9ppHgKuSfmJSWXV2eLig3Yo05dgL0zG3wSS+ON5LQZ3YaYepqz6wlkL1AIvFTKm52I=
X-Received: by 2002:a05:6e02:88c:b0:317:9096:e80f with SMTP id
 z12-20020a056e02088c00b003179096e80fmr635740ils.4.1679612583622; Thu, 23 Mar
 2023 16:03:03 -0700 (PDT)
MIME-Version: 1.0
From: Maverickk 78 <maverickk1778@gmail.com>
Date: Fri, 24 Mar 2023 04:32:52 +0530
Message-ID: <CALfBBTsN4fCW7fR+xMvoiMvaq=a2rTshCifYA6NVrUE-+GBwQg@mail.gmail.com>
Subject: Cxl devel!
To: Jonathan Cameron via <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000683fd005f7994722"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=maverickk1778@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000683fd005f7994722
Content-Type: text/plain; charset="UTF-8"

Hello Jonathan

Raghu here, I'm going over your cxl patches for past few days, it's very
impressive.

I want to get involved and contribute in your endeavor, may be bits &
pieces to start.

If you're specific trivial task(cvl/pcie/fm) about cxl, please let me know.

Regards
Raghu

--000000000000683fd005f7994722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Jonathan=C2=A0<div dir=3D"auto"><br></div><div dir=
=3D"auto">Raghu here, I&#39;m going over your cxl patches for past few days=
, it&#39;s very impressive.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I want to get involved and contribute in your endeavor, may be bits &am=
p; pieces to start.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If y=
ou&#39;re specific trivial task(cvl/pcie/fm) about cxl, please=C2=A0let me =
know.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards</div=
><div dir=3D"auto">Raghu=C2=A0</div></div>

--000000000000683fd005f7994722--

