Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61998701C5B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 10:56:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1py7Vr-0000W7-0D; Sun, 14 May 2023 04:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1py7Vi-0000Vn-6b
 for qemu-devel@nongnu.org; Sun, 14 May 2023 04:55:22 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1py7Vg-0007NG-26
 for qemu-devel@nongnu.org; Sun, 14 May 2023 04:55:21 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1aaf2ede38fso112070425ad.2
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684054518; x=1686646518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eP9+IGMQJtUNiDuxERzDi1JGqY0YUeov+f0P8hB3kmw=;
 b=ZJr3M9Q8QQfaVC9934AgnRP27XJ2Kgoe2aTkYMmC0fzsdEDNzLf3dUvL2xkUIrcpum
 W47cYGMPMmNfWXP0mNprB7C3VceOmuJAxgGnhEM1w0uVfyaLPpue1YbXOucURzh1/Egz
 3bHEw55c7356EgTKeToGrEhNjccLBSIcvtggRuWiCtW84XUOWiCPUNp2rGnify5quXDn
 8G+6ikBQJ/PWm73isQiGkLq727r9HrSFj+sX/cGHVrlX/I4nc4nmIMfUkeuUc5BL3wvZ
 bkZKDYkaPPuN5CthmAfX53knokXIWLZ786mOgeQsW3gsCaOpZoI4CFSBFlgBfD6aSFaz
 rzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684054518; x=1686646518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eP9+IGMQJtUNiDuxERzDi1JGqY0YUeov+f0P8hB3kmw=;
 b=gXHtGxe2oslywQRTWn8AkOreUvIU40ZwhaUIbUHX7kZyJESpJtoH9xK8ZmePckjDbZ
 7YOtijy0Q+5184lf1I4Ezy6GjQurYrYpaHPVkN4QuSwfUDP2Bhbwzw8tOtoqM8qMGLOQ
 ZjDau9q9NvsLaTU9hbwC2htF12vOQVBZ/nVYBRHktzp3zEYtiqcZa43Tqu1uxKzN9pio
 hgVOG6xmabWjUiNSRmws7G//ZOEwOXX0ipjTF1bcB8aARUapzTg7nlxcv4KRMmUoy+5n
 0YVuIwf2omJXujdok8C419/BNwvlzysteUwPutwHePXkv3NUeV8krUdcXtQNv8HbG+n7
 SDxg==
X-Gm-Message-State: AC+VfDw41fm5J4ajGKgkr3zSjDPawspw4glu6Itq5/rRuL5h8IRcFIwv
 6XKhhLay5nKL1y1Ji5lho1E=
X-Google-Smtp-Source: ACHHUZ7dqsfiEsJfvrxKlF+9IcRw9PI+JJSxt51SrNpIyRCTrdKC8zXsnneZSwWFPo1Vxhb5lDX0jg==
X-Received: by 2002:a17:902:e550:b0:1a6:6f3f:bc3 with SMTP id
 n16-20020a170902e55000b001a66f3f0bc3mr42047978plf.57.1684054518019; 
 Sun, 14 May 2023 01:55:18 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.119.15])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a17090aca0600b0024e37e0a67dsm20939464pjt.20.2023.05.14.01.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 01:55:17 -0700 (PDT)
Message-ID: <252a0071-2ffa-87c6-a72e-d27975ddecd5@gmail.com>
Date: Sun, 14 May 2023 15:55:11 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [REPOST PATCH v3 5/5] amd_iommu: report x2APIC support to the
 operating system
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230411142440.8018-1-minhquangbui99@gmail.com>
 <20230411142440.8018-6-minhquangbui99@gmail.com>
 <20230512102159-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20230512102159-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.923,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/12/23 21:39, Michael S. Tsirkin wrote:
> On Tue, Apr 11, 2023 at 09:24:40PM +0700, Bui Quang Minh wrote:
>> This commit adds XTSup configuration to let user choose to whether enable
>> this feature or not. When XTSup is enabled, additional bytes in IRTE with
>> enabled guest virtual VAPIC are used to support 32-bit destination id.
>>
>> Additionally, this commit changes to use IVHD type 0x11 in ACPI table for
>> feature report to operating system. This is because Linux does not use
>> XTSup in IOMMU Feature Reporting field of IVHD type 0x10 but only use XTSup
>> bit in EFR Register Image of IVHD 0x11 to indicate x2APIC support (see
>> init_iommu_one in linux/drivers/iommu/amd/init.c)
>>
>> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> 
> I'm concerned that switching to type 11 will break some older guests.
> It would be better if we could export both type 10 and type 11
> ivhd. A question however would be how does this interact
> with older guests. For example:
> https://lists.linuxfoundation.org/pipermail/iommu/2016-January/015310.html
> it looks like linux before 2016 only expected one ivhd entry?

Export both type 0x10 and 0x11 looks reasonable to me. Before the above 
commit, I see that Linux still loops through multiple ivhd but only 
handles one with type 0x10. On newer kernel, it will choose to handle 
the type that appears last corresponding the first devid, which is weird 
in my opinion.

