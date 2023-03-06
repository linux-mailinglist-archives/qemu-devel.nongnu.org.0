Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDE66AC855
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:39:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDrv-0004ht-3O; Mon, 06 Mar 2023 11:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pZDrq-0004ga-KO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:39:20 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pZDro-0005iR-Vi
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:39:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id oj5so10347581pjb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 08:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678120755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LyNRya//n5SQSvg9VTfHQMfEUKAunsPseLPVYhD2Yas=;
 b=gnicLGiG7Z7RH/7FXF/ftYz69dlbiwOuTXZxHjEL3DtslxItlpIc4Td/+cRjbEsqDa
 ze3ZdaKxUYt7LoDvCGoTvVCyXkbpkVpxUG6yZUPN/ne1khIHmbOW5BpM+r495h+DMPfy
 +2npPG7tYmlyY+XKoZprOBzEFceRyr1vCwdQ/fzWOquUP3HA1Sb5K9IqPxSNN33ZyuKv
 WM7INwtW4gI+glAi25kPH42CZq+ZYH8yjUR+nM9xElAStHDAupe2m0GNnPH/z1BcDiHy
 XxOsQ3EQKWX3+U081C7smfv8IzMkXvAvNbwdf99zUn5X5cQe2EK2F1q1NKRZ/4joWBZb
 jaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678120755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LyNRya//n5SQSvg9VTfHQMfEUKAunsPseLPVYhD2Yas=;
 b=G/tV41GylHOCxbprMFb264YBoTdOiMASX1OeYoKnDUtfNy+VqIx+cKTGGuRGzRYHqv
 toXPY/iSlqnSgFpq9jx93LXhzwN8M+igs1HY1D7Og/q4TPKuGui4Dn7HGJABFMS/2ByO
 YSgJL31IwTJL8c4kMZSXty3XvXD182Vr6umNiExRPQYNj6IlbtvpgUE3XZ/wQXCxcD8B
 J9H45NCd0GwuMFcDPo0qMt2veUwS0oDuuiLZh1k+uREfaLG1yw1ApQEmDM8Jqj0sB4ed
 7E984D8sN3xILtFr7sfJxhjniHiKWSybRZILfbQqIn8dnI4NWsGc1cShWiF6fxKH1LRm
 RuyQ==
X-Gm-Message-State: AO0yUKVGYayQuODq8qUF/J4enax9jX5eiw+3H7lqNg9MXOEaVA8MTNsh
 S023nfur1ahGbbegQleI9iQ=
X-Google-Smtp-Source: AK7set8T9rpGsWK15vIlh09YManjAhe3MGAD0EobHmfvP3H+6/2FFXE82nXaySsPkcfM/a+NNmvI2g==
X-Received: by 2002:a17:90a:19:b0:23a:ad68:25a7 with SMTP id
 25-20020a17090a001900b0023aad6825a7mr4109179pja.2.1678120754727; 
 Mon, 06 Mar 2023 08:39:14 -0800 (PST)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a17090aca9400b0023317104415sm7992698pjt.17.2023.03.06.08.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 08:39:14 -0800 (PST)
Message-ID: <f348f44d-1f27-58df-22e6-dfd015588a1a@gmail.com>
Date: Mon, 6 Mar 2023 23:39:09 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
To: David Woodhouse <dwmw2@infradead.org>, Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
 <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
 <20230227170759.12297901@imammedo.users.ipa.redhat.com>
 <f24683be-f3a7-34fe-279a-11d01e696bbc@gmail.com>
 <20230228173954.6a7b6c4f@imammedo.users.ipa.redhat.com>
 <71d9e801-80b2-d5ed-4c02-b328f0b175d4@gmail.com>
 <20230306114331.531c9cd2@imammedo.users.ipa.redhat.com>
 <96f1f670d576dbb1969055353b9e7b5a8632a4c8.camel@infradead.org>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <96f1f670d576dbb1969055353b9e7b5a8632a4c8.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

On 3/6/23 22:51, David Woodhouse wrote:
> On Mon, 2023-03-06 at 11:43 +0100, Igor Mammedov wrote:
>>> However, there are still problems while trying to extending support to
>>> APIC ID larger than 255 because there are many places assume APIC ID is
>>> 8-bit long.
>>
>> that's what I was concerned about (i.e. just enabling x2apic without fixing
>> with all code that just assumes 8bit apicid).
> 
> Even before you extend the physical APIC IDs past 254 or 255, there's
> still the issue that 255 isn't a broadcast in X2APIC mode. And that
> *logical* addressing will use more than 8 bits even when the physical
> IDs are lower.
> 
>>> One of that is interrupt remapping which returns 32-bit
>>> destination ID but uses MSI (which has 8-bit destination) to send to
>>> APIC. I will look more into this.
> 
> The translated 'output' from the interrupt remapping doesn't "use MSI",
> in the sense of a write transaction which happens to go to addresses in
> the 0x00000000FEExxxxx range. The *input* to interrupt remapping comes
> from that intercept.
> 
> The output is already "known" to be an MSI message, with a full 64-bit
> address and 32-bit data, and the KVM API puts the high 24 bits of the
> target APIC ID into the high word of the address.
> 
> If you look at the "generic" x86_iommu_irq_to_msi_message() in
> hw/intc/x86-iommu.c you'll see it's also using the same trick:
> 
>      msg.__addr_hi = irq->dest & 0xffffff00;

Yeah, I see that trick too, with this hunk and temporarily disable 
broadcast destination id 0xff in physical mode, I am able to boot Linux 
with 255 CPUs (I can't see how to use few CPUs but configure with high 
APIC ID)

@@ -814,7 +816,12 @@ static void apic_send_msi(MSIMessage *msi)
  {
      uint64_t addr = msi->address;
      uint32_t data = msi->data;
-    uint8_t dest = (addr & MSI_ADDR_DEST_ID_MASK) >> 
MSI_ADDR_DEST_ID_SHIFT;
+    uint32_t dest = (addr & MSI_ADDR_DEST_ID_MASK) >> 
MSI_ADDR_DEST_ID_SHIFT;
+    /*
+     * The higher 3 bytes of destination id is stored in higher word of
+     * msi address. See x86_iommu_irq_to_msi_message()
+     */
+    dest = dest | (addr >> 32);

I am reading the manual now, looks like broadcast destination id in 
x2APIC is 0xffff_ffff in both physical and logic mode.

By the way, thank you very much for your review.
Quang Minh

