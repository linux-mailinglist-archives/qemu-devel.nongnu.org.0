Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E733A00A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 19:47:22 +0100 (CET)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL9IH-0003HU-4N
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 13:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9HQ-0002oQ-Ja
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 13:46:28 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9HO-0008C4-Tv
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 13:46:28 -0500
Received: by mail-qv1-xf29.google.com with SMTP id a14so5901497qvj.7
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6REAFbAUK3TgtejABwfrQk8+wBcXmGVgZa8ZMbVwci8=;
 b=zQBqgICz2r7PqJ7PPBPbwVo/RAL8fLEolLL6AJ8bqMbYAmFD0Zk1HCtaoui1FxlOeN
 Ej09w6rMia7InQbU2L9q9KiVIeFUna/l6CZow7Emilvqctm3QVIv4agDEezjOP41zu3P
 W7YGJPvnr0JLzEM7/RCWyMC0OiHFYP7ZtsensT9GJ+1Qd7j5hRxYgFtHmiCfnvWXRIfT
 Ay0lDzIV89jg5pX6kY3XsEqhHPpC+CdZ8DZRs785NbOjConhBFNT1N/7buiszXBTxRwH
 7RLfGL2uxpwXpXQf50DThxn7y2k9m2nJJLu+lonHWh9gyQGRFJIwPZg1h05KeHBkg6Ne
 wZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6REAFbAUK3TgtejABwfrQk8+wBcXmGVgZa8ZMbVwci8=;
 b=kSgnJ+qUgzuvJ89clprwe9ET8bQtnYZgqIS2RBGKOyq2khcvYjzhoVgqyzN6hY+923
 8HGdodn58u3buzxvBT9Z+tvoCaVIuJqsj/5ElYD1oymenhg3I37a4oM3TSdMIHy2sL/x
 4akprheqfLL3KFComS4OLZCMGUvt6DbU87eHYSyerNpTkl3CaiBQE9URwoo6MulvDjzI
 6pkBmlWOJVIhnsZUHItOkp8WFZOaVGpLiTzBOcijBlpCQDD+0Zi3PDyEVFdUGaTBkLYc
 orHAzeEj+edSHfNmvNMQLtQV/NmTpEMr9I0erDUbZT68DAvkdiaJEQxGVMbGxa0+FWDK
 uy/Q==
X-Gm-Message-State: AOAM531lQvSti0dneS0DUYiKA9PGLeVvlfwWVJl8RJP6Gti4ehZ5XAK5
 eo+UoNAFhUvuh/c7Wh9QEJruqxd4KkUFfrQt
X-Google-Smtp-Source: ABdhPJz/ZFRK+Gns1oPL8tkkcqglzCpE5vQwzU13PSNp4u+ECaL4InA8PltJ0JrX2uCj/I/T17dgDQ==
X-Received: by 2002:ad4:44a9:: with SMTP id n9mr3707252qvt.60.1615661185679;
 Sat, 13 Mar 2021 10:46:25 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g6sm321860qkd.62.2021.03.13.10.46.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 10:46:25 -0800 (PST)
Subject: Re: [PATCH 02/26] meson: Move disas/tci.c to disas/meson.build
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-3-richard.henderson@linaro.org>
Message-ID: <c6aef891-83ab-0b4a-09cd-3cd37d793d7a@linaro.org>
Date: Sat, 13 Mar 2021 12:46:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 6:21 PM, Richard Henderson wrote:
> There's no reason to do this in the main meson.build.
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   meson.build       | 1 -
>   disas/meson.build | 2 ++
>   2 files changed, 2 insertions(+), 1 deletion(-)

I'm going to drop this one because it conflicts with the in-flight TCI patch 
set, which eliminates disas/tci.c entirely.


r~

