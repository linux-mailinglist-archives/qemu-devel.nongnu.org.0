Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EFE6CAAC4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:37:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpp3-0007CE-Tw; Mon, 27 Mar 2023 12:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgpoy-0007Bx-23
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:35:49 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgpou-0004LY-5a
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:35:47 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso12330408pjb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679934942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Te/MUACaW066dUvkaE8gh1N4ZX1M5h64Gby6Kq6jGTs=;
 b=p8f0Km/hvpWYwLPviHzH2SYWK2ub7dcAuUH0o3wNS/5E8dG01pzA5AzWm+tSdtWvPv
 tZPpWmyStf8cJxfLCOkcdIJi+KJMJQ8xE4mgC4pHzIiMS5RRe58jSFRLFqfXCqpBWVTf
 QMLH2/gWPBhgcK3Aqr8Jsx9qmj5ohlnsLijIf8ls9/Of4aZQ5OeKcd/wWPfOFvI4Xgl8
 fNFkowVhF8G5I43X2eOXCDH9p54I0V8ntfbyhhkLBZoUj8bWg4iESFninmqnblJQrs9d
 f4HSXrjgYZoLTkhQaTEvIZzv9qCUrYff8tukXswWllgHAzTXkbisyNF0LwPNkrJsHY93
 FOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679934942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Te/MUACaW066dUvkaE8gh1N4ZX1M5h64Gby6Kq6jGTs=;
 b=78dm6zpOmi66MWBS+eefeVVYFcm81tdns05DoRDAPpyykW35BO7yUk4ue+2q9GakDP
 jIiHwx6GUlTU1B5sSAToXRx9A7NxMharNTGyjGnKsZdj0f6JxLQuV8zUe05FhQOrP/56
 Vw60uNCXfZ9zy1W3ZIPjDcHEmi6jFjyhehElNdXBfNtb168C1DoWMXOuRXv3UbQjL3vf
 2rYZ1cmsq/LZ81mlglf6TVfERO5z7rqcgZl5lA2CffzJ9RzyogapPav3OatAS1B8Qj0i
 kg9u2Xl4g5C7GUMWH6Rdeo0jOU74uBwmTD565+T+mYgNhIeXYbbSaP9lZOZ6sWP1QtAz
 V1HA==
X-Gm-Message-State: AAQBX9dhkkSwjSPXgtrO7WPQxzlmCmliFHyRbpDzYaqkm7JfUeMqEU02
 Zf9/MD2ROQIjZUX/dID3JcM=
X-Google-Smtp-Source: AKy350aPe4F+k1RsN2eyfDNKO3qBe59AMn7mFy1V8gXshKN5uxchaZboRD3HkPf+VQsxYwY/GQ9drQ==
X-Received: by 2002:a17:90b:3911:b0:23f:9d83:ad76 with SMTP id
 ob17-20020a17090b391100b0023f9d83ad76mr13368797pjb.23.1679934942403; 
 Mon, 27 Mar 2023 09:35:42 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a17090ae38b00b0023b3ebedc17sm7693624pjz.46.2023.03.27.09.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 09:35:41 -0700 (PDT)
Message-ID: <445928d9-4cd3-978d-ce76-9cd01457b6f0@gmail.com>
Date: Mon, 27 Mar 2023 23:35:36 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/5] apic: add support for x2APIC mode
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
 <61446cfb-f937-3a0d-2a98-34febcc7e4f3@gmail.com>
 <3834475953c0f865e88251886f1e861d51c25a2b.camel@infradead.org>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <3834475953c0f865e88251886f1e861d51c25a2b.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x102b.google.com
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

On 3/27/23 23:22, David Woodhouse wrote:
> On Mon, 2023-03-27 at 22:45 +0700, Bui Quang Minh wrote:
>>
>>> Maybe I'm misreading the patch, but to me it looks that
>>> if (dest == 0xff) apic_get_broadcast_bitmask() bit applies even in
>>> x2apic mode? So delivering to the APIC with physical ID 255 will be
>>> misinterpreted as a broadcast?
>>
>> In case dest == 0xff the second argument to apic_get_broadcast_bitmask
>> is set to false which means this is xAPIC broadcast
> 
> Yeah, but it *isn't* xAPIC broadcast. It's X2APIC unicast to APIC#255.
> 
> I think you want (although you don't have 'dev') something like this:
> 
> 
> static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
>                                        uint32_t dest, uint8_t dest_mode)
> {
>      APICCommonState *apic_iter;
>      int i;
> 
>      memset(deliver_bitmask, 0x00, max_apic_words * sizeof(uint32_t));
> 
>      /* x2APIC broadcast id for both physical and logical (cluster) mode */
>      if (dest == 0xffffffff) {
>          apic_get_broadcast_bitmask(deliver_bitmask, true);
>          return;
>      }
> 
>      if (dest_mode == 0) {
>          apic_find_dest(deliver_bitmask, dest);
>          /* Broadcast to xAPIC mode apics */
> -        if (dest == 0xff) {
> +        if (dest == 0xff && is_x2apic_mode(dev)) {
>              apic_get_broadcast_bitmask(deliver_bitmask, false);
>          }
>      } else {
> 

Hmm, the unicast case is handled in apic_find_dest function, the logic 
inside the if (dest == 0xff) is for handling the broadcast case only. 
This is because when dest == 0xff, it can be both a x2APIC unicast and 
xAPIC broadcast in case we have some CPUs that are in xAPIC and others 
are in x2APIC. Do you think the code here is tricky and hard to read?

