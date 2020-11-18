Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E12B7DEA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 13:55:10 +0100 (CET)
Received: from localhost ([::1]:45994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfMzN-0002ZY-I8
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 07:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfMu4-0006Bo-4N
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:49:40 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfMu2-0006QB-BY
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:49:39 -0500
Received: by mail-wm1-x341.google.com with SMTP id c198so1008049wmd.0
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 04:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=BzLTqTiUtAwdS8hWyxia9K2itjlyThpYvpkbu0YAXYM=;
 b=p62OLnBWtOlgTSk6G0zVwTKGLEXKZVNTCe/GizKyj/IDHXghWki2MjVSIZCatcqIOv
 ilrN8Zm3aLfbYmcX+hM1teZvq+9xXQ3yOFyPZ84i48iwhmZBAlJaEoDGuIjkRrBmKNG5
 WUUwGriF0BgyHUt3jMXuntewc0k+MM5mIRgo14che/3jjShU9Yi+6Dy2ILIv9sJQXl0Q
 qdiEmAQqZNByPqk6BGMuwX3U1gUGNyk/5DJXUY18cgHg5cQpCFNNCGFYL9S6VPC0d2a8
 twBPQQKTuib/a4bEzMpxmqwojq9JVHaCfKnPsqp/PIf9zfhQK7SXF3fksO/iahWqyZWh
 MIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=BzLTqTiUtAwdS8hWyxia9K2itjlyThpYvpkbu0YAXYM=;
 b=XYdolhcV006g4QkdXJRFVWfg2OT2fVt7jllS65/LfJCTZO7xd3ShszIxTQ5II7H2/C
 nZHtCCMRBZgaswjmqu0g14YZAmBHeR9CNqhwhyWHNIQxuKxsDQiknh875jJvCkf2GGjV
 0wCKDi35CrXB2xBMw7NRE8x82Ib8IRuVrNyGbgjh4n1D22D64wuXEJmEVZY9HalKWs4C
 NkQdMp6k1nzZfzVpb5PmDIOcWfgTi3HbMqjMcOeFnGMz3FRr0Ozcek7H4NOL6qC0JFt9
 H2IFEYqKmB4aHAUUnI4VnLoi3R25kwF1qvkttQmT7dS+pO51DhXEMld/ws2GH/DVWDnF
 hBzg==
X-Gm-Message-State: AOAM533aH4QUmtCMD0FLgww0CYk6IPNqR6lgXtx3g/zJkUuqlh/QM+7n
 CNUCnDbnEzeXUCW8K0oMrS0bz6hxIqEOtw==
X-Google-Smtp-Source: ABdhPJy8tsmqEc8Q2qkVkrskHwUZ6O+rQho5QdhbJ4f9xZLeiQS49tSpE1arm/N5FFM600L2/yv36g==
X-Received: by 2002:a1c:5f83:: with SMTP id t125mr4215941wmb.82.1605703775718; 
 Wed, 18 Nov 2020 04:49:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a144sm3813705wmd.47.2020.11.18.04.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 04:49:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D30A21FF7E;
 Wed, 18 Nov 2020 12:49:33 +0000 (GMT)
References: <20201118101821.132236-1-pbonzini@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] cirrus-ci: parallelize "make check"
In-reply-to: <20201118101821.132236-1-pbonzini@redhat.com>
Date: Wed, 18 Nov 2020 12:49:33 +0000
Message-ID: <875z62x21u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Otherwise, the tests risk failing due to timeouts.

This is a reversion of what we used to do because it's very hard to
figure out which test broke when they are all mixed together. Maybe we
could just up the timeouts.

That said the timeouts seem a bit random with macos taking around 53
minutes and macos_xcode taking less at around 44 unless they get "stuck".

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .cirrus.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f0209b7a3e..111e19f1bf 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -29,7 +29,7 @@ macos_task:
>                     --extra-cflags=3D'-Wno-error=3Ddeprecated-declaration=
s'
>                     || { cat config.log meson-logs/meson-log.txt; exit 1;=
 }
>      - gmake -j$(sysctl -n hw.ncpu)
> -    - gmake check V=3D1
> +    - gmake -j$(sysctl -n hw.ncpu) check V=3D1
>=20=20
>  macos_xcode_task:
>    osx_instance:
> @@ -43,7 +43,7 @@ macos_xcode_task:
>      - ../configure --extra-cflags=3D'-Wno-error=3Ddeprecated-declaration=
s' --enable-modules
>                     --enable-werror --cc=3Dclang || { cat config.log meso=
n-logs/meson-log.txt; exit 1; }
>      - gmake -j$(sysctl -n hw.ncpu)
> -    - gmake check V=3D1
> +    - gmake -j$(sysctl -n hw.ncpu) check V=3D1
>=20=20
>  windows_msys2_task:
>    timeout_in: 90m


--=20
Alex Benn=C3=A9e

