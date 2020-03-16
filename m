Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6281873E1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 21:17:34 +0100 (CET)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDwB3-0007kd-B6
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 16:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDwA9-0007D4-Q4
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 16:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDwA8-0005pA-Ns
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 16:16:37 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:35426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDwA8-0005kb-GU
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 16:16:36 -0400
Received: by mail-pj1-x1043.google.com with SMTP id mq3so9284677pjb.0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FhITnVcXOIhnDs6uomlU7NICQahFSW5Nno5Xh6Sq2S4=;
 b=FoJB4AMPXLMvqJ/PwEVqdjzE4axxigJIAJXVIgptDfwHvaprZTEE5YOdc/y1goBOvu
 4ZZaQY5MzFzgkwfBhc4G6K7luBCzEvSeoGcAaYETYA7PnJtCwMVh8x/6uMPN5r/rJgGe
 YvRU50ybHtZ0mOlJF+eVXe7HpEaZrykr6uypERcyCu8bFl/CtCsdL0lE+IqAYOw0mHse
 AftV/lzKuiYcwTV9dV9xl96SMyhsFYDe2VXitZfHl2W6PrAaSmtQp92OiscOzfWMIIXG
 1Ek0faM4ssdTahTxkQcazBtwMjZurKMef+/NGaY6EsxiQaKqFpYLIQQbwlUIk/7+peV1
 mfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FhITnVcXOIhnDs6uomlU7NICQahFSW5Nno5Xh6Sq2S4=;
 b=ftKpQNRzJvxUbH6VSEESEbbf3xGRjx6ua93QtNu5nfIetwqUYz4HE313NZoS9bziW7
 JhlHzrGxZmEmKy5xzq6rQtsrEJ6yP0yav3rW7UN4UDNKXmBO7tdNM8xSiuZhBjxdZuO4
 Co5baMKlcKoorIzFCrLEl8cOVuRvr95vyQBwbc/SMbynIe5jObmX96UfAiwg+pJdSLle
 EPBj1sfYvsAB8a/YD5UbMCY3yXgTrGdI4niirwc7ItUbP2/chxPE2vfeSdnqI+ZH1sLV
 g68mSMTvJZj/p9WJjDOwOQDtjmaRMhm+xUtfail4D5t16DiWPFpziqCE2FnRzVHRqoF6
 Zfdw==
X-Gm-Message-State: ANhLgQ0nOKoyRYs7JeumNpPFrfLbVfbqG2yF9sG4QUYQv/krRjHI4Z8J
 vdM7ixDoQcPzGbHv5Ajsu1Oa8w==
X-Google-Smtp-Source: ADFU+vvXz6vFHeF1yKbPbpgcnf+53vX8VlT/JrnRIIROKRDHpkh55asOanh1rtAanRMRpWVarvC1uw==
X-Received: by 2002:a17:90b:d8d:: with SMTP id
 bg13mr1312350pjb.29.1584389794888; 
 Mon, 16 Mar 2020 13:16:34 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 67sm677082pfe.168.2020.03.16.13.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 13:16:34 -0700 (PDT)
Subject: Re: [PATCH v3 01/19] target/arm: Rename KVM set_feature() as
 kvm_set_feature()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb3178f1-5a0c-b11c-a012-c41beeb66cd2@linaro.org>
Date: Mon, 16 Mar 2020 13:16:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> +++ b/target/arm/kvm32.c
> @@ -22,7 +22,7 @@
>  #include "internals.h"
>  #include "qemu/log.h"
>  
> -static inline void set_feature(uint64_t *features, int feature)
> +static inline void kvm_set_feature(uint64_t *features, int feature)

Why, what's wrong with the existing name?
Plus, with patch 2, you can just remove these.


r~

