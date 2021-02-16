Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57CE31CBA6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:17:52 +0100 (CET)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1Al-0006gg-TV
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC199-0005w2-MH
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:16:11 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC197-0000rQ-Dn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:16:11 -0500
Received: by mail-ed1-x536.google.com with SMTP id y18so12246369edw.13
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yj1oFFEoFpZlmKl9lKMBKEoc5H9KYa/mzAusSDfjrv8=;
 b=Tapsl4/Zbr3W4jxXvXh7fTcIKdxU2O8+HgH9k3qU1fOFa+GLOYZiunALlbmCvP0ryg
 N+1WRKqApqIF48/VaTLQFPuNy4BXb10wulAE8yDENEKnLLz/yF3CgYsRS/2cLl5ELoUi
 N/F4SUL1feTfikjBUyGS7q7LrXdafQK/KnbAOyyjf+V8J9ytyf+kNtQTexXWUEgyTNtY
 7zvQl6YnmZm3+XqKPRcmiqwxiRz3XUOvnR8oAVZKzHbwVaWIOCdBWXwR97kmjcJXpEm6
 1MvLqzlC+GB2SZEL1JrTPmjE3m3O1xIqS9IVvXJuC4r45HTkCaOZ8oLUJNzRTXRFNR4S
 o3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yj1oFFEoFpZlmKl9lKMBKEoc5H9KYa/mzAusSDfjrv8=;
 b=QZQMh6+1W2SwtK4Fwu4Gvml0ingBtH7aSOurOvX839xAOAUBSjeuZKeuGgyjPJZII0
 h9FoWd1GISC3HlAjguXJVXGYNZqzk17dKQJaBwoh6Ps3Rgqg0V3CabwZ2urS399qF1TX
 nUPeABX33FY5Bzd1pM4wUDjcXT5TiuDeu8eoFV+79ITxCGJpjy4kDHyVbhurcMzXZ74n
 UWaNBs4Z8kBkZvWcp0QnpFmgm710Ek5QzX80pSWdlNXErNwbKiah5E0csFVYPgTLLN8o
 542cZ4WSkmj8lKfoQoi6Zs2nfVzGHOVMT7pCiMXjrsFGzSSP8GTKidpBfvT+QbpF6jkJ
 yxGA==
X-Gm-Message-State: AOAM532wIgN5CCirPlN4duK8cXXDeWYFYvjqxiWeOy2U1zKRg2+1fVOo
 H7TYC0wW/VHvOw8nxRKqXDnCcqCJp6U5JLzN7OYndQ==
X-Google-Smtp-Source: ABdhPJwqsoUSd8AxIIsKs1M7ViD/3XwCnf3fuolWi1zYlsxVWQLBVFxxcqUYz8eRFp1nK9CuGf60lMphVyLvyTRYs7k=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr20960198ede.44.1613484967608; 
 Tue, 16 Feb 2021 06:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20210210220426.3577804-1-wuhaotsh@google.com>
In-Reply-To: <20210210220426.3577804-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:15:56 +0000
Message-ID: <CAFEAcA935ddobJrxRkNtxdBv6-Mm3THwTLd8Vfcg8hEwjpr0xA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/i2c: Add NPCM7XX SMBus Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 22:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set implements the System manager bus (SMBus) module in NPCM7XX
> SoC. Basically, it emulates the data transactions of the module, not the
> SDA/SCL levels. We have also added a QTest which contains read and write
> operations for both single-byte and FIFO mode, and added basic I2C devices
> for npcm750-evb and quanta-gsj boards.



Applied to target-arm.next, thanks.

-- PMM

