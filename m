Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D12E984A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:20:49 +0100 (CET)
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwRf6-0001jw-Ts
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwRe5-0001DL-0u
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:19:45 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwRe2-0008Ew-On
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:19:44 -0500
Received: by mail-ej1-x631.google.com with SMTP id t16so7688148ejf.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 07:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ofmynd4FtmqI9xTAugifhWXeFOl9+D0lPRKKIHLRDAg=;
 b=bmYQCRsLTgGMKfuflYSMmVIYsLYZmFLKa1r01tbHetYJK3UsyIu2ZIqMOm1NQusL8x
 gMRvc+NOtGqUolKvUOsOgsamTS14hVY32GBC9oEJ20HbOaJBdRd52n9gN/Fc2OvrxipB
 W20RDrwD0b2kmtDqKkJlVMj2lNeXb/2GBtCgz250Yx0gusZ7v9fEQo94meB4mGc6RZMC
 5VoHW9G+RU/GXvFX7MVVdsT7Zh31+BNOcRbiznbM/k5hH5+EBBGWfEeoUYekschuM2l9
 x8AsujT8E1Lc9J+As06rk4vzhk3uG4K+6TT+p+VVQGKXZJ6kBJ2jevKNWRiu9AnrWo8a
 DPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ofmynd4FtmqI9xTAugifhWXeFOl9+D0lPRKKIHLRDAg=;
 b=RJ5/UWCmoPeW5rtmsxhOFr+btkVeobKj1UkEAzH1rBfxJ8BgKDJS7CS85MKHZDPhHV
 WT2x/7Xakj6TjgQJjjxMlsYZGfMo5nbv82ff992G2yy6vIeiGiD2K+M6yWQtG/VrWHE9
 mhX3tZadT2xr+OSNixrbmsmSrM6VzqSRHC75I+HfDnvhOvR8sXuXtU5CF0YsTbgXYS8m
 KC6TQjEyTKDsH615jN2OXPoBxsb+OQp01z9LJopv56zxRNJDWF5YARcDXvFt1xhlVHWp
 FZAgmYaVlItKB5zcAbuhH30gv1+QjIHb82mOvPtdcCVJnpJ4XLvxndCzT+PNLsjoEO7p
 voJg==
X-Gm-Message-State: AOAM530FxRTpaxvs/v8UQ5koMHNn3Ze3E/QO7w1iPvKFjhlp5KOGIjRw
 FPZiozLgC5W/YUPPxnBKtV1ANeekxzcWVlBWVjh+ZA==
X-Google-Smtp-Source: ABdhPJyrcg6uzolfMolNfcefz3h7/zKoA6yI2uAYomST+x37pyIFEJzgAfve/e/talqWenvks3HeUAH/8D/0Fe4JtRI=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr41952351ejf.85.1609773580659; 
 Mon, 04 Jan 2021 07:19:40 -0800 (PST)
MIME-Version: 1.0
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <20210104122149.GH640208@redhat.com>
 <CAFEAcA_3nv2N7zY5kwGWPLRx2dY3KB8wMAFX-MMrk_kXK1SUVg@mail.gmail.com>
 <7493bddf-d915-8faa-5612-f14a3067a574@redhat.com>
In-Reply-To: <7493bddf-d915-8faa-5612-f14a3067a574@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 15:19:29 +0000
Message-ID: <CAFEAcA8e916+AU4Ebvie504AOoOBP8wZ8rC90=Hcws76wpkMTQ@mail.gmail.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 14:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 04/01/21 14:21, Peter Maydell wrote:
> >> The rest of QEMU should only ever be using QEMU's TLS abstractions
> >> and not directly be tied to GNUTLS. So ideally the gnutls flags
> >> should only ever be added in the crypto/meson.build, and anything
> >> which depends on that should then get the flags indirectly.
> > Unfortunately include/crypto/tlscreds.h leaks this implementation
> > detail
>
> That is not a problem.  As Daniel said, anything depending on crypto can
> still get the gnutls flags _indirectly_.
>
> In my proposed solution to the bug you'd get that via
>
>      io_ss.add(crypto, qom)
>      libio = static_library(..., dependencies: io_ss.dependencies())

Does this work recursively? For instance monitor/qmp-cmds.c
needs the gnutls CFLAGS because:
 * qmp-cmds.c includes ui/vnc.h
 * ui/vnc.h includes include/crypto/tlssession.h
 * include/crypto/tlssession.h includes gnutls.h

I don't see anything in monitor/meson.build that says "qmp-cmds.c
needs whatever ui's dependencies are".

thanks
-- PMM

