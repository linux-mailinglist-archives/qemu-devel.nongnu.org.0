Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1B78518C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 18:59:32 +0200 (CEST)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvPHf-0002vh-EF
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 12:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49611)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvPH6-0002Wc-18
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:58:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvPH5-0006vT-4r
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:58:55 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35505)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvPH4-0006uW-Vk
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:58:55 -0400
Received: by mail-wr1-f67.google.com with SMTP id k2so6235266wrq.2
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 09:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WWYU6IAg8ypbE442fE9n0mg8KZggvKY5YHO9BktClZY=;
 b=Hi4EO+vZO/A/KX5VKgTh2JWDOUY5n9DrHeAcvMhABnyqi1L18+nu4xfGE4KZwM5zA8
 F0YIj4hcjGoo7RjolvAWTwfE1R2ZxNxm3fq9ePETEgMq0mOK3kpBQiOAy/ybibXWOTq6
 AQ7zQX1vuLgSFxpzJi6uEQs1AIXrqg8cn77LY5dg+yf4sk2eqAZAgIBNyLd7xUPEx02P
 dXaM4FXEfx0YEBL+2CYqJjf4zLy9zBQ1IgAmhtBFuTR62qikvde4JJSjG4kgJubcsypX
 gyaJVCAOxz9/zrnvtUlzb8qYbST/ModPxXtg/OCT1EZQJWjPE1FnZ4DtriGD9N+wYXM/
 8s7A==
X-Gm-Message-State: APjAAAWqDDx1adWPV2m+6EccX9IBQwz+kF+NLuI3LZA0zGJhfD5h1kte
 MrQwGdJRvoCrGbr37N3gFUk41RXvD0FVPQ==
X-Google-Smtp-Source: APXvYqwv4cnKmOiX+ron2TGQ5OXqFgud+p3uvURxifYApEcpOwOwUX2o5cbc4uPF1RB/pm4tnEkGhw==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr12092152wrp.199.1565197133536; 
 Wed, 07 Aug 2019 09:58:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id g2sm840921wmh.0.2019.08.07.09.58.52
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:58:52 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190730123759.21723-1-pbonzini@redhat.com>
 <87r25xi1y7.fsf@linaro.org> <3bcecd49-bf0e-8503-12d7-ac9dfeb444cb@redhat.com>
 <35301c4b-8743-1e29-0f6e-968afec5faa7@redhat.com>
 <5882e101-19cb-8092-5248-1762625fdcb3@redhat.com> <87a7clhqwk.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3b47ebbc-9783-21a8-b856-79e5f3743d66@redhat.com>
Date: Wed, 7 Aug 2019 18:58:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87a7clhqwk.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH 0/3] tests/tcg: disentangle makefiles
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/19 18:38, Alex Bennée wrote:
>>> Rather, we use '#!/usr/bin/env bash' to find bash anywhere.
>> Nevermind - this script is pure Bourne shell.  The only fix needed
>> should be
> I thought we wanted to use pure POSIX shell and not rely on bash-ism's
> creeping in?
> 

There are uses of bash as long as it's marked as such (and not /bin/sh).
 But Bourne shell = /bin/sh, bash is the "Bourne-again" shell. :)

Paolo

