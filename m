Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BB3CC992
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 16:28:35 +0200 (CEST)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m57mU-0002Ic-IB
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 10:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m57lK-00018u-IG
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 10:27:22 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m57lH-0000dF-3w
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 10:27:22 -0400
Received: by mail-ej1-x636.google.com with SMTP id c17so23567570ejk.13
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HD6k5+KQK9qxAUFqHXQSV7byPqIpXfC6kRNrqVkBKEw=;
 b=Fg3vgS32c3fcwDVGJEzVZyzSjpjgPEJOY06Xbk4Icxz/3/BtrmwnjDV5mbwmjXUroH
 Bdper/zbDj3Vmo+rYXoeV+pyVHZrFtdTWKDYcBOtD37uVGC+eGGWQPrV+fAbhtkZTynF
 /ZC5MRBBDWN5ZE76DEQf2hirsG7qc7I06gHR63pyngl+T34/ZoI3WdOyk6axQcxznELS
 gf2Mn35K59iP576ZG95FWtZhfsAAPzYRrh3x2iWiIxWvGzcr8dBoKKxAndnRUcPohIYx
 LQuyU8k5SHO+sUbwm/myBowIiW3HIWlTlyuRATmpdPWDtM6pYpgDBKWXG75Ew84SlFD1
 ylwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HD6k5+KQK9qxAUFqHXQSV7byPqIpXfC6kRNrqVkBKEw=;
 b=ZYR3RGZQIy1mrvygD2BiObdl+9uzD9g28RoVEPwEDvH4WvBfRej8z/w81+xKIFmWY9
 rvPmxAOVYENDec94CYKQZOa+yoSc4mT+MrBZLjXzicaYBQQV5nuuuNPGBWpUOY64tc/L
 NjBQmiy8qUy3fzLSzqnC0/aiPLKZmE+1BUhu5PlgHBcgBFgNH3ZR1k2uo3NThdyi3hUg
 GAgje3w57VYFG4z8XjVk46aUuyLavDJoB5LAhPfFiBZxIrs9F76jVgC2lDnRP7yBwpfu
 emlcUVT4HUVTmdb9CtjRzxfGVj9buCag4neAAkJ3y6F1UglXk3tDYriueZ0+b/e37Wi4
 fFcw==
X-Gm-Message-State: AOAM531jxlUaADIhzYC60txldEwxIFSk1HzFOwhCEXgmqtvz9Cj6yCur
 wpqsh3LVOHnVAZWhQIuDO/t1APQAaMki0k4MS6V/BQ==
X-Google-Smtp-Source: ABdhPJwFbu6jUELXCipj25hxSmLBjRqAgr9Ar0Ds+xPE5Y0AFNhLy7HeM4WhSAXlrfBfE6geU/d/qQB2gd+PiTdjNPg=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr23253272ejd.250.1626618436962; 
 Sun, 18 Jul 2021 07:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210718131659.55783-1-ani@anisinha.ca>
In-Reply-To: <20210718131659.55783-1-ani@anisinha.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 15:26:36 +0100
Message-ID: <CAFEAcA8zP8k2A-anMv8T7ia67491PinhW3FevBcXCnAZ7gXpfg@mail.gmail.com>
Subject: Re: [PATCH] hw/pci: remove all references to find_i440fx function
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 at 14:18, Ani Sinha <ani@anisinha.ca> wrote:
>
> commit c0e427d6eb5fefc538 ("hw/acpi/ich9: Enable ACPI PCI hot-plug") removed all
> uses of find_i440fx() function. This has been replaced by the more generic call
> acpi_get_i386_pci_host() which maybe able to find the root bus both for i440fx
> machine type as well as for the q35 machine type. There seems to be no more any
> need to maintain a i440fx specific version of the api call. Remove it.
>
> Tested by building from a clean tree successfully.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/pci-host/i440fx.c         | 8 --------
>  include/hw/pci-host/i440fx.h | 1 -
>  stubs/meson.build            | 1 -
>  stubs/pci-host-piix.c        | 7 -------
>  4 files changed, 17 deletions(-)
>  delete mode 100644 stubs/pci-host-piix.c
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

