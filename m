Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017B2F9E72
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:40:45 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Sto-0007z2-3n
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Srd-00072e-3R
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:38:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Sra-0003B4-FF
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610969905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0d1RWxP11A2NadWM5hSbgly1+YXaXGcngWM8xR+KFzI=;
 b=AYh68fmBjJMwOiMmOeOw/NPiZyRrXez3UmMABDxyhbtLlXUr7HkxG3RWl4UYjF+lPOq7+1
 29mgF/JEad4t2FFn+LcC92gy4fBH5mSnG9Yg1ySF5OF6U8vHeJWwek4V7z/UX9/ioCRwEr
 YAnh5DY2LEOL2Cj8HTYwpZctAw5NITs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-VdEc1yTpObScRFygIGdxEg-1; Mon, 18 Jan 2021 06:38:21 -0500
X-MC-Unique: VdEc1yTpObScRFygIGdxEg-1
Received: by mail-ed1-f71.google.com with SMTP id a9so7782815edy.8
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 03:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0d1RWxP11A2NadWM5hSbgly1+YXaXGcngWM8xR+KFzI=;
 b=kkiCzOjOn/pTWrxUkm+1CPPlc3viMJadHtj98U4PdUW2CWn2zTxWtoMobDW5fuXTKS
 HcCQoP2gi4x5F1W28Lp6qB2YIn1HdWo+AUJupylgxFd4PNjnzNgy5Va6p8vtucwRlwCd
 f/1JOYuozLdfcvksCjB6p8VgyUq28JW/MbryIXVrwZ847uASmQUIJXTgLuriE0Pfggrc
 c5L7Rc6EvgKvXvhRh6qNTJm3WX2SSQ0EUhni4t5zHpbJtjCkKdTmdz0bDgYT2Lgv3YU8
 CmTK3O2E1HMusfSlR4haPRSdmXL5aeO5jdfThHkr1UZCdSBTLqcmJKif3SS9nkY2IJhg
 QcFg==
X-Gm-Message-State: AOAM533Yvi0qxjvB/FBvkNZnP7I7mjTjmXsb6vRYBKGjXLd5napaBZ13
 Vj6uGwelw2lMhGjtCkAe1+HNwIJg8pbx/dnLqrB+4MuGink1HX7shfqrVUmpdckc/imkXRJGRyn
 ljf9WzNbfDBgAcRipqR1TcXziWLeCTyBzV8FeNjjLOXw36tnQCY6MGkt7NwRgFKCc
X-Received: by 2002:a17:906:7b8d:: with SMTP id
 s13mr16748042ejo.479.1610969900133; 
 Mon, 18 Jan 2021 03:38:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWuayhLG3cxeS0kJtVIVNnTZd+Fq5ZkkaRsjAcgFQ3VKGRqF+E4R3Hxq9MvD3hmAigdPa5Zw==
X-Received: by 2002:a17:906:7b8d:: with SMTP id
 s13mr16748025ejo.479.1610969899855; 
 Mon, 18 Jan 2021 03:38:19 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w12sm4638719edr.29.2021.01.18.03.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 03:38:19 -0800 (PST)
Subject: Re: [PATCH-for-5.2? v3 3/9] hw/usb: reorder fields in UASStatus
To: Daniele Buono <dbuono@linux.vnet.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-4-dbuono@linux.vnet.ibm.com>
 <4677dea1-bdd2-0095-e75c-2ca6d9be0cb9@redhat.com>
 <afff8e95-ac1f-552a-c8b3-ff008947bf98@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9675d8c2-9913-3bc7-2b53-9ed3413fbd23@redhat.com>
Date: Mon, 18 Jan 2021 12:38:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <afff8e95-ac1f-552a-c8b3-ff008947bf98@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 5:16 PM, Daniele Buono wrote:
> Hi Philippe,
> 
> On 11/6/2020 9:28 AM, Philippe Mathieu-Daudé wrote:
>> On 11/5/20 11:18 PM, Daniele Buono wrote:
>>> The UASStatus data structure has a variable sized field inside of
>>> type uas_iu,
>>> that however is not placed at the end of the data structure.
>>>
>>> This placement triggers a warning with clang 11, and while not a bug
>>> right now,
>>> (the status is never a uas_iu_command, which is the variable-sized
>>> case),
>>> it could become one in the future.
>>
>> The problem is uas_iu_command::add_cdb, indeed.
>>
>>>
>>> ../qemu-base/hw/usb/dev-uas.c:157:31: error: field 'status' with
>>> variable sized type 'uas_iu' not at the end of a struct or class is a
>>> GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>
>> If possible remove the "../qemu-base/" as it does not provide
>> any useful information.
>>
> Sure, will do at the next cycle
>>>      uas_iu                    status;
>>>                                ^
>>> 1 error generated.
>>>
>>> Fix this by moving uas_iu at the end of the struct
>>
>> Your patch silents the warning, but the problem is the same.
>> It would be safer/cleaner to make 'status' a pointer on the heap IMO.
> 
> I'm thinking of moving 'status' in a pointer with the following code
> changes:
> 
> UASStatus is allocated in `usb_uas_alloc_status`, which currently does
> not take a type or size for the union field. I'm thinking of adding
> requested size for the status, like this:
> 
> static UASStatus *usb_uas_alloc_status(UASDevice *uas, uint8_t id,
> uint16_t tag, size_t size);
> 
> and the common call would be
> usb_uas_alloc_status([...],sizeof(uas_iu));
> 
> Also we'd need a double free when the object is freed. Right now
> it's handled in the code when the object is not used anymore with a
> `g_free(st);`.
> I'd have to replace it with
> `g_free(st->status); g_free(st);`. Would you suggest doing it place
> or by adding a usb_uas_dealloc_status() function?
> 
> ---
> 
> However, I am confused by the use of that variable-lenght field.
> I'm looking at what seems the only place where a command is
> parsed, in `usb_uas_handle_data`.
> 
> uas_iu iu;
> [...]
>     switch (p->ep->nr) {
>     case UAS_PIPE_ID_COMMAND:
>         length = MIN(sizeof(iu), p->iov.size);
>         usb_packet_copy(p, &iu, length);
>         [...]
>         break;
> [...]
> 
> It would seem that the copy is limited to at most sizeof(uas_iu),
> so even if we had anything in add_cdb[], that wouldn't be copied
> here?
> 
> Is this intended?

Gerd, do you know?


