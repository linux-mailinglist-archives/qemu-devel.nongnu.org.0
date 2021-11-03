Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C4C444105
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 13:05:19 +0100 (CET)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miF13-00053Z-NL
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 08:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miEzD-0003xs-JR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 08:03:23 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:36430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miEz1-0000Lm-G7
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 08:03:23 -0400
Received: by mail-qk1-x72e.google.com with SMTP id i9so1974644qki.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e2Za+JgDWGq7Zkr3qqrbXbY4ReiXtDU837SMntvLBY4=;
 b=yhX19lbQ0W7mX3dMxsEfRuyFJOWJ8NhVbOd1zpTa0rFfLX0T4JDJPb0ByKh0SMJFB0
 lO1iJsSq/jY+0wG0LUlZPX+3oJVJQWUrmLJuv6VZwKRRzsQ3ScUwpn0ViEzA52lWCPLf
 d+0jXKE9r9WsMUlgmxyXVZDKhzcs5QDrrzi4mt2pD2/GOMWp3+3CUWEauFQeKOt/Jlrq
 SN1GY4N9RzYeZ8DT3ozUY67MKRtblnwCulqd7fxcfKiYGGQxm6L2FquvYhU0UH4JVtIu
 rDq9SYYVjKha8H2tO5WZFIAScwNKU7LHUFZze+SBLPg2zBk7urFPC0rDow39M86BnH6j
 4VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e2Za+JgDWGq7Zkr3qqrbXbY4ReiXtDU837SMntvLBY4=;
 b=rn1e5A8zTTLseSveW/nT4y09aX+vVc6dSC2y49fo+aECJkML3adnSt2lYJc5/DuDg/
 clqu7lLHId2sarVJfr4FGwZ5GP8i/4t6RVBZdL5Gp6r+WDP8U6IKoT7OXc+Siw2XOzZo
 D5diB68yGUsq2QSKQ1lZDA6XBtr8Ly0dq5Zqjtl2fNdxBZHEnxbKysL6B3ZyNjaNYOLr
 FNms+76vN8wgL/VsmEyLtxuggbUpJp/zrJvx1bdn8qerzk/CyNEJwCmlHkXKt0bSFkga
 MLVOhcZl/qbtQoi0cEBmNB6TJKMvkS8wkHYI8J/weYo2sQHMangH5PziZ4wPQT7PrMBD
 FpIg==
X-Gm-Message-State: AOAM533ugpPkYKn1NkCHne8berj3LITk6K9mczH1XoOlZFpFzK7iGbL6
 Ft84KNHneLe8rDxqopfa+oFN4w==
X-Google-Smtp-Source: ABdhPJzcUe1G4aCjzMN7LFm0oXPUkZK1W+8+tQYjnERZMLhTtXBR+MHBtGFaKnL6sjbwROKhSS9USw==
X-Received: by 2002:a05:620a:4049:: with SMTP id
 i9mr14327045qko.320.1635940989106; 
 Wed, 03 Nov 2021 05:03:09 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id u9sm1425723qta.83.2021.11.03.05.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 05:03:08 -0700 (PDT)
Subject: Re: [PULL 00/10] Misc 20211102 patches
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20211102162619.2760593-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39461c49-727f-7a54-a0b8-a8774c8e63b2@linaro.org>
Date: Wed, 3 Nov 2021 08:03:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102162619.2760593-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 12:26 PM, Gerd Hoffmann wrote:
> The following changes since commit 8cb41fda78c7ebde0dd248c6afe1d336efb0de50:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/machine-20211101' into staging (2021-11-02 05:53:45 -0400)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/misc-20211102-pull-request
> 
> for you to fetch changes up to 58d7d4c7869cb3addb0714aa7b6bd88f2b6b7edf:
> 
>    usb-storage: tag usb_msd_csw as packed struct (2021-11-02 17:24:18 +0100)
> 
> ----------------------------------------------------------------
> MAINTAINERS: audio updates
> microvm: device tree support
> console: chardev fixes
> misc: deprecate sga
> usb: fix struct usb_msd_csw
> 
> ----------------------------------------------------------------
> 
> Christian Schoenebeck (1):
>    MAINTAINERS: add myself as partial audio reviewer
> 
> Daniel P. Berrangé (1):
>    hw/misc: deprecate the 'sga' device
> 
> Dongwon Kim (1):
>    ui/gtk: skip any extra draw of same guest scanout blob res
> 
> Gerd Hoffmann (2):
>    microvm: add device tree support.
>    usb-storage: tag usb_msd_csw as packed struct
> 
> Nikola Pavlica (1):
>    ui/gtk: Update the refresh rate for gl-area too
> 
> Thomas Huth (1):
>    MAINTAINERS: Add myself as a reviewer for SDL audio
> 
> Volker Rümelin (3):
>    ui/console: replace QEMUFIFO with Fifo8
>    ui/console: replace kbd_timer with chr_accept_input callback
>    ui/console: remove chardev frontend connected test
> 
>   hw/i386/microvm-dt.h               |   8 +
>   include/hw/i386/microvm.h          |   4 +
>   include/hw/usb/msd.h               |   2 +-
>   include/ui/console.h               |   1 +
>   hw/display/virtio-gpu-udmabuf.c    |   2 +-
>   hw/i386/microvm-dt.c               | 341 +++++++++++++++++++++++++++++
>   hw/i386/microvm.c                  |   2 +
>   hw/misc/sga.c                      |   2 +
>   ui/console.c                       | 109 +++------
>   ui/gtk-egl.c                       |  40 ++--
>   ui/gtk-gl-area.c                   |  52 +++--
>   .gitlab-ci.d/buildtest.yml         |   1 -
>   MAINTAINERS                        |   4 +
>   configs/targets/i386-softmmu.mak   |   1 +
>   configs/targets/x86_64-softmmu.mak |   1 +
>   docs/about/deprecated.rst          |  10 +
>   hw/i386/meson.build                |   2 +-
>   17 files changed, 466 insertions(+), 116 deletions(-)
>   create mode 100644 hw/i386/microvm-dt.h
>   create mode 100644 hw/i386/microvm-dt.c

Applied, thanks.

r~


