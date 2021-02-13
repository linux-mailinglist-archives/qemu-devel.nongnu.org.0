Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F267F31A9BF
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 04:21:59 +0100 (CET)
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAlVO-00035f-GN
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 22:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lAlTi-0002UK-Me
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 22:20:15 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:39010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lAlTe-0002rI-GG
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 22:20:14 -0500
Received: by mail-qk1-x733.google.com with SMTP id h8so1622033qkk.6
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 19:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=skzKuHoWIU5V3oeykvHz4tO/UUVMelz4Zaqr6qj3kZY=;
 b=pO4WoyziBRJJjgCPV5LassvFFhCDckUMDB/mWSz4Yzazqh8vysBifXt9qdHvZFk/6h
 JcKu/+WvQs1ZKrnww8jp9ECoxzjh4c1abTLdAbEFokZ180Duis5FfzXXHN94CZpb3vrp
 wwpVUF+cHiVE8YwYeZqVBWP7is/LJOKuFkRbfGE2sVModZcyBdPEjowPWchO3Wh+4lgo
 MScXzYsxM8IkB8d17I9lEthOOlbHP7XbrUdHQSX7KFZcjd/FQeoaKESuOIudk5ljuSBH
 /CHkERC9QHxNkJVuhyMYxgwf2hCKrwqZkrgBzwRA7c0lWeg8pA0hq3S07mJltkVrF4Bd
 8zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=skzKuHoWIU5V3oeykvHz4tO/UUVMelz4Zaqr6qj3kZY=;
 b=UCUESZ+ircwyKTxF9H6ZUKSzx72GZWdhdQVv1WeGkN9DyeNHbK+cOEqhFNE5XbmDT0
 V594xAeFp+KWmu16WYRoJscEU6CFaOB3iBFmZVt9H6iZ/uHGcnqagLwci1NMH+UJQy3E
 65yVtQeBmwm0zackKiDSqE2FYI6ZoNHyhT420KsE1rp9VdUIX8wXOIbZ4pdbBxMr7/Jz
 TuWc0gbBt0rzLOGIbtCgX6mIRuzpC28rUY8QqklCAwguO6kb3D4wSGTLemylh7V0SjN6
 tZcOJiAES4/eUohuVSk8GtfjW8V1HtiGqRiuu8nj8RYns5dFOygD6nxsC4h6nhmhO8oU
 sKSA==
X-Gm-Message-State: AOAM533p6TCX111saY3w6iBS8dJ68zwYFaqvPXB4W1wZ0sSIINYlhsvK
 JpNUcW2l+L6UEBBVIY6Yf71HgXAlw5E=
X-Google-Smtp-Source: ABdhPJxs6CIXk5heU2iYlAo327WmVFpC7vF24LOKR3SL7O3L4Ir6Jb6nSbcofS7KOW6svQrkPngrkA==
X-Received: by 2002:a37:806:: with SMTP id 6mr5576685qki.258.1613186408763;
 Fri, 12 Feb 2021 19:20:08 -0800 (PST)
Received: from [192.168.0.4] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id u7sm6547453qta.75.2021.02.12.19.20.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Feb 2021 19:20:08 -0800 (PST)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Virgil 3D renderer on macOS
Date: Fri, 12 Feb 2021 22:20:07 -0500
References: <mailman.1760.1613121930.30133.qemu-devel@nongnu.org>
To: qemu Developers <qemu-devel@nongnu.org>,
 akihiko.odaki@gmail.com
In-Reply-To: <mailman.1760.1613121930.30133.qemu-devel@nongnu.org>
Message-Id: <1E9D7BA4-C070-48AE-9989-70EA04FE547D@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x733.google.com
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



