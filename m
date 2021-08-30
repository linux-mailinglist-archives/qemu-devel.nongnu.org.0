Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37903FB90E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:35:31 +0200 (CEST)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjJq-0006HW-Hu
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKjHx-00044G-7A
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:33:33 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKjHv-0003lK-2T
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:33:32 -0400
Received: by mail-pf1-x432.google.com with SMTP id m26so12527927pff.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yNzkicToSsozVy/9ZWrb+/qe2rpN9aPGIOsu9DTQKbc=;
 b=eTt/tGIOEkthWSQIwIHTx/RKfMqjWz57yZhXn/wNr6hOcOe2yFUO2kHh4kIDExiBcd
 +QjwZOLB6ks0KMn8QWgrIYWGFCHFz8VHe1BY+JlH3JJHty6rgWRczGUgIG2IjZwsajq6
 8l0jRebVuCOpkvNuRGKquhT8H3X/jWYUVodW4YWepWexEpUgR3o8DmjdcA0CcnoX60tF
 gHmqx7OEhV5e1vxgtSHBkEl5uiUrhc+WfKeIa3y0ssAki5I9c2mVAaat59img7Uu063l
 MVQnfNeZSU2pkgEkPj7gHWvh+jy7XyjYQzz11mrNGKI11TQ5n8qhbAHkXIe7hL8MMQ/i
 3kNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yNzkicToSsozVy/9ZWrb+/qe2rpN9aPGIOsu9DTQKbc=;
 b=EOq8czVBC4IAi+8m+sMf0MRwIr96P51WM+NCjhzHrUukgVKg0PjEhf2RfeSxo1OWsD
 Ib+7BpcCfG5rc7lmHSd0dVbekrOZXlCkc9X4Tbmn9I3kWJeL/H0Cu3qAJmbYPCjQJ/Xr
 tNRqI8ZFo4FY+3P8xqJcoQkG+SU9RTr8jBe57ts8/841bqmx/uaK+sXKRA4Sr9JVXEPs
 MtwrYXoj4V0cCKBa5lSM1XkObwGf9nYOWpMixiYU+cxTQkte17YSAed2iG60XDJgJK6e
 Uef+Buu1A4WwKHnKWzc4SyE0xylJubQjTFZbwL1i8L8kqkz+ZVWm+KRu5lWu+cCuIAmP
 wNQA==
X-Gm-Message-State: AOAM5306sPk9BePBEucU3Djkr+WV4iyvuK29lqWsgLHXyNg7vT3K8oIU
 ds0t3MlmEsNAxKB1lI6tVdZgQg==
X-Google-Smtp-Source: ABdhPJx2KadgeECTg5LaxoFpGxrHwFbR5EB4zxNb0LCUEZ4/o4XRd9CufQ/MgulHSFJLOE5vhibzrQ==
X-Received: by 2002:aa7:80d8:0:b0:3f3:814f:4368 with SMTP id
 a24-20020aa780d8000000b003f3814f4368mr18152696pfn.77.1630337609608; 
 Mon, 30 Aug 2021 08:33:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id p24sm13738953pfh.136.2021.08.30.08.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 08:33:29 -0700 (PDT)
Subject: Re: [PATCH 2/3] configure: Remove options that can be handled via
 meson_options.txt instead
To: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
 <20210829173210.39562-3-thuth@redhat.com>
 <20210830150625.l76qozj4lzmuqsf7@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c95dd4f5-4640-8247-027c-550e2af750aa@linaro.org>
Date: Mon, 30 Aug 2021 08:33:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830150625.l76qozj4lzmuqsf7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 8:06 AM, Eric Blake wrote:
> Does meson treat
> -Dbrlapi=auto and the absence of any mention of brlapi identically?

I believe the default is right there in meson_options.txt:

option('brlapi', type : 'feature', value : 'auto',
        description: 'brlapi character device driver')

with value: 'auto'


r~

