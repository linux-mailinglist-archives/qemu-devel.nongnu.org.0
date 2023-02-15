Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E8B69772E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:13:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSBxm-0008JI-Ji; Wed, 15 Feb 2023 02:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSBxl-0008Io-0V
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:12:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSBxd-0005UY-MC
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:12:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso777820wms.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 23:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ROt0WgXSryr0kEJ+ahBghatYhZlbuoa/JfqIV/lj/c=;
 b=O0om8eCMiyl4VVccZ7RqeJC1/jmRT2pRIaoEy3XBd1mno1lIg2XZ3Ht1XGrOKQCQX9
 GXahcCCK9a48J1sDBd481KI4NJ6rO0BeqIOCoDVQbYr6ufaK9x5jlkSoLYmIEY+0o7WY
 ZdR9wavMeMpPiR2dn7o5fjmY7Myp011uai/KgZIzARVSZiMrrkZUSqMvXb9yc5TO1PxK
 IAiiGIV3uctSYTXaQR2+jchDQaxEHTmgNC4BJONG0aM/WQgoUxcfVaGvjJr6Td80Y/qz
 cJM8K3nzcWP7SALvuuP4b02ZcEvEe2Xuv7rYr2Y1FoHN5E65yjUYdwgQcm3nsS6X5zbg
 oYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ROt0WgXSryr0kEJ+ahBghatYhZlbuoa/JfqIV/lj/c=;
 b=3/SUjTiQoRflBeJ8Sqeq7fL+v4hEMNefenPntvyclbhpYhduQxpQUBLKFAzJCcSc82
 g/1fQQQ/MyaCNG9P2vYGLQvzoxWiVfjLTkc9qwx8JSBJ4gAae7/SxDzpCy6fsBdAcg8a
 LMVJa4RWD801JayHz7LkURVku2YzKfB01BXh/7JYQF02b/gR2DhwJcwjpkFt4y3xHHCX
 SP/gUEm4ic7PYwT4NgWqleNo3ovle4d+3xOL24Dal5d7mMv6ybRUhdoH2x2ovzHXGf0U
 6mFPa5egk344JOH861GxC3RTlX9M05suVNogk3HWz5pnN7ShJ4X8+ZEp/mYRAvQc5HbP
 61Rg==
X-Gm-Message-State: AO0yUKUOOAqThWOuEqBOp/+CBBmjQGYJA09sdaN0++rFTYhWdyXQVCpE
 hoCS4dU2KrejY82fJjdefYjGvA==
X-Google-Smtp-Source: AK7set8xeUWpvdQVsk+f9b9mfASyFOYoJjm9OON+mixP5ZPwRxjNhjImrmD42aZ8ISMe2xkrDEzVEg==
X-Received: by 2002:a05:600c:705:b0:3e0:6c4:6a3a with SMTP id
 i5-20020a05600c070500b003e006c46a3amr1075239wmn.22.1676445130356; 
 Tue, 14 Feb 2023 23:12:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003dd1bd0b915sm1148178wms.22.2023.02.14.23.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 23:12:10 -0800 (PST)
Message-ID: <7ec3bb81-05ae-f73e-b33b-9871f568f4ea@linaro.org>
Date: Wed, 15 Feb 2023 08:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 6/7] hw/isa: Assert isa_register_portio_list() gets
 non-NULL ISA device
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-7-philmd@linaro.org>
 <8bcc1035-c9fc-762a-7a32-6b0344539345@linaro.org>
 <f088930b-ad9d-354d-5053-f319272140a1@linaro.org>
 <be88dc7c-750f-f4a3-c350-d780e36337ae@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <be88dc7c-750f-f4a3-c350-d780e36337ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 14/2/23 19:49, Richard Henderson wrote:
> On 2/14/23 00:18, Philippe Mathieu-Daudé wrote:
>>   __attribute__((nonnull)) void a1(void *ptr)
>>   {
>>     // can no use assert(ptr) because compiler warning
>>   }
> 
> I briefly glossed over that...
> 
>>> I realize we'd probably want to add -fno-delete-null-pointer-checks 
>>> if we make too much 
> 
> ... here.  The compiler warning should go away with the right flag.

Doh, got it now!


