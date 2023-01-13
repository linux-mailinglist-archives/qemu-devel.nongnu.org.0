Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388CB66A143
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGOGq-0003Gp-12; Fri, 13 Jan 2023 12:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGOGo-0003GA-48
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:55:14 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGOGm-00023Z-FT
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:55:13 -0500
Received: by mail-pj1-x1036.google.com with SMTP id q64so23138733pjq.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J/KZwcwmi0unA9z0/0HoyFdkfK8P7sEBzYpjoGIw+4c=;
 b=XPnHwf2jGp72mww65xKzTdDzUCwqtlDpCFU9dj4JSGHfIBaG6OrgZ48CJl6kX2NaR1
 SiIAnbH5SBIvjh/9frtaPDaDZ7VAUA/HIgQxSxSDxO3XWtxe3DLfHXCsAkobeUZ7XKf3
 099vn/B3dYzMguYhaSzlkxPngpC5iQxqvTI7e3V5NfResFtJsvDsO2WrimQ/CKTAC2sq
 iEiJfXfJNGrKgQvfTALE9r3c++OciYGYNlvjnlIPfVfKwSFw42X2PYfOqwJh1sEhT+bo
 qVLZdR1tR2IgxssdcU1zQph9FX3sRTTHn9kBgaWbUPAAgMo04t8o3UWhNvU6KZFC5UWi
 SFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J/KZwcwmi0unA9z0/0HoyFdkfK8P7sEBzYpjoGIw+4c=;
 b=XLfqm3siERmSbxpgHV/Z9QsDNNDrUioctI6HB2Fw/mHPpuaqWEK0PC0qv6ZlTCXHRE
 yF8hr364tTTfCMLzCkgHdxIsU0jLTSMogl1JHsnitu1JDqZ3fRCL4WI6KKO9taiY/Gq3
 48BtrGdd89cGQ3zcEsuI7nQ9QVs2bmIi9Y/p09Ddcwld2gQ0hmzjSsNdHLyWS0sYl+e3
 Q2P1aOgf8gki7xEWTR9uw0h56ei4tAzq/+5WhmgnyuWtEbr1OOvTsiWMF2D0pGii09YQ
 Jm7IFXT4zLaRIwk/aSA9gboXiiqExI5OWeRw3n83FDilPjlrEe62JGeHrozuFHWQrKve
 7iaw==
X-Gm-Message-State: AFqh2kqawH8Yys+ZeQ9q5tLrPWwDWpL6a2nYxN23TGeAdvL51Fu2+wIk
 sK7fZxqYy2gdvyxvzoomPx3h0t5izsob31U9Wljgnpofn0d+0g==
X-Google-Smtp-Source: AMrXdXuIuLFrW0cgCjvnVoQUNJUq6Ccp7EL5n5ygN5aW7fDkuyNIwMGii60+eROz8x5pW3pRfgWGObZwOFGzhVjyiBg=
X-Received: by 2002:a17:90a:f50b:b0:229:2631:e8 with SMTP id
 cs11-20020a17090af50b00b00229263100e8mr283679pjb.215.1673632510959; Fri, 13
 Jan 2023 09:55:10 -0800 (PST)
MIME-Version: 1.0
References: <20230113141126.535646-1-peter.maydell@linaro.org>
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 17:54:59 +0000
Message-ID: <CAFEAcA8uWWXK44dWPbA+GjtzMX=oH+OkOtSqnR1JXD7jB_nW1w@mail.gmail.com>
Subject: Re: [PULL 00/38] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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

On Fri, 13 Jan 2023 at 14:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit 3db29dcac23da85486704ef9e7a8e7217f7829cd:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-01-12 13:51:36 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230113
>
> for you to fetch changes up to 08899b5c68a55a3780d707e2464073c8f2670d31:
>
>   target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled (2023-01-13 13:19:36 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  hw/arm/stm32f405: correctly describe the memory layout
>  hw/arm: Add Olimex H405 board
>  cubieboard: Support booting from an SD card image with u-boot on it
>  target/arm: Fix sve_probe_page
>  target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled
>  various code cleanups
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

