Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23CF51A5DF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:46:38 +0200 (CEST)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmI97-0003yR-9k
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI5y-0001ay-Dg
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:22 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI5w-000818-7e
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:22 -0400
Received: by mail-oi1-x233.google.com with SMTP id s131so1742736oie.1
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=huAkFMmdQRpQKrSiJ8enWmGpEbVGcsakqNuHBO6Ll+0=;
 b=xY53/dgIlvOitk7vUoQimybdoPZN+JDdPG+9NH2EtFD59lpZV97+lK6/l+YcSWON0I
 wPp3QlxZy/TWq4uOblFk2LkkMHkIqnnJzpA6wNNlWKgCqjcuNlAHmU8aCY5Z24erhWcc
 1YCWoDbI8OZi9VtwJEDPz+BWoPq2FRuypmObuFxtqtMOvq/JZKyAtoiyfyJBO6wP+UYZ
 4Kix8maR/FLsUPJpc13h5kCkzu5Hks1n1O08bgi8aeuy1nw2/NofyX0ctwgB5HGcY7hn
 J4k3s+QYBmSLPBzX/4YpFXljOfcjhAaTs6zC3XDxiasSqHMY7x98d+DcCpaF/e/jDwCU
 Mm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=huAkFMmdQRpQKrSiJ8enWmGpEbVGcsakqNuHBO6Ll+0=;
 b=BaVbtgxrel7m0/+LLFgf8YdnPOhwNVzXeQ9C4WMMt9mn3fLkyKhFrgoWZcNRoG8ZQE
 RarvD/BXqEpLbPzKV1E0fIW8oz6FAmyQyAL8Cz1/urMtZyWqvN5wLH3VCVpdA2gfhvhQ
 lnhp8lM9GQqUIEUqZr7XjKiLxAIvAf1dEusGU/rr9Hza0pJ02Q6UbiwJpBXzY5YRg7ZJ
 yofiMAVL7JZv9k4mthTu15vQwijkWNngsgNSDYXDnqcCoy9xzQHxgkMNM/B1y9ShOYdk
 yBpawilxZR4A2N1cKmPmxzhEpK3qUrglBiZMj7zaSusjVawcfR0aK3ot9PX1b6osijEx
 vflw==
X-Gm-Message-State: AOAM530LXRw4e0+kOzW/gbwsytwlGYINSGg6YEiqXwA5AxCD2Ubr9txZ
 rbtixfd9LTuWc68pJ19imZOkrg==
X-Google-Smtp-Source: ABdhPJz9VwCXLEfACPPtPvH2HL69LLDwPgnTScdgkCpqDu5WTU9FVWsSCNVO3cJj6/3vPXfT2VG/0w==
X-Received: by 2002:a05:6808:191e:b0:326:6890:770f with SMTP id
 bf30-20020a056808191e00b003266890770fmr184223oib.64.1651682598876; 
 Wed, 04 May 2022 09:43:18 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 s139-20020acaa991000000b00325cda1ff9fsm4511090oie.30.2022.05.04.09.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:43:18 -0700 (PDT)
Message-ID: <6a5bdfa5-be3f-debe-d97d-7a425ed8d3b7@linaro.org>
Date: Wed, 4 May 2022 10:27:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] linux-user/host/s390: Treat EX and EXRL as writes
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>
Cc: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20220504114819.1729737-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504114819.1729737-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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

On 5/4/22 04:48, Ilya Leoshkevich wrote:
> clang-built s390x branch-relative-long test fails on clang-built s390x
> QEMU due to the following sequence of events:
> 
> - The test zeroes out a code page, clang generates exrl+xc for this.
> 
> - do_helper_xc() is called. Clang generates exrl+xc there as well.
> 
> - Since there already exists a TB for the code in question, its page is
>    read-only and SIGSEGV is raised.
> 
> - host_signal_handler() calls host_signal_write() and the latter does
>    not recognize exrl as a write. Therefore page_unprotect() is not
>    called and the signal is forwarded to the test.
> 
> Fix by treating EXRL (and EX, just in case) as writes. There may be
> false positives, but they will lead only to an extra page_unprotect()
> call.
> 
> Reported-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   linux-user/include/host/s390/host-signal.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

