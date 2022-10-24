Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23E60B001
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:00:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omz46-0004iq-55; Mon, 24 Oct 2022 11:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omz44-0004iW-Im
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:08:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omz43-0005Hy-4r
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:08:32 -0400
Received: by mail-wr1-x430.google.com with SMTP id z14so3218804wrn.7
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EAKxV6CPMQEGY3xMPHZoRDXKujdOYzGkVEkcDHJ/NrU=;
 b=jqMZmGOwXFSeyjBzPHrXsULUegAfGQhtfz4sxWWzST11my1klUcXQnxLTd3UfhBGIk
 b6w7lSbOMkfachUMrjpMGOsw11P1jC54aIMCdMrlRH2IR7P3chnvAqF90SPdXRDqCFK2
 P09WoEY8M/GusXbdtZ4TvWABPI4s5GojdUDhFOM1gMTnJMJpmlR0vsSbrA3/OCcETvnm
 Jw5vrOhoHYdGZXE9tysjuMhEg0dnWvehy71aJXyrcCbEzUno3EQI3ItCpMsmOGzGtWBU
 5irMjhqWs0jfO6P6MOnJ+gqoxE28BWJgklT+G0nahgc1QSFW+vRfO+FOjndku/Ytrunt
 WgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EAKxV6CPMQEGY3xMPHZoRDXKujdOYzGkVEkcDHJ/NrU=;
 b=bsFLztU5cfCf1nixa+jrBIui4L+urlivscu6lFrImu1SQqkn4N1CW3ZfeEom4NWFDJ
 02VwTDnwnvJbdVWaPK5NfwKUQ06VKGRn87UHbCfEuIDNaas7nuWIuhVr+6MA3B+RqlKz
 nUeErQwrKz1FZbPtphwhU56EyVUgZuZnf9+p/c96V/ShMhoN9fgYM6PcjLpjsl4+yJvR
 7LrGGBp1vLpDqwdNixnFhI3TX5XwE5FyQwbloKGMMcSR4aaH6G8ea6GSThm32naXBSZI
 jVBweyw3ZfwDejqtaLT2MUbSgj+UijCdSXmiy2YgW4BSDwPEJ7jPv9yJXnwfTI8u6Yf9
 h69A==
X-Gm-Message-State: ACrzQf2NhB9o5m4PIACyPSsfD/Nu68nYiY1BH7oOhyxfIMBAVhCKRGrf
 fXg8MHcArP6winsu3+0VvWBy2Q==
X-Google-Smtp-Source: AMsMyM7Jz2qcQG8GociLagMoNMMX8voIFNOdyDBjXdLCfWlA/etkXtNlDY8afporaAgxQouNz9BF+A==
X-Received: by 2002:a5d:6701:0:b0:22e:6545:995d with SMTP id
 o1-20020a5d6701000000b0022e6545995dmr22071074wru.301.1666624109633; 
 Mon, 24 Oct 2022 08:08:29 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 bp23-20020a5d5a97000000b002366553eca7sm5920836wrb.83.2022.10.24.08.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 08:08:28 -0700 (PDT)
Message-ID: <7fcc1aa7-d009-c9cb-304a-9cbd93669609@linaro.org>
Date: Mon, 24 Oct 2022 17:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 02/29] target/alpha: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/alpha/cpu.c       | 9 +++++++++
>   target/alpha/translate.c | 6 ------
>   2 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


