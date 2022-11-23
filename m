Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37897635BA7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxnu1-000629-MW; Wed, 23 Nov 2022 06:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxntJ-0005t6-L5
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:26:09 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxntC-00083l-Gl
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:26:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id n3so12351141wrp.5
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 03:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M6IO8Zd1j0tOna7TRlUxE+OEy1lGQv6mwaIA8YMFQAo=;
 b=vHG/wn0Fe37uWbswqmDIKX1582EZFOfxjfbu8BFelUgZhiPr/Hsh7OHRoVIc7dnt83
 nCtx8iDWZYGouWcgPu+RLoSYZeDgqki2cMQQgEizVV+teYrMO+NZhpbdZZtXHFTdvt06
 y6/J/j41uQCHh7wq+iEuOP6eGbvidOr/MTf0/i5u7i6DRjs7SttxM3jMma72UiZ3bJja
 11Rk3Aw3c1m7P1FTNVjT37vORtsIXN73G61LGdLSC7TLf4RiNmEADl1NGUJa247dqkza
 sjia2+JDDsV4E7SSU/LPWFuq3WVIKuiAJIS8y0Uvg6jA3WiLmXfc1Fmc7urudqE9JRdA
 fiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M6IO8Zd1j0tOna7TRlUxE+OEy1lGQv6mwaIA8YMFQAo=;
 b=eXhJj3x2Bx1kNPYwwzbduQd7z6SY2pEJI4e775iMdl4qckwNiypNoOLutM8BkENEvw
 tuT14gR1b6QNcB7/Ho50JRzBcU6BrssO0kW/NfRoBGoWtE5f1AsdbRLn/igDVLfBLD+h
 vIk2iULCAm/kVMureJyCRON+BlkuW8aqyb5RSFHbgMxRojIdPdPV+VwhsQNWAt6ygtLx
 wppsPPd9IgIW1dZQd6pm9mfLO6nFute/Gy6ICrT5Ot4/orsOjmEz6PwI2VLrXveIusL3
 VDeB2Xyx5Yb1gKekdaskGlF7QAzixNt4nseV3dwBvXn1eJ2jY5K2gWBKJDqsWWDwGZga
 D3KA==
X-Gm-Message-State: ANoB5pnULCD8yqYtzrpSANAYRLm2spvHnEfCka4Gu1+x1sB629aNH1HK
 BmuusAlsGPRS5BDpCfctXVvqEQ==
X-Google-Smtp-Source: AA0mqf5GOxUlPc8xxXF2TuYNXf8KYnyBsy78E/rTX7+8TCeSwe1pO8bruDfL6lZXSQ68CEyi6tO1Qg==
X-Received: by 2002:a05:6000:a12:b0:241:c4d1:41a6 with SMTP id
 co18-20020a0560000a1200b00241c4d141a6mr13855854wrb.324.1669202759966; 
 Wed, 23 Nov 2022 03:25:59 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bi8-20020a05600c3d8800b003c701c12a17sm1965872wmb.12.2022.11.23.03.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 03:25:59 -0800 (PST)
Message-ID: <c9b007eb-b1e4-121f-378d-12357a426939@linaro.org>
Date: Wed, 23 Nov 2022 12:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, eperezma@redhat.com, eric.auger@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
 <20221122152944-mutt-send-email-mst@kernel.org>
 <CAMxuvaySOMOs=0hwOeP4O6b2nO+ANiEsoDaAzduRRpDcUd=OFw@mail.gmail.com>
 <20221123022126-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221123022126-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 23/11/22 08:23, Michael S. Tsirkin wrote:
> On Wed, Nov 23, 2022 at 11:20:41AM +0400, Marc-André Lureau wrote:
>> Hi
>>
>> On Wed, Nov 23, 2022 at 12:32 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>>      On Tue, Nov 22, 2022 at 06:53:49PM +0400, marcandre.lureau@redhat.com
>>      wrote:
>>      > From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>      >
>>      > 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
>>      > warning") removed the warning on vfio_listener_region_add() path.
>>      >
>>      > An error is reported for vhost-vdpa case:
>>      > qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
>>      >
>>      > Skip the CRB device.
>>      >
>>      > Fixes:
>>      > https://bugzilla.redhat.com/show_bug.cgi?id=2141965
>>      >
>>      > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>      > ---
>>      >  hw/virtio/vhost-vdpa.c | 6 ++++++
>>      >  1 file changed, 6 insertions(+)
>>      >
>>      > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>      > index 7468e44b87..9d7206e4b8 100644
>>      > --- a/hw/virtio/vhost-vdpa.c
>>      > +++ b/hw/virtio/vhost-vdpa.c
>>      > @@ -19,6 +19,7 @@
>>      >  #include "hw/virtio/virtio-net.h"
>>      >  #include "hw/virtio/vhost-shadow-virtqueue.h"
>>      >  #include "hw/virtio/vhost-vdpa.h"
>>      > +#include "sysemu/tpm.h"
>>      >  #include "exec/address-spaces.h"
>>      >  #include "migration/blocker.h"
>>      >  #include "qemu/cutils.h"
>>      > @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section
>>      (MemoryRegionSection *section,
>>      >  {
>>      >      Int128 llend;
>>      >
>>      > +    if (TPM_IS_CRB(section->mr->owner)) {
>>      > +        /* The CRB command buffer has its base address unaligned. */
>>      > +        return true;
>>      > +    }
>>      > +
>>
>>      Quite a hack. We can't really keep adding dependency on random devices
>>
>>
>> Agree it's not great. but it's not strictly a dependency. At least you can
>> still build with !CONFIG_TPM.
> 
> but what does it have to do with tpm?
> 
> 
>>
>>      to vhost. And would you add hacks like this to listeners?
>>      Pls figure out what's special about this buffer.
>>      Also if this section is unaligned then doesn't it break up
>>      other aligned sections?
>>
>>
>> See the original discussion:
>> https://patchew.org/QEMU/20220208133842.112017-1-eric.auger@redhat.com/
>> 20220208133842.112017-2-eric.auger@redhat.com/
>>
>> It is not clear whether aligning the tpm-crb-cmd region would work (overlapping
>> tpm-crb-mmio).
>>
>> Peter Maydell said: "There's nothing that guarantees alignment for memory
>> regions at all, whether they're RAM, IO or anything else.".
>>
>> Maybe vfio/vhost should simply skip those odd regions silently.
> 
> 
> How do we detect them? Are these regions not DMA-able on real hardware?

Are you suggesting expanding the Memory API?

- Add 'base_address_unaligned' to MemoryRegion structure (default to
   false)

- Add memory_region_set_..._unaligned()

Then have TYPE_TPM_CRB use this API?

