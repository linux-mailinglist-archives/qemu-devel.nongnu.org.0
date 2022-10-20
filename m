Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70C605589
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 04:33:59 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLNe-0007qQ-4n
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:33:58 -0400
Received: from [::1] (port=45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLNJ-0007ET-PA
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLLn-0006WS-CV
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:32:03 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLLm-0007vw-0G
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:32:03 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d10so18994059pfh.6
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9JqkVvX6xH+IbuH06r6v1oiFdx9KjJZc5ip0P4C1NlQ=;
 b=VBTwdUBIDPI46MQN6AxRr67+I5AI1DqiGLLYTpRBJHSCVmZ3LffB0NZieM4GXvHQWo
 88JA4Y6/NKpAQl7lDlKm3DBT6xiO8yZqSWhUdUgh04a3tcfVWveeBq353Nz4v1PBufnl
 zUSTGNOQiUBCLr9QumFmBeUYmowx1thiZKkut30xQ2s8G9EsoZyoPNeHTACnwRK7Zg9u
 m+2ry3uOZecZ4EbmJsz6FjVy24FKLmKAsqAiAXsokOQjHTlz1vpQS9oefwXa6a8UPQ5q
 M6bYgFPT89J7B42xq7tr8JIun2ld3Tt+nXVzI0Q4hKN33LmCD3L98CeYIsaPPhAeQIeO
 cvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9JqkVvX6xH+IbuH06r6v1oiFdx9KjJZc5ip0P4C1NlQ=;
 b=MHBp7tHiJA4i9YftimNDPJ7yTEDmrLVavgVwMK0+8Whh1crR9yhT26XytFSwhZ72EO
 /2mNytfqeZG8kofugIPjzdj9I0rw1dY4+RlPDVbQ1fw91n3JwRPdwnAoXMTADKWiUTWx
 p06DDjOewEpN2cEw/bAS63LdMqWYzvn6GJsHoZm+90dM087hgaEo8MsV1E9fkgTqI2CX
 IZwWQPciuDhEwqAJNamoXWK8ozI587I6w++0cdL5/lhsjpZAJg8nxGXKDRA9WhXrK79l
 5a1USWOuIOR6q+5NlvDPXtkoY5s7wtzzkuAEJzlLbtKNANX17i3cA/y+e2C4J7seMhFq
 yecA==
X-Gm-Message-State: ACrzQf0TXZqNN468AlpYktWOljN6Twb6ngSYO6iyUmDQNfW2BAJZfa4M
 g+K7xs8ecxBzuLvC5HvlqLF+gtHy2eI1gLw2
X-Google-Smtp-Source: AMsMyM50Yi1nCUYEfYtJc3lYS7DOjOVS4MlnBbp+GWrojuOs2/t3WLHV6M20qyubAfr3WtwfP8CXXg==
X-Received: by 2002:a63:ea48:0:b0:43c:69c4:68d4 with SMTP id
 l8-20020a63ea48000000b0043c69c468d4mr9968411pgk.416.1666233120734; 
 Wed, 19 Oct 2022 19:32:00 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902c40300b00172751a2fa4sm11765683plk.80.2022.10.19.19.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 19:32:00 -0700 (PDT)
Message-ID: <5c2c589c-d43e-9bac-7bfe-763077765474@linaro.org>
Date: Thu, 20 Oct 2022 12:22:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/4] target/i386: introduce function to set rounding mode
 from FPCW or MXCSR bits
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221019150616.929463-1-pbonzini@redhat.com>
 <20221019150616.929463-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221019150616.929463-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/20/22 01:06, Paolo Bonzini wrote:
> VROUND, FSTCW and STMXCSR all have to perform the same conversion from
> x86 rounding modes to softfloat constants.  Since the ISA is consistent
> on the meaning of the two-bit rounding modes, extract the common code
> into a wrapper for set_float_rounding_mode.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h        | 60 +++---------------------------------
>   target/i386/tcg/fpu_helper.c | 60 +++++++++++++-----------------------
>   2 files changed, 25 insertions(+), 95 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

