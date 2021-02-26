Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDA83269EB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 23:23:29 +0100 (CET)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFlWC-0003LI-E3
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 17:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFlUH-000233-4c
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 17:21:29 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFlUF-0004FN-IK
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 17:21:28 -0500
Received: by mail-pj1-x102f.google.com with SMTP id i14so5196584pjz.4
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 14:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2QyO0Y+bdtzCBGJqfWV9nFJwo2R83BmonhwVbwULdsM=;
 b=n1eHyLRKUVLlRIpnyqcnoqaorkIqqoiI2gxLID3LRkfvi+f6vTGTXrv7uE3PcuArPf
 dNa1LYSUGgegBrAgfnEXvY2LsyZrKXP8irbVN42VKZaGuzBYbero8lXi/cqPihkecjdF
 wXM2qRaLOlATo9RARsHEYbdl6qnmCfzOodY2+CR722GlBcGUQMMXpS0QOK3s4guVN4HW
 0wohCDg5cwQ2G+j+a4WOMDhlipQZr6cbz+NK7GexgL9E68nRchiB7CItDXSK66jronEb
 U8AOTfouUfGpPrDT1RJR2qdgU7HzF/DpIJFZe0UxYALyygSPNHAbCKvkJ9xjTcwor/s/
 tsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2QyO0Y+bdtzCBGJqfWV9nFJwo2R83BmonhwVbwULdsM=;
 b=b/3QOEBqosUi7TOTg8b2LJI8OvSSoZyXzYPn76RaoduM3SK2/Dh87GfcEyE3rDuswW
 HuvlQvZr0HBB31Rz+h4UctoGlfOh1dZ57RXejgjtR2ztTEXDbwvllFwgDrD48T/yuO2F
 duBMaKLrYQTJ10IrKyTOE5V7UiJHhLP1/rrrKXTBPb68qa7DW6PQBIEFBHaLG16lTTwb
 OloTB4Q7OoYXvcAxhcJ6PO1C5Ig8mjL0YNTtILTEoieLJZ1LgUWNm/bkvUeGcAWbJitn
 ht8ZapHWjBUm+26J0Oi6hbo5t/LSn27JG0yzLtmL5n7WxhqMpjzQwaUHzoOHiqerN2sV
 JnHw==
X-Gm-Message-State: AOAM531wVwV3nmqaQOiMVvg8XU2RA1F82LW9SyAKBTOBDvGwvPflY0eu
 Mmj81SgOAb+B4+ESE1otaymFeA==
X-Google-Smtp-Source: ABdhPJxp3gdptu/3o2qI2mlEP2AL8sVdVYktF05JbmkGcksdoa+EBG5PG3brJNv6PXnTKQL9XoGr5Q==
X-Received: by 2002:a17:90a:d585:: with SMTP id
 v5mr5527965pju.206.1614378085579; 
 Fri, 26 Feb 2021 14:21:25 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id i22sm2735709pjz.56.2021.02.26.14.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 14:21:25 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/mips/jazz: Remove confusing ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210226132723.3969650-1-f4bug@amsat.org>
 <20210226132723.3969650-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccd34d47-a9f7-be79-5086-4a33e2d092a7@linaro.org>
Date: Fri, 26 Feb 2021 14:21:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226132723.3969650-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Claudio Fontana <cfontana@suse.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 5:27 AM, Philippe Mathieu-Daudé wrote:
> @@ -211,10 +209,8 @@ static void mips_jazz_init(MachineState *machine,
>       * memory region that catches all memory accesses, as we do on Malta.
>       */
>      cc = CPU_GET_CLASS(cpu);
> -#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>      real_do_transaction_failed = cc->tcg_ops->do_transaction_failed;
>      cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;
> -#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */

Ah, I wondered what you were after with that first patch,
and this is it.

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

