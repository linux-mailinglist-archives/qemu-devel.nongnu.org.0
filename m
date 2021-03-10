Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA68333385
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 04:04:25 +0100 (CET)
Received: from localhost ([::1]:56512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJp96-0005Rd-2d
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 22:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srinath3142@gmail.com>)
 id 1lJp7X-0004js-9P
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 22:02:47 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <srinath3142@gmail.com>)
 id 1lJp7V-0002jG-8J
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 22:02:47 -0500
Received: by mail-ej1-x62f.google.com with SMTP id r17so34540947ejy.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 19:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cwiGOK+eYMA+z7KVT9G9z43309XuQW/QGcBejzDY6vg=;
 b=mRwTzUyaqGXTI9tkfBuhiYJYj0GmlnuIq/ixj5ippKoLGrQH3ZEAcjM/9siwUH3jnq
 nbGH5LY2vP2vcHE5+ad8tZuZYWcfDU+o2Cssyb62tqLtskLY1svnxl3ceZryj7RsA4xg
 EqWxYYfwTD9fP2fkKjSd7HVbPqFJF4Dg2Htq4CG1m/iIlRO0YJToHS+DgFGlwW9jFw0a
 7XBlEBZp4qnvrsqGzGe9wv3s+apF8aMVvW3VwTLX1fBHONalJBonnpYYzuxBdSfjIsWW
 qWDjkhnIGbwkBkRQSPFlzrK5E4TudjDoMf0Tawn5syCeSBD5BGiugYOo5RpAM2b10cUu
 P9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cwiGOK+eYMA+z7KVT9G9z43309XuQW/QGcBejzDY6vg=;
 b=UqDj+1BkMc5PtMg5ZJuByo1e3by4sOSyLDjCW3Z+MMk/iuvbUSEjawYPSqDNlIxe62
 lCmg+SCiEaWyFkA6CgbVuDNmDl77JKbc2K6oN7qFfIyoUg6ClYmMnzkYH7U1NNcU7LMk
 Cxd88mi8f89Df2ZGwfgC6b2RY4dT0WYYehZXYxOtWuE8UmXLPNO+re6l82gtHV9PUJwh
 ufy2CjqSUVB4kjZ5T+Lpm0rstZh7hqKx6ORB6BiYr4e8f3q1X0sVqkRyLOj29/tMjWVM
 SZentx8WzZ6+jU6UICdU9f29eYS2Fzv3F1WA/E7XpJ/DkJwqjpXDCPrOOs/Ybhcxgv+N
 NJWQ==
X-Gm-Message-State: AOAM5322h4dI61BzyEU/0sZ/yrTeXUzBAgEbmUtWgCOVSLqS+oQ7UZ1R
 /5fUuvamDYQd+1bA5pIVVFHfVW45nVe0VIG5kWgy3rkFcQM=
X-Google-Smtp-Source: ABdhPJy8EO9FPi2uRBoz0Ae7bUvYa3I6sv6S4yiGR60MQ/eV2Ym8bx1wzJoueWj7J4KYsYOWTOfCcac1shlHZuLRnkE=
X-Received: by 2002:a17:906:6a94:: with SMTP id
 p20mr1263719ejr.68.1615345362467; 
 Tue, 09 Mar 2021 19:02:42 -0800 (PST)
MIME-Version: 1.0
From: Srinath M <srinath3142@gmail.com>
Date: Wed, 10 Mar 2021 08:32:30 +0530
Message-ID: <CAEOVpxjnm3idK-Ufz+Fho166Lv5paZsCwnF3Fbp8TyoKZKe_SQ@mail.gmail.com>
Subject: Emulating STM32F407 (Cortex-M4) with peripherals on an X86
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000084fba405bd25e62d"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=srinath3142@gmail.com; helo=mail-ej1-x62f.google.com
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

--00000000000084fba405bd25e62d
Content-Type: text/plain; charset="UTF-8"

Hi

I am new to the Qemu project and was wondering if it is possible to emulate
the above processor with it's peripherals (Uart, DMA at least) on an X86.
Would it be possible for the following OS to run in a Qemu emulation (as it
does on the real processor) ?
https://www.st.com/en/development-tools/coide.html

I want to see how many such devices would interact with each other over a
network and it's unviable to have dozens of embedded boards at a time.

Generally all these processors have more functionality than pins, so the
pins are multiplexed and must be assigned functionality in a startup
routine. So i think there must be a CPU+peripheral emulator running on a
board emulator.

I would like to know if anyone has attempted something like this before or
some thoughts on the best way forward.

Regards
Srinath

--00000000000084fba405bd25e62d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>I am new to the Qemu project and was=
 wondering if it is possible to emulate the above processor with it&#39;s p=
eripherals (Uart, DMA at least) on an X86.</div><div>Would it be possible f=
or the following OS to run in a Qemu emulation (as it does on the real proc=
essor) ?</div><div><a href=3D"https://www.st.com/en/development-tools/coide=
.html">https://www.st.com/en/development-tools/coide.html</a><br></div><div=
><br></div><div>I want to see how many such devices would interact with eac=
h other over a network and it&#39;s unviable to have dozens of embedded boa=
rds at a time.</div><div><br></div><div>Generally all these processors have=
 more functionality than pins, so the pins are multiplexed and must be assi=
gned functionality in a startup routine. So i think there must be a CPU+per=
ipheral emulator running on a board emulator.</div><div><br></div><div>I wo=
uld like to know if anyone has attempted something like this before or some=
 thoughts on the best way forward.</div><div><br></div><div>Regards<br>Srin=
ath</div><div><br></div><div><br></div></div>

--00000000000084fba405bd25e62d--

