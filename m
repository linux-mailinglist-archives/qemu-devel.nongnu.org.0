Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744952CA05B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:52:45 +0100 (CET)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3H2-0000VO-By
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3Al-00006f-Uk
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:46:15 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3Aj-0007lf-Oa
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:46:15 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so3076375ejb.13
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 02:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGTbcmofABvNYQ7tBm5czWS6tzu9qJdgIq5A63QbFCE=;
 b=GBtPXi1xXbJWlS/UvgSj8olQUvGvAJigSETISCNbxNASR17P3zdNrYq70pVGBLzL9D
 9Olyt325Z5Lvz6046BkoOTmCGTwxvbHkcdcvN8pLJ6DaHi//fCXPcFtN7gFUcTz1g2Gq
 uJatQZxeDynYFscvvWEzduXHNmmqaKDq23hVWInCVBstkYdlSh8xFodsdpljs3U6L8HT
 dxGHrg+Zkxg260G6ogwRiFW/NOoiM/poSqwX1tnB3ceZPKFOTu9H4EKTE2TPuMZiGEbz
 k7EPKqBkw4eb6cBMqjLWcd+AR9l5HN0a8EajlQmhtwT1olgSAAIIkC5OHk9vM9c4mFLk
 WrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGTbcmofABvNYQ7tBm5czWS6tzu9qJdgIq5A63QbFCE=;
 b=RvEzCIqAvkFZApjFXazO4IUOwlTBCz08d/yJqnYWDucDQsivasyB5mR1EHmCyZTpy2
 G7vhd1kxql2Y+ZPJ+DYMsOIXASyEk/3BfyGJC08ByukpBaq68b3Q5hylFWjdCe/BNOL7
 a4kT/chSSBch/L2V0T++GzKnuIDjHktPvH03dhON+4cIrTSj1X72A8ZN3q4kjCKMSYgW
 J5eQZwDDRJmP/bIiSmwIs2gibtrNF0m2vsH28rVPj3/wjDdsoYHhe5mMzxjK+L6ewgOn
 8L5Azp+8+2wFJbjyZ2vXuYspMYsSS+zZ0rEvcFh4vnTqABoPh6n+HKMzEM/g0iZUnEQt
 UVug==
X-Gm-Message-State: AOAM531w6CV3oTqlLQAm9ufoYmh4MOq/9D++jNqifhgjtdlV/0OuOZDE
 fHoVvGZyf7E7hjdMHWP9AaPUWv48UvVqceLXgcguVA==
X-Google-Smtp-Source: ABdhPJxe5qI4HwlPnmzfeOTCpB22H8PhWe4z3/jBvghu9VZjrn014BOGiwzTur0w16RTjCDMo8LZIpLdI89lxE1Scdw=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr2089301ejr.482.1606819572136; 
 Tue, 01 Dec 2020 02:46:12 -0800 (PST)
MIME-Version: 1.0
References: <20201201103502.4024573-1-pbonzini@redhat.com>
 <20201201103502.4024573-33-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-33-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 10:46:01 +0000
Message-ID: <CAFEAcA-OE37ZH5z3mYkviW_WVLv=L_+Jumda_p8GAtkHR_UN6Q@mail.gmail.com>
Subject: Re: [PATCH v2 32/32] scripts: kernel-doc: remove unnecesssary change
 wrt Linux
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 10:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> A comment in kernel-doc mentions QEMU's qatomic_set macro, but since
> this code originated in Linux we should just revert it and stay as close
> to the kernel's copy of the script as possible.
>
> The change was introduced (more or less unintentionally) in QEMU commit
> commit d73415a31547, which did a global search-and-replace of QEMU's
> atomic access macros.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

