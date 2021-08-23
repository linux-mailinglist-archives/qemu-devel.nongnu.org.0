Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F0A3F4859
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:12:31 +0200 (CEST)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6wQ-00016r-Cj
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6v5-0000Nc-6l
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6v3-0001cg-Jq
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629713464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ofd4z7iGVEftewma8eRQYs1rowRGm69RFE6moW5YvMs=;
 b=DTTzNJV0+pj3M+fCBx3/QPSPpcmK/BHDkaAIA0F/cURQ22GlU/Eod8FH7lZuPEI0Z/BPUa
 v7JtZVe5wMfQzckgWUXQ0jpzqHdUlwViWkKvPmrxuiWou6YUc1dFryLjrbwLMSylirjcRI
 +fcw7nbkOc2/a6h5csDC7z28ukS2bGk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-KSJSTgRSMRiLH_yEyOvXCQ-1; Mon, 23 Aug 2021 06:11:03 -0400
X-MC-Unique: KSJSTgRSMRiLH_yEyOvXCQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so269386wml.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ofd4z7iGVEftewma8eRQYs1rowRGm69RFE6moW5YvMs=;
 b=DCqptpUp1iUlEAkCBb7DcsNpxlJXQRpr7a+c+BhGYUE0UY9Zs7Xv5GPKSo3JlfKqYo
 Q82QAXYyezRaZkQKpkAnd1UzTq2YmfHmIUIo5iQKde5LXI1y5uBtqT59ea1xRl+vFUAI
 W3kodeRV5xkzxO1/6sP5pc0mYpky2HN0vCYTHBUmSZS285AXR04MiGq6Wup07kXhYHBo
 au9nsX2itjOMBEeJFz6phtTcbik/fnTsXLSpfRhwng/MOHcmfLyaPPzdqWkFWdyJM4UT
 oZ0fJ/JjXI/2G1O/g4eyUhS5CxWf1rlL199AprO2SWeFQa1wPbeoPve0tEkdKVPzHecy
 ajGg==
X-Gm-Message-State: AOAM531LUDXw7wQRk7W8h1JWAvf4STg25Xnx4zLqaQ1miC7QD4uoWrV6
 /uAcHcXMZsjDvpx9GokgyLg0hjkTVvW+TsPCGgsVyCI4Tr5BvbiBIz0mQSgCc34PA1aJkx9bZRo
 /HzGTgv1obKKzQ7g=
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr15631679wmj.117.1629713462319; 
 Mon, 23 Aug 2021 03:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw33A1u1BVEV/5DZUH/6tQoZqbOWfgpguXBUj0s8eb018LrBnICZq95CZfUGvKjvFtUOqdLYw==
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr15631653wmj.117.1629713462063; 
 Mon, 23 Aug 2021 03:11:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l9sm14438253wrt.95.2021.08.23.03.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 03:11:01 -0700 (PDT)
Subject: Re: [PATCH v3] memory: Have 'info mtree' remove duplicated Address
 Space information
To: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210823085429.597873-1-philmd@redhat.com>
 <8743192d-225d-c091-ab53-c747daa86f46@redhat.com>
 <CAFEAcA8ok3RL41upiYt3mUeuFc8Nr_HPsQ7h4HvEPM9VH3jmiw@mail.gmail.com>
 <499a2d67-9234-30ec-2645-4e0f77dc336b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4b9f0f52-248c-c418-1df9-48ac4857a245@redhat.com>
Date: Mon, 23 Aug 2021 12:11:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <499a2d67-9234-30ec-2645-4e0f77dc336b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 11:35 AM, David Hildenbrand wrote:
> On 23.08.21 11:28, Peter Maydell wrote:
>> On Mon, 23 Aug 2021 at 10:20, David Hildenbrand <david@redhat.com> wrote:
>>>
>>> On 23.08.21 10:54, Philippe Mathieu-Daudé wrote:
>>>> +static void mtree_print_as(gpointer key, gpointer value, gpointer
>>>> user_data)
>>>> +{
>>>> +    MemoryRegion *mr = key;
>>>> +    GSList *as_same_root_mr_list = value;
>>>> +    struct AddressSpaceInfo *asi = user_data;
>>>
>>> Reverse Christmas tree?

I simply followed to order of the arguments as a no-brainer ;)

>> This has never been part of the QEMU style guidelines
>> and I would oppose our adding it. It would gain us very little,
>> the codebase doesn't consistently follow that rule today so
>> it wouldn't be preserving an existing consistency of style,
>> and it would be yet another weird stylistic issue that trips
>> people up and requires patch repins.

(in this particular case I've to respin for a typo).

> Ah right, it used very inconsistently in the QEMU codebase and even in
> this file (I spotted it's the case in the entry of mtree_info() and
> wondered if it's the case for this file -- turns out it's absolutely not).


