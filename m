Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9C4C7E29
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 00:15:55 +0100 (CET)
Received: from localhost ([::1]:58338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOpFC-0007ak-1Q
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 18:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOpC0-0005We-69
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:12:37 -0500
Received: from [2607:f8b0:4864:20::1034] (port=38573
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOpBy-0006Ku-PZ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:12:35 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so511659pjb.3
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 15:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=v+CnBF2Oo8IophJS8C4FpsI2iALlCqY5kAv1EJksDIs=;
 b=N6WHWW6adAYUZM/SceOyJve2YMeO5l0QoqSE4o5J4yO1NweEfCyKIYe7H2na7gGkP8
 73tE0SbhTgnODdfxosqxOhF3kaOoZwtQKQtvXaZiyZUP7MllB+dIt/N7nvTlyzhTAXI7
 RnujTYVWH1RSYAIvUIoQ9tiAttrJU0IMvvwUuI8Eh/1cILj99A7MGFQnlu2swL6zLqJm
 Gg7kVjYPGm7T1NiSuYadwasbqY7D548nZNbCp+cS4TBI/ac9ZQRTAc8rqUDJre6EhX2E
 7bzrrIJ4m+FKWbTZFnwhV7hIqmCxzYiPLRRs7VCHn0D17QOPpyuEpuFBEYpuQ7r6Tumq
 +89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v+CnBF2Oo8IophJS8C4FpsI2iALlCqY5kAv1EJksDIs=;
 b=KOebFZ3djDcpx7RI4QAsfxQjEarck1YHNJxjL1uetHzE7AjTZePgO34nvF96wD2T+z
 UfkSIDVggmCPiB/RCpzUhiXcept8CQ+ImSi7LQHwF3b/ArHYwo3qIDZncDeFOrK4VOyf
 4/yVdPYLsUL/Kf49INqMuwmAasjbqmOEOfz9tqKbI/zENRQJRVAL8B8IUED/oyYpSPWu
 i/jshvBRNavnQjvpJIG0mEX/qN29dnE7Sd9DLsWxWwdtZ5d0//dd6cZqw2aITaab+m3o
 Kf6qGhsDNkuHgTBzJa1IhV2wvDBBns/RXQ6v1VWdR3W363EQScOY+tYHJhRsbmkv3SjC
 UOsA==
X-Gm-Message-State: AOAM530e30kaC56BocmpCAz4hpj2BPcsUDkATawqePwiLcil8RDi/K58
 /IvKVLK4cHaSRkPGDLQzal8gV6V/yLE=
X-Google-Smtp-Source: ABdhPJz65RO89j0TBP7fQuoNH+Y889EmDQVv3WSA+Xxl76MA/U1IVaPVLj4FHVJoELGeQe1A9GPbaQ==
X-Received: by 2002:a17:902:ed83:b0:14f:c969:7669 with SMTP id
 e3-20020a170902ed8300b0014fc9697669mr23172423plj.96.1646089953498; 
 Mon, 28 Feb 2022 15:12:33 -0800 (PST)
Received: from [192.168.1.115] (133.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.133]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056a00168c00b004e15818cda3sm15770201pfc.114.2022.02.28.15.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 15:12:33 -0800 (PST)
Message-ID: <0aade174-de41-0e96-134e-4c924d05ac03@gmail.com>
Date: Tue, 1 Mar 2022 00:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] meson: fix CONFIG_ATOMIC128 check
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220228200032.777433-1-marcandre.lureau@redhat.com>
 <20220228200032.777433-2-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228200032.777433-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 21:00, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The current testing code isn't correct and matching QEMU usage:
> 
> testfile.c: In function 'main':
> testfile.c:5:11: error: incorrect number of arguments to function '__atomic_load'
>      5 |       y = __atomic_load(&x, 0);
>        |           ^~~~~~~~~~~~~
> testfile.c:6:7: error: argument 2 of '__atomic_store' must be a pointer type
>      6 |       __atomic_store(&x, y, 0);
>        |       ^~~~~~~~~~~~~~
> testfile.c:7:7: error: argument 3 of '__atomic_compare_exchange' must be a pointer type
>      7 |       __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
>        |       ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Replace the test with common atomics test for u64 and u128 that matches
> better QEMU needs.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build | 27 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