> On Feb 12, 2021, at 4:25 AM, qemu-devel-request@nongnu.org wrote:
>=20
> Message: 2
> Date: Fri, 12 Feb 2021 12:52:21 +0900
> From: =E5=B0=8F=E7=94=B0=E5=96=9C=E9=99=BD=E5=BD=A6 =
<akihiko.odaki@gmail.com>
> To: qemu-devel@nongnu.org, virglrenderer-devel@lists.freedesktop.org
> Subject: Virgil 3D renderer on macOS
> Message-ID:
> 	=
<CAMVc7JXQ_W+wDb9fUrGXmnO9Udaugbg=3DX-9PkpKNY13Xe7YxiQ@mail.gmail.com>
> Content-Type: text/plain; charset=3D"UTF-8"
>=20
> Hi,
>=20
> I would like to introduce my Virgil 3D renderer port to macOS.
>=20
> Some patches which are made in the process are useful even without
> Virgil 3D renderer, and already submitted to upstreams:
> - [PATCH] ui/cocoa: Support unique keys of JIS keyboards
> - [PATCH] ui/cocoa: Remove the uses of full screen APIs
> - [PATCH] ui/cocoa: Do not copy members of pixman image
> - [PATCH] ui/cocoa: Interpret left button down as is when command is =
pressed
> - Support ANGLE on macOS by akihikodaki =C2=B7 Pull Request #239 =C2=B7 =
anholt/libepoxy
>  https://github.com/anholt/libepoxy/pull/239
>=20
> I will send other patches when I confirm they do not cause harm on
> Linux hosts, or changes they depend on get merged.
>=20
> The complete source code is available on GitHub:
> https://github.com/akihikodaki/libepoxy/tree/macos
> https://github.com/akihikodaki/qemu/tree/macos
> https://github.com/akihikodaki/virglrenderer/tree/macos
>=20
> The "cocoa" display of QEMU will provide OpenGL support to the guest
> on macOS hosts. "NSOpenGLContext" (which wraps "CGL") will be the
> backend for core profile. ANGLE (which also wraps CGL and provides
> compatibility improvements) will be the backend for ES profile. It is
> possible to build without ANGLE, but such a build will lose ES profile
> compatibility.
>=20
> Videos captured on M1 MacBook Air are available on YouTube:
> https://youtu.be/ezvQPREjN1s (The WebGL Aquarium on the host, for =
comparison)
> https://youtu.be/iOG9Dbn8VoE (QEMU with OpenGL Core)
> https://youtu.be/k0bVlVQU2JQ (QEMU with OpenGL ES)
>=20
> glmark2 gives 577 scores for gl=3Des and 151 scores for gl=3Doff. The =
FPS
> of the WebGL aquarium with identical configurations was consistent
> with the display on the host (60 FPS), 15 FPS with gl=3Des, 8 FPS with
> gl=3Doff.
>=20
> I have not ran a formal conformance tests, but gl=3Dcore (which uses
> NSOpenGLContext) had a few problems:
> - glmark2 fails with the following output:
>> vrend_compile_shader: context error reported 6 "glmark2" Illegal =
shader 0
>> shader failed to compile
>> ERROR: 0:2: '' :  extension 'GL_ARB_fragment_coord_conventions' is =
not supported
>=20
> - Mozilla Firefox opening "about:support" fails with the following
> output on the host (This one should be easy to fix but I rather not
> because I also have gl=3Des.):
>> No provider of glTexStorage2DMultisample found.  Requires one of:
>>    Desktop OpenGL 4.3
>>=20
>>    GL_ARB_texture_storage_multisample
>>    OpenGL ES 3.1
>=20
> In contrast, gl=3Des, backed with ANGLE, runs properly as far as I =
have seen.
>=20
> My motivation is to make Linux desktop usable on M1. Patches to add
> Hypervisor framework support on Aarch64 are already submitted ("hvf:
> Implement Apple Silicon Support") and they are indeed useful for
> various workloads and I also used them to port Virgil, but I also
> needed graphics acceleration for my purpose. Another attempt to get
> Linux work on M1 is Asahi Linux, which aims to run Linux bare-metal.
> Of course, this needs porting graphic stacks to M1 and is likely to
> take time. I am satisfied with my port for the purpose although there
> may be rooms for performance or compatibility improvements.
>=20
> There is nothing preventing that if anyone would like to use Virgil on
> Intel Macs. Also, some patches may benefit other OpenGL ES
> configurations and displays.
>=20
> Thanks,

I am also an M1 Mac owner. I don't know very much about graphics cards =
but I would be happy to help if you need a tester.=20

I was doing a lot of thinking about implementing a 3D video card in =
QEMU. One option was to port PCem's Voodoo2 card to QEMU. Another option =
was to implement the ATI Rage 128 card. Drivers wouldn't probably be a =
problem since they already exist for Mac OS and Windows. One issue users =
might encounter is game support. Both these cards are older and probably =
are missing features that newer games need. Then there's the problem of =
proprietary firmware files these cards probably use. So I was wondering =
what your opinion on this issue. Should we focus on emulating a real =
video card or focus on making Virgil 3D compatible with more operating =
systems?






