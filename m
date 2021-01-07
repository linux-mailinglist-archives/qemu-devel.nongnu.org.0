Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54582EE775
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:10:06 +0100 (CET)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcXm-0006Fq-0d
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcWF-0005TJ-1W
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:08:31 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcW8-00034Z-HG
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:08:30 -0500
Received: by mail-ed1-x534.google.com with SMTP id cm17so9129402edb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 13:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zMl9HB+CoeXivwtGRa00mnivVk8GGwQAiI6UYMzRyho=;
 b=cXMp+Cy/JMgy9H01KiWx4ox09DK+ha8i9819ixe4IZnC1PIkjqlm7z+s7i3uUOsc3R
 WP5AG5FRVIWqK2cODy6n8fjXpkXkUGHLiiQzEsMuTPhfwgQk8QbQBYNRi99ZJYtSW+af
 QLFHah2y/ygnez4HR/zBEKC6aVCu9EBHvMFHN0M0wfySdAPIwGhuKaYfkFjgTYRP+GOZ
 bNrGKosxEPhfeFDj/ZvP+TY8nxsEI1cEFozxoKkEJWTzhfI9eg0zXT7lkcW3Gyw4buyd
 2thOqB+UVgjMu4E76tSvk3VfSSENlyIwLBjog+z64ko9lULsEFqyR7oOyFvRbv+5WInS
 N7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMl9HB+CoeXivwtGRa00mnivVk8GGwQAiI6UYMzRyho=;
 b=Kyj008JRrSygNMa54RRiiOMWkgOUYUyxaklan4duVoadVQSpdMC1q9BxqdWz0QFkUf
 8PRCyaoQglSEieGWZljJSzJ6cludUejvWktAUYlLF5dG8j5gL9vgoa0pIOZ7wx+ng671
 0z4+sBeKe5xW2a8J1IgWHxgJrehxKR/VZZJY3JU+PmADxxPpgDrvKxIxvc/cH6elguWU
 MC7UrUmHW18uS+/guRAH6yxOy9BTbm7A84Ok0vgfYCFJ0vIvXV/50nh8S1w7TXXIqRdP
 lBK2eA/npaNbJyIr3ehf3vbsBpOfT62yUsyP+bblIfpnsuUrCAYQp5hLaLAsAM676b3/
 +LVg==
X-Gm-Message-State: AOAM533U6cnG3Pp7HNSBQPZWq1jZvA5sdv+qEIORnsrKdm3CfZeLXGB/
 y0z2G87NqaSEV/KnlZXJZTQdm+Xj5xZOMcQk3LwFfQ==
X-Google-Smtp-Source: ABdhPJz0z+v0gdhv3jktfNkT9wNFyLLzwqM6FJQGE0im0+EEEA4XwJ1oUJRrAdPwh2QHh8Yp9MWII6s9o5vALx6kyKg=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr2971927edr.251.1610053703000; 
 Thu, 07 Jan 2021 13:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-7-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-7-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 21:08:11 +0000
Message-ID: <CAFEAcA_dHwgAPcDxPW0xWcGrA=zW46Y+s79eK3KEt4A8m4=Emg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] hw/*: Use type casting for SysBusDevice in NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> A device shouldn't access its parent object which is QOM internal.
> Instead it should use type cast for this purporse. This patch fixes this
> issue for all NPCM7XX Devices.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

