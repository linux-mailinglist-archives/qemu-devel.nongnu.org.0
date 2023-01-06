Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0438066003D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 13:27:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDln6-0000QA-GW; Fri, 06 Jan 2023 07:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDln4-0000Pm-OI
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 07:25:43 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDln3-0000fy-5v
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 07:25:42 -0500
Received: by mail-wm1-x333.google.com with SMTP id ja17so944892wmb.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 04:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cGfTsxDRG+LfoKkBFGZZ/WvwF0lb6LoKmVVmXvkk4C0=;
 b=j2BRoliK8qTd+F+OwsZmpdkMniMJPUoh7KnKOodKcQYhH8dYCE2hyVbmWCgTN/maAx
 r6eQt2KWt4gVNOl07Yrcf+URqL26xP1qlD6w0frzh8QHhCSN6G57NOTcuvs5a31tcrL9
 avJ61vY5r0QCoAeGgk2zzuozoAT4vUlXZu5A/EzY20ki4osHwGvFAMBpj/0sBdYVdyNL
 LedpN2q7UKSxvg7sEVLNNlfg27/NpLeX6nm9lg+c6dlaKgujb7BGQ5Mwx3ltCuIq/jWm
 dGR4bfGffK1SpFmx9areMCmVEZo8cuK3QDTXkDYPkwaRZljpwDvTOyTrkKc8XHSmVEl1
 8zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cGfTsxDRG+LfoKkBFGZZ/WvwF0lb6LoKmVVmXvkk4C0=;
 b=tMPltT4FrgPC7uLWwb47YP3OT7egKumrhdEl+l+kmukf2pb51R2SEEa7JTWqF2kJpR
 acBmJFZ+X+JvkbFZZ+FKdplex4Uz5APBmHOBvFXGkU67ayrDrDagGirgBOfRs2RhjViG
 yCFD76wQHdg0QSUxKtMaDoQpjZi63Z7Be/Dff0QdOaesgwAmgPRk0UKGOzncRxYn/VCJ
 V3aNlVDwDRrJcGSWI6vZrMutcw4LAAEx4xE3T5x8FIN+PCz4WM9bd78+2fcFjC9wV8lw
 mg42tXd3tsj0VrlVHPP9z89ubl82y8IAN+5wthNvv/MHSrgyhJJ97sv5VfV2BwdRIqf7
 EOpg==
X-Gm-Message-State: AFqh2koIhom76rAuHFqltSFUvo8bYOrQ7faNAJcGzeBbmQftqXhLEypW
 DfPoZCaHK8qYBFgfLKby8cRdfA==
X-Google-Smtp-Source: AMrXdXtK2NS9bhPqosfbghflNCW3WATI4EQme8et2nuxBkQ/Co7cKEvbgMhqSWzvFuxk9D76m9gkLw==
X-Received: by 2002:a05:600c:3d1b:b0:3d0:6a57:66a5 with SMTP id
 bh27-20020a05600c3d1b00b003d06a5766a5mr38329071wmb.0.1673007938784; 
 Fri, 06 Jan 2023 04:25:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm6055371wmb.14.2023.01.06.04.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 04:25:38 -0800 (PST)
Message-ID: <6a1a6ed8-568d-c08b-91a7-1093a2b25929@linaro.org>
Date: Fri, 6 Jan 2023 13:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <B207F213-3B7B-4E0A-A87E-DE53CD351647@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <B207F213-3B7B-4E0A-A87E-DE53CD351647@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 6/1/23 12:57, Bernhard Beschow wrote:
> 
> 
> Am 4. Januar 2023 15:35:33 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> +Markus/Thomas
>>
>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>    hw/i386/pc_piix.c             |  4 +---
>>>    hw/isa/piix.c                 | 20 --------------------
>>>    include/hw/southbridge/piix.h |  1 -
>>>    3 files changed, 1 insertion(+), 24 deletions(-)


>>>    -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>> -{
>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>> -
>>> -    k->realize = piix3_realize;
>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>> -    dc->vmsd = &vmstate_piix3;
>>
>> IIUC, since this device is user-creatable, we can't simply remove it
>> without going thru the deprecation process.
> 
> AFAICS this device is actually not user-creatable since dc->user_creatable is set to false once in the base class. I think it is safe to remove the Xen class unless there are ABI issues.
Great news!

