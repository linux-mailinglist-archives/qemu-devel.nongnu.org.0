Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43DF6536E0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 20:15:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p84Yb-0000Cf-Lb; Wed, 21 Dec 2022 14:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p84YZ-000091-Hl
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:15:11 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p84YX-0008JA-1u
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:15:11 -0500
Received: by mail-ed1-x52b.google.com with SMTP id a16so23368712edb.9
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 11:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qC9o6aUNastG2ObXdLEu/4zP5RqC9Zhhwd+DuQ4ZoHU=;
 b=k4tfedzrsA5xqN3v1wcyecDApggYsFc2sPdIzBObBzvfnWNVXmoixeT/I6ZTqHaRJu
 AjfD4rQ1mbz1fFgdNKVnNxsjTd1nnxGXhqIl0Mx2xnjnks1KQBjDAuCNh0GBf9JlWW+H
 bUdZjXVXqmtHGRgA00SIRSGO+nWBMSdDpEbNGPzrRsMwuRxnol3UbYEMEHCiRdf4FnSs
 0AKiktxg21l91cusw2YaLSMg003K4q201SV9jKaXvcolAzq1DzqhRIOnDNhVW2iSBwo/
 asA8yfB2Gky9bnJPi4JEZ6w1wMmxx/yH59RhleI4NdGcfbvoTu69hl8z18NwLxFib7CY
 IGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qC9o6aUNastG2ObXdLEu/4zP5RqC9Zhhwd+DuQ4ZoHU=;
 b=P9M95nn2lwlikqziTwujVDtcduuTFdr9UaVgqo4Vzb68XqWmh1UfKt+Hd7kKB3BOwL
 DrkfjW/reqcFiz5edzUkN2PZiIn5byNZ/wqpcSlPZhIfBHuhcPNgRinjiOYvPTzkr9JC
 2dZst1gUSMobnnwDCAhdX8fD4r8caxmzJE6VgMPX5HW1fvr6tDL23FWI/WvWxacJ77MQ
 kBD36ckmNzh5WgFpTKa8f/3C6RU2pnLrJGFOeQsxA194nE2HjXUwEhowpktSwG6boV6g
 z0hqIWwRYDzqshtHAhrJTy7ktV/lKCi29ndz9LChPVDohIQNHt/xYALL0GfsRuXKpOpR
 AFIw==
X-Gm-Message-State: AFqh2koouA1hSCOOVgXn7i2aKBebKKfxxh35EaUXSts6CyVf32qsrOqG
 Qq6p+xkeU/PqA0y8xa24RfSEGg==
X-Google-Smtp-Source: AMrXdXvzBg9tdoJtNT8wFs+/4IE+04nSoZu2Gw1TwVVg7hb4ZC07uIiZb/8uLR0hPORB0MqNxDNaiA==
X-Received: by 2002:a05:6402:1f15:b0:46c:e2f1:3a81 with SMTP id
 b21-20020a0564021f1500b0046ce2f13a81mr2542999edb.37.1671650107090; 
 Wed, 21 Dec 2022 11:15:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056402101500b00477626e3e42sm6250440edu.84.2022.12.21.11.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 11:15:06 -0800 (PST)
Message-ID: <f4d9fd97-a986-d212-5cf5-332e831ee337@linaro.org>
Date: Wed, 21 Dec 2022 20:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v4 00/30] This series consolidates the implementations of
 the PIIX3 and PIIX4 south
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/12/22 17:59, Bernhard Beschow wrote:
> code as possible and to bring both device models to feature parity such that
> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
> list before.
> 
> The series is structured as follows: First, PIIX3 is changed to instantiate
> internal devices itself, like PIIX4 does already. Second, PIIX3 gets prepared
> for the merge with PIIX4 which includes some fixes, cleanups, and renamings.
> Third, the same is done for PIIX4. In step four the implementations are merged.
> Since some consolidations could be done easier with merged implementations, the
> consolidation continues in step five which concludes the series.
> 
> One particular challenge in this series was that the PIC of PIIX3 used to be
> instantiated outside of the south bridge while some sub functions require a PIC
> with populated qemu_irqs. This has been solved by introducing a proxy PIC which
> furthermore allows PIIX3 to be agnostic towards the virtualization technology
> used (KVM, TCG, Xen). Due to consolidation PIIX4 gained the proxy PIC as well.
> 
> Another challenge was dealing with optional devices where Peter already gave
> advice in [1] which this series implements.
> 
> Last but not least there might be some opportunity to consolidate VM state
> handling, probably by reusing the one from PIIX3. Since I'm not very familiar
> with the requirements I didn't touch it so far.
> 
> v4:
> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"
>    since it is already queued via mips-next. This eliminates patches
>    'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa/piix4:
>    Prefix pci_slot_get_pirq() with "piix4_"'.
> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>    'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'. I originally only
>    split these patches since I wasn't sure whether renaming a type was allowed.
> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>    created' for forther cleanup of INTx-to-LNKx route decoupling.

Sigh I did the rebase this morning and was waiting for the test suite...
https://gitlab.com/philmd/qemu/-/commits/mips-testing/

Anyway I'll double-check with this series.

