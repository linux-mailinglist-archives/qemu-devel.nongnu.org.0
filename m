Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8A4C97B6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 22:23:53 +0100 (CET)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP9yK-00008i-Jt
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 16:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP9tG-0004qU-57
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 16:18:39 -0500
Received: from [2607:f8b0:4864:20::532] (port=44688
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP9tD-00068y-LI
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 16:18:37 -0500
Received: by mail-pg1-x532.google.com with SMTP id c1so15308161pgk.11
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 13:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5wi+zl8fAAp+mb3XfCtsytHUbSsXiBK2GvUxOJmecco=;
 b=JwRhi17g57Sv7yHVq1ibrOyL9qsvp8sJh526qS6A4IfYaURYOPFqNJfRJejOpS6ipr
 71derAl5Es0VI9SyPTF2W+Mr/jv1OYvdTKWGBMnRCEi08OnI90BkOqE7tFwLFItbAIHo
 lilC5bHDSnF1a4bzxD+6ac9oRNXkGx02xUkupW6BBvgpNXe5a7fRa4JJX0evYMAcY0Ko
 oRd1QT1Uk2accoVUSZkZzEp4z3I2Ejhae3bOCY2s9Yxx/kC7Id4rQTTifzJUCP+iIC+R
 jRgVR+4Mn6akzF+F9Vo+EJEjPYTY/+jfU5dTtAv+rpYnUq0XzpulGMJTeWeduHUd2+GV
 J2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5wi+zl8fAAp+mb3XfCtsytHUbSsXiBK2GvUxOJmecco=;
 b=sn5y2K9usUmIwb8L/vtbewPMQJzxhzSSiNk8mSFcOp35sOUs+J5VCHvgJDzFIVrvsC
 0qKnCKF0vb2ofEh0yIKJlpXBPG3ZreV7l541Vk+Mos7P0+vDwH4FClJ9DGFDz1W4DP7T
 b2tF6AeTpFlR+/P14B16mYm7LQ+ZiuIpLsi2Mn876BvvgyVjOVmQ2zCm1A/vmwCohQZv
 z5mCk/O8hdDkjqE2Kxrmxc74Gi9bBeMIvg6jZPpuidRxsQu79mHb1NXznFAoIdh9u6xR
 HScpzxUcd7uXZMpb50q4TdmBfgkEeznqCzFDF9Mb356y7+rothUv9druaYIddHRAo/CK
 LInA==
X-Gm-Message-State: AOAM531/aZixn0ugX4WFX0ulurCE3um3hfp3cpGed/FKkrRMJq99ods+
 jEXUi4foiFMbkpZ9+oOtfP/XXg==
X-Google-Smtp-Source: ABdhPJzyZh76dDKSanMbAcFtMji3GbqeZrIb4CFv53PUi99lVScLVjDfqKmfVJgg+G/7sEtC5AbSTA==
X-Received: by 2002:a05:6a00:1ca2:b0:4f6:4f1d:c911 with SMTP id
 y34-20020a056a001ca200b004f64f1dc911mr138260pfw.76.1646169513981; 
 Tue, 01 Mar 2022 13:18:33 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 a11-20020a056a001d0b00b004f4057fafe2sm8888126pfx.94.2022.03.01.13.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 13:18:33 -0800 (PST)
Message-ID: <7c621228-8854-8923-7c8e-0b66ba03063f@linaro.org>
Date: Tue, 1 Mar 2022 11:18:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] tests/tcg/s390x: Cleanup of mie3 tests.
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>
References: <20220301195933.1500-1-dmiller423@gmail.com>
 <234dc90d-7e7a-8281-d0db-14c8c4c6efea@linaro.org>
 <CAEgyohUvQVfNGYfhmiOONGxstZ+MEy7Wx=e5uC2ee_reQaNakA@mail.gmail.com>
 <CAEgyohWeLd1Wn6FmEKpgFHFskAiMfcpu778Re2ZHr5-zBq70Zg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAEgyohWeLd1Wn6FmEKpgFHFskAiMfcpu778Re2ZHr5-zBq70Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/22 10:22, David Miller wrote:
> However the constraint must be wrong there.
> Sorry about split message.
> 
> On Tue, Mar 1, 2022 at 3:21 PM David Miller <dmiller423@gmail.com 
> <mailto:dmiller423@gmail.com>> wrote:
> 
>     I used
> 
> 
>     #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
>     {                       \
>          uint64_t res= 0; \
>     asm volatile (          \
>          "ltgr %[c], %[c]\n" \
>          ASM                 \
>          "stg %[c], %[res] " \
>          : [res]"=&r" (res) \
>          : [a]"r" (a), \
>            [b]"r" (b), \
>            [c]"r" (c)       \
>     ); \
>          return res; \
>     }
> 
> 

The final stg is wrong and unnecessary.


r~

