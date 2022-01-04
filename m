Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D3C484A8A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 23:15:11 +0100 (CET)
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4s5G-0000xw-2t
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 17:15:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4s3k-0007zE-Rk
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:13:36 -0500
Received: from [2607:f8b0:4864:20::434] (port=42870
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4s3j-0000nz-DG
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:13:36 -0500
Received: by mail-pf1-x434.google.com with SMTP id t19so33390817pfg.9
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 14:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yGhC5KNeUzflPJXWteXAWgl1DeyBYTlAzOlKhY0VdZs=;
 b=deJd+JzV1b8vgfCZ4/zl75e+lKbqI9V7zecOLmCs5R327fsMRcCq45FNImCrWYplLC
 +dXV4DaL4ffb3OYw4lnKLYM+oQyRmiQA/6/Ryce1rtYtoRKARjngz+Zzg3BJPCYTqbzc
 t39QHkWHNxNZ/8OmAJejRLsRuASgzLLqn5mUw8VWUdsmq6G01JPpeBSv5gUyFefGRMH9
 fuMyqwrN6PvPvL+Bm8ysj2tFiAK89SqWuUEkms5RBxBU3gqWc1qNWaUJu//RuazhxQxJ
 xjrpZuDFmaD30BXI2JxtyPbXGI0236/iDfe2cNPO0MI39kVqbkz2J4D9ApaJRRYgfqlQ
 Eugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yGhC5KNeUzflPJXWteXAWgl1DeyBYTlAzOlKhY0VdZs=;
 b=xqRPb9FJ1n5K6tDqjxS1ZV+ZhxiResjiLkfLzLCwVEnJgZfDYWiJbocXYhxHxkcekm
 xdrEJqLNPTIZDCrBc4lyxDoMW579pyKnsWrZr7tvAMrzh6Wx4kb0sgngLgB9dQ3AgdED
 DY8r02Vj1xZcpx71j2LPBRz4AXseTrRu3D9pfhXKPYqE5WYgxzbGj/pqC7dzk3+s3YNs
 F4FWm04MWpV3pyYQW/KsfkzbRwH79bH3Md3VI5UI06mL/C/VgRj8EmZCx6lwCOrzKDxX
 bi3/nzhfnqOR5AfYscNvjhyO28cxPFlVoTxx4f4xkgXVUov5uGi7/3BYNFKciKZuM+yR
 rM7Q==
X-Gm-Message-State: AOAM531uaZDDXaGiKvSMjEP4ktoIByh8lZbJRVAfoY3CYtZWoapXizUI
 SpVh1WEs+JVPhFJDXsVBYPuylw==
X-Google-Smtp-Source: ABdhPJzdaJFtlrXyYnKqOW1ux2eJIuT26XhgcyknJi49YK1HC5AAR0vOoeZt3ff/L9njD1Yi2ceyoQ==
X-Received: by 2002:a05:6a00:1818:b0:4ba:c287:a406 with SMTP id
 y24-20020a056a00181800b004bac287a406mr52363203pfa.6.1641334414082; 
 Tue, 04 Jan 2022 14:13:34 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l22sm43859988pfc.167.2022.01.04.14.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 14:13:33 -0800 (PST)
Subject: Re: [PATCH v2] linux-user: Fix trivial build error on loongarch64
 hosts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104215027.2180972-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d48454c-12d4-1c3c-e85d-12c319deb3ec@linaro.org>
Date: Tue, 4 Jan 2022 14:13:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104215027.2180972-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, WANG Xuerui <git@xen0n.name>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 1:50 PM, Philippe Mathieu-Daudé wrote:
> When building using GCC 8.3.0 on loongarch64 (Loongnix) we get:
> 
>    In file included from ../linux-user/signal.c:33:
>    ../linux-user/host/loongarch64/host-signal.h: In function ‘host_signal_write’:
>    ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
>           uint32_t sel = (insn >> 15) & 0b11111111111;
>           ^~~~~~~~
> 
> We don't use the 'sel' variable more than once, so drop it.
> 
> Meson output for the record:
> 
>    Host machine cpu family: loongarch64
>    Host machine cpu: loongarch64
>    C compiler for the host machine: cc (gcc 8.3.0 "cc (Loongnix 8.3.0-6.lnd.vec.27) 8.3.0")
>    C linker for the host machine: cc ld.bfd 2.31.1-system
> 
> Fixes: ad812c3bd65 ("linux-user: Implement CPU-specific signal handler for loongarch64 hosts")
> Reported-by: Song Gao<gaosong@loongson.cn>
> Suggested-by: Song Gao<gaosong@loongson.cn>
> Reviewed-by: WANG Xuerui<git@xen0n.name>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/host/loongarch64/host-signal.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

