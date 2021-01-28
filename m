Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15890307734
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:36:35 +0100 (CET)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57TO-0002P6-4p
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57RM-0001P8-MK
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:34:28 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57RG-0001g7-Dq
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:34:24 -0500
Received: by mail-ed1-x52c.google.com with SMTP id f1so6585924edr.12
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FDbVfjV0OH07Xlau7gYTFjUmJwQAphIIVLwJHzEZa2Y=;
 b=qUmcW5Jbih0a9zAcxiOt3QM9cabsUqNeXqt2kyevHcZ0KC6ljbTWh9wYgeZgKhixtK
 ONr6zMMQIoqaar+AidC3HQX6hBmTdkKFgsKaXQNUzydEvBL5C+y2JsJlHyZqBd6ovHDN
 ASZTdTyAoy5YlFZFRlAKNFDHqFypvP8pJceyP3BaqRKjMEGd4U67slBAdpJyACfND7LS
 RQqnUPx7LxlQ+Rn/Qfy891eSgg7NXCT75p4UJyfq+Lg+8YOs7SAqoV+rDYpxS7tGOej1
 alOVKpnFf05kC7RlC0/lfRJ8UP9EoUgHN2bi3s28fbmP+BOEm6PG76pab/IrP6hyBzvw
 Lijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FDbVfjV0OH07Xlau7gYTFjUmJwQAphIIVLwJHzEZa2Y=;
 b=OZNZlZ1E7LUmJVCBLm9Z9sl9e4lDLME5Fk6NEl4oruiH3AhUutZ8JhaeSaNtELmQof
 h4Kst/ULh/xmU54xIvDHAGw6LrNzfx6t6DCP9UPF6+zG8OYlP+3RN2oC8pjltetFiK78
 rJCqsUzRdjxwohfxDFHgqOnC7GDQkaD5+SWRUUzZXZPqKg8WBYjn+kekskk6WSrST898
 utkB7dzmj7r7MnXzdmzrcSy9wlyJCAqJxXcNYOl7X9EjPiVw3IftPhFIsvgtVNARh3ca
 XqUh7EFf6l9q2aiFhcWi3OqnQYwE+FyLhG0SgZmYPaaHmOp1ZidtUejVqV/ISbuzG3Ec
 JTHA==
X-Gm-Message-State: AOAM5301OFLHpD5OO+Wkq3pD2FwmquFo/pJj0cd+BhKMzEMkhs9zkAgR
 o2vBPXaRZp/9A29o08Ov5frH6J7sUieUK4d1nkITXQ==
X-Google-Smtp-Source: ABdhPJztztM2F9WUrSF8YR9QC8W0qoAWl5dgpEQDXq+q00x7eiCeo8PgmwHPS87uhjDJscImVqiCWT534Mw7OOGH+sw=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr14092231eds.204.1611840859716; 
 Thu, 28 Jan 2021 05:34:19 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-7-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-7-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:34:08 +0000
Message-ID: <CAFEAcA9cjJo8W6oOF0uASQDGLuXUdgURkammsXkJOsLkaZU3fw@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] hw/ssi: imx_spi: Rework imx_spi_write() to
 handle block disabled
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> When the block is disabled, only the ECSPI_CONREG register can
> be modified. Setting the EN bit enabled the device, clearing it
> "disables the block and resets the internal logic with the
> exception of the ECSPI_CONREG" register.
>
> Ignore all other registers write except ECSPI_CONREG when the
> block is disabled.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20210115153049.3353008-6-f4bug@amsat.org>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

