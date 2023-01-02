Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802A65B5FC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 18:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCOiw-0003xJ-LZ; Mon, 02 Jan 2023 12:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCOit-0003wp-IO
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 12:35:43 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCOir-0003Pk-QR
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 12:35:43 -0500
Received: by mail-pl1-x634.google.com with SMTP id m4so30141577pls.4
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 09:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PG6Q93jXC3GYEY6lXhg4G/uyo4HR9OHX8753AsgnmWc=;
 b=R9WSLs0BPNSBUGUjj9vsXzOFgioEtl0WquHqzcCyC1sZKlid0uxnywwETgyyOOKEZX
 NZ4dnD5+cKC6g5A+WJS5B95CL/tCXZ8t3EYO56HHfxvZ32PadcoSxgt115vulswULt+4
 ThdaHl2ytvU3ZlpO2gFIb10qQClfD1e5KNdiw8g80C80YSXHoIixY4wMLd6tUh9SOBoj
 paPeKZOY+6UKRDx5kt2fSMZprnsC+Md9HKo+lLVExGOWQR4+clkdTMlia79rciDTvwzW
 QhYgeoeQdKGhhM9oGIvRFL+XzKE26xGqpbv1OCWIqJzxTnATJHkDYgMwDLs29p5k9ec7
 9ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PG6Q93jXC3GYEY6lXhg4G/uyo4HR9OHX8753AsgnmWc=;
 b=fqPNJ76HYIaRcdRcu56EFXYJeuL806vBPjlsSKvguyxvFimjzBwhqSkU8fS0N7YK5T
 FCOeRQAyWXPL+GQ/99jmi4IC7lnkMpj92DYQdFC2jCxeGZWCNCfL7QycTYJJvOim3rp1
 CMpOFJPRjIgZKy8PDGkqZIBg3e2V9tsmpX+KnL8i4z8XqpVupj10AIPlri6ZVVLvBPnY
 BC6rStpCEwQQG0I9yuUx+Ut/WnSDqHlyUbkMG/kJaZ9P/2VbqgkmtM4jDfY0pkP8E8bU
 5DhACKh2T4CppncrN4dzUG5c5sjwAIQ3qRp176HdowYWXaF7JBa2+wZkyHCeVQjTPNVL
 RuAw==
X-Gm-Message-State: AFqh2krfFD2Cm75Agbv69YTAmliKjosYgsbZYIoWKNpjRQ1b7jdUC5x/
 RvTWYUAAFW/PkrU6ZZosgzZcfg==
X-Google-Smtp-Source: AMrXdXs6Jnyl5yrRIMf/zbgkQZuhku4FiXNFnsJ5y+zjKR8C8fGQJiMqfdwejy0dBJwnJnHn19DYmw==
X-Received: by 2002:a17:902:74ca:b0:186:af3d:dd6e with SMTP id
 f10-20020a17090274ca00b00186af3ddd6emr46226754plt.21.1672680938985; 
 Mon, 02 Jan 2023 09:35:38 -0800 (PST)
Received: from ?IPV6:2601:1c0:5e81:b50:3bef:a25b:134f:781f?
 ([2601:1c0:5e81:b50:3bef:a25b:134f:781f])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902d54700b00189e1522982sm9737737plf.168.2023.01.02.09.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 09:35:38 -0800 (PST)
Message-ID: <06c9ed84-22f3-a423-52be-4e006f20cffc@linaro.org>
Date: Mon, 2 Jan 2023 09:35:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] target/m68k: pass sign directly into make_quotient()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
 <0e418e12-2738-133e-e212-7c7dbbc241c8@vivier.eu>
 <8d716112-ea5b-d294-55bd-61798f12648b@linaro.org>
 <004c686f-b5ed-be4f-087d-2736bedd57b9@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <004c686f-b5ed-be4f-087d-2736bedd57b9@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/2/23 02:10, Mark Cave-Ayland wrote:
>>> I think you need an "abs(floatx80_to_int32())" in both cases as you do in PATCH 4
>>
>> Or in fact
>>
>>      sign = extractFloatx80Sign(res);
>>      quot = floatx80_to_int32(floatx80_abs(res->d), status);
>>      make_quotient(env, sign, quot);
> 
> Thanks for the suggestion. Just out of curiosity, how does moving the abs to before the 
> integer conversion make a difference here? Is it because floatx80_to_int32() can fail in 
> some circumstances because of the sign of the result?

It's a simple and operation on floats, instead of cmp+cmov on integers.

I think it's a touch clearer as well, having just saved the fp sign, you discard it before 
moving on to the next thing.


r~

