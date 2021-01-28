Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A65307735
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:37:01 +0100 (CET)
Received: from localhost ([::1]:49652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57To-0002zz-Ap
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57S6-0001tc-P8
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:35:14 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57S4-0001yB-67
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:35:14 -0500
Received: by mail-ej1-x62e.google.com with SMTP id l9so7804637ejx.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IGOfBR1ojRy69cMcPWM88r3IGetpzt3k2qpwWb5Xx5A=;
 b=z15ofsgo7zd5dgIDkVXsqvo9knEG1uJwpCdCARwmMwwPDRRVz9gXeZqFtaCtdSLni+
 Fq7OOgoVYS/TXvitBLtAHV641l6n4csRlURaYElBkFj0sXGkGe+21AXTtOWz3qmAcVuH
 CoKzIr5L+vE32ra0w5Uybxy2lZ0y9wHC6rZAFm/aVJUEhkxZOOrgHOiAOYDc6hL77EQ4
 UdPoy9zjAi16URRXnPgQkhIS5kstLVMxQU7HU8yFgVL2C69O3LEKN5nxEnnZQIAuvnkU
 O6KImi2qUeELA5AVLuEn3J+AUorWl9pL4J1PvsGGvSCi4u8khwYmENYkAY0BR+F/YTA1
 IYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IGOfBR1ojRy69cMcPWM88r3IGetpzt3k2qpwWb5Xx5A=;
 b=jJmFkcaa+ntnNRERqIxvIgobi8P+b6vf/sHo1abYCbaJdt4+eF8tiRFpbutwVzYMi6
 5McjFhKYq6kIghxkcAyUqMUXzTuFYi8vK2wshkVwivWnZfMI3+Rvn3mbAdJHmTV3j96Y
 JDOOw7NN08ZBkucOQkb+EVw+SIQY51Ww2igW9a/k7/tdAAlQdCZiMh8PVQpoGqYJOUaH
 9kKAjolZaHavarFJV64MXviGX55JKeChP1FZApTh4FTfWOfJS5prrbnG4ev4g9l6ig2h
 hn+Vizglj4mk3hBUZu7f5mmeVlQz5aOxujormN8TlKsUbTBSGja8J3TLT9WEOVaae8qK
 me0g==
X-Gm-Message-State: AOAM531z2XZ1UFfFIhYAa8/MAb9dWN5xw2GVPzvVLuhSpmuIeNXsJxBq
 HD09XFqr8kwI4IYNINp3txu+2/qHwvu7GLoZC9oo5A==
X-Google-Smtp-Source: ABdhPJz4rogvJkQs9UZ/VH+PQKSgdbDLZJVh8Hua7C7V6tbMETWfovbl50F3k8g+KARZKiPHBYA5uJfoBVq/4HTXUOk=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr10947434ejz.407.1611840910834; 
 Thu, 28 Jan 2021 05:35:10 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-3-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:34:59 +0000
Message-ID: <CAFEAcA-rtKVGNMKc8UaO=BGe4snqi6B=vC=9o50onFmFqnep+Q@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Usually the approach is that the device on the other end of the line
> is going to reset its state anyway, so there's no need to actively
> signal an irq line change during the reset hook.
>
> Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
> imx_spi_soft_reset() that is called when the controller is disabled.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

