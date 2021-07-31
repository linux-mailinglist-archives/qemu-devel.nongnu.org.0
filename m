Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B65A3DC816
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 21:56:38 +0200 (CEST)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9v64-0001t2-L6
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 15:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9v4L-00016m-A0
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 15:54:49 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9v4J-0008By-QD
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 15:54:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id u2so6832526plg.10
 for <qemu-devel@nongnu.org>; Sat, 31 Jul 2021 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/H8C0ahWDxeS41Ws79yQrJAMehX2BmAxjbk0BFsSjpI=;
 b=wqrfrJLP9GaRIFOdAPGE/WuSnwSYN4NmRzFbTN52xNGW9MdpojWqQzS1F87tEWFJnY
 +jIKD5HQUGcxRIUBmpIz9+EAwAVmOtcvezN+0+O3fJreqEu3s/tsmnku8fmQSh+x3Npw
 sKlbUMmNCGwTIZ7zMQAOhOrIPemvP3Axdedx4YJF9YD7cd0sOOVLQzeR1ha7Z3xxYJPp
 Ta3Xco0GMRzprYPo+ubQVHQMmsNCQhQCaGEqB0xSaNGPe2L9ML66r62dLSVsQc9Jei4l
 MeuyYXlYHPOAC6nZ1bNGTMF6ajurKer+nz2rfr1K52wv2RLnWWLtFKxG2jzTTlUvfwLr
 DNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/H8C0ahWDxeS41Ws79yQrJAMehX2BmAxjbk0BFsSjpI=;
 b=agDI3Lp8osPrx9Q63uJCPM386j18Kg9GaoGcuiR4IWafrOEDvpp9qaxTZFRGMLO1fs
 47q5c76MqQIx7GuPrr4CoVOTDzPTWz/8AC7UhTer77YjB81XEaMbhTX79M8eRg3XwPF7
 MFv7EZUhvMUxv47w9JusNTRw7bPysm6EVAj7OOTYcQ/SiSXTym9X8/zfUYdimzMH8jA7
 4gSzgzJL2dUU3NV6aP7h9/UlrTOLYtrQwDyB/w6khHNLmoqfeH7l1hk4VyNtv6XDLwV7
 +sHjrKjcAnFF0KaNxVm2BvijfVnJ1WfIB8s7J5ZYCAqvW4sBY4PSJ4MBaevf0ElNT3JD
 9peg==
X-Gm-Message-State: AOAM530mw+3G+n1BKR65vWtwH+/zTc88FxpNWR2UM//HkTYSnpNno3QU
 ZnfOH4YKZt/R+I/fqZ6A/7CDUw==
X-Google-Smtp-Source: ABdhPJws8Wn8pOtSSpQKJbpFMiJzv6ycn0hsXt6vuADbUHsT9AgBoOD+XlE89o4Y45KOG9peuH8Yxw==
X-Received: by 2002:a65:44c3:: with SMTP id g3mr924092pgs.233.1627761285742;
 Sat, 31 Jul 2021 12:54:45 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:9ce9:bb31:6c6e:663c?
 (2603-800c-3202-ffa7-9ce9-bb31-6c6e-663c.res6.spectrum.com.
 [2603:800c:3202:ffa7:9ce9:bb31:6c6e:663c])
 by smtp.gmail.com with ESMTPSA id 198sm4049002pfu.32.2021.07.31.12.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jul 2021 12:54:45 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Remove JR opcode unused arguments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210730225507.2642827-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0a226bb-43cc-cc0a-7415-3fc1d19d574b@linaro.org>
Date: Sat, 31 Jul 2021 09:54:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730225507.2642827-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.124,
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

On 7/30/21 12:55 PM, Philippe Mathieu-Daudé wrote:
>       case OPC_JR:
> -        gen_compute_branch(ctx, op1, 4, rs, rd, sa, 4);
> +        gen_compute_branch(ctx, op1, 4, rs, 0, 0, 4);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

