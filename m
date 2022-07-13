Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEEB573A6D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 17:47:42 +0200 (CEST)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBeaT-0001pE-85
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 11:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBeXm-0000FH-Vk
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:44:55 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:50839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBeXl-0004qq-A6
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:44:54 -0400
Received: by mail-pj1-x1034.google.com with SMTP id a15so12626039pjs.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PGXwMIOxlkuwaHOfssDlOrMjPJJQhcH9DUH34KfwmCw=;
 b=HmmREVhQRrwSP/zEIQ8BbitU0DeLUBMUyOnbEaRyj6G9JwXOslXp78UxL5Rv8APT7U
 cRw3UzmtNqS28gJfCt1Sp5FbSN2q8i4U3p0eHIvwsMUH5BaLSGPgYQmF9ja/UL7b+PCS
 qQvSeOv9ahczCNw6UvXkDtduSCMBXsbX3yAY2k0dhU4ynMzusuWrcTeB69eTuzYzFH50
 FK1ic6l1SD7aC/8U9fz9eyGqWC9BdyJ4XzI6+l6nIyYqiW9anpc4tSYV+h2ZRQAXbwbh
 L30ykX0igbfNRB8aNEP09rTh8WmE0VAJjhcuhV76W0NkwOlbmALuIEiFzUjV7sz5iftf
 bJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PGXwMIOxlkuwaHOfssDlOrMjPJJQhcH9DUH34KfwmCw=;
 b=eoG40V4tFxclA6JulKvXUyPgar7v1g8u2xh+ewT7CQ7hkLxUyyTLw/hiWvZu0yqt4a
 2sfi723WotcV6dJqywtHKdO6NASZnLmNkixz8hAncFZDoDgPwA4Up6MH3PndEQBnwIFM
 91wnU6mAj60dtz6saveCHEfdGtEaIoxkEgcY7gXOd7Wp+SnvjVd0zl1LE3HD40dfaOru
 tqaOwRv7R76RhEdLRHat/VlTUI+fPkSfvrH48s7GJ1XMqsIRTy4Qqzn1C9fAG0BI1+EW
 chrLrW1m1H0YHjiB5a+6JuMMuJjd8kU7o9ajaw9lcv0PAFPUI3ULPRGpMkVQFpPlrcP5
 We0g==
X-Gm-Message-State: AJIora9RzdNYhei+C5TFhPvaEER+pOAs10N2CH6NpplIzlDT6zGt40aT
 tfQn5vSIAq3RN/Vg1qlVu10Uxg==
X-Google-Smtp-Source: AGRyM1svvTG78ABGyNJOgAEkos1I/pzydze0A8a+PgSwytIREOpOowvkAUz5Ig5uIdHBkUWgR9rfsw==
X-Received: by 2002:a17:903:245:b0:16b:9b6d:20bc with SMTP id
 j5-20020a170903024500b0016b9b6d20bcmr3594319plh.14.1657727091579; 
 Wed, 13 Jul 2022 08:44:51 -0700 (PDT)
Received: from [192.168.138.227] ([202.124.167.115])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a631e10000000b00412a3c1efddsm8150885pge.42.2022.07.13.08.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 08:44:51 -0700 (PDT)
Message-ID: <3c321cef-b574-1396-237a-d1ac1cf19e01@linaro.org>
Date: Wed, 13 Jul 2022 21:14:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] tests/tcg/s390x: test signed vfmin/vfmax
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
 <20220712015717.3602602-4-iii@linux.ibm.com>
 <c7897b91-dbfd-3a32-68c8-d7afa40495ba@linaro.org>
 <c7a32437850ddc70438173ff7f0f0966e5f48384.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c7a32437850ddc70438173ff7f0f0966e5f48384.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 7/12/22 18:02, Ilya Leoshkevich wrote:
>> This works, of course.  It could be simpler using EXECUTE, to store
>> just the one
>> instruction and not worry about an executable mapped page, but I
>> guess it doesn't matter.
> 
> I thought about this too, but EX/EXRL operate only on the second byte,
> and I need to modify bytes 3-5 here.

I didn't mean modify the instruction via EX, but something like

   static char minmax[6] __attribute__((aligned(2)))
     = { xx, yy, zz, 0, 0, 0 };

   minmax[3] = m6 ...
   minmax[4] = ...
   minmax[5] = op;

   asm("vl %%v25,0(%1)\n"
       "vl %%v26,0(%2)\n"
       "ex 0,0(%3)\n"
       "vst %%v24,0(%0)"
       : : "a"(v1), "a"(v2), "a"(v3), "a"(minmax)
       : "memory", "v24", "v25", "v26);


r~

