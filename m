Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182663198F0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 04:53:34 +0100 (CET)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAPWO-0003AS-KZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 22:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lAPVT-0002jZ-Tz
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 22:52:35 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lAPVS-00034N-4r
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 22:52:35 -0500
Received: by mail-ej1-x634.google.com with SMTP id z19so199137eju.9
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 19:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=8Y9SyGbxOS6T9J7plNE7EJveWKzsfWi2aZgZ7W4uuTs=;
 b=rZfwwFHPJaVSeIZ7r2+x5Iwd6QLdBF7Z07cMgGsmn0xMdDskPnGgPhkxYo3X8EN/wN
 B8fyecL9qR+TmizKnW4yIR2LU/wwRtaE0UZRdp3GzAwCnNJp3NXjMlYVbONtxYFsjH7b
 VVHPVmfsr2bWlD+npbGBqFX+FYaOpVA/sLfd2CnkFZSEkZVoa7vM308J5LMVUN/zLr8a
 AkIG3yS3K4rCYKo1l8iZdf/WD8J774u76JcJJQLw5vph5Po6d06Om8dcZzsMQLB9rSYk
 Fn/nfr3YRZXY0Msg14XYGVR/3RT6uNBCkn/e1hsLzEi9/NAOHMrnOLrjU91Srqnfp5Zi
 RP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=8Y9SyGbxOS6T9J7plNE7EJveWKzsfWi2aZgZ7W4uuTs=;
 b=m0JHZQwzh7WUfKvaZJ5qcUM7JRvMVBooirlx+5Lvs7jibANaW7KHlaQ8Eogo0aKHRn
 3OfCYcjTjdbDDgPZ6K2uns8og7Og3gYBhjXIyxglHpm9CgTAYvqvNl8rLIltzkfaaFWZ
 1iwe8OYeXlDgZXzYlon0QfxJddek0qwk4HdIsl8i/kBzMyejK5jQXRZ5HvNKmNr3ICs8
 UEEuMzxVO0W11obJgLgvBZDZDdVXCfDIp4Q7P1bMy7cnd7GaqQ7lUN6tGm8ehPRHvL6l
 tzOd27WLaT4e9VVvIr22hB0WhGcAGH5bQEMQjQJbZXuoeHY6a0WhhTfS5KFB7rJWDVwR
 GU+Q==
X-Gm-Message-State: AOAM532yr/Fq1TyY8J7egdMWjWTrnu/WpYii/05HmukpenWqmi308NyJ
 sdRceneFyAjxn+2CQ2w1en5+nbV7oReyITRs7bK/DIrppu4k5g==
X-Google-Smtp-Source: ABdhPJyQ1mTbwfOO81/XUDg2MCvFBlCtx8t/TCVuDD8+UP22XwSXy1uhIeWAmWBNsr1W6HlB3YrOJTFdK/dKGbmA9BE=
X-Received: by 2002:a17:906:2bd7:: with SMTP id
 n23mr1049108ejg.502.1613101951861; 
 Thu, 11 Feb 2021 19:52:31 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?5bCP55Sw5Zac6Zm95b2m?= <akihiko.odaki@gmail.com>
Date: Fri, 12 Feb 2021 12:52:21 +0900
Message-ID: <CAMVc7JXQ_W+wDb9fUrGXmnO9Udaugbg=X-9PkpKNY13Xe7YxiQ@mail.gmail.com>
Subject: Virgil 3D renderer on macOS
To: qemu-devel@nongnu.org, virglrenderer-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi,

I would like to introduce my Virgil 3D renderer port to macOS.

Some patches which are made in the process are useful even without
Virgil 3D renderer, and already submitted to upstreams:
- [PATCH] ui/cocoa: Support unique keys of JIS keyboards
- [PATCH] ui/cocoa: Remove the uses of full screen APIs
- [PATCH] ui/cocoa: Do not copy members of pixman image
- [PATCH] ui/cocoa: Interpret left button down as is when command is presse=
d
- Support ANGLE on macOS by akihikodaki =C2=B7 Pull Request #239 =C2=B7 anh=
olt/libepoxy
  https://github.com/anholt/libepoxy/pull/239

I will send other patches when I confirm they do not cause harm on
Linux hosts, or changes they depend on get merged.

The complete source code is available on GitHub:
https://github.com/akihikodaki/libepoxy/tree/macos
https://github.com/akihikodaki/qemu/tree/macos
https://github.com/akihikodaki/virglrenderer/tree/macos

The "cocoa" display of QEMU will provide OpenGL support to the guest
on macOS hosts. "NSOpenGLContext" (which wraps "CGL") will be the
backend for core profile. ANGLE (which also wraps CGL and provides
compatibility improvements) will be the backend for ES profile. It is
possible to build without ANGLE, but such a build will lose ES profile
compatibility.

Videos captured on M1 MacBook Air are available on YouTube:
https://youtu.be/ezvQPREjN1s (The WebGL Aquarium on the host, for compariso=
n)
https://youtu.be/iOG9Dbn8VoE (QEMU with OpenGL Core)
https://youtu.be/k0bVlVQU2JQ (QEMU with OpenGL ES)

glmark2 gives 577 scores for gl=3Des and 151 scores for gl=3Doff. The FPS
of the WebGL aquarium with identical configurations was consistent
with the display on the host (60 FPS), 15 FPS with gl=3Des, 8 FPS with
gl=3Doff.

I have not ran a formal conformance tests, but gl=3Dcore (which uses
NSOpenGLContext) had a few problems:
- glmark2 fails with the following output:
> vrend_compile_shader: context error reported 6 "glmark2" Illegal shader 0
> shader failed to compile
> ERROR: 0:2: '' :  extension 'GL_ARB_fragment_coord_conventions' is not su=
pported

- Mozilla Firefox opening "about:support" fails with the following
output on the host (This one should be easy to fix but I rather not
because I also have gl=3Des.):
> No provider of glTexStorage2DMultisample found.  Requires one of:
>     Desktop OpenGL 4.3
>
>     GL_ARB_texture_storage_multisample
>     OpenGL ES 3.1

In contrast, gl=3Des, backed with ANGLE, runs properly as far as I have see=
n.

My motivation is to make Linux desktop usable on M1. Patches to add
Hypervisor framework support on Aarch64 are already submitted ("hvf:
Implement Apple Silicon Support") and they are indeed useful for
various workloads and I also used them to port Virgil, but I also
needed graphics acceleration for my purpose. Another attempt to get
Linux work on M1 is Asahi Linux, which aims to run Linux bare-metal.
Of course, this needs porting graphic stacks to M1 and is likely to
take time. I am satisfied with my port for the purpose although there
may be rooms for performance or compatibility improvements.

There is nothing preventing that if anyone would like to use Virgil on
Intel Macs. Also, some patches may benefit other OpenGL ES
configurations and displays.

Thanks,

