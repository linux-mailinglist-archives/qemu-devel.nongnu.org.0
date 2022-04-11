Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CF4FC3E0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 20:09:46 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndyTx-0007cz-DU
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 14:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndySi-0006va-SM
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 14:08:28 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndySh-0007jR-7E
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 14:08:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id bg24so3589928pjb.1
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/q5ykmhmZZiQV3dZW7yrjWcXrz6MVRCX/f9L7uUwch0=;
 b=AYtIQptG1ZCmg7gh8IL0jYuz0N2fV6POcIQrbBeZ53ToPHo+z/CacPEqtEDKgYKc4L
 xo6BLE7rmkqBXKGttXqdEONUgoTDoFdgRHm22rVJQMUXaF2V65YFmR5vxSgXHR/qbori
 xPjG2dx0UHhZyBhtbg4jNzD5UXgH30pouMN7Fs4IBbw3OXCCzKTwq3FHesrCAXWqQnwK
 81yVtdzrXNMAZMqntfQdm85l37cBwTzbP7Vwq3gdr4xEDj4x0b4lfG5ZR5MuVklEOLVj
 /bHgi/G9wznhk069ssBYRTlFc8GDZgA6I7iYFvd16YufiRbQAgg2dcd+bzoU/5IRy5SL
 bwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/q5ykmhmZZiQV3dZW7yrjWcXrz6MVRCX/f9L7uUwch0=;
 b=elsDtoyi56KLC7pRPbfZWIM5EGYJbHAcrNU+PWgvR8nHdT6fIrRz19GeycVBw/neov
 vC5fGRlXu73ozwR1OVZVRlDI+re6ynpTLDyCKn7OKyW/uEr9ISHO7quIn1YFzS9Jjtf/
 0aOBQ5/vhfRdINhZNwWJfj5Qqy3QGbrX/waZlii3p4wGeWHCkd/8JE41OvjaTT4bFKqb
 91x2B5GRLSOERYsKnrHGZMQjCXAqqqzjdwcFbbvUU+kt8rhV68uH7oKJ2+GhlWUBYPhp
 sbJCpJ3poSCE2/Xac/gfa51UNpfZoT/QmKEbAZthjD1mQqn6ZUvs7wNG0KF20QzPHmDx
 +Glg==
X-Gm-Message-State: AOAM531arqb6N7XZ9P/U4cia0qMm+TwpHdbZxXbMHcbu08xAdZZoGtG6
 H8A8DhOlzqEKA5NuAMOWP7hMew==
X-Google-Smtp-Source: ABdhPJxmHM81y1YHVQyZfg4wOErdD1WYCm+DECd8fRqdbdX+YaH/q20/qDOcU3kxFSD0QFnrRnmcxg==
X-Received: by 2002:a17:90a:5902:b0:1cb:a0eb:8f8c with SMTP id
 k2-20020a17090a590200b001cba0eb8f8cmr429886pji.17.1649700502268; 
 Mon, 11 Apr 2022 11:08:22 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa79058000000b00505686a982asm15229411pfo.125.2022.04.11.11.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 11:08:21 -0700 (PDT)
Message-ID: <dea17ea8-0c00-4523-7d18-e2dee77ae80e@linaro.org>
Date: Mon, 11 Apr 2022 11:08:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] migration/dirtyrate: Replace malloc with g_new
Content-Language: en-US
To: jianchunfu <jianchunfu@cmss.chinamobile.com>
References: <20220411094703.7000-1-jianchunfu@cmss.chinamobile.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220411094703.7000-1-jianchunfu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 02:47, jianchunfu wrote:
> Using macro g_new() to handling potential memory allocation failures
> in dirtyrate.
> 
> Signed-off-by: jianchunfu<jianchunfu@cmss.chinamobile.com>
> ---
>   migration/dirtyrate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