+static u8 get_highest_supported_ivhd_type(struct acpi_table_header *ivrs)
+{
+	u8 *base = (u8 *)ivrs;
+	struct ivhd_header *ivhd = (struct ivhd_header *)
+					(base + IVRS_HEADER_LENGTH);
+	u8 last_type = ivhd->type;
+	u16 devid = ivhd->devid;
+
+	while (((u8 *)ivhd - base < ivrs->length) &&
+	       (ivhd->type <= ACPI_IVHD_TYPE_MAX_SUPPORTED)) {
+		u8 *p = (u8 *) ivhd;
+
+		if (ivhd->devid == devid)
+			last_type = ivhd->type;
+		ivhd = (struct ivhd_header *)(p + ivhd->length);
+	}
+
+	return last_type;
+}

So when exposing type 0x10 following by 0x11, old kernel only parses 
0x10 and does not support x2APIC while new kernel parse 0x11 and support 
x2APIC. I will expose both types in the next version.

> Some research and testing here would be benefitial.
> Similarly for windows guests.
> 
> Thanks!
> 
> 
> 
>> ---
>>   hw/i386/acpi-build.c | 28 ++++++++++++++--------------
>>   hw/i386/amd_iommu.c  | 21 +++++++++++++++++++--
>>   hw/i386/amd_iommu.h  | 16 +++++++++++-----
>>   3 files changed, 44 insertions(+), 21 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index ec857a117e..72d6bb2892 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2339,7 +2339,7 @@ static void
>>   build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>>                   const char *oem_table_id)
>>   {
>> -    int ivhd_table_len = 24;
>> +    int ivhd_table_len = 40;
>>       AMDVIState *s = AMD_IOMMU_DEVICE(x86_iommu_get_default());
>>       GArray *ivhd_blob = g_array_new(false, true, 1);
>>       AcpiTable table = { .sig = "IVRS", .rev = 1, .oem_id = oem_id,
>> @@ -2349,18 +2349,19 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>>       /* IVinfo - IO virtualization information common to all
>>        * IOMMU units in a system
>>        */
>> -    build_append_int_noprefix(table_data, 40UL << 8/* PASize */, 4);
>> +    build_append_int_noprefix(table_data,
>> +                             (1UL << 0) | /* EFRSup */
>> +                             (40UL << 8), /* PASize */
>> +                             4);
>>       /* reserved */
>>       build_append_int_noprefix(table_data, 0, 8);
>>   
>> -    /* IVHD definition - type 10h */
>> -    build_append_int_noprefix(table_data, 0x10, 1);
>> +    /* IVHD definition - type 11h */
>> +    build_append_int_noprefix(table_data, 0x11, 1);
>>       /* virtualization flags */
>>       build_append_int_noprefix(table_data,
>>                                (1UL << 0) | /* HtTunEn      */
>> -                             (1UL << 4) | /* iotblSup     */
> 
> btw this should have been iotlbsup?
> 
>> -                             (1UL << 6) | /* PrefSup      */
>> -                             (1UL << 7),  /* PPRSup       */
>> +                             (1UL << 4),  /* iotblSup     */
>>                                1);
>>   
>>       /*
> 
> hmm why are you removing these other flags?

According to the AMD IOMMU specification, the bit 6, 7 are reserved in 
type 0x11 which are PerfSup, PPRSup respectively in type 0x10 so I 
remove those flags when changing to type 0x11. In type 0x11, these 
feature are reported via the below EFR Register Image I believe.

> 
>> @@ -2404,13 +2405,12 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>>       build_append_int_noprefix(table_data, 0, 2);
>>       /* IOMMU info */
>>       build_append_int_noprefix(table_data, 0, 2);
>> -    /* IOMMU Feature Reporting */
>> -    build_append_int_noprefix(table_data,
>> -                             (48UL << 30) | /* HATS   */
>> -                             (48UL << 28) | /* GATS   */
>> -                             (1UL << 2)   | /* GTSup  */
>> -                             (1UL << 6),    /* GASup  */
>> -                             4);
>> +    /* IOMMU Attributes */
>> +    build_append_int_noprefix(table_data, 0, 4);
>> +    /* EFR Register Image */
>> +    build_append_int_noprefix(table_data, s->efr_reg, 8);
>> +    /* EFR Register Image 2 */
>> +    build_append_int_noprefix(table_data, 0, 8);
> 
> 
> here too. what's going on?

Same as the above, the structure of type 0x11 is different from 0x10. At 
offset 20 it is not IOMMU feature reporting but IOMMU attributes. And 
there are 2 more fields: EFR Register Image, EFR Register Image 2 before 
IVHD device entries.

>>   
>>       /* IVHD entries as found above */
>>       g_array_append_vals(table_data, ivhd_blob->data, ivhd_blob->len);
>> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
>> index bcd016f5c5..5dfa93d945 100644
>> --- a/hw/i386/amd_iommu.c
>> +++ b/hw/i386/amd_iommu.c
>> @@ -31,6 +31,7 @@
>>   #include "hw/i386/apic_internal.h"
>>   #include "trace.h"
>>   #include "hw/i386/apic-msidef.h"
>> +#include "hw/qdev-properties.h"
>>   
>>   /* used AMD-Vi MMIO registers */
>>   const char *amdvi_mmio_low[] = {
>> @@ -1155,7 +1156,12 @@ static int amdvi_int_remap_ga(AMDVIState *iommu,
>>       irq->vector = irte.hi.fields.vector;
>>       irq->dest_mode = irte.lo.fields_remap.dm;
>>       irq->redir_hint = irte.lo.fields_remap.rq_eoi;
>> -    irq->dest = irte.lo.fields_remap.destination;
>> +    if (!iommu->xtsup) {
>> +        irq->dest = irte.lo.fields_remap.destination & 0xff;
>> +    } else {
>> +        irq->dest = irte.lo.fields_remap.destination |
>> +                    (irte.hi.fields.destination_hi << 24);
>> +    }
> 
> Weird way to put it. Why not if (iommu->xtsup) ... ?

Okay, I'll fix this in next version.

>>   
>>       return 0;
>>   }
>> @@ -1503,10 +1509,15 @@ static void amdvi_init(AMDVIState *s)
>>       s->enabled = false;
>>       s->ats_enabled = false;
>>       s->cmdbuf_enabled = false;
>> +    s->efr_reg = AMDVI_DEFAULT_EXT_FEATURES;
>> +
>> +    if (s->xtsup) {
>> +        s->efr_reg |= AMDVI_FEATURE_XT;
>> +    }
>>   
>>       /* reset MMIO */
>>       memset(s->mmior, 0, AMDVI_MMIO_SIZE);
>> -    amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, AMDVI_EXT_FEATURES,
>> +    amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, s->efr_reg,
>>               0xffffffffffffffef, 0);
>>       amdvi_set_quad(s, AMDVI_MMIO_STATUS, 0, 0x98, 0x67);
>>   
>> @@ -1586,6 +1597,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
>>       amdvi_init(s);
>>   }
>>   
>> +static Property amdvi_properties[] = {
>> +    DEFINE_PROP_BOOL("xtsup", AMDVIState, xtsup, false),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>>   static const VMStateDescription vmstate_amdvi_sysbus = {
>>       .name = "amd-iommu",
>>       .unmigratable = 1
>> @@ -1612,6 +1628,7 @@ static void amdvi_sysbus_class_init(ObjectClass *klass, void *data)
>>       dc->user_creatable = true;
>>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>       dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
>> +    device_class_set_props(dc, amdvi_properties);
>>   }
>>   
>>   static const TypeInfo amdvi_sysbus = {
>> diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
>> index 79d38a3e41..96df7b0400 100644
>> --- a/hw/i386/amd_iommu.h
>> +++ b/hw/i386/amd_iommu.h
>> @@ -154,6 +154,7 @@
>>   
>>   #define AMDVI_FEATURE_PREFETCH            (1ULL << 0) /* page prefetch       */
>>   #define AMDVI_FEATURE_PPR                 (1ULL << 1) /* PPR Support         */
>> +#define AMDVI_FEATURE_XT                  (1ULL << 2) /* x2APIC Support      */
>>   #define AMDVI_FEATURE_GT                  (1ULL << 4) /* Guest Translation   */
>>   #define AMDVI_FEATURE_IA                  (1ULL << 6) /* inval all support   */
>>   #define AMDVI_FEATURE_GA                  (1ULL << 7) /* guest VAPIC support */
>> @@ -173,8 +174,9 @@
>>   #define AMDVI_IOTLB_MAX_SIZE 1024
>>   #define AMDVI_DEVID_SHIFT    36
>>   
>> -/* extended feature support */
>> -#define AMDVI_EXT_FEATURES (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
>> +/* default extended feature */
>> +#define AMDVI_DEFAULT_EXT_FEATURES \
>> +        (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
>>           AMDVI_FEATURE_IA | AMDVI_FEATURE_GT | AMDVI_FEATURE_HE | \
>>           AMDVI_GATS_MODE | AMDVI_HATS_MODE | AMDVI_FEATURE_GA)
>>   
>> @@ -278,8 +280,8 @@ union irte_ga_lo {
>>                   dm:1,
>>                   /* ------ */
>>                   guest_mode:1,
>> -                destination:8,
>> -                rsvd_1:48;
>> +                destination:24,
>> +                rsvd_1:32;
>>     } fields_remap;
>>   };
>>   
>> @@ -287,7 +289,8 @@ union irte_ga_hi {
>>     uint64_t val;
>>     struct {
>>         uint64_t  vector:8,
>> -                rsvd_2:56;
>> +                rsvd_2:48,
>> +                destination_hi:8;
>>     } fields;
>>   };
>>   
>> @@ -367,6 +370,9 @@ struct AMDVIState {
>>   
>>       /* Interrupt remapping */
>>       bool ga_enabled;
>> +    bool xtsup;
>> +
>> +    uint64_t efr_reg;            /* extended feature register */
>>   };
>>   
>>   #endif
>> -- 
>> 2.25.1
> 

Thanks,
Quang Minh.

