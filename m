Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875A865C0AC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pChAf-0006Pn-V5; Tue, 03 Jan 2023 08:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pChAW-0006Mv-FW
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:17:34 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pChAU-0002O0-HH
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:17:28 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so23067694wms.2
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+6FCYc7IsbLXUkXo08SQ4GUWBR9iGC2Xzf9FolVUtRo=;
 b=n/56VD4IRMp0yuUVG73jhVPdUgXayuZx4giEfUZ8VLgAAnbQZeIuIvQcokB2wptb6k
 roMl4LNuBykQy/MpusQOu0PMAW1zy6KpNMcCebcpS9DCuAqDne0+v68abElKm/+c9PGX
 5deJomEDWCynXEAQCe2GxPFbAKq3knf/Q0Vi2APEhmyoBGnSpcnvaiXifXNt7MFWuLtI
 CYdI4jO0cRMmDBNHyzsDW6aehiMZJ7lHGoG9Mw1g3tBw2z61ryhoGk+Eml41wavMKgNr
 3jQc0/MkoQeBHxtCrcfilhHCmnRLxA8ZrtYjJvD3vWgTfxcPoCHF0jAIAEkIpPZNbsBN
 AdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6FCYc7IsbLXUkXo08SQ4GUWBR9iGC2Xzf9FolVUtRo=;
 b=UPdwd/ak/L450P+nagQtqeY25PHp5p/S3O6krkWsZ1vhCNqGridLjA6OkYgLEy6IOg
 XVLSEBuG065Kg47TGoE+RiLZxizKDNH3ebA7Bzpp+4YxFH9mDKpPk/xZpTjtA3Hu+xbO
 W2QqyHToJStIKTpRv5Ud2bYYW0IKsWuLjjFQ6YEuJJL8b8r6NVziqxo8ow8E7953zdVg
 KSwsFgGXTt3FVtovEcKaBcty6In1ZfR/2r1VwI09VBgew/USLehMnOad9F26/i82sbaW
 KBV+bED19iW541UzBSSpT3xK2R6AzKSe07NNOJTovgHWsBbgprD9PS04zoxXqEHClfCn
 v+MQ==
X-Gm-Message-State: AFqh2koVrJQN6OlJwOxLK6pCMES/5TcB/H+hWqMvlVVhZ5DjMnMwAxhI
 BAnqxrzgIqwEvL0YBrYjr4C28w==
X-Google-Smtp-Source: AMrXdXtKrBI9NGgAUmqiWfEI2RGlGcbNiSC2hdExF6pkPz5b4Eg0tXIw6L8+2KPWlNKYtW4NbzL5LQ==
X-Received: by 2002:a05:600c:4255:b0:3d3:3d34:5d63 with SMTP id
 r21-20020a05600c425500b003d33d345d63mr32744520wmm.8.1672751844305; 
 Tue, 03 Jan 2023 05:17:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003cffd3c3d6csm40171333wmm.12.2023.01.03.05.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 05:17:23 -0800 (PST)
Message-ID: <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org>
Date: Tue, 3 Jan 2023 14:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230102213504.14646-1-shentey@gmail.com>
 <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

Hi Chuck,

On 3/1/23 04:15, Chuck Zmudzinski wrote:
> On 1/2/23 4:34 PM, Bernhard Beschow wrote:
>> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
>> it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
>> machine agnostic to the precise southbridge being used. 2/ will become
>> particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
>> the "Frankenstein" use of PIIX4_ACPI in PIIX3.
>>
>> Testing done:
>> None, because I don't know how to conduct this properly :(
>>
>> Based-on: <20221221170003.2929-1-shentey@gmail.com>
>>            "[PATCH v4 00/30] Consolidate PIIX south bridges"

This series is based on a previous series:
https://lore.kernel.org/qemu-devel/20221221170003.2929-1-shentey@gmail.com/
(which itself also is).

>> Bernhard Beschow (6):
>>    include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it
>>    hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
>>    hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
>>    hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
>>    hw/isa/piix: Resolve redundant k->config_write assignments
>>    hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>>
>>   hw/i386/pc_piix.c             | 34 ++++++++++++++++--
>>   hw/i386/xen/xen-hvm.c         |  9 +++--
>>   hw/isa/piix.c                 | 66 +----------------------------------
> 
> This file does not exist on the Qemu master branch.
> But hw/isa/piix3.c and hw/isa/piix4.c do exist.
> 
> I tried renaming it from piix.c to piix3.c in the patch, but
> the patch set still does not apply cleanly on my tree.
> 
> Is this patch set re-based against something other than
> the current master Qemu branch?
> 
> I have a system that is suitable for testing this patch set, but
> I need guidance on how to apply it to the Qemu source tree.

You can ask Bernhard to publish a branch with the full work,
or apply each series locally. I use the b4 tool for that:
https://b4.docs.kernel.org/en/latest/installing.html

i.e.:

$ git checkout -b shentey_work
$ b4 am 20221120150550.63059-1-shentey@gmail.com
$ git am 
./v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_bridges.mbx
$ b4 am 20221221170003.2929-1-shentey@gmail.com
$ git am 
./v4_20221221_shentey_this_series_consolidates_the_implementations_of_the_piix3_and_piix4_south.mbx
$ b4 am 20230102213504.14646-1-shentey@gmail.com
$ git am ./20230102_shentey_resolve_type_piix3_xen_device.mbx

Now the branch 'shentey_work' contains all the patches and you can test.

Regards,

Phil.

