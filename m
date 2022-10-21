Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232126078BF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:42:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsIQ-0007JV-5R
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:42:46 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrxh-0003Mw-Pc
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olrxE-0002nX-UQ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:21:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olrx3-0003ay-Gq
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:20:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id f11so4389137wrm.6
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fclBL2DpDYJrYU1BjyQuOIQ/MO5tKMgq37veQJeQ2n4=;
 b=FSBb67Bt1oZuJV6sOvlww0UJMA+bSH0WGVgnpYeTqP6H21Ju+WifYioUQAeL0Nojtk
 Z81sVaaMW50wPC77SAXzQPzQn3MkICX1KWjdWC4rEd6Asr/d9glTKj9ssYm/TY/E+Zje
 eKKrFQb6KQj0l9G+sXGCrAUg/b8jIvpIDDqW2WJQY4B1aZ8lWwCBCBngWofPok/o+8KJ
 f3QpbeawwQAyFFrJfDNL7M94T9UDPv1RTUPouKnpCuH6UJbc5hGzsBsFbDaN0V/8KCR1
 WXhNP+Dx4QWh4L/UlRa2mIpXMIkKjtzp7Gf8SaMwCkoqJNGJGjvZnKjtrcK5ryDzEgEV
 OZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fclBL2DpDYJrYU1BjyQuOIQ/MO5tKMgq37veQJeQ2n4=;
 b=MM9wJe/LVkLfv03pMedB6UyV5l9jHqwpkOjFXzVXvAvcQLrXcRSlGIA/+CB7mAtwKU
 vtP2t7WAppE4AdAVkCASNGLRkenmOt2KP1hFElzjphzLEgn/l4JrMD7rEc9Q0Esz4tSF
 G2lpwc682LZd25yke0ub0MJgqYqtZwHnFbJgecAVmt3VXW6wPBVl74Ifx94KZ7H/9A5H
 8yDZysXMcHIheeLedGZg0EoH2L2sz7Yj0w8CpBnEDextnhex2Qk4URqGeYpFLVpkMA7S
 PAjnMGtNxmWAYD7WUlxPLhU/DhoKvpo26X6jKPfNDx7pYpvtumN8bOnQuZKxR4+7Tvz4
 A6fA==
X-Gm-Message-State: ACrzQf0iLTxMHwj7uT8u8PwXTqwAa+UM2nNglB4AR40AHP8aUG8aQyQE
 NkU8eQC5JGtC0Y9c9A4F809c6Q==
X-Google-Smtp-Source: AMsMyM5e+Pbh1hb3QzRiLSLXWqIsw5ixTNWz9T3X6aT1kKxl5LI+D4J2QxglQZ8ZWWf5VOIdNxh+jw==
X-Received: by 2002:a05:6000:18a1:b0:230:f9fb:c83 with SMTP id
 b1-20020a05600018a100b00230f9fb0c83mr12373772wri.329.1666358439681; 
 Fri, 21 Oct 2022 06:20:39 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adff452000000b0022584c82c80sm18829340wrp.19.2022.10.21.06.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 06:20:39 -0700 (PDT)
Message-ID: <34aef1b8-c8bb-995f-c9ee-0c9c982620c5@linaro.org>
Date: Fri, 21 Oct 2022 15:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v14 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 xen-devel@lists.xenproject.org, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-16-lvivier@redhat.com>
 <1f769d00-cf50-abaf-f078-f301959156b9@linaro.org>
 <87tu3x1n2m.fsf@pond.sub.org>
 <881f1b6d-ac9f-a144-0e13-622981f02130@redhat.com>
 <871qr11kgt.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qr11kgt.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/22 13:31, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 10/21/22 12:35, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> On 21/10/22 11:09, Laurent Vivier wrote:
>>>>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>>>>> This allows net/stream to use all the available parameters provided by
>>>>> SocketAddress.
>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>>> ---
>>>>>     net/stream.c    | 492 +++++++++++++++++-------------------------------
>>>>>     qemu-options.hx |   4 +-
>>>>>     2 files changed, 178 insertions(+), 318 deletions(-)

>>>>> +    addr = qio_channel_socket_get_local_address(listen_sioc, NULL);
>>>>> +    g_assert(addr != NULL);
>>>>
>>>> Missing propagating Error* (observed in v12).
>>>
>>> *If* this is really a programming error: what about &error_abort?
>>
>> assert() informs the compiler that following code will not use addr with a NULL value, I
>> don't think &error_abort does that. This could avoid an error report in code static analyzer.
> 
> I'd expect Coverity to see right through it.
> 
> Static analyzers with a less global view won't, of course.
> 
> For what it's worth, there are about a thousand uses of &error_abort
> outside tests/.  I'm not aware of them confusing static analyzers we
> care about.
> 
> I like &error_abort, because it makes the program crash when we try to
> put the error into &error_abort, with an informative message.  This is
> often right where things go wrong[*].  I personally don't care much
> about the better message, but others do.  The better stack backtrace has
> been quite useful to me.

I concur:

   qemu-system-x86_64: socket family 0 unsupported

VS:

    ERROR:../../net/stream.c:321:net_stream_client_connected: assertion
failed: (addr != NULL)

https://lore.kernel.org/qemu-devel/6fa6b9e5-fede-0f68-752f-0c0d8fa3494f@linaro.org/

> 
> Let's use &error_abort, and throw in the assert when a static analyzer
> we care about needs it.
> 
> 
> [*] error_propagate() messes this up.  That's why the comments in
> error.h ask you to do without when practical.
> 
> 


