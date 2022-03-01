Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FD4C8B59
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 13:18:52 +0100 (CET)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP1Ss-0004rt-Ax
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 07:18:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nP1F2-00025o-QK
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 07:04:32 -0500
Received: from [2607:f8b0:4864:20::102a] (port=36363
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nP1F1-00083h-6j
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 07:04:32 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso1855014pjk.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 04:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=vw/sTpV6p1j4zVjAKC9hkSAuAakdAxo8wn+XFhKMk4c=;
 b=XzKRiCUCVt2heyiRZFqVKQGgygPkUUn/cWgSdE9nXLl9F55yOoTvY+TCqXpWScO2Kl
 9uGGk/pKpc8OP6uL6flhN2X/clqIwEMQQvIIPTyDHthzaR8YlBqDvIazl8X+0h+jpDmQ
 jasEx+si3DART4lWAZypGpwasqA14XJqIuxh/r/4y0OUSmA1rKn2TjnXtJbBbH9Ov221
 99N8EQUB2KnfkSTBeplPCWruxchyGOT8P2lyF0c8w4xb7ePedQTZnX6SbsMM+9os6rhb
 FPhQJBu366wyE5Puk4Vh3u3uAyxXSt2kr45yCKQAQODKDIawHZlNfiT2Ewq7kPLcFcG0
 T94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=vw/sTpV6p1j4zVjAKC9hkSAuAakdAxo8wn+XFhKMk4c=;
 b=c3byu6adVy0hvF9YRIqxdxPXmSheGcg7KBh+EfckWKEUv3G8WugIH+RtUzcK24f3fP
 cUyVM0ec7p6aGELUD2W9N99VSejqHzmSbw6nxYI2X3Re0mLZzZWDEuxm+z9C97a5YFm7
 9l1+7R4gtY2v7zkmZNFXgm9KJ4CWvI24sRcUpFv5UxdTqZbdQ+wtLQ7L0igFAAWZnF1/
 rystXdzLskcbEr17ab7oHZFBff1WLZlie+mJYreeXsvqxh2eR1evAUzwjos5NnHDLD+P
 O9c+DTjYROZipwNb0p/w5fGUI8UWazHpukLDVvcQ6LDiqED5psGjwEiXtWk8RoZ2QfVK
 5NJg==
X-Gm-Message-State: AOAM531uWJNtIKVvT+C4zJGgvy924ehPkLttpCsboV5dEXAZOIeeJaRu
 RLRq5Si3yfLGZvC3u+W3sjE=
X-Google-Smtp-Source: ABdhPJySq9NYtJM2bCvl19fjOlJqTuMygzyKrG7bYvABCd7BZrP49GNUexMhtydBeCgP9PTghgzB9w==
X-Received: by 2002:a17:902:f242:b0:14f:e2d3:e251 with SMTP id
 j2-20020a170902f24200b0014fe2d3e251mr24897535plc.19.1646136269676; 
 Tue, 01 Mar 2022 04:04:29 -0800 (PST)
Received: from [192.168.221.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056a0002a700b004f357e3e42fsm16385003pfs.36.2022.03.01.04.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 04:04:28 -0800 (PST)
Message-ID: <6f9309d2-83d4-c09e-794f-3e9bb9202460@gmail.com>
Date: Tue, 1 Mar 2022 13:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/22] isa: Resolve unneeded IRQ attributes from
 ISADevice
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <086da51d-1ed3-2726-d3f1-b5984b33991d@gmail.com>
In-Reply-To: <086da51d-1ed3-2726-d3f1-b5984b33991d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
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

On 27/2/22 23:40, Philippe Mathieu-Daudé wrote:
> On 22/2/22 20:34, Bernhard Beschow wrote:
>> v2:
>> The newly QOM'ified devices now report an error to the user in their 
>> realize
>> functions if the configured IRQ number is greater than 15.
>>
>> v1:
>> The IRQ attributes of ISADevice are hardcoded to support up to two 
>> IRQs per
>> device which creates an artificial limit. By not having the attributes 
>> in the
>> first place, this limitation can be avoided altogether.
>>
>> The IRQ attributes are mostly used for printing ('info qtree') and 
>> there is one
>> user, hw/ppc/pnv, to use the attributes directly. As it turns out, the 
>> printing
>> is redundant if the IRQ numbers are exposed as QOM properties and 
>> hw/ppc/pnv
>> can be easily ported away.
>>
>> The patch series is structured as follows: Patch 1-3 QOM'ify the last 
>> devices
>> which rely on printing their IRQ numbers via the ISADevice attributes. 
>> Patch
>> 4 and 5 remove the last users of the ISADevice attributes such that 
>> they can be
>> removed in patch 6. The remainder of the patch series is cleanup.
>>
>> Patch 6 turns isa_init_irq() into a trivial wrapper for isa_get_irq(). 
>> That is,
>> the former function becomes redundant. All users are therefore 
>> converted to use
>> isa_get_irq() directly. Finally, the last patch removes the now unused
>> isa_init_irq().
>>
>>
>> Bernhard Beschow (22):
>>    hw/rtc/mc146818rtc: QOM'ify IRQ number
>>    hw/rtc/m48t59-isa: QOM'ify IRQ number
>>    hw/input/pckbd: QOM'ify IRQ numbers
>>    hw/isa/isa-bus: Remove isabus_dev_print()
>>    hw/ppc/pnv: Determine ns16550's IRQ number from QOM property
>>    isa: Drop unused attributes from ISADevice
>>    hw/audio/cs4231a: Disuse isa_init_irq()
>>    hw/audio/gus: Disuse isa_init_irq()
>>    hw/audio/sb16: Disuse isa_init_irq()
>>    hw/block/fdc-isa: Disuse isa_init_irq()
>>    hw/char/parallel: Disuse isa_init_irq()
>>    hw/char/serial-isa: Disuse isa_init_irq()
>>    hw/ide/isa: Disuse isa_init_irq()
>>    hw/input/pckbd: Disuse isa_init_irq()
>>    hw/ipmi/isa_ipmi_bt: Disuse isa_init_irq()
>>    hw/ipmi/isa_ipmi_kcs: Disuse isa_init_irq()
>>    hw/isa/piix4: Disuse isa_init_irq()
>>    hw/net/ne2000-isa: Disuse isa_init_irq()
>>    hw/rtc/m48t59-isa: Disuse isa_init_irq()
>>    hw/tpm/tpm_tis_isa: Disuse isa_init_irq()
>>    hw/isa/isa-bus: Disuse isa_init_irq()
>>    isa: Remove unused isa_init_irq()
> 
> Series:
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

If you can address the few comments, I'll queue the v3 via the
MIPS tree.

Thanks,

Phil.

