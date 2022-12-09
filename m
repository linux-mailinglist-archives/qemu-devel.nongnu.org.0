Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B6E6481DE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:39:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXl-0006WB-Mu; Fri, 09 Dec 2022 06:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bWi-0005ZZ-KV
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:56 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bWZ-0002h1-IX
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:46 -0500
Received: by mail-pg1-x52c.google.com with SMTP id h193so3322787pgc.10
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ex9Fb3dDRS427vhyJTMOPmys/YYJu3WouGuTrBcTKCY=;
 b=Gpn11nAo0PgKYqTKlQy5QdQktCL6P+hhsKBUoLac4V/JIgn2Crj52/Qbu1QmV2crH0
 FueDIN3ey7GxkgqhjUB2Thkyn5rR5yYmgKZ3IGVnnQhJFObCPPfxaXxcpro3aZUz9wA2
 fpjpBULCBS+jNT5RHcJ008kh6/d1rM59rB2HYWtBtulRTQ4hpdsfF80Ke7E4fNDBiZC7
 KHx5iHWHmrJm0Yl36nSSEp4Oag9Gt7LjsnAWV2/UksWZP8+FU+JtXmfczkK50XePNIux
 aL6OdnajfFZoSdD/xzE68zPYqluQeh3Rn5fPLsuOM5hHRib1xM6TyKuTmTvBld2iGGPB
 MWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ex9Fb3dDRS427vhyJTMOPmys/YYJu3WouGuTrBcTKCY=;
 b=AxBZmCHxgHe3oVTai7HlBgOxRQWUwcWjGF2b6rN6fcEwuYhq3udPVYZvmyq8fLBoZE
 6uCJPNA3Swp0CLtgGLE+G4dXcXDdqNv6WwvImXwQNeimHm1OQd8pgCuOxet4Ae04b9ct
 7cQF/5d+EAwb2qD+YKj15eZSycALIdrbPoHGKN3NK8fRY4mYdPmvr+e5AkN2bLR2k/fj
 C26FlZm8vtztsmwBcpB9ORD53Mkfu1lEuJ5IDMlhqu5LWo6JZbwbclnozNn/9yWVK+Ba
 puJ4Sh8W6r0PLaKxP6g33Y+eu+hjOInrwiN1Nf6bAUOIi4OVmFi3hyIYpYqurv/t3wTc
 SO5Q==
X-Gm-Message-State: ANoB5pm/xg6lLXca16kSaA6oqbk//S3QAk3ZqXvDUFYgT6GH1HgsAaGh
 H8H4azPa7KEoRTevYSUJloO0YJCnraIhmxNrIkFtyQ==
X-Google-Smtp-Source: AA0mqf4rptVo8Cba0x04z+SqbL5cEnC1N+iM4lIP9T2erIhHyCSRJEJmI7OC30r0+jZOruXIorz+YJlf7FfAZrVitrU=
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr4234471pgg.105.1670585197540; Fri, 09
 Dec 2022 03:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20221209111736.59796-1-philmd@linaro.org>
In-Reply-To: <20221209111736.59796-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 11:26:25 +0000
Message-ID: <CAFEAcA-OJeuby_E=7FOn7E7CMc6u0uEX4BUunY6ucL1-qQPQiw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0] target/arm: Keep "internals.h" internal to
 target/arm/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 9 Dec 2022 at 11:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> "target/arm/internals.h" is supposed to be *internal* to
> target/arm/. hw/arm/virt.c includes it to get arm_pamax()
> declaration. Move this declaration to "cpu.h" which can
> be included out of target/arm/, and move the implementation
> in machine.c which is always built with system emulation.

machine.c doesn't seem like the right place for this --
that file is purely concerned with migration. I don't know
why we use 'machine.c' as our name for the file where the
target CPU migration code lives, but that's fairly consistently
what we name it across all architectures and we don't put
other stuff in that file. I suppose it would be less confusing
to rename all those files to migration.c...

thanks
-- PMM

