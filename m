Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09F1413C03
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 23:08:39 +0200 (CEST)
Received: from localhost ([::1]:55496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSn0I-0003XF-9m
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 17:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1mSmzU-0002dH-0o
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 17:07:48 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1mSmzS-0000Jq-Iu
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 17:07:47 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso358172ota.8
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=6GOD7Kd3l+JUBk4hLfB4HbFIwKwjnFs2h36q0wUmJXs=;
 b=GMBLg3DygpM2h6102Z7xi2VgYpkGAJcQQmSAk7hZS5E8qpRkNVvqVzCfFfujB1q086
 ctb+PYrONqwTyKSJVxFGJ3wV2tMC1D44PWSqHfuCDqlsiWNeRkPsVUhwaTRyCi/faing
 TqkF/ojw3jJ5J1e0z/iz4a4zk6dP0JHD1u74riXpsFxpEEEv81qlihrbRiN7xG8ktcIL
 nY10UZEWkia+8OfghAy0wRGy60VRy8XZtCD4LpO8JQ7/Z9Wt/l05fkDqHR0JGoW7FWAU
 8vN5YbwqLotGNEmC2gMJAGYx6TjFzNd1OCc084FyKP2q3HWKdEGhqLqIVTQOqz6NVNKL
 PDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6GOD7Kd3l+JUBk4hLfB4HbFIwKwjnFs2h36q0wUmJXs=;
 b=WH3ah4LTFpcLqeDoUYkgnmH5Nfwx7wAX+QE+UX9Zf98QGM5bnb5zB7xpmP6XaQFZAL
 1+QKLmb9e3OpS0lmctW5zCMBQMaSkWtJVZFvwPpFZZWQHyWGFw7HN/pSHNzXQYHTQ6gG
 PL5DKJVR7PXIf+uERgzMM+ABg8vlidGu/SRc6iSzbVLkw0DrqnqBz/yesYOSxpe8/V7T
 CgtNMylWjmc9Cq3ovdPWj9QWWlfUaUeINvDesHxFhaxftXRZJExqqB3YBVhLl4TMSaaL
 JVMPXXJB7kpciKO/WaKF/NkPCbCw0RJJL3XKiHFFLutq6Ucl01L5HsRLKWB5/hXrv4Up
 sgGw==
X-Gm-Message-State: AOAM533r8wB5fMmBvx5w50YjS8OrLW/NuK+cnZP8MsbfCqIg3DP1kukX
 NZ/4k7obUBFHPNdyxRFJhg8LEM3RB8suOSz6PD/kn1d2CtM=
X-Google-Smtp-Source: ABdhPJzsxw0AN+brfVtRvZzUbzi+Baqsl67gDN7fJeuj5BxjzE9RC0m0nwIERQQnhmdyQEYGfOaFK3NKOUcL545G/us=
X-Received: by 2002:a9d:71c6:: with SMTP id z6mr27477526otj.382.1632258464705; 
 Tue, 21 Sep 2021 14:07:44 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 21 Sep 2021 17:07:33 -0400
Message-ID: <CAK7rcp9HjoCVbFmT9rwAteAVdCCMgobt1jvCLuhL3CCBKJZSsA@mail.gmail.com>
Subject: Change TCG cache size?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f8716b05cc87c915"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000f8716b05cc87c915
Content-Type: text/plain; charset="UTF-8"

Hello all,

I just want to ask this one question: if I change the qemu tcg cache size (
TB_JMP_CACHE_SIZE), will that force any errors at run time?

--000000000000f8716b05cc87c915
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br><br>I just want to ask this one question: if=
 I change the qemu tcg cache size (<span style=3D"color:rgb(29,28,29);font-=
family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monospace;font-size:12=
px;font-variant-ligatures:none;white-space:pre-wrap">TB_JMP_CACHE_SIZE)</sp=
an>, will that force any errors at=C2=A0run time?<br></div>

--000000000000f8716b05cc87c915--

