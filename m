Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D294882E2
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 10:40:05 +0100 (CET)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n68Ci-0001eN-56
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 04:40:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n67tj-0005e1-0b
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:20:27 -0500
Received: from [2a00:1450:4864:20::435] (port=34448
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n67th-0001jn-Id
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:20:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id h10so5646524wrb.1
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 01:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Syb+5W0hg/s+Tb56OUXLu2s/PF7+mNHLMVkU0Mhev4=;
 b=I4pWHHohb5CEpiFR7k/DstH9HbLmJjeovPc2zwUNcdz9m9N8j2cFo0beHw+rtp5iHF
 Q1J5DTVxMD/vhGLjtjpAGZ45tJdyzGabXC6uNf3KD30bqH6tZajADK9ihBaBZCjyKWE9
 wPQSAXOLqux5CJlHHd+M4wqj9865QJldqQC4GNHssFIX1eZmYIl9REmiWi7CK4sh/ea8
 XcOl8rSx1jOwKQxNKsaDYQ1hliAQbE8bGUwywCvk+dTEPZguKBmcz+w/B2K/T3ODodLI
 TtIynxXOf3iGKI0PDt6RooiQulK3ujyTebKAHxMyOdtOdKH5fHWc15NOHvetZNu3O5eS
 nt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Syb+5W0hg/s+Tb56OUXLu2s/PF7+mNHLMVkU0Mhev4=;
 b=VMHGdd87NpqBCMUFS6FR5iCtsZE9FqQ5xPeAUk04hBJj1f8+pskPm2VkjymfLYRlX0
 mouZEnRL3sOLeK2c1HSN6/pwmle6+srYOErUSj5rk1TQStZx2uWYQ/f4CPO58cWUDW1M
 vhTMa9eHvAsRywvnORu68wVVXlDthId8JWqfJpqUvWwYJo84aQBFTFlkmIPS5300WxWd
 EGyV34IX5b2m+SSaguhlteFIiT3b/r/SB316FMDcImtmO2zjNdkjO0ROoBIeEIIST7Iw
 +kx7TXtrKj6bij+NdOFgZxpUjtDUfLuS/+wqxN5joauS9Z2GPmqwcNE3XyLySnDF2sc0
 QKIQ==
X-Gm-Message-State: AOAM530gIU/BUvIgQixth4WZdpXAv8LHuydce2yCESozO04g4X0kyDDZ
 IxAVgzlwVnc5TKWrQ4lHXMg=
X-Google-Smtp-Source: ABdhPJzR3FI7z2WsZmevpCt2kQIgfGR7/PhKBXBvCFUoP+9F8cqVYO4mv/8+aPBH32AG9woNyjTNzQ==
X-Received: by 2002:adf:f64a:: with SMTP id x10mr6307741wrp.709.1641633622968; 
 Sat, 08 Jan 2022 01:20:22 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id o11sm1104249wmq.15.2022.01.08.01.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 01:20:22 -0800 (PST)
Message-ID: <e0f80732-9bd1-cc14-7960-efd8a06ae909@amsat.org>
Date: Sat, 8 Jan 2022 10:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 05/12] tcg/mips: Unify TCG_GUEST_BASE_REG tests
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220108063644.478043-1-richard.henderson@linaro.org>
 <20220108063644.478043-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220108063644.478043-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 1/8/22 07:36, Richard Henderson wrote:
> In tcg_out_qemu_ld/st, we already check for guest_base matching int16_t.
> Mirror that when setting up TCG_GUEST_BASE_REG in the prologue.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

