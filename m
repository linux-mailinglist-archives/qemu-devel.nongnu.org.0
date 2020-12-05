Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F02CFB52
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 13:48:35 +0100 (CET)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klWzK-00012D-Nm
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 07:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWxP-00009Z-68
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:46:36 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWxN-0005VT-01
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:46:34 -0500
Received: by mail-ot1-x344.google.com with SMTP id y24so8028755otk.3
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w6E8IoXAoT0ONLP0B3PN9245e88skgkJZtJ69nwUw+Y=;
 b=o7S9KOpBJD7MqS2up6JB7DKxUifpMYo0Rgwb/cwx6kSmxK3toZA3xSVl4IW/KuM037
 c3/XwoAsFry/d3TFihB08rbb1aXTXOv3r1tkVg3O6s4eUJg7OUvGwiLMqP5V+gdtVFZC
 px51ms7Kt7BDqzGDjfvhEDgxBQqh54EzMWRl5mi80W0YVv/IkW7Wtfc4aIl7iDN5Ykvp
 oukZPUQLDh0qEdOglHAnlgIMUjV53Ddv6E1RHR3k5149sgD+Bcd5dpZpjA9SIgdQerJm
 2QhMXjqzxBr3cRZVy1myChZV5DkC+W3nrpmfT0VwL0Kn+DKuL+ioO8eCqM3vR3Ws4HPz
 VwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w6E8IoXAoT0ONLP0B3PN9245e88skgkJZtJ69nwUw+Y=;
 b=oD+iDrM2zZFW5Zjk3uB80p1WeegWru2O+YW1ENFC+hP04CbloQXkIPvXM9HNDgla5v
 /2XNt6UZoAQwafb+vw9gJTLTDlDMUAvob2NFO2phhcZRBWr6ROoIurqgSkzD8a1xGhYa
 n8Yz1yOnCnBWaErvfam1t4dk5YCZX29k8nu3SM1b3pBdhltxnLoDAxzH257uG7VqIZzK
 2+fjv6ugN+vi8hVRu3QIxRT8/zrh4TbDfsdUcG95qpM21M3L9ePdTRmZJW34gt+1rW2/
 wHnofnjN/jfQiyrwT2SJw79aU19mqKfydJDB+7gxvqqSRt9bGqJgmt9XfTZXQmMSxyF0
 9pAQ==
X-Gm-Message-State: AOAM5339WcS6JyHooCvn7skYBFW9v0XJwmiWx8gbotSQpSUrXLwXmOGp
 Q4MBZoqUd9r4hexmVfhV0USCv7CsoYrXHvv1
X-Google-Smtp-Source: ABdhPJyoIw7xE01ciQTi3GHHDFl0IgiRZuY4igyg9sYu9wRTOHmN0gU50gVTkKEhRyiGeubmOdjA7g==
X-Received: by 2002:a9d:6d01:: with SMTP id o1mr2361488otp.66.1607172391855;
 Sat, 05 Dec 2020 04:46:31 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id l1sm1308407otj.17.2020.12.05.04.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:46:31 -0800 (PST)
Subject: Re: [PATCH 1/5] target/mips: Remove mips_def_t unused argument from
 mvp_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
References: <20201204222622.2743175-1-f4bug@amsat.org>
 <20201204222622.2743175-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32540d57-fa65-54d7-47b7-039d865289b3@linaro.org>
Date: Sat, 5 Dec 2020 06:46:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204222622.2743175-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 4:26 PM, Philippe Mathieu-Daudé wrote:
> mvp_init() doesn't require any CPU definition (beside the
> information accessible via CPUMIPSState). Remove the unused
> argument.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c          | 2 +-
>  target/mips/translate_init.c.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

