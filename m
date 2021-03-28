Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D308834BD3C
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:27:01 +0200 (CEST)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYFg-0007v6-UH
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYDT-0007Ls-PR
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:24:43 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:41641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYDS-0006VN-5C
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:24:43 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so9999007otq.8
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fJtPc6GMUVVflDeU3sRGiRmiU4fWpnfRnloLz+XFmdw=;
 b=M5I65EEIZ9QMYOisuniUWa33LaVNSClpVC+exPMFPh2qs2QS7Wn9V/wdFpXPK2LFZw
 GEOBV0zm0xofxP2KeF9QNdJLBddwsCKzeOaB9ilfSCSMW7QSNSWcPzu9IB/WFKUVDkD4
 ooV9S+tOeFQ525wpkgNER/IVdpcaIpPgGLA7qOOcEpPAO1xfZ37jJfKt2OlqkOfIpWoW
 pSMYPbMRa2X18DfIlMTnWPdg9rYR8Z6UiTX1VN4jUnwo2PoeAM58R7Ld/Ei8BYsyItoJ
 kOAKkhulXDqYBqmB8UYOFUYPe6KwTcx3u6joBE3Q5/vKq+dOcnNJsH66hoN7le06jdTg
 765w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fJtPc6GMUVVflDeU3sRGiRmiU4fWpnfRnloLz+XFmdw=;
 b=a+KWA0FO1ceXU8V4Nn6m/70l8IaxhNyXFkbOACkxOGvvgfp3ZuuCS63yXykHzKEEan
 e8b7Wcu7aztanpyYFLjS4dDgnXn3OEsGi4SEa287WemkhdwaRTnetVJZTqfHkgMw2uAg
 J3PZXvJiYUluSi+AEWoDqPu1obBmQ/Jko00R9iGmd6GItiMQ1tc4bVLzXVvHh8OPH8oI
 zkKXp7N0QPmZqJKbe7ye62wbaW6CB4hzHE9NbjMubKHdcvq4ul6RNKWbY6nU7ScFRuu+
 oJRrB85NT9mexCjXPSP9zaFjNek4Ct7PrKeSRc4k0XTE8QIvoobvT9cNWGbXmu2RJZAi
 e6eg==
X-Gm-Message-State: AOAM530VH9kO4okzqc5ftAUAD9w65UuYq8mqOKV8sMv6Crnmtc9DI5sp
 y5hFcI7d1wHnndQVQWd4kX+4fQ==
X-Google-Smtp-Source: ABdhPJyzhdoPjK9EEMKHqrw0xwA7Ffy0cOPOlTb7vJxOp/RQvwdkWTaT4eP5dHoYIvwVNfA+AalFFg==
X-Received: by 2002:a9d:5d0a:: with SMTP id b10mr5950551oti.180.1616948681162; 
 Sun, 28 Mar 2021 09:24:41 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id e18sm3780374otf.2.2021.03.28.09.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:24:40 -0700 (PDT)
Subject: Re: [RFC v12 30/65] target/arm: fix style of arm_cpu_do_interrupt
 functions before move
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-31-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7fed691-fcc8-bf9b-6d35-16d862f912d7@linaro.org>
Date: Sun, 28 Mar 2021 10:24:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-31-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> before refactoring the exception code, fix the style of the
> functions being moved.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/helper.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

