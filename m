Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C738D65324F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:16:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zsI-0007JZ-E2; Wed, 21 Dec 2022 09:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7zsG-0007AB-8g
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:15:12 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7zsE-00086C-Nf
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:15:12 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so2387773pjr.3
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 06:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NrtnuWM6XK1BbNFV4Pq41+YcOnytNsBueUkqFUE3rts=;
 b=v0HebVL/0laAxGW/X3EaMGiX0DA0t3AYgUwomKplN0VEzScm5YiDcdNmvNhU5p/F3B
 LoGyP8v0mqoe4VV/EiNvITgD3i3kZobbt5vHrOt1X8hsk51DMW5ssRXO4/ytG9PaJZjz
 ghtrZr6XHnwTxDZqCyTI8DjlVfw//n1Wze7m0VjFhqF4WBICPK4UBDgQ7t5DRRPtzSf+
 bWT3grCFzKvt//nPNpXIydCxGLV0sf7BQh+vWrZ5bgq/HK/8aauQ5ro/y2IrPee+QKQR
 pvUxdOaQP5uoItPbmLVPl8O+TZf/+nnvq1jIRbYNWg9h5m9KlTU4gT2m5wAMLgOOhld5
 llWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NrtnuWM6XK1BbNFV4Pq41+YcOnytNsBueUkqFUE3rts=;
 b=5Q21vAR4YaoXxnsKh/xGI043CURY1DQ6DRnVHOSmP46De+R1Yj9DKZteS3Zyqda25q
 8a+vasBpnnjkyKeTD3DGlVexyY+O7YCwWJjStoykySzzRWcrldSmVzeSSDfiwzGQ+IRs
 YND+Mu6Lm+IFqE5HIvzpMkF8DrhTULs5SID5a247jo6JlnQr+jDnnx6g5DDPVKbMfHkf
 QnV03KHH0L4hUgU3jncdVsmYy6YKZwhU8XPbduDkp7tGt2vW1JxXFtnVDDp9MJF5tqIk
 c2hrY7P1vSy3iHyqCWKahs9vZzWFkQNVDQwxPHLOVYMTqVfr3Vd/YeUxozAR2CjpxBKH
 zJwA==
X-Gm-Message-State: AFqh2kq24MWPVRZDwFda54ROxUpVvfWSFc9ALnBWQGlmLcZD/JA9jIdw
 QdREYb7PfJq6i41uzbXp3vfONbwLoWUivIb7j0+10g==
X-Google-Smtp-Source: AMrXdXs6Pz+PQB/isTy8fVLA79udLDh/ue7HyZkBJSoGt1kP906u7scAsgm1yqzTcMeMTTN7VN2tuntcVy3OPdhywa4=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr88386plp.60.1671632108861; Wed, 21 Dec
 2022 06:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20221220174638.2156308-1-peter.maydell@linaro.org>
 <873599syl4.fsf@suse.de>
In-Reply-To: <873599syl4.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 14:14:57 +0000
Message-ID: <CAFEAcA_JG16xVWd3QAJxt+Bs9rKabWz9cLpw=CRWEOchRPCqVw@mail.gmail.com>
Subject: Re: [PATCH] block/io: Check for replay-enabled in
 bdrv_drain_all_begin()
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 20 Dec 2022 at 18:46, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In commit da0bd74434 we refactored bdrv_drain_all_begin() to pull out
> > the non-polling part into bdrv_drain_all_begin_nopoll().  This change
> > broke record-and-replay, because the "return early if replay enabled"
> > check is now in the sub-function bdrv_drain_all_begin_nopoll(), and
> > so it only causes us to return from that function, and not from the
> > calling bdrv_drain_all_begin().
> >
> > Fix the regression by checking whether replay is enabled in both
> > functions.
> >
> > The breakage and fix can be tested via 'make check-avocado': the
> > tests/avocado/reverse_debugging.py:ReverseDebugging_X86_64.test_x86_64_pc
> > tests/avocado/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
> > tests were both broken by this.
> >
> > Fixes: da0bd744344adb1f285 ("block: Factor out bdrv_drain_all_begin_nopoll()")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Tested-by: Fabiano Rosas <farosas@suse.de>

Thanks; I've applied this to git since it unbreaks 'make check'.

-- PMM

