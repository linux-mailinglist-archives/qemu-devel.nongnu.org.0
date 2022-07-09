Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A256C61F
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jul 2022 05:01:56 +0200 (CEST)
Received: from localhost ([::1]:42924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oA0jC-0002OO-KX
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 23:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oA0hM-0001KQ-29
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 23:00:00 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oA0hK-0002Hi-5D
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 22:59:59 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p16so313836plo.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+wfnHbZqha+Bnbae0/WVZKsuUJrB7fybdYg9Vfg9MfA=;
 b=aUxyPdXKSwd0UinnwmEnUJ3e4lJl/uGAGrPQOIHOvoKrX2HFgl1tHixPc2A1/3jmjc
 AU8WbfjbJb1p0vM1gZMezxccJIcNg3o5xfyxEBwzl1hnAwOZmSdhLk33Acy61qbtcPIO
 DbH0IR1sR3g2aNCKNPvYLYrDRH7pw1wJFiDnVzqaSVEkIIu5geIeJsZfdq60//s8y+PR
 NQSZsKLlwHIrrfo5uaoIR8wm1LczJ/7I2OfK5MAD1GH/KZqk2VHbD08HfI5sQgEwVGMQ
 IE/r2922aK0OsZvTvoGARRG7qCnT2qkQUklP/8iStdK9HNSmwcgmJqjj+jfxUG/IGvVd
 SSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+wfnHbZqha+Bnbae0/WVZKsuUJrB7fybdYg9Vfg9MfA=;
 b=oJx1t8HmqwKwIQmnTyUyZjqLrpE0Sz1YKcuaZeD3JToGAfJoqS14RXBG1rY5alyrWQ
 2UlyoNsPGN9hxoKlUJ/tvCfuOseE0y8qIAcHYmKrVZbZPqMd+ElQJxqe28yUEgzN5UiJ
 o+RQwyGzewE19MVPvweByS68dHY9OhILcD9laiqPkr/dMea8ciNhuyntZ7cYYq9Ygh1c
 EqEv/RYFcRHpyfQbEMiM1cr4IfepdAzQ1Pzzq5hp2lGWs12UXyjwDxV5pOJNirNBmiDz
 EiG+waZyYU8iYnk9LTGVpl2caMJXpDGzndenzlJhtuqbiOjb38UoOCeBGRrrI3/5cf2b
 NXIQ==
X-Gm-Message-State: AJIora8uE/8emE8XkkErV8bpzf50gRK/MKUrKkl/KJtQRuClPZr9WtUi
 6P5V2MQvVAdOrMEQg+zpPj+pnA==
X-Google-Smtp-Source: AGRyM1t+bFbUEmHhT3R+sE2kPW09HXQQ3FsxckmcSw30y6vbNnROnMT1YAyv4bXb813fJvJ94G9xyw==
X-Received: by 2002:a17:90b:3ec2:b0:1ee:d9c3:53ce with SMTP id
 rm2-20020a17090b3ec200b001eed9c353cemr3438524pjb.189.1657335596424; 
 Fri, 08 Jul 2022 19:59:56 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a17090a2f8800b001e31fea8c85sm2050578pjd.14.2022.07.08.19.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 19:59:56 -0700 (PDT)
Message-ID: <89098547-6e30-96b0-2e7a-f131999c5528@linaro.org>
Date: Sat, 9 Jul 2022 08:29:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220707161656.41664-1-cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220707161656.41664-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/7/22 21:46, Cornelia Huck wrote:
> If I'm not misunderstanding things, we need a way to fault in a page together
> with the tag; doing that in one go is probably the only way that we can be
> sure that this is race-free on the QEMU side.

That's my understanding as well.


r~

