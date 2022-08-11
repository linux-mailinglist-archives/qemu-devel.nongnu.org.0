Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B641590941
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 01:42:41 +0200 (CEST)
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMHp2-0005dH-FR
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 19:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHkd-0001o6-Jg
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:38:08 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHkZ-00059N-U0
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:38:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id bh13so18418161pgb.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 16:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=/wqYIG0FUUf0yQ1aVgmumllJOcOfohzqMw03ggfm+Vc=;
 b=ESFbMP9ja5OuelM9Vf35901CNM0JftVNx09vMTVlS9B6RwRG8y1ssijmdyEPMo5+gE
 UJOwu7742NWHcSHxnOqWw7g7ABoM6p7KTuQxIYKqt2dW91aHyKJMkCzvg0Yk/kRvnOhT
 GNj4jqHw2LUX+E9O1VkhCKDJu8LXI7wNEOd69KfF1RT56hmrJhfgLxzGPYFEIIJbktft
 ynN1xoIQzklNM26I0vPrbKgx0JG5AhA56SXVnqkV1jBJarEGyvgnm1agKtHZNhU+1QBF
 xTur3ElVccRqj6kMFvFZXgW6Lpqml/GDPDQPfiZZbzws9PQLWPznkwL3paX9u2lUHlWT
 5bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=/wqYIG0FUUf0yQ1aVgmumllJOcOfohzqMw03ggfm+Vc=;
 b=Nvo7Qf+Wz9dBjCvEReq6KIgTvaTrIcxDG+GJWOnqwJzoWbNqxlBrsGooJzje8m9HTj
 RnvG7haeKDtNzo3+q8MwluqkTQqebRgppyQ9hoYyFWOOjvc3FuvlbZqKb9d+wR4u0qWK
 a05V3c31Fsr6H9Y5HzbY2Hi7+6BQFCCMY9fATqZ4fY+8siDk7QtHOiZUQT939TrTV7ao
 vbUlFrK1l2ZIf599ylsembEy7FeAML4NzSXW4KFteUtaEa0qmGGm4fOg8JbZsH9cZhSA
 pDLMT+o+k05IDR9q8yCS+xL/xfBmWKXJl1fgcz/8OYNijujN4epjoCETjzpywx1tHYuD
 i/qQ==
X-Gm-Message-State: ACgBeo1LqBQ+B5qepsRVn14psGCInbkXr7mTlfSKqBZkGajdYuc8wiLn
 9jUpJJWICMXG9vELoyspm+6k+t+u3Os=
X-Google-Smtp-Source: AA6agR7MufVlhL5jAqXuXaCbIZHNnls30ZyFtD216w+mSq7+VvxUqyHDQxhUeCVPdnZo/3ImiI4pTA==
X-Received: by 2002:a63:d012:0:b0:41c:5f9f:9ab8 with SMTP id
 z18-20020a63d012000000b0041c5f9f9ab8mr1045390pgf.213.1660261081304; 
 Thu, 11 Aug 2022 16:38:01 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z20-20020aa79494000000b0052d3899f8c2sm266392pfk.4.2022.08.11.16.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:38:00 -0700 (PDT)
Message-ID: <b274e40b-f3a5-fd4e-9909-e48bc7f36d7a@amsat.org>
Date: Fri, 12 Aug 2022 01:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v1 3/8] hw/core/cpu-sysemu: used cached class in
 cpu_asidx_from_attrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-4-alex.bennee@linaro.org>
In-Reply-To: <20220811151413.3350684-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/8/22 17:14, Alex Bennée wrote:
> This is a heavily used function so lets avoid the cost of
> CPU_GET_CLASS. On the romulus-bmc run it has a modest effect:
> 
>    Before: 36.812 s ±  0.506 s
>    After:  35.912 s ±  0.168 s
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/core/cpu-sysemu.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

