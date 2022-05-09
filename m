Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED251F454
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 08:19:50 +0200 (CEST)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnwkI-0005fb-29
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 02:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnwgE-0004jT-KZ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 02:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnwgD-0006Wz-3g
 for qemu-devel@nongnu.org; Mon, 09 May 2022 02:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652076935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMrzEeqSjaHjzMEF1QpMwc1HEvZI96Mxu3IkKA2K4sA=;
 b=hmGxUAIVpJi7NvUdoEXiWAKimJQhHwzHqH7tmrsijt0CDl6WiSvBF8+/N00V+cS7/0IqOw
 pUVKtxSEb/MzgrY+/RFhzw2QWsZC8JWC1XQ9cRAVlhjzRLS9iDAXKw6Dta3JvCmoxmxvD5
 0Sab5wbbDdA4xAFHwQSELXmLxbh+Hqg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-o7Y3f4MVNb-hmly3ajRCcw-1; Mon, 09 May 2022 02:15:34 -0400
X-MC-Unique: o7Y3f4MVNb-hmly3ajRCcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so3473883wmi.8
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 23:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tMrzEeqSjaHjzMEF1QpMwc1HEvZI96Mxu3IkKA2K4sA=;
 b=RWHhqzldDjLxDCsFvNGjWAg9+ktIneFyNQC/iLO3+EfodHTBHBv9oWEMCX6gwNgExZ
 k1q7u4QtyqJs6h1trZtT63fm9ogQs9zjGXKKWITRE152HyK1YIMTGYW/65SV/QhKzIb3
 nG9r0KMgnKoXzUfwWFxla5WwIH+4xVivHaEmcW1gYiG/3BNRN/33NQcoRMRVoMT9j1Om
 aklJxNb4WfYNAlhziLTYOAJJFS3TF3jIZeDsEYHDSgu6XomY0d6JC69egGKKSIV2IA2L
 2srOgGUwWjCDW+DQXEoeeSR584NveOoOzU7m6jOcAMpop2qREVsaOrn+kl2HqDnGmU37
 jsqQ==
X-Gm-Message-State: AOAM5304RVLASbKerdMkMsspDBjGEacNZxbidtLt4tFAFRyrQq0Al9bj
 LQ1QiNq75gexiyYKxSLuA+OVV/TclgE6Bmtw/57UKUgyaIJAHSQKahQXELS5euA6uzw8QLBTWds
 fsZyic8ZINnddUXU=
X-Received: by 2002:a05:600c:5113:b0:394:800c:4c36 with SMTP id
 o19-20020a05600c511300b00394800c4c36mr11164362wms.93.1652076933076; 
 Sun, 08 May 2022 23:15:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc/dLX51a33BsVvPFAQBfA8BuZRmYRm+6IIwPsmOz+0uzWSZADlyn81L5iymju8Jyh97e3GQ==
X-Received: by 2002:a05:600c:5113:b0:394:800c:4c36 with SMTP id
 o19-20020a05600c511300b00394800c4c36mr11164337wms.93.1652076932828; 
 Sun, 08 May 2022 23:15:32 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 v9-20020adf8b49000000b0020c8d8252dasm10549220wra.103.2022.05.08.23.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 23:15:32 -0700 (PDT)
Message-ID: <40fa1ceb-e762-c372-ffc9-2ded4998c08f@redhat.com>
Date: Mon, 9 May 2022 08:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 0/9] Misc patches
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220506143750.559526-1-thuth@redhat.com>
 <CAFEAcA8pPZJ-Yn2U+7G=eQOaNu0c4g3LGQvugf5vZ=vnA72Frw@mail.gmail.com>
 <2bbd36ab-5ca4-19bc-7bfe-1c53d01e02e0@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <2bbd36ab-5ca4-19bc-7bfe-1c53d01e02e0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 06/05/2022 19.28, Richard Henderson wrote:
> On 5/6/22 09:49, Peter Maydell wrote:
>> On Fri, 6 May 2022 at 15:41, Thomas Huth <thuth@redhat.com> wrote:
>>> ----------------------------------------------------------------
>>> * Remove redundant/obsolete x86 and arm disassemblers (Capstone is better)
>>> * Limit some Xen-related code to builds where Xen is really available
>>> * Remove hxtool-conv.pl
>>> * Update MinGW and OpenBSD to a more recent version in the CI
>>> * Warn user if the -vga flag is passed but no vga device is created
>>>
>>
>> I think Paolo mentioned an issue with the -vga patch here -- might
>> want to hold off on that one until he's had a chance to reply.
> 
> Ok.  I didn't see this before I pushed to staging, but I won't push to 
> master until I hear from Paolo.

As mentioned in the other mail thread, Paolo was right. I'll respin the pull 
request with the fix included.

  Thomas


