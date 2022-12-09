Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F736481DF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:39:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bie-0006s9-Rt; Fri, 09 Dec 2022 06:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3biP-0006pP-Ad
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:38:53 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3biN-00030N-T5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:38:53 -0500
Received: by mail-pl1-x62c.google.com with SMTP id w23so4578628ply.12
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i/4+w1pfQLSn3iAw8BoeN4zDhLQy7iTGMvjMFcuDlv8=;
 b=iGZ7Sr5OxENzWO+4KTKh+Mck670a9gj3fzMDQXqtaWW3tOCs71S6s8X3KYd0Wjmjfl
 QaXs/uIiUvv/n1hj3hZ8cLSzaa2t+qu1MbOqxYTwZbXw2/U5Or4edtLCQfB35aTdngFJ
 0dHsuwHXZIQd8BRRRcg9E1+TOAw/nVHqeCOo4B59wbPgRPbg8APTJwG0ka4WJGePsARg
 BVMyCUwfIAsv+jaQWAMx+8Ka0HZ7nn+KgJNq85U57afuQB1Kj0194hK4GQPqc6b9r80p
 6Lm7dl7DksvhjvGwsI/JQvcMfaDhwpX3J6FvuZKYaK0nj09MGK4ISTPqCLuVfK8uMVkz
 ZA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i/4+w1pfQLSn3iAw8BoeN4zDhLQy7iTGMvjMFcuDlv8=;
 b=uD41FEUoLONBntVqlun+kZFzAkphjW1wiuo4lP2qD1Mpx4LMRCMl9yHo3ZzdB+rKnL
 UauHvTe9bz7d7JuuVaFM0XDCyMj+mzT2NJSUQCIMTYp7kDlm9HqcRts+5hYrcTFzza4V
 ln2vt+xCFCoKjk8C+1WxllQQEltWNdi07lv3js6vwn6uJeK6v8pqCgnuD/fQDJ4XVcJ7
 5zX/CPgzGK5B+W/yMecoUsOnTYe5IXSZ/A9/jlrAvovhy9ZWbY7nxMiw0GO4gTDUBbyf
 oIXIAsFrX+RjPy9IyNx1If1i2HN4mLeC8ZPuFZo/V7aj60s5nrSca+iZH/VNkvLLksqH
 VRRA==
X-Gm-Message-State: ANoB5pkWQTCxs/Vkjsp63YPXRlssrxC05jXqmg3HXytQB53zQvpbSXJv
 yUN2LCeKYZb1ZGcCHmQXIm47My7fnOk+SC0HztENFJ3mtIY85g==
X-Google-Smtp-Source: AA0mqf7ceOjJuaRHzJqqzhMgFtWA+1odkKgSdtfaoxpp6pKl5DQh1f6I02U/0NHGTPFexurj6l3x2uAI52iUMDsOvqo=
X-Received: by 2002:a17:90b:3c0b:b0:219:e2f1:81ad with SMTP id
 pb11-20020a17090b3c0b00b00219e2f181admr16741732pjb.19.1670585930267; Fri, 09
 Dec 2022 03:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-2-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 11:38:38 +0000
Message-ID: <CAFEAcA8NGm_sC3XVN4jk-rZ1hPA=+mK8GoTc30=nzZe0_XoOGw@mail.gmail.com>
Subject: Re: [PATCH 01/30] configure: remove useless write_c_skeleton
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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

On Fri, 9 Dec 2022 at 11:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This is not needed ever since QEMU stopped detecting -liberty; this
> happened with the Meson switch but it is quite likely that the
> library was not really necessary years before.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/configure b/configure
> index 26c7bc515468..e31d4522ea63 100755
> --- a/configure
> +++ b/configure
> @@ -638,7 +638,6 @@ if test "$mingw32" = "yes" ; then
>    EXESUF=".exe"
>    # MinGW needs -mthreads for TLS and macro _MT.
>    CONFIGURE_CFLAGS="-mthreads $CONFIGURE_CFLAGS"
> -  write_c_skeleton;
>    prefix="/qemu"
>    bindir=""
>    qemu_suffix=""
> --
> 2.38.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

