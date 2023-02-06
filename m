Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6168BFED
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Mc-0003ZA-2L; Mon, 06 Feb 2023 09:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2MB-0003Ik-0R
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:20:32 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2Lq-0005jI-5r
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:20:24 -0500
Received: by mail-pl1-x629.google.com with SMTP id h15so4883166plk.12
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/stSA+LMSnAOBlUv+folta2O7Ep6uldSCfoGsbSkdLE=;
 b=uMxmOa8DtD4Q+qh7DuVxSBeytNMm+2tR1BCEIWCMfwZ2GFG0uYrtZo2MTqYtUvH50N
 oSXT3JV+e9yHyibXaVwaHXbf81UnJ89SFNjORAiACHfUJ9Ci8RNfro97F504AnUVYyL3
 ghVt0B9Hx4zAAf/opDGD1X75XcyaFiVucY36kP3w/b6jKKvGnHK0L8v5X/IlGETU7gc/
 tJop7KjJWZvf/1KaQHbHZKxHqTDP0pX183TsGr/oftNhFbUEB2Y916kRgKTP3myitNof
 R1To77PqV5fm9eTPQhdSS/dFXWh4UeL71ogXtyuc5n5BB1b/+EDgYFRYXYHmfD9fvrop
 GUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/stSA+LMSnAOBlUv+folta2O7Ep6uldSCfoGsbSkdLE=;
 b=mP/dfm6gxY7mp6XiHqyv05ysJP1RYPxOQbKSpx9/vy4hweKKuqRaNAdHDWBLn8400h
 HkBuZFNCjVdljUk0BZIuTdrEqbpXHu/kiORxGjMb89meZn9VP6s1JPmEul0OzI4xEbiw
 TENs9bluo+X921E8baAc6VMAAcmzkqglHjAjbb2JoxFHTWYezHisssVvavCsYgXy8b7S
 qB0LOrkPn2SEZ0IJzDcM27LH6Dva8mOi4HyeNbQpu6hMiH2oXrecQSDZyirBwVDk54Ns
 KB4x+Fns/JiGfffXyb7YzEQwe9vhtt9cf6KaKMl0l22snucrT/EwVNcb0ztJ+3Co/0D2
 D8Cw==
X-Gm-Message-State: AO0yUKWRlyLb+haXiPemvL/MHNxwk+k59tjOLo/+vHv94VhRIn7rMYam
 3o/A3wXFL4Jy0xHBIAaUN3UYy+sA0mubSJqwxjLR0LfimEanbg==
X-Google-Smtp-Source: AK7set8jFmpTz8L5bgQ8bRgWE8DhTvOipR5iVCycm19sYEJLIKXaKJET1jf6AOrEGBU2gWmC+5P3OyAkHoDE9eAHRkA=
X-Received: by 2002:a17:90a:313:b0:230:c24b:f22c with SMTP id
 19-20020a17090a031300b00230c24bf22cmr666398pje.53.1675693206765; Mon, 06 Feb
 2023 06:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20230206140809.26028-1-farosas@suse.de>
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2023 14:19:55 +0000
Message-ID: <CAFEAcA9VkFU_bh=aBAOoXCUCeSm1xuR+H+uerd468=vVuDrJEg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Kconfig vs. default devices
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Mon, 6 Feb 2023 at 14:14, Fabiano Rosas <farosas@suse.de> wrote:
>
> We currently have a situation where disabling a Kconfig might result
> in a runtime error when QEMU selects the corresponding device as a
> default value for an option. But first a disambiguation:
>
> Kconfig default::
>   a device "Foo" for which there's "config FOO default y" or "config X
>   imply FOO" in Kconfig.
>
> QEMU hardcoded default::
>   a fallback; a device "Foo" that is chosen in case no corresponding
>   option is given in the command line.
>
> The issue I'm trying to solve is that there is no link between the two
> "defaults" above, which means that when the user at build time
> de-selects a Kconfig default, either via configs/devices/*/*.mak or
> --without-default-devices, the subsequent invocation at runtime might
> continue to try to create the missing device due to QEMU defaults.
>
> Even a experienced user that tweaks the build via .mak files is not
> required to know about what QEMU developers chose to use as fallbacks
> in the code. Moreover, the person/entity that builds the code might
> not be the same that runs it, which makes it even more confusing.
>
> We do have -nodefaults in the command line, but that doesn't include
> all types of fallbacks that might be set in the code. It also does not
> cover individual CONFIGs and their respective use as a fallback in the
> code.
>
> So my proposal here is actually simple: Let's make sure every fallback
> device creation *without* a validation check gets a hard dependency in
> Kconfig. A validation check being something like:
>
> if (has_defaults && object_get_class("foo") {
>    create_foo();
> }

So we could do one of several things to resolve any particular
one of these:
 (1) make the Kconfig force the device to be compiled in
 (2) make QEMU silently fall back to "don't provide device"
     rather than "provide this default device" if the
     device isn't compiled in
 (3) make QEMU emit an error message saying that the
     command line implies that the machine should have
     (default) device X but X support wasn't compiled in

I don't strongly care which approach we take, but shouldn't
we be consistent about what we do? AFAICT your patch 1
here takes approach (2) but the others take approach (1).

thanks
-- PMM

