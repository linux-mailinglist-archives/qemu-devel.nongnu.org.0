Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388D559276
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 07:44:26 +0200 (CEST)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4c7F-0005qY-4f
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 01:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4c3w-0004Ti-66
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 01:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4c3u-00027B-FA
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 01:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656049257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvZk4w/4NMxXzopQHF+1/MxkNYjHe8h3GsC16UgBLQU=;
 b=VplrwI4pYyzyX9bg6STbhz4jY01bAMxIDzrW9+29NnMKB5u8x3/PQVfniDzfQFNQKWjfIu
 8faos4PhhIyp69O/DPt3OZ0RTxYBIcNbv7z9EZnksYP+yThsYqIyE42pQvrdG7DrR5fiJS
 R7m0oQ9mlmHrVB+2VyqDD9lF3Giacyw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-9wj_pYBcOuqtFs8PyIKebA-1; Fri, 24 Jun 2022 01:40:56 -0400
X-MC-Unique: 9wj_pYBcOuqtFs8PyIKebA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r65-20020a1c4444000000b003a02a3f0beeso956651wma.3
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 22:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NvZk4w/4NMxXzopQHF+1/MxkNYjHe8h3GsC16UgBLQU=;
 b=t5prnW5d+xFDE2fa8uZcSHtDeb97wpG0etOaJKE1axg/Y+w/ew55roL24/HlEiHyL7
 A/a9ZDDP3k2ybf5W69B1HzZY8ZdErMDW5borQmnPKB9nv4dH/H0AA1J/2iAsdDd8LwJn
 ToMJD9Fh8llGUV5PvKpYQpdLmmdwld7XGL+Kr/hPwN3YEhvJKE4hOg12L/VPgYAG0gxg
 Pk7UyDqbbYrz+blxiuQM7O+h6Z/nZmBzu9wuqtTS3qVL15PPlOab+wzVEBnbAq1s1tH5
 nDVA26UeQTdcg2DFQb1d2vHAz/etrMJLhnJiPeRG6MuTYR0H+vn6eE1f3YbEH/bYsMxQ
 0Wqw==
X-Gm-Message-State: AJIora8jFGQG1Z1OGTiZNB8M4mq4y4QSFpvnns1wgB+QhgsLckpOEVlB
 0Ff+WlPTqhjVQkhYajHIEI4irAZ/4qa0J0iHM03Nccq631FH/kzJB+lx9wbEabRVgL8zKZXDtir
 SyOIx9pCOsK7buc4=
X-Received: by 2002:a5d:50d0:0:b0:21b:978f:e54 with SMTP id
 f16-20020a5d50d0000000b0021b978f0e54mr11467573wrt.612.1656049254830; 
 Thu, 23 Jun 2022 22:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgKKSY1x+Gthr4WChN0xtjcDdICiquChCsMCBSYlv33VfRovjSKVjYUbOSSDdN3Ff2CHsVNg==
X-Received: by 2002:a5d:50d0:0:b0:21b:978f:e54 with SMTP id
 f16-20020a5d50d0000000b0021b978f0e54mr11467547wrt.612.1656049254534; 
 Thu, 23 Jun 2022 22:40:54 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-192.web.vodafone.de.
 [109.43.176.192]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d6305000000b0020ff877cfbdsm1225347wru.87.2022.06.23.22.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 22:40:54 -0700 (PDT)
Message-ID: <d2dc72e9-3393-f7c2-f79f-2021d47c44b9@redhat.com>
Date: Fri, 24 Jun 2022 07:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH] include/qemu/host-utils: Remove the *_overflow
 wrappers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220623164051.506316-1-thuth@redhat.com>
 <CAFEAcA-k73D5fPfp5XnD2gtRO0pTXpAt_xTG51dGnzji+=NGqA@mail.gmail.com>
 <0a1ecd14-69a8-afc6-f74c-18d5abf2e4d0@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <0a1ecd14-69a8-afc6-f74c-18d5abf2e4d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 23/06/2022 23.29, Richard Henderson wrote:
> On 6/23/22 12:30, Peter Maydell wrote:
>>> -static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
>>> -{
>>> -#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
>>> -    return __builtin_add_overflow(x, y, ret);
>>> -#else
>>> -    *ret = x + y;
>>> -    return ((*ret ^ x) & ~(x ^ y)) < 0;
>>> -#endif
>>> -}
>>
>> I think I'd prefer to keep the wrapper functions and just delete
>> the fallback ifdeffery, but I guess I don't feel really strongly
>> about it. Richard, do you have an opinion?
> 
> Likewise I don't feel strongly, but lean toward keeping the names.  I will 
> point out that without these names, one has to track down the type of each 
> argument to figure out what is, or is not, overflowing.

Yes, I checked the calling sites, and some do use different types indeed, 
but as far as I understood the __builtin_add_overflow(), it should be ok in 
our cases. Anyway, it's maybe less error prone to keep the wrapper with the 
fixed parameter types, so I'll send a v2 that just removes the #ifs instead.

  Thomas


