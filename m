Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188E31BF5B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:31:46 +0100 (CET)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgmn-0002nF-94
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgiI-0007WO-Am
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:27:06 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgiD-0000o8-K8
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:27:06 -0500
Received: by mail-pl1-x62e.google.com with SMTP id r2so3985428plr.10
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CrdpEeSOpZv88k2lHPHxPFfeAcAnyoUxFvC/BbGRTS0=;
 b=jWOum9xyE4Ml6yTbburXt/YsL3XUa2hzSpvBVX13M7m6nisrl5CPSUcfkztNBg6MvY
 In8J67k/0Xal8QjpE8OaOAzDqPS65iU0J/W2O4NdaaGCugGMy6ppAp9CaS4afJ2swLIn
 4co57m2TPaXWoT69n/qYHssl+7Li22GaCFZRFe2t6z04cuDHxg9wUHs2tim6/xUkdJf9
 8cUixXjl3n9eblODindfTJc0gha0lBLlF3iGbIt3DOVvRE8Uqa2czSaf2ML4b+geM+nF
 nmnI+fuIx/Ws2kyKZBeR3xtWYTHWvWJfzs+Zzu4Nx9auxuE+E4PivFLvj9u6OVdn0xby
 KpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CrdpEeSOpZv88k2lHPHxPFfeAcAnyoUxFvC/BbGRTS0=;
 b=V89rLeOdF46ZaeDJjnHu3EO5QPUo7cfRsTE5GDEGh9xXFLMKxu+jh1AAijEmw0Yg/R
 OBSqBHFfSWFyqD6M/PaZ5pZKL+5c0F5UlA/wG79Xtb+MxLjDMShx9o4gCZHIfAga9sqS
 Org0le0/w1VjlZYUypG3GIX4U8cRQc2qsZXc8uya5F4/9aXUypQw+fh2D0aOYX7qhcJl
 g/Xt6ufPk+PlzeketkUJkLIeGAXpBE3JJgpcV/ugMgDytayElWtSOty98eBY2uMFiUSc
 Av1IlJyVgFeTuLODeZ+y/oRsi9dEvv3FHckZ0y+KTf26r/LvgngaB4BWak7LojSG7lyg
 neYg==
X-Gm-Message-State: AOAM533OJ91ix6eX9JMtwLDNBCG6WdPD43/CNZaOjbnmiTlAbpQmwkdM
 H3Fn5cxS5vsXvo6xjIIZmo+kLbDX9sCPKg==
X-Google-Smtp-Source: ABdhPJwiynmR0HCiTWowWWjeM8J9X7RpegnR/B6vfLTCyR5SB/3SyP87eq8AtXfOJbrt1xsFjtBhCg==
X-Received: by 2002:a17:90a:1082:: with SMTP id
 c2mr16858706pja.183.1613406420281; 
 Mon, 15 Feb 2021 08:27:00 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 11sm18870798pgz.22.2021.02.15.08.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:26:59 -0800 (PST)
Subject: Re: [RFC PATCH 11/42] target/mips/tx79: Move PCPYH opcode to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdb4b0c2-f2f7-4355-c3ce-7729f108f87e@linaro.org>
Date: Mon, 15 Feb 2021 08:26:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +    if (a->rt == 0) {
> +        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
> +        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
> +        return true;
> +    }

Is there a good reason not to use gen_load_gpr?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

