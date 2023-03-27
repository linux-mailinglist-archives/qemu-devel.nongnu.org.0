Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0B6CA97F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 17:47:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgp2e-0005qD-PN; Mon, 27 Mar 2023 11:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgp2U-0005k4-SG
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:45:42 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgp2T-0007Vt-8q
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:45:42 -0400
Received: by mail-pl1-x62b.google.com with SMTP id iw3so8823165plb.6
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 08:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679931939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l9KL+kITrFwHTaKWlno2/PmGeqqEdDfXwET3mFnyXDE=;
 b=alX3Au2jzpGmgHFLgOWIs9mkYnkl1eSQgQOYsMqOFXRSkKqAmQ51ZUtQh+en0ls8QP
 a4LlJeEY8WxSVEpvUBx2xQxD7dT2aL7/aXtRpbdLGcVPBVJI+ywPs5q8KEGE5rxmaCCV
 L/8Gze7dYwa0iDKjqXuWZKj9dqo9QJDyO0ZuO6p1kqE8QSkgAJ2zZ2HRHH0y0qgD6HD3
 cIo/zJegFHnj3Q9/hxfhVd59tae2+726DxKAH/hP2OM9vJJGLb2wCHusgEVOhVTKxuwK
 FoD7oAWF9jGqWkjfVXzW1j3d3zyZgFFXnWRr0eNGzOt7G6QE16+iXPdXjPlaUhmcD8dm
 hiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679931939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l9KL+kITrFwHTaKWlno2/PmGeqqEdDfXwET3mFnyXDE=;
 b=Y0Bm25M0wmH0kbdLALtsAZg9U3XPVTPpQdpksyXK4z+esfGJacPlfwAokQLW38yp5m
 C5p2KVlSnSUkkXAmdmhpve6CaFrQx/+ev7kzTHGbj+T3Uw7vGw7FG2HaLv82gfuW48Ko
 FBlzGtbYF1T6PNdMFJIovQA5z2QqNd0r6nllKlaHre1FRrGkM4SR23o80Gh6+BGUj1rG
 aZHM6W2uf/kxr5FKU7URafNuw4E0WpxjtboCBrcDsujadHA9oSzKOtv9jfCMFabmPqD/
 NrLO64sbY8QjL+xoedIqOrvmfHkgW/WSTkNKaErvWJXAH1bm9D0gqATpm8UmWObUiPb0
 Ll4g==
X-Gm-Message-State: AAQBX9fI0tvZe0rCXI3yNGAQA4el6dbAYayn2CZb0dbe7f4q36BCJ6VX
 fz1zj64Lo68jB+TTx53Bfi4=
X-Google-Smtp-Source: AKy350Yv2bVGyx/f6tNgbsewNuNRhJFTK+cevKViNcaBEE9IMfQI7O+J9fWs4ImZFNObcWfc1U7kmw==
X-Received: by 2002:a17:902:c70a:b0:1a2:1c7:1c26 with SMTP id
 p10-20020a170902c70a00b001a201c71c26mr8711281plp.0.1679931939272; 
 Mon, 27 Mar 2023 08:45:39 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b00198d7b52eefsm19269434plk.257.2023.03.27.08.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 08:45:38 -0700 (PDT)
Message-ID: <61446cfb-f937-3a0d-2a98-34febcc7e4f3@gmail.com>
Date: Mon, 27 Mar 2023 22:45:34 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/5] apic: add support for x2APIC mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230326052039.33717-1-minhquangbui99@gmail.com>
 <20230326052039.33717-3-minhquangbui99@gmail.com>
 <a8ea36d901a1b713ab8bc0f5bcd1b7d26ad6f9cb.camel@infradead.org>
 <05d55576-f703-18a1-7f9f-4c15b8c54490@gmail.com>
 <0944a6f4c7c1569c182a27d40bdeb0a164a41bbb.camel@infradead.org>
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <0944a6f4c7c1569c182a27d40bdeb0a164a41bbb.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x62b.google.com
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

On 3/27/23 22:37, David Woodhouse wrote:
> On Mon, 2023-03-27 at 22:33 +0700, Bui Quang Minh wrote:
>>
>>>> +    memset(deliver_bitmask, 0x00, max_apic_words * sizeof(uint32_t));
>>>> +
>>>> +    /* x2APIC broadcast id for both physical and logical (cluster) mode */
>>>> +    if (dest == 0xffffffff) {
>>>> +        apic_get_broadcast_bitmask(deliver_bitmask, true);
>>>> +        return;
>>>> +    }
>>>> +
>>>>         if (dest_mode == 0) {
>>>
>>> Might be nice to have a constant for DEST_MODE_PHYS vs.
>>> DEST_MODE_LOGICAL to make this clearer?
>>
>> I'll fix it in the next version.
>>
>>>> +        apic_find_dest(deliver_bitmask, dest);
>>>> +        /* Broadcast to xAPIC mode apics */
>>>>             if (dest == 0xff) {
>>>> -            memset(deliver_bitmask, 0xff, MAX_APIC_WORDS * sizeof(uint32_t));
>>>> -        } else {
>>>> -            int idx = apic_find_dest(dest);
>>>> -            memset(deliver_bitmask, 0x00, MAX_APIC_WORDS * sizeof(uint32_t));
>>>> -            if (idx >= 0)
>>>> -                apic_set_bit(deliver_bitmask, idx);
>>>> +            apic_get_broadcast_bitmask(deliver_bitmask, false);
>>>
>>>
>>> Hrm... aren't you still interpreting destination 0x000000FF as
>>> broadcast even for X2APIC mode? Or am I misreading this?
>>
>> In case the destination is 0xFF, the IPI will be delivered to CPU has
>> APIC ID 0xFF if it is in x2APIC mode, and it will be delivered to all
>> CPUs that are in xAPIC mode. In case the destination is 0xFFFFFFFF, the
>> IPI is delivered to all CPUs that are in x2APIC mode. I've created
>> apic_get_broadcast_bitmask function and changed the apic_find_dest to
>> implement that logic.
> 
> Maybe I'm misreading the patch, but to me it looks that
> if (dest == 0xff) apic_get_broadcast_bitmask() bit applies even in
> x2apic mode? So delivering to the APIC with physical ID 255 will be
> misinterpreted as a broadcast?

In case dest == 0xff the second argument to apic_get_broadcast_bitmask 
is set to false which means this is xAPIC broadcast

static void apic_get_broadcast_bitmask(uint32_t *deliver_bitmask,
                                        bool is_x2apic_broadcast)
{
     int i;
     APICCommonState *apic_iter;

     for (i = 0; i < max_apics; i++) {
         apic_iter = local_apics[i];
         if (apic_iter) {
             bool apic_in_x2apic = is_x2apic_mode(&apic_iter->parent_obj);

             if (is_x2apic_broadcast && apic_in_x2apic) {
                 apic_set_bit(deliver_bitmask, i);
             } else if (!is_x2apic_broadcast && !apic_in_x2apic) {
                 apic_set_bit(deliver_bitmask, i);
             }
         }
     }
}

In apic_get_broadcast_bitmask, because is_x2apic_broadcast == false, the 
delivery bit set only if that apic_in_x2apic == false (that CPU is in 
xAPIC mode)

