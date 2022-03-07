Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6A4CEEF8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 01:35:34 +0100 (CET)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR1LY-0000wj-Rr
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 19:35:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR1Kb-000803-4G
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 19:34:33 -0500
Received: from [2a00:1450:4864:20::435] (port=33674
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR1KZ-0001lh-IJ
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 19:34:32 -0500
Received: by mail-wr1-x435.google.com with SMTP id j17so20867815wrc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 16:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jQ1nEaCziBwqjFUS8hoMmZ0At6Eit46uCxim4vhyeMU=;
 b=ZEYulUMpP2PZT4+yUcyBZmh396cj/k4bAP4a6nzyryuG0d6aEQ/CEuz1u7Od8yh4QC
 VA3ZBnI4ueQeTSYoTcWZiSuAAJpJgRjj0R5yY+vrjpfKejq8rS3zb+hykOIeQqRXyDk4
 fSilxDqNkQc29fbw3Ok17fHTQClM3j/fu+PrDSRdRbgjY+23HzWNyMqndL75Jw+P5KRT
 NPS9/el5NohbemwY8R/TE9tpdURznV4lE39cb0cV5TFvTCqiOPFMHSOuTso7oueA91Qw
 B/glv5UiyL041xlE1/46WODJemhbIDvdriSgNJ6FITuDUbMw7fR7MNj285o10mBI9V8u
 8EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jQ1nEaCziBwqjFUS8hoMmZ0At6Eit46uCxim4vhyeMU=;
 b=LqAI2EvaFAF4ttYOl/L4pMucoCE/WRrMdygDw+37j8PL7ljqcLM5lzeoVbQmZJZfpT
 AfaxzqRbO9yum+5XwnRp61bwNIVXsp7ycJDOWwKHBW84rT5aH/8ltQVqBS06j/Zfg3jY
 HOEVkYA2LWgrYN0YW7djNo9NxDacLK+z5UKmKy2H78u/wuTmva9c+/4WwC3X/iHE64jY
 deqJqB7zwgUfXbFH+AbG6jjrudqcJ5KOwH8DqbjOfawwWRK2NQg1GwG6lkruBrKJHNGL
 ai5l2VBFC97A+r0p+lQscW1G58D/ekNZuPZBpRExbtrcFGQLSaGfegMSMNPCHDQEOXZb
 07Ng==
X-Gm-Message-State: AOAM5325iVqKW8l1+GQaL2yZmgxJ2Ex4CCEIT1fqJtnOCCj+pR3iNg6C
 7GFD/2hHHMN+GKU4eQkuYX4=
X-Google-Smtp-Source: ABdhPJyh9Acy78XHrnXEB400xJi91/FfYaPQi3t8NYiZkG0vulK0Qnweh8unRAcF8GQIztcxcXc4Ig==
X-Received: by 2002:a5d:63cf:0:b0:1f0:7916:6a39 with SMTP id
 c15-20020a5d63cf000000b001f079166a39mr6672673wrw.500.1646613269585; 
 Sun, 06 Mar 2022 16:34:29 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6688000000b001f04ae0bb6csm9810891wru.58.2022.03.06.16.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 16:34:28 -0800 (PST)
Message-ID: <43235477-83c2-1101-93df-25d52a9ac529@gmail.com>
Date: Mon, 7 Mar 2022 01:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 0/7] isa: Resolve unneeded IRQ attributes from ISADevice
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220301220037.76555-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220301220037.76555-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 23:00, Bernhard Beschow wrote:

> The IRQ attributes are mostly used for printing ('info qtree') and there is one
> user, hw/ppc/pnv, to use the attributes directly. As it turns out, the printing
> is redundant if the IRQ numbers are exposed as QOM properties and hw/ppc/pnv
> can be easily ported away.
> 
> The patch series is structured as follows: Patch 1-3 QOM'ify the last devices
> which rely on printing their IRQ numbers via the ISADevice attributes. Patch
> 4 and 5 remove the last users of the ISADevice attributes such that they can be
> removed in patch 6. The remainder of the patch series is cleanup.
> 
> Patch 6 turns isa_init_irq() into a trivial wrapper for isa_get_irq(). That is,
> the former function becomes redundant. All users are therefore converted to use
> isa_get_irq() directly. Finally, the last patch removes the now unused
> isa_init_irq().
> 
> 
> Bernhard Beschow (7):
>    hw/rtc/mc146818rtc: QOM'ify IRQ number
>    hw/rtc/m48t59-isa: QOM'ify IRQ number
>    hw/input/pckbd: QOM'ify IRQ numbers
>    hw/isa/isa-bus: Remove isabus_dev_print()
>    hw/ppc/pnv: Determine ns16550's IRQ number from QOM property
>    isa: Drop unused attributes from ISADevice
>    isa: Inline and remove one-line isa_init_irq()
> 
>   hw/audio/cs4231a.c           |  2 +-
>   hw/audio/gus.c               |  2 +-
>   hw/audio/sb16.c              |  2 +-
>   hw/block/fdc-isa.c           |  2 +-
>   hw/char/parallel.c           |  2 +-
>   hw/char/serial-isa.c         |  2 +-
>   hw/ide/isa.c                 |  2 +-
>   hw/input/pckbd.c             | 26 +++++++++++++++++++++----
>   hw/ipmi/isa_ipmi_bt.c        |  2 +-
>   hw/ipmi/isa_ipmi_kcs.c       |  2 +-
>   hw/isa/isa-bus.c             | 37 +-----------------------------------
>   hw/isa/piix4.c               |  2 +-
>   hw/net/ne2000-isa.c          |  2 +-
>   hw/ppc/pnv.c                 |  5 ++++-
>   hw/rtc/m48t59-isa.c          |  9 ++++++++-
>   hw/rtc/mc146818rtc.c         | 13 +++++++++++--
>   hw/tpm/tpm_tis_isa.c         |  2 +-
>   include/hw/isa/isa.h         |  3 ---
>   include/hw/rtc/mc146818rtc.h |  1 +
>   tests/qemu-iotests/172.out   | 26 -------------------------
>   20 files changed, 59 insertions(+), 85 deletions(-)
> 

Please avoid posting 2 series going in different directions but touching
the same files, and expect the same person to take them both and resolve
resulting conflicts. Post one, then the second one based on the previous
one (and so on if multiple steps). Anyway, for now I adapted this series
on top of your "malta: Fix PCI IRQ levels" series and queued to mips.

Thanks,

Phil.

