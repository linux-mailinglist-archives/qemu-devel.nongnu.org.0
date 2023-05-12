Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6F6FFF37
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 05:22:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxJLD-0000i6-Cb; Thu, 11 May 2023 23:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJLB-0000ht-5i
 for qemu-devel@nongnu.org; Thu, 11 May 2023 23:21:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJL6-0004Lq-RK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 23:21:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30789a4c537so4601883f8f.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 20:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683861661; x=1686453661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rqg4bShYWwgnVnAeEEtsGQWJbdLqc+tuFjCQGlQDIbY=;
 b=VQgHfFC3GTFKkiqbKrUYF9bH8fF6qATSKh2IrqBIU3NvgeweZ5laRnp8HhT4KpK8cG
 ZQNBNKRJ0YpLCdC0Y05RohA3XpXwkJ7CM56h9YFqjSdGHCAVZE/n86cXIKo1ptl5K5hh
 kMublGyklIiCsm/cSIW8EfxIlyar2zc4cEjrxyBkbvbr/ymwUMqhuP8mL0VDsPi4Sohr
 MWdaYEz5UZKUtp652LyuARx12MXixY3PJWR0SsXpS6AHbbWBFHIqDR1Y3s34F9i7HQ4P
 OWnl+m2AOQG/T6CDkDgyGptnCyDBuB+vBf6VMeHtbLXE2BSuw6dcc8I9he6Mw+8dSXus
 uLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683861661; x=1686453661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rqg4bShYWwgnVnAeEEtsGQWJbdLqc+tuFjCQGlQDIbY=;
 b=UYMHhdlgFWjH/UQqEEnAfnAGS7jEwT+RO1kkSpkgtj3ItOrpIBhk7YKlbORA+vMr5b
 6WbC0/5hI2x77k3drtGFqQ0nW9e8JfTtZukgIjA14e9/JfR7HbdRndmLUIYMAPBzISaS
 uZHUcJI3QnPzw7GmIwnNjAsHh9HM+NjADcRiKkEfDhSGGfMxWH6Jbq6wimwM/38BB7ue
 so4wyLjxjs0bMKYpMlj4u4/JZtiIFsLt7EgxBVeti2EvwMD3zGRde4Lo3k+MknJWy14G
 tbY7Iwas23hYNQk0Kw9t6SSZ0RuSYEbdY/JDLId18WNNFdCcRiERv86AsizHKfO2zbsF
 XG9w==
X-Gm-Message-State: AC+VfDyl86GirIC8vS1Z73mUMxsBggRSGHh9gOf+kKyGQNSkHWQJDud/
 H/jgOGJZij6Yk51+/NLfi+gaSA==
X-Google-Smtp-Source: ACHHUZ4udcvlMK62pYKTvcq6w54XczE0osjJ+D2Op1/0EnGdhopeyOq/Hp6pnNewhfG4fkFLdAUo7g==
X-Received: by 2002:a5d:668c:0:b0:2fe:2775:6067 with SMTP id
 l12-20020a5d668c000000b002fe27756067mr16663886wru.28.1683861661495; 
 Thu, 11 May 2023 20:21:01 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6101000000b003062b57ffd1sm22196089wrt.50.2023.05.11.20.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 20:21:01 -0700 (PDT)
Message-ID: <12e3140b-54e6-04df-04b6-839e2ad8dad6@linaro.org>
Date: Fri, 12 May 2023 05:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 01/19] test-cutils: Avoid g_assert in unit tests
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: hreitz@redhat.com, armbru@redhat.com, richard.henderson@linaro.org
References: <20230512021033.1378730-1-eblake@redhat.com>
 <20230512021033.1378730-2-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512021033.1378730-2-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/5/23 04:10, Eric Blake wrote:
> glib documentation[1] is clear: g_assert() should be avoided in unit
> tests because it is ineffective if G_DISABLE_ASSERT is defined; unit
> tests should stick to constructs based on g_assert_true() instead.
> Note that since commit 262a69f428, we intentionally state that you
> cannot define G_DISABLE_ASSERT that while building qemu; but our code
> can be copied to other projects without that restriction, so we should
> be consistent.
> 
> For most of the replacements in this patch, using g_assert_cmpstr()
> would be a regression in quality - although it would helpfully display
> the string contents of both pointers on test failure, here, we really
> do care about pointer equality, not just string content equality.  But
> when a NULL pointer is expected, g_assert_null works fine.
> 
> [1] https://libsoup.org/glib/glib-Testing.html#g-assert
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>   tests/unit/test-cutils.c | 324 +++++++++++++++++++--------------------
>   1 file changed, 162 insertions(+), 162 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


