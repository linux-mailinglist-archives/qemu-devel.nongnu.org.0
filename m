Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7D38021E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 04:47:24 +0200 (CEST)
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhNrH-0000nA-9A
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 22:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNpt-0008G6-Um; Thu, 13 May 2021 22:45:57 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNps-0007Bx-BF; Thu, 13 May 2021 22:45:57 -0400
Received: by mail-yb1-xb32.google.com with SMTP id g38so37175038ybi.12;
 Thu, 13 May 2021 19:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2LfEbFEs79EOd5GGUGJoxezKXLLMD4tromp40I6KEw4=;
 b=P9kWk6olaZM2XiqPk+EhoUUWh1D3YIeWJ3ChiZgdhEWN0d5oTxoCugjtl/56jMmJBL
 aHM3erszoCHbkF75xsQ3ZRYXdCWnR2QFhx6HZ0NWB9BAFnRxUy23d1tje5TqKQ2+cMem
 PIIhiI/xjWVrBLND7qlwKf3TolwmIfpPMIX0gkJ9MrnqbDyGymD8QCsMOtWUdeW+dvZf
 MLCHY6C9Z8GcY97Zj2NsQln7HgUE+X4+yhCTaybKPIxJRmAArxJ+4V0ZZpsfdnIZwEo1
 nYmYUUXTCdG98VlmMLzKNLGRHNDFSg7DPavFgRNT6XjnaEhTypjYEyJ1yFYoMqPOwNE7
 yD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2LfEbFEs79EOd5GGUGJoxezKXLLMD4tromp40I6KEw4=;
 b=t1PGTOypD/j+dYcalM6wivXjgqBbUd9wRi0AvUbbtnBWo6/n9APq9uD2zt28al84Up
 nb6LdyeTXhHn7YW62nAoxRySPh7KvzMQALkQLsmJqctQx8TLAcLrY0jUVw6gdRDRkI/K
 +m8kmsRfkf/h7DACC/tqvfGCnnsltJ7MffdmiYKHolBXua/p96qg4glge2LQIkCfAvOf
 m1v1QtPtpkQsJqvZ+vtyd+9z7FZCU9gTSmBjJwjqCqqhjZ3dgLeBHpnEBZEPMrfymAaW
 T5DOQOVnoKfDF7nd7+Lzgvs8VSzHndeLkXYXXUBnhFVSKgZ5s+j/KiZkEhiY0WROmt15
 Po2Q==
X-Gm-Message-State: AOAM5306VBH6+o2a038rKhGF4tZIC/S656JWJ7bny50XnG3Ezj9yxjRY
 BMqSC22/K7f4sXsKrM9tAjiqdaJEJHwPMzwdR8AEzrX3RWpaUA==
X-Google-Smtp-Source: ABdhPJxWxppN34IR5n+UuCDVKD8NRcRRbOCvVVXp8/POhjaqRy58H5rNYCK6dArYPEesD0mJMl2zTEoLvtbr973bldc=
X-Received: by 2002:a25:aae1:: with SMTP id t88mr59274268ybi.122.1620960355092; 
 Thu, 13 May 2021 19:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-6-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-6-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 10:45:41 +0800
Message-ID: <CAEUhbmVym+XP6XQ2sA_MsVYe7CNeLKcjds0nQiGhd3Bvr6nT0w@mail.gmail.com>
Subject: Re: [PATCH 05/10] hw/arm/Kconfig: Add missing SDHCI symbol to
 FSL_IMX25
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 12:56 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
> added a dependency on the TYPE_IMX_USDHC model, but forgot to add
> the Kconfig selector. Fix that to solve when built stand-alone:
>
>   $ qemu-system-arm -M imx25-pdk
>   qemu-system-arm: missing object type 'imx-usdhc'
>   Aborted (core dumped)
>
> Fixes: bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

