Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AA591C32
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 19:56:15 +0200 (CEST)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMvMr-0000fk-Pd
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 13:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oMub7-0000MD-Px; Sat, 13 Aug 2022 13:06:53 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oMub6-0002UU-8G; Sat, 13 Aug 2022 13:06:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so3453228pjf.5; 
 Sat, 13 Aug 2022 10:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=d6+WqawZ6bYb/eT0yzkwDBNoVUw3EGLEc13+cWpGXLQ=;
 b=KAYC0xNyrOaKh9jCG9lrXY0n+ZkVjpnCWGwqjFfW1SUOW8H6BmMU1YsMbS/R3VmXxG
 7YZt+FAPxhc4SqjyWljN41y8fa0asa/c5JgPUMxA8wqzBIny2jSngPIrlewx30Z9owKe
 9FGtkCtoJy+0m2hsYfbftuuLZauFgaU/r1NxQKPQObNcraucAiu71ctxwtGQ50hDyjkX
 mXlI5l7Nblmac/Iyc2jE/+ss4k8nGVXmAZoJE8Vg3yEz1+8ksIiyxpET93uJd4mF95To
 6KDnnFQap3tD1Btgu3XnYuRc6zvnlO6JVKXYnSLlR2XbTCFJBCTrTZOYFbGMMZ8wl2sy
 Wn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=d6+WqawZ6bYb/eT0yzkwDBNoVUw3EGLEc13+cWpGXLQ=;
 b=MqrDMLjslkCY8OlJggFHSVjg4KqPzJA7KotiRFO7G/PvkAMwKv6SOhwcWVrxLFjl+T
 iol++FdGxi/98RVVlFPgb/CrGHvq1X17hu1NAhvmxsVQJ8A1oIQD0VE9quRN7G5OLT9b
 Y98SZxxwfy4Y8h4TiYGeyj3C0hQEqld6pvX+hRS5nPd7MukNS0x53cjwoCe97L7tBT8s
 SVgjmkxB3HhoBBqz8Zyvz1k2H5lfDpKWd2tmCSbTWNqGoqiW0rPSteu6gTK0NjTsGqrg
 X5+jy87JQ3ztEq+5zpXlQ6p521/4jjImDS4/yjHPvIx2zLnmTtkgpUxcezdCPjpppAn1
 Ci9g==
X-Gm-Message-State: ACgBeo2slKEr6hjC9HRa4CbDOjeLHyl2u6wj5t2GRgmAl0PAI94eyAfV
 0Xz0RD410oEv11r6FnoqreLdhnVgDZKUvWNJetcOHtaOKOU=
X-Google-Smtp-Source: AA6agR79JaM//ICb9Z704tXYJOP0fu1VbXHLmAd3t/Fr39/Ri98PerFJybYGBk2eTfCPQrmCfN9uEwhr7cvwDI6R2qs=
X-Received: by 2002:a17:902:c408:b0:16d:c48d:978e with SMTP id
 k8-20020a170902c40800b0016dc48d978emr9321178plk.70.1660410409803; Sat, 13 Aug
 2022 10:06:49 -0700 (PDT)
MIME-Version: 1.0
From: Shiny Saana <shinysaana@gmail.com>
Date: Sat, 13 Aug 2022 19:06:39 +0200
Message-ID: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
Subject: Teensy 4.1 Implementation
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a8661305e6226cef"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=shinysaana@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 13 Aug 2022 13:54:30 -0400
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

--000000000000a8661305e6226cef
Content-Type: text/plain; charset="UTF-8"

Hello!

I'd like to implement support for emulating the teensy 4.1 board (
https://www.pjrc.com/store/teensy41.html) to QEMU.

I'm honestly quite lost as to where to start at the moment, since I can't
really find any emulated Cortex-M7 that would be close to that board
already implemented.

I asked around on IRC, and I was redirected to those two mailing lists, for
guidance, and also as writing code without maintainers approval would be
pointless.

Thank you!

--000000000000a8661305e6226cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!<div><br></div><div dir=3D"auto">I&#39;d like to implement support fo=
r emulating the teensy 4.1 board (<div dir=3D"auto"><a href=3D"https://www.=
pjrc.com/store/teensy41.html">https://www.pjrc.com/store/teensy41.html</a>)=
 to QEMU.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m honest=
ly quite lost as to where to start at the moment, since I can&#39;t really =
find any emulated Cortex-M7 that would be close to that board already imple=
mented.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I asked around o=
n IRC, and I was redirected to those two mailing lists, for guidance, and a=
lso as writing code without maintainers approval would be pointless.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Thank you!</div><div dir=3D"au=
to"><br></div></div>

--000000000000a8661305e6226cef--

