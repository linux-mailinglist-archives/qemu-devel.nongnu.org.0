Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FFB6AAA54
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:00:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYSQi-0001mx-Qf; Sat, 04 Mar 2023 09:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSQg-0001mZ-5r
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:00:06 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSQe-0001Vg-Dc
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:00:05 -0500
Received: by mail-pf1-x42c.google.com with SMTP id cp12so3176580pfb.5
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 06:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677938403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VzctX7FWfeWGAi+HDiPeRGwFwXaY6/VUBKSw63TTYuc=;
 b=ApqJKceAZmPAnlFN8ILhQQY3nQFPoI0X761MG6cKuamiZ88uVtOhGOH9BqFr285XM5
 jVdZ4Zw7llJL6HlUvEuknLfdeettJ6O+d740i+HTpJCwObvrde2ULxAQdMCWfuxKNef4
 BAQCeMurUNWK8BzUWYIyRPZ7KkRTHjkgeNFcz6ARc6UZTcC1A5euO5xWYsbFzZP2Exw/
 mD5hqT5GHloInk4FR5eeyC2ZLcADb06eLMfZ4Ad6GQ5nNKu6xV65BRLtiILTP1SCuj1f
 lQR6EV3VJ5hhD6WN/hz/CeM2eRpvLio+MhcONTsEe0Vvbt7eMn9ng46ZHpBa5JJLBBqa
 2z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677938403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VzctX7FWfeWGAi+HDiPeRGwFwXaY6/VUBKSw63TTYuc=;
 b=epW/Mmy/vVgjql0MiInCbP/+0722b+ZbXfilb0eZp8obeZWwHALoYLJEszxqr1QqGz
 EY4dis0UKDF1/2XIb6lH9ME39rHkt028LYbf/Uz5bpJWqNPSIrXbLvjfDWKEMk+PDMd4
 OMzzxns16dJhSWWrVZ0m/ujuQ38AO7GiuptUhd66ZE+hR5fw6Gk+2L5pfprAeqYU3MUH
 WTOlCO6wUgfVOlstT5py7pYfmVDnYRymtb8XhEf2KZjJrK0+7Wxjvzcj1UncdVNTH9jB
 kNMmgcgP/OizjPjhf+6kDKeTUsgtnki+lk6T7zP+EqXWat8YioCC4/8eJE4nhZZFK4fH
 /eGg==
X-Gm-Message-State: AO0yUKXfa60t9QR+j1qJv80/DZmTZdHnxDjpDSL1pcb0sKmBkXuae1sH
 QmSjkEdJsJIrNIqwfTZoyNYAPnisb8pVHfIQJb5xcw==
X-Google-Smtp-Source: AK7set8KPSos8JNhZdcCg9FF7+p5tDYFj1N+F/SP/9R5hZlcPhpadIgs5PCSJ9F+5JSNfhsTMs4M24D2lAzPl80evsI=
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr1632203pgf.9.1677938402912; 
 Sat, 04 Mar 2023 06:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20230303024103.356250-1-gaosong@loongson.cn>
In-Reply-To: <20230303024103.356250-1-gaosong@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 13:59:51 +0000
Message-ID: <CAFEAcA8CUcX3+B26GUbonoWCh+7+eC0ARs1v0W5-1x1LT_2pJA@mail.gmail.com>
Subject: Re: [PULL 0/5] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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

On Fri, 3 Mar 2023 at 02:41, Song Gao <gaosong@loongson.cn> wrote:
>
> The following changes since commit 262312d7ba6e2966acedb4f9c134fd19176b4083:
>
>   Merge tag 'pull-testing-next-010323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-02 13:02:53 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20230303
>
> for you to fetch changes up to 0d588c4f999699a430b32c563fe9ccc1710b8fd7:
>
>   hw/loongarch/virt: add system_powerdown hmp command support (2023-03-03 09:37:30 +0800)
>
> ----------------------------------------------------------------
> pull-loongarch-20230303
>
> ----------------------------------------------------------------
> Bibo Mao (1):
>       hw/loongarch/virt: rename PCH_PIC_IRQ_OFFSET with VIRT_GSI_BASE
>
> Song Gao (4):
>       loongarch: Add smbios command line option.
>       docs/system/loongarch: update loongson3.rst and rename it to virt.rst
>       target/loongarch: Implement Chip Configuraiton Version Register(0x0000)
>       hw/loongarch/virt: add system_powerdown hmp command support


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

