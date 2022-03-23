Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD44E5836
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:14:51 +0100 (CET)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5VS-0007pH-8A
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:14:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5Tv-0006Tj-8z
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:13:15 -0400
Received: from [2607:f8b0:4864:20::52b] (port=47057
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5Ts-0007bz-MT
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:13:14 -0400
Received: by mail-pg1-x52b.google.com with SMTP id b130so374702pga.13
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sL1AwgKgCC1bCzdNuU6lhBErhd3xUsSe76D0MQW8D5c=;
 b=eV+p4KaciG4oYZ0aG04Ob09yQGoCKu7R5YxwTsW7V+6ZRgHSYAUpGrHfhtaPegqBxu
 vU6rcckcyuJK7QQaq2Q4WPtEW92EmTw8/CVVaaLohbnIeJqOM6Apk/zaPZKDEgw8WdfF
 FmoE+kXYt5h1FniTDGHIXPfWnlIzi0sy3l+Oa0MpCB0xLc9m2VLNfUjNpn8S42Vjqax0
 ROxHOe5JgQq09vyuWKSkM3sTh6voj/ZyKMFdWVw+pvfYpPg8uJybRPl6LrdkbEnre59F
 21K81cGF41/qtOmUpEHaXY0dH3a+0hxI0Pq5DD3swYyZcfG4Z9gpJGmAIrojUzcACW+M
 7ljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sL1AwgKgCC1bCzdNuU6lhBErhd3xUsSe76D0MQW8D5c=;
 b=WmO0NYJdTJZGwCL0kDvUxd2P1cp9x0UTAQwVv3DWJ88wxB7od3LPn+mkwkuGQXSW7y
 i4fiTNFoBJfeyzohCQtl1iQlKWY4IDp8ztls77Sz+KD4/TQeJMlEv1VUJTLjUH1w4qKl
 GCRi4t6XWgKyhx17f/pnAhjyVp23tDzmtONb7vieGdv7LzBggTfwk/TRz7OK5q3Xb306
 1rofkha4uSK3mKRT8G5LrkIDF+TpFgN3aRuS0qEOj8OSlRKzC81oKdqEHDRymzAUaTAg
 JK1zT4s/cVtf6S4MQrsCwWzjiyNdMiHjfJk4qCQirXI+Hoq8xPfb4bCBWCRC76W0wN4a
 jE9Q==
X-Gm-Message-State: AOAM531rzqH6YxT4yiVvwy7xJLmfqE9qfroEeoDfCMr48ceXELnKCsa/
 kAMDZMKmBJOzBBikLsHOdcYanQ==
X-Google-Smtp-Source: ABdhPJxcimbJ+VBC427O5CybaUqVcN+71Ou3qoREh62ICL/w6FkqI0U90yR7ke2cX1MqEOiS/X6c6w==
X-Received: by 2002:a65:550a:0:b0:374:5324:c32d with SMTP id
 f10-20020a65550a000000b003745324c32dmr873784pgr.61.1648059191147; 
 Wed, 23 Mar 2022 11:13:11 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm549972pfj.128.2022.03.23.11.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:13:10 -0700 (PDT)
Message-ID: <558ea087-b788-a72b-8167-eaacf8bd0816@linaro.org>
Date: Wed, 23 Mar 2022 11:13:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/32] tests: replace free_all() usage with g_auto
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-11-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-11-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Use more idiomatic glib/auto-style code.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   tests/unit/check-qobject.c | 127 ++++++++++++-------------------------
>   1 file changed, 40 insertions(+), 87 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

