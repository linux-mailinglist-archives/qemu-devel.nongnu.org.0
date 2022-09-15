Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3D45B9BE0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 15:34:41 +0200 (CEST)
Received: from localhost ([::1]:33328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYp0q-0003d9-Hm
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 09:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <egsherlock@gmail.com>)
 id 1oYhGb-0001iO-Ia
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 01:18:25 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <egsherlock@gmail.com>)
 id 1oYhGZ-0005RI-1r
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 01:18:25 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 n23-20020a17090a091700b00202a51cc78bso14975323pjn.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 22:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=iz6yk6WFw0wHh1MVm0zW1mIpjKYyIFEOlk8phUs2x8A=;
 b=D6HNGAywhWzJwKGCxTaMrr2R2LQObDpejz0oVJBWmV+N7zm4jOVRlwftqhQTMXa1s7
 9qS43YTZgjMmB9cS2e/FUE3yuVFSbh7ZzN5ViGHNqlCapvBBG1JhdhMRmP2+IeEZslkw
 OiK9qtM5PF4b4C43fkJ0kpHToGNxGeXuOueFB91M/7GRCVYTjiHzEw7GrqCrbnNJxzlw
 uUZEJ+ZCxTrVeGhX0zuNAfPIVjEziAJH7nL91yUamWs5Xe5ca6AdAO0DwWbeSak3q8Ms
 VE0a+F6t9nkV6DxHRtZWzrA8paczywCCDL0osSjTSEWIw3HlPsjsgjCVy1DaA1Y5mbP8
 CJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=iz6yk6WFw0wHh1MVm0zW1mIpjKYyIFEOlk8phUs2x8A=;
 b=PhYyXylyQ+EYzQiJy4olu6Io6H84lxKghPRfpbNPfgAPVQks0hhDHvy6mJtr8an4IT
 DQqJo6R9gMjR26/8uHQYpoLVZdKj6nLdAcDF8E9IGdBnPkYAEmqn5b93TYW4ggv+s6t9
 RXi99L8JDUc0M1hVI4vecJQDF7Pnb3YjBuoFG/TKBT92ERLqvlNCdOgEFysw9Gi/T0Eb
 CM0GT+qOxaKIhn+Pr8Gmh9EBZRYaW5Q4ymukzy3lO4PFVSPVKQcbkkY6fcjkFriIrwE4
 XlYK/sO5wIN28dLdsziFZPTYfS46+GuwDnNxjo0J49XQgkmoRvjdvSmed0I60SPoTaod
 wQTw==
X-Gm-Message-State: ACrzQf11EHfsL4TdP9UMEU7PGKWHLkVqkHFh3ENl07umcKqeAlPe8QWL
 Kr9pRHyb66PEmHEDK/ArbuNuIvA8oU/e2BV9QHQhFJAKEG7O0Q==
X-Google-Smtp-Source: AMsMyM4q5/GNq4HwEdpvOI6JTihGftB8BeBqKsRWsAWblZrZDWynpZjrJEdwM0D36QRrZPtWa86Hj9O8nwgcNCpPvGo=
X-Received: by 2002:a17:902:7c0b:b0:174:abfc:f5 with SMTP id
 x11-20020a1709027c0b00b00174abfc00f5mr2612054pll.124.1663219101171; Wed, 14
 Sep 2022 22:18:21 -0700 (PDT)
MIME-Version: 1.0
From: Evan Sherlock <egsherlock@gmail.com>
Date: Wed, 14 Sep 2022 22:17:41 -0700
Message-ID: <CANZg8SLZdLJ_vcEzTc0sOhZSU0kkjJaQ8FrJWxXf8P_W-K9OXQ@mail.gmail.com>
Subject: Cannot get Qemu to move past "Booting from ROM"?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b5833905e8b05fc3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=egsherlock@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Sep 2022 09:22:10 -0400
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

--000000000000b5833905e8b05fc3
Content-Type: text/plain; charset="UTF-8"

My custom build kernel 4.9.327 with gcc-11.2 is not booting in Qemu and it
is stuck on "Booting from ROM".

Just like the screenshot here: Custom 64bit 3.10.9 kernel not booting in
qemu and stucks on Booting from ROM
<https://unix.stackexchange.com/questions/625230/custom-64bit-3-10-9-kernel-not-booting-in-qemu-and-stucks-on-booting-from-rom>

I run qemu-system-x86_64 -kernel linux-4.9.327/arch/x86/boot/bzImage

Shouldn't the kernel crash?

Any tips?

--000000000000b5833905e8b05fc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-_3xX726aBn29LDbsDtzr_6E gmail-_1Ap4F5m=
aDtT1E1YuCiaO0r gmail-D3IL3FD0RFy_mkKLPwL4" style=3D"max-width:800px"><div =
class=3D"gmail-_292iotee39Lmt0MkQZ2hPV gmail-RichTextJSON-root"><p class=3D=
"gmail-_1qeIAgB0cPwnLhDF9XSiJM">My custom build kernel 4.9.327 with gcc-11.=
2 is not booting in Qemu and it is stuck on &quot;Booting from ROM&quot;.</=
p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM">Just like the screenshot here:=
 <a href=3D"https://unix.stackexchange.com/questions/625230/custom-64bit-3-=
10-9-kernel-not-booting-in-qemu-and-stucks-on-booting-from-rom" class=3D"gm=
ail-_3t5uN8xUmg0TOwRCOGQEcU" rel=3D"noopener nofollow ugc" target=3D"_blank=
">Custom 64bit 3.10.9 kernel not booting in qemu and stucks on Booting from=
 ROM</a></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM">I run qemu-system-x8=
6_64 -kernel linux-4.9.327/arch/x86/boot/bzImage</p><p class=3D"gmail-_1qeI=
AgB0cPwnLhDF9XSiJM">Shouldn&#39;t the kernel crash?<br></p><p class=3D"gmai=
l-_1qeIAgB0cPwnLhDF9XSiJM">Any tips?</p></div></div><h1 class=3D"gmail-_eYt=
D2XCVieq6emjKBH3m"></h1></div>

--000000000000b5833905e8b05fc3--

