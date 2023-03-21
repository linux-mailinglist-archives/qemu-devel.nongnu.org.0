Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892DD6C3802
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 18:16:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pefZb-00042z-SE; Tue, 21 Mar 2023 13:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pefZZ-00042a-K8
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:14:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pefZX-0003B8-W5
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:14:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j3-20020a17090adc8300b0023d09aea4a6so20999207pjv.5
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 10:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679418894;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jkuvpVheAWHLThM0d/DQm1CPn+1YmjkT33Vqs0aNNRs=;
 b=Zg4irEBv8AwyLbbIQFCIK32IKJdD9DZZTGl+4c+1bZ8OpWUIXefilC/jiRrY4xjEzZ
 eRAwKX61qg3RD08bPzyfO1SHJy3dGYoQTz+3x1amQ5l1V4zkIePOjMml3344iruD/o2L
 N3R7JKRGPsb4CsvRTRzK4nBTsBmSg9dg+eF9CLZisN+Dp/uDoCPa0KOyp1JEPPf3YJ9Q
 juLXR9XLlZ0mOb18AoPSWbm9B0h5Lo5EXEa08DQ0Xv0dXKMl4Z9XFlcOaIhMI9PY1X7S
 D7dupsdiJGInvF29e0n+VPaAu2APLmfSETvhGSV/V6z0vSHWXHosSqmV4EfX+bvZb5nx
 kmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679418894;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jkuvpVheAWHLThM0d/DQm1CPn+1YmjkT33Vqs0aNNRs=;
 b=5dU8Kb1qQEWA5l1aUFKql86+GTHFEy1JxJyb1DPoich+1HOjX3+DeyiLyXzJxHwMB7
 +4ES9CkYueRQbzXyDn+xcgVNaxemS9k7VbJfqOYJfGnoie8CI60sT1gVDDOEaZQ4QAx6
 M3sgcJXLudTZJTRg/PzrwrcLU08EVetDNb/S/bYXYP/uwDy+rVIEsBff40JQLvmAnhsI
 5PwFE/9WNYhmW3BUoaSA/V3Cjl2sG0GvAi9EcjiKL8501p63tO9ZgsU8t13UX8uXIIT/
 /qZ5jb5aQSxS4HAr3AFGQD8w14ADyassMk7MtK8C7pkvynIKy7MEdVZP6S8KPBkM//HI
 it3w==
X-Gm-Message-State: AO0yUKXoszDW1yfxoEHVSoWCHL6nXcFtXCcPiV71fWj7dF/s+nih6Wih
 Fn+Sni+vpEdR+DB8Exc83iqwWoYz60WYFEA+VoVtD6Yj4K5EnyT1
X-Google-Smtp-Source: AK7set8sXEK6DEdbYym7+3YJYyX3JcY4F/kHi4ie4Vw8/usx7DeMRfX0YptvKCOBxUH62T7E2ntwE3NS1loVYLtGCUQ=
X-Received: by 2002:a17:902:c949:b0:19a:5953:e85c with SMTP id
 i9-20020a170902c94900b0019a5953e85cmr1725696pla.1.1679418894187; Tue, 21 Mar
 2023 10:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230321132036.1836617-1-peter.maydell@linaro.org>
In-Reply-To: <20230321132036.1836617-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2023 17:14:42 +0000
Message-ID: <CAFEAcA-D=aSj6MfThikXfPC71k9WFE3V3nuC9C4mjNuyyRA+wg@mail.gmail.com>
Subject: Re: [PULL 0/8] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Tue, 21 Mar 2023 at 13:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit aa9e7fa4689d1becb2faf67f65aafcbcf664f1ce:
>
>   Merge tag 'edk2-stable202302-20230320-pull-request' of https://gitlab.com/kraxel/qemu into staging (2023-03-20 13:43:35 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230321
>
> for you to fetch changes up to 5787d17a42f7af4bd117e5d6bfa54b1fdf93c255:
>
>   target/arm: Don't advertise aarch64-pauth.xml to gdb (2023-03-21 13:19:08 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * contrib/elf2dmp: Support Windows Server 2022
>  * hw/char/cadence_uart: Fix guards on invalid BRGR/BDIV settings
>  * target/arm: Add Neoverse-N1 IMPDEF registers
>  * hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
>  * docs/system/arm/cpu-features.rst: Fix formatting
>  * target/arm: Don't advertise aarch64-pauth.xml to gdb
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

