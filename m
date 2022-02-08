Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570E64AD5DC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:54:44 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHO8x-0005iO-Ew
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHO0r-0004sH-OY
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:46:25 -0500
Received: from [2607:f8b0:4864:20::42f] (port=33655
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHO0p-0001Lr-SP
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:46:20 -0500
Received: by mail-pf1-x42f.google.com with SMTP id i186so18221170pfe.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nk9iYzX/+/S2I1YBoezqm6UraH982u7iTbl29F5Y7UM=;
 b=e82JnpNiWf4l1WwxI4dl4NSWfz7FmsO0y5Sp2q+IU6bej/YlIcvEHgTpW653HnLtWg
 dFHTQw8gPok0g8Hp5VMiQ4jszYnC3drPz0u3sE6krjxpqT5gsekEWTa9BPf+6UQKLPNk
 kdi3motyMp9Fe3ejd2ZvPJyAqnAKpr+AGzCoJYs1oz7y+d6m5cPv/wiHbeC20q87Gwuu
 WxEHqdc17weH16CjABh8z4EfnatFfJCdNAxX0BJU/8pTKXAJAE1DH2/qnly1ymk5a7It
 7TdJTZvNqnWN3y0E1teUfMy9agOmmXL82pNu5BBDQ/xomrpYXdXEnOV69pzmEoSTGBhz
 zGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nk9iYzX/+/S2I1YBoezqm6UraH982u7iTbl29F5Y7UM=;
 b=EltyWpfDPhurA7lb8JiGkereZcK2sxz7ij38TQ+4aVf7hWRQsiMTro07WoNlS9Z+1P
 GU8Qv7fTo2cKXCo7AKxYA0cLWKct1IoDYJdMeOeSdbfKmsKfrL8tTF+u4/LUtTIyaY5H
 J8uEe9lgURGu7OFI0tt5ZL4bKuA1hBxTmL/2ujkvn/uFnWTcLj32KxFeUZgbCPi0xLWz
 sNhbiTcfb85UiZoDCHSiY2aigC7Y8jQBrbcP+PWasK512vsLyJ+fjx2VpS9pOTIJZ3zs
 o1tpK1JwQ93eIvJ3dioCGRm5z3lmJYVfJv3hgx2SM7y1cvKMvpWXNsEboEEmUMv8jadh
 +22w==
X-Gm-Message-State: AOAM5338SCIpMezAnRwsiQWquY2oWo1KsJenLmd2kmPMltqdwGgB00py
 ij8wTqIXkKvl8piGe7Pf0wI=
X-Google-Smtp-Source: ABdhPJxImhzd5/kj0EHkha2jQUz1cLKCXLDlIPYRxDGS6iJXe6JDX7RuguWHOlM9kWYA74Hcs98gWQ==
X-Received: by 2002:aa7:8d83:: with SMTP id i3mr595018pfr.14.1644317177937;
 Tue, 08 Feb 2022 02:46:17 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r7sm5451655pgv.15.2022.02.08.02.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 02:46:17 -0800 (PST)
Message-ID: <4e0bd152-9eb0-4e8c-1451-a3ccdda94f9e@amsat.org>
Date: Tue, 8 Feb 2022 11:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v6 5/8] tcg/sparc: Convert patch_reloc to return bool
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20220208071710.320122-1-richard.henderson@linaro.org>
 <20220208071710.320122-6-richard.henderson@linaro.org>
In-Reply-To: <20220208071710.320122-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 08:17, Richard Henderson wrote:
> Since 7ecd02a06f8, if patch_reloc fails we restart translation
> with a smaller TB.  Sparc had its function signature changed,

"SPARC"?

> but not the logic.  Replace assert with return false.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc/tcg-target.c.inc | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

