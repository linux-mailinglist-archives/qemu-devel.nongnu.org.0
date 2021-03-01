Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23C3278A5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:55:55 +0100 (CET)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdPG-0004N9-0q
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdO0-0003ia-Im
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:54:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdNz-0005HC-6j
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:54:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u11so7294634wmq.5
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 23:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IbiIzNKV+eexCK4kqZkdzuByWZlpQ3JxiYYXntWaxvg=;
 b=H4RuiTSoAuRBZmOTZ9OKnt2K2d83sow3FEcpqmmN7+qnEzU5mflDJmETZLhdKvSZWb
 ntNiGMHdzbPa9825ot+v0eLMuGkUkZnEy+pRMjlB9XtLf0thUHnWWSRRDs5T/2lGQFUr
 1bbwuijClGO4rgCzGwcD4HKHv5TjG4WZ4hSd7K4t2BgDC0H1wih14PyZjZeRZ3JDxELF
 2gWLfnL2TSJL9GJDO17mphIArE4/uoXUyn0U8TS9sGTyBbWPvDx7AMPQDuIAIauGb94X
 TKCzgNEn/WpjdCwON9fL7hc5UQA3e5qZSkVIGhbXBEQh4GPZGgmI9Mx28BlHyM8CjlRW
 pJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IbiIzNKV+eexCK4kqZkdzuByWZlpQ3JxiYYXntWaxvg=;
 b=kY/CPW+UHlvo6NSkzt6DpEgg/NhgXovK3p1hza4IIy4EFkgI52QH/h1u3jAaygr7y6
 WteASXGNFew+joJY5LFMAcB9W+p8YfrLximzrJzIr/uojHfgdwMdiNMx3tc/JOrJOpLH
 7OtCDYLod7QiHpmFCs7JymRT8KI71YD+sQuDScEhUJnerzPEhzIeFrXlolMRbB8pmJ6H
 T+v4ThNJRT2Men8g3GD7HA0f3kMaOtcPTTeVTyXuP1UGBTEr26CsKsparJPeiaMUKIrm
 kHbRJ5z9ggqCKH4tp3BmJVhEtpOcfqWe/9CcJWp82O0wNwkzIM6qq7eIXqaq08vnq6cm
 HB8w==
X-Gm-Message-State: AOAM532sR2TxeWGTFAxXB5GHptAC4Z7H6yiFgpe28Coetfone0P9tctC
 fIeK9cjVzewtZccelxaJhvA=
X-Google-Smtp-Source: ABdhPJxqo2SrArms25XZGAKLoxiAMdu1jp7L8oWiHNSAZc/mE1zS5pcL8VFBqAE+jy5AuKkCuWahRw==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr5330621wmq.186.1614585273791; 
 Sun, 28 Feb 2021 23:54:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 75sm22527490wma.23.2021.02.28.23.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 23:54:33 -0800 (PST)
Subject: Re: [PATCH 50/50] target/i386: Remove user-only i/o stubs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210228232321.322053-1-richard.henderson@linaro.org>
 <20210228232321.322053-51-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cce2928c-d4e5-ee37-4fcc-4d3a8fef1fef@amsat.org>
Date: Mon, 1 Mar 2021 08:54:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210228232321.322053-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 12:23 AM, Richard Henderson wrote:
> With the previous patch for check_io, we now have enough for
> the compiler to dead-code eliminate all of the i/o helpers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/helper.h              |  3 +-
>  target/i386/tcg/translate.c       |  6 ++++
>  target/i386/tcg/user/misc_stubs.c | 55 -------------------------------
>  target/i386/tcg/user/meson.build  |  1 -
>  4 files changed, 7 insertions(+), 58 deletions(-)
>  delete mode 100644 target/i386/tcg/user/misc_stubs.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


