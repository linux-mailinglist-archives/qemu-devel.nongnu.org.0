Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D55267627
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Sep 2020 00:49:29 +0200 (CEST)
Received: from localhost ([::1]:57922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGrrE-0005l8-IV
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 18:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrq2-0004hb-AX
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 18:48:15 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrq0-00016Y-Rb
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 18:48:14 -0400
Received: by mail-pj1-x1041.google.com with SMTP id kk9so2358602pjb.2
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QIa1gYMd2982R0r1MVBdCj1U9OhtTqhpoj4DQnzfJrM=;
 b=VBVfMgCeFHxPo3vPFCGpABujuY16lam+Hl1MDZpbhjh1mhaEyb+3fejaEbBu8oX9mB
 y/uZEp9V7PNVeAJxC6tJbzCY7Nfs9gwjMt+84vrlC/INlI24VOPk9TI6T8hF4PEAPpQB
 reWQ44xNXObgjF4Rbhmi2gnJXMctRHwsJXLTp0gLuRHcnQilDZAVCCgv2ot+eywf22dh
 WkA9bCEV/hTUb0aauvp4xQyzpaUNZJzMegfmuIZNc4JJx6sruy3MDOwPDjlliDvQHRMd
 kGQ49UErx3JG/aMovWuj4nKDRDdCTlBggKiuAMOXX61oroFO+zCv7G08kB5nKkx351kg
 N1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QIa1gYMd2982R0r1MVBdCj1U9OhtTqhpoj4DQnzfJrM=;
 b=SYGGqmoRvimc8er5ntx1T/jYMy0BfOuimd47KbZkndaRzLPRF+HCS6VaAxfCnv1xug
 qdvm5PXlyb2AwTxkSDw33LmP2lh5qZuJXjbWcvVXg538e/0wGsyzkQSi8QfJCEsDhIoM
 9Vtky//npljyce16SQEGC3yrkVT0hthXuf5pogeQaijn6il+W9phwbIaVtK4WAbaGsSW
 SuGa5yHt+xilseReElqwGnWjHi3hXoLTkftDMem9D88UTGHJoHI9vnkFQzPa6AU5zaJ2
 O/HJdnTLIXBHzt5IgJn5mLQsdL8UQpkSGVv+lyHZUGzyMguSdYl3paIxn1jz0k72SECX
 bmxA==
X-Gm-Message-State: AOAM532fwY+He/HfhjgmRxNFJpjqXA4Cd3Ph1z5z03k/q9qQ6Rvezw/G
 h+azO+w+T848fad4hoSenVrAZQ==
X-Google-Smtp-Source: ABdhPJzQb9yWetJN1+iFga6bt2YLBdC1LuXVJx6oN7I6aRhjHqO8NYq0w4wJ/VdoAv7UOZuqwRK0VA==
X-Received: by 2002:a17:90a:cc0e:: with SMTP id
 b14mr3976206pju.166.1599864491471; 
 Fri, 11 Sep 2020 15:48:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kt18sm2776896pjb.56.2020.09.11.15.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 15:48:10 -0700 (PDT)
Subject: Re: [PATCH v5 7/7] hw/arm/tosa: Replace fprintf() calls by LED devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4adecaec-b777-4b53-9890-5b88c5122f63@linaro.org>
Date: Fri, 11 Sep 2020 15:48:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/20 1:54 PM, Philippe Mathieu-Daudé wrote:
> The recently added LED device reports LED status changes with
> the 'led_set_intensity' trace event. It is less invasive than
> the fprintf() calls. We need however to have a binary built
> with tracing support.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/tosa.c  | 40 +++++++++++++++-------------------------
>  hw/arm/Kconfig |  1 +
>  2 files changed, 16 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


