Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAAF5764BD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 17:48:22 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCNYD-0003W2-11
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 11:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNVB-00014W-DI
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 11:45:17 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:36581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNV5-0003wM-CR
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 11:45:13 -0400
Received: by mail-yb1-xb33.google.com with SMTP id n74so9063092yba.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hRI3oAsXndDzLe4xroIUW7CwYsgULF/Lq0h7TgbMZGk=;
 b=vcoO3mf4qrB9li2JXaz6s1bgGi4Y+X8DI5LXQkgIQutCCcyOe7XjIYGE9OP1cQ1Cnb
 eb0nsQOa7jULlUCJ6uCZ9RoXxflswO65Pb97x7HDo1JIV5P1Ev8Xx9Az3Cozx0Ghfnpi
 MnFxq4ARueGcg3bBJhnkkN7kO+4OpkitgFG5hx9+9aK5jxy3nPDOUZoGjqH34j5hE0yg
 QqHEJSW6t+RednC4cA3VeCbFRA46gGiW/ZLaFNJPlX8IKCWF2FyWIPugKch5eI4Cgq2Q
 ThtBCkMFOKeJdPztcfMGbEgnkGGLaL0SZn0v3axbKKDpUTe/er82ehxJ/YLGMOG2Vyu+
 VfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hRI3oAsXndDzLe4xroIUW7CwYsgULF/Lq0h7TgbMZGk=;
 b=bTrI4HmjZFbIpGT0ambRVjWIEydzPHEfyVI7ajDaaTf0Qur+k3oe2k6AwY40l6Lnmk
 MRioqmv1fHSuIRh+uWs64H04vvJBlTxyK+ySOOBIBSaNLg4Gz1YYhYmHo1PEO3IrRUYd
 IQlyHmp4tJqlT5Lnk8ZI6y9aCEuDXYzNRfrv53X6p5avV7XACeTx4sxUwr0JRtBBXNud
 d8DsCOsvi5N8kjKO7Cm+V9rN9lCfrTQZ3UJdSbbDlVwagP5LSdwjkKFbRNzxHgeADfDZ
 qpjo/oWVD6YiG8em/cuvcAUJz+o6gShGzmuxjWKEx5ddgb15i23Y5wL58oOeh/uFj9eH
 yvTA==
X-Gm-Message-State: AJIora8PxvDVW3LUG7VnH50Hg1xCO5ra3TwKBz2fKH7ojngHnRZA6TMX
 SLa8OK4V0JyGL1H/0ynpsPfrQZ1drm39OcsLSByCjA==
X-Google-Smtp-Source: AGRyM1u1dK71K8QfAFVBbrTxOfpDFgtjPGJbbUCgsah1KNxEOefHkuhfDU+39h873u0NS4BOauxOSbZTqscBo3i5Nus=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr15568708ybj.479.1657899906209; Fri, 15
 Jul 2022 08:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 16:44:27 +0100
Message-ID: <CAFEAcA-DkDAvwaNOSQ3c7xTEsJcLGcp7xKsg61Jd-jUd8P7H1g@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Misc NPCM7XX patches
To: Hao Wu <wuhaotsh@google.com>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, armbru@redhat.com, thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jul 2022 at 19:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> [NOTE: I'm reviving a bunch of patches that was in the process of
> upstreaming a while ago but paused.]
>
> This patch set contains a few bug fixes and I2C devices for some
> NPCM7XX boards.
>
> Patch 1~2 fix a problem that causes the SMBus module to behave
> incorrectly when it's in FIFO mode and trying to receive more than
> 16 bytes at a time.
>
> Patch 3 fixes a error in a register for ADC module.
>
> Patch 4 makes the ADC input to be R/W instead of write only. It allows
> a test system to read these via QMP and has no negative effect.
>
> Patch 5 adds a new blockdev IF type IF_OTHER.
>
> Patch 6 allows at24c_eeprom_init to take a bus as parameter so it can
> be used by more use cases (e.g. behind an I2C mux.)
>
> Patch 7 allows at24c_eeprom_init to take a drive as property, similar
> to sdhci_attach_device().
>
> Patch 8 uses the function defined in patch 5 to add the EEPROM and other
> I2C devices for Quanta GBS board.

I've taken patches 3 and 4 into target-arm.next as they're
already reviewed and standalone bugfixes. I had a comment on
patch 2. I'll leave the IF_OTHER patch (and the patches that
make use of it) to the blockdev folks to review.

thanks
-- PMM

