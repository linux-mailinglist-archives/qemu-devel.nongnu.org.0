Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BDA4FC906
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 01:58:13 +0200 (CEST)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne3vA-0004zp-3u
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 19:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne3ti-0003RA-46
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 19:56:42 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne3tg-0004iB-F7
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 19:56:41 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso957189pjh.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 16:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ISrYRqi5+w3aeq7oc2sJ/eee118BEF7YlYSYWqp1CI4=;
 b=Q8M6IbOA95iU19gJhT4I7n1wJe11lhYH+IB3ofiBTh3IwT9OgxjsbpnBuxjYidvPoS
 ZDJF1DKEmC/0HLP/tQeFKmtvSWr8TyRJQh/7F9U077PzDXEvA7lW4aAtqz0YWRKzkOyV
 lC6MDc0hldNl47WBKEc1cWxhBi+kN2UksXuYnwkOdlKYk9oisGsM7ajWRg8kOiyrReDf
 7HLmvZY7Lvzg9kNjhYivIeBOvRcHgZSbdD08jmfjo7Mnw2J8JakNAN/ji+9iI3a/QwS+
 7kaRX+loxPr6ZhrlAY+u1+alNq5fKar7/y91MUbaiHDDks3AGiIlWZmEevFW2KekwK12
 mqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ISrYRqi5+w3aeq7oc2sJ/eee118BEF7YlYSYWqp1CI4=;
 b=RD8/Bb2DLYXey0/+DjUv2HY+w5OMZgOJmcwA8Des7S123Jf05jlNB50CCHXUVRxQ62
 FAiOiea1nygy55GBK4wAqu0htbAgPZSENDGh0qQ67oGhjYHtwNdEUOMELYPAcp1u79w+
 /hwdvoRouGnzglagnPdNhKZoxwqNvGdUqVslW6w5SXUCJl8dIMfn3hfO7xNz17fyL/6S
 Vi6Th5ib+uLcJ4h0rNRuLfIFojTUuk/Ex4ateiN8M80fnFSsN89amrklX7QGd5J0G95F
 5et13qo+GL6fMX2b/9w2SoXEZgbkcizVOmntd0u3br9L8Kci+QkRXU0AwXBFtsCPs7h9
 RLcQ==
X-Gm-Message-State: AOAM5333krzJFAaNeIZc0wBmjqDu1/84IblphCFXtsnmk2xzJ57/c89T
 smDGj1W97Z26yvXU/4HiKT5MZA==
X-Google-Smtp-Source: ABdhPJygZjofaHHDVQQiRM8xnoET4OMToDdr2ndMSAsN4T4GDTRPwPbDRCJveJ9xcry9i+pQLHi98g==
X-Received: by 2002:a17:902:70cb:b0:158:424e:a657 with SMTP id
 l11-20020a17090270cb00b00158424ea657mr11984788plt.6.1649721398876; 
 Mon, 11 Apr 2022 16:56:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a63ac0a000000b0039901c45810sm778369pge.47.2022.04.11.16.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 16:56:38 -0700 (PDT)
Message-ID: <604c2f8d-95b9-cef9-21e6-a6fe569e4805@linaro.org>
Date: Mon, 11 Apr 2022 16:56:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] target/arm: Define cortex-a76
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-7-richard.henderson@linaro.org>
 <CAFEAcA_2sWO0LtKk+10Ktyhrn5WGV=9eqA+yWd5Mt=nUiJpAYg@mail.gmail.com>
 <925dd928-47e2-2bec-f97a-7041b6b6e649@linaro.org>
In-Reply-To: <925dd928-47e2-2bec-f97a-7041b6b6e649@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 11:30, Richard Henderson wrote:
>>    cpu->isar.dbgdidr
> 
> "If EL1 cannot use AArch32 then the implementation of this register is OPTIONAL and 
> deprecated."

Which we already handle in define_debug_regs by not defining DBGDIDR if this value is 0.


r~

