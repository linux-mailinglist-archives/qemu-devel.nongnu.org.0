Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E3A458DFB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:06:06 +0100 (CET)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp85F-0008C0-Jy
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:06:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp840-0007H3-Ss
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:04:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp83y-0002pC-PJ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637582686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39yIz6lLPMrpmAQPLdmfeQDERMqPTewiDQw8O3Cj+kU=;
 b=OOgOIpL3bmWalxB8ruC8/fS5oz0cKx92+DwgC33fpIXDX8ji+26cI06rlpVEKbx0VDeVpm
 mTbU/Wj4h6W1nPYEj8atxczSW18jYDdHQJXb8XW9DkOQ3RO0jYKr+GE/I2agnsmII1ed4K
 Y06ZnvKAH3tUCxh/q7OD93mkWcyaV5I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-70zlB-FIOpG8hKlqHAljbg-1; Mon, 22 Nov 2021 07:04:45 -0500
X-MC-Unique: 70zlB-FIOpG8hKlqHAljbg-1
Received: by mail-wm1-f71.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so10080776wmc.7
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=39yIz6lLPMrpmAQPLdmfeQDERMqPTewiDQw8O3Cj+kU=;
 b=CdM9F8n9A25CbQClPs1tOCXl5lRTxlogUBv789/hZQ3DIt+fPme5V3IHvxQvaktMuq
 P9SF8KMj81ZAgafPKrTSEI0UgQdzBkGtjpYNU7K5NX0GLwkzVvv8qSmTTd/n9w0ozGc2
 jPVg1ZNOT7kDghljpDAxAULo+VcQSJ8BXY3UlliKVP9czrotEsXcBYSuvqyhSwGjEBhO
 803+53tq+y25hwNAsjt9Y5O0oa75i9hq058kE9CBDN0IZa9WbDMfBmYGfRl8WqJtKsVy
 x0mit80covfiOYvYcOfMT2sYgy058AjBVLirIFRmukm8AZXotet30F01CFLuxTz1zQS7
 fx4g==
X-Gm-Message-State: AOAM533uu7iN+ycMB+Xwclr3Gl/oj6ef3SqWJK+1l4PnZi5b7R1za9Gu
 wHX2Cnjbe2nSJsjMQgJd8lwWi8bwSJqBnYTe/Vi5zlClUPkyFtrSZGEL13M8RDUvtAINPXGCVNB
 UfbLYGOor95GBEXk=
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr28452642wmq.22.1637582683377; 
 Mon, 22 Nov 2021 04:04:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjT4PPLERNyL1WzG+Wp3tDGK4KUYKLQKLNjuCL5RhvOIcieCwW0KsZ8AS8fQLWiyaqQ1FuSQ==
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr28452624wmq.22.1637582683206; 
 Mon, 22 Nov 2021 04:04:43 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o10sm10696010wri.15.2021.11.22.04.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:04:42 -0800 (PST)
Message-ID: <d57c594d-41a4-6617-9890-a6e19955550f@redhat.com>
Date: Mon, 22 Nov 2021 13:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2? 0/2] hw/intc/arm_gicv3: Introduce
 CONFIG_ARM_GIC_TCG Kconfig selector
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211115223619.2599282-1-philmd@redhat.com>
 <CAFEAcA8TvHb3XG6Kw83=Bb69YZ+GF0p4r6uG+UdwM3UbLmQ31A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAFEAcA8TvHb3XG6Kw83=Bb69YZ+GF0p4r6uG+UdwM3UbLmQ31A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 11:59, Peter Maydell wrote:
> On Mon, 15 Nov 2021 at 22:36, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> The GICv3 ITS support has been introduced uring the 6.2 development
>> window (commits 18f6290a6a9..17fb5e36aab). This device is for
>> emulation. When building virtualization-only binary, it might be
>> desirable to not include this device.
>>
>> Introduce the CONFIG_ARM_GIC_TCG Kconfig selector to allow downstream
>> distributions to deselect this device.
>>
>> Based-on: pull-target-arm-20211115-1
>>
>> Philippe Mathieu-Daudé (2):
>>   hw/intc/arm_gicv3: Extract gicv3_set_gicv3state from arm_gicv3_cpuif.c
>>   hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> This looks OK to me, but I'm inclined to leave it for 7.0 at this
> point in the release cycle, unless it would be awkward for
> downstreams if we didn't put it in ?

Mirek was Cc'ed and didn't comment so let's delay it to 7.0.


