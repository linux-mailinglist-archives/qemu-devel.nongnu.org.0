Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA138982A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 22:43:22 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljT2H-0001aI-E6
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 16:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljSwn-0002SR-VM
 for qemu-devel@nongnu.org; Wed, 19 May 2021 16:37:41 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljSwm-0003dA-A8
 for qemu-devel@nongnu.org; Wed, 19 May 2021 16:37:41 -0400
Received: by mail-ua1-x92a.google.com with SMTP id 20so4860056uaf.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 13:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6v5522Feu9V2xjfyaU9l3pEDSfIF+EzqIdJJOEYi3Hs=;
 b=vYwcUoDxfflqf7Lb/ZNGtqoIJrHlgRKdpV6+qsgx7r0oXQf1T/ImVrtbi24ATBa6HY
 3AWoxoJsAU3VpyCIxOTvRA8LxQXQ9WV7IUM0KAnQva+af+Z3r4w8mXyvymPmeRZthUgK
 etG9IDVQejwO/A2LhQaUkpoZH4MhHipiN4Jrf/mC//8Pzvf38ukbPlInLz0uOiBWe2cj
 uOARlcMWmzM9kIeWtFY1eqwZVj/je3lw5Lwi7OE23ULqbUt2JqnrEb9TMrZ4SqYxhpqT
 7q9oDZv4G1rAfnblODww1fwjIWOzJ9hs+zv0HQ+0F/qBQmdTCC/Iw18/sUI0V8m+nWp0
 5mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6v5522Feu9V2xjfyaU9l3pEDSfIF+EzqIdJJOEYi3Hs=;
 b=FEWPMe3AmAd3a+ZP08ZGncnX6kY6pC1CuHiR7vvYO/cdVZq5MsTKScBUCAtrfKbGGg
 Job10rdilqux8CVrcryDzjB67D/g/JvFqmQK6G0C+5WuKOukwz/vX4GXfjreG88pqjfV
 N3PE/pndGVPBR4/US/9bhW7Uls3d8vnbO40/WsuIGsus0I/AANQ+C0AtXCqvxwQyPSdE
 fGPmHZwgsOm4biQR8brrLy9sbT0Ii8Z54p1vpRN6Bgk6dBaSWwvLxnb1DkK1MC+a9YN7
 taCHndLFfS3/gCGIJSZWbZRXyideOoaR7/jUAKNNwXakIaw2nWvWotnDZjt4v1DYoJ8I
 iH7g==
X-Gm-Message-State: AOAM533e427J4PozIyDCZJ9e59UMY4kHZ8/aFXfLIxh9Ow6BmIhdFGoM
 0Pkj5mpC2cR5yQOOWRLwFfv14g==
X-Google-Smtp-Source: ABdhPJy3keIgcGVlq/mb07MDEscD/sM7RNFn6ZX6Sc68HdfTPrL78a/dYWP4EV59B3ovpnysGxvfLQ==
X-Received: by 2002:ab0:43c2:: with SMTP id l60mr1655868ual.95.1621456658733; 
 Wed, 19 May 2021 13:37:38 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id m6sm121511vso.7.2021.05.19.13.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 13:37:38 -0700 (PDT)
Subject: Re: [PATCH 00/24] target/ppc: Clean up mmu translation
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <YKR9bZmPxOHKlnnP@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a4c91d4-c813-2803-e5e7-4f8fe6d6f05d@linaro.org>
Date: Wed, 19 May 2021 15:37:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKR9bZmPxOHKlnnP@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 9:52 PM, David Gibson wrote:
> On Tue, May 18, 2021 at 03:11:22PM -0500, Richard Henderson wrote:
>> This attempts the cleanup I've been talking about with Bruno.
>>
>> On the way, there's a lot of MMUAccessType cleanup, to get the
>> code into the form I wanted the interface to share.  There's a
>> lot more cleanup that could be done, particularly wrt the older
>> mmu models.
> 
> I've applied 1..15, still looking at the rest.

Please dequeue.  I want to create a new mmu-internal.h, which affects all the 
patches from #1.


r~


