Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14AF42996B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:25:41 +0200 (CEST)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3jp-0007Jj-1q
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3h7-0005LM-4R
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:22:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3gv-0007db-TE
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:22:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id y3so27545674wrl.1
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D/08PWrqjyPkGc0B42a25KshgE2FvQ8dgUiiu9R79Go=;
 b=bkOl/QGfT5SP6xw2kyH9o3KE9zNsg4EVhJK9/1aRCdlBMRMHWEZ2tFToPIsIKJ4zS1
 QQXwkA8IpizYQoPZTwx6Io0zTdbFzykg0inhnOIaDKZ1Lbly1UURZbfWanBJjVN6C0hI
 CM4H/9NGLK3ITN/IRZHdM3cIWQu2FIV3yeahUMYBK2OrWGOz3XtQ/eku2arKzTK/yy7b
 afnqK0iKuxtGE4OOjhKkH3KLbau2uitHuh8F4ia3vA/u1CJX6PzfrkMAllk6o3K6Nixk
 JqbamqTtVyL6kAFdg1Bh1ilzk5R/TZisc18p8Ce+TGHC1WLhZmKs63ltAJdhW9qNA6If
 f3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D/08PWrqjyPkGc0B42a25KshgE2FvQ8dgUiiu9R79Go=;
 b=o0+2XkfMW3T/BBL+q+34fKNfqmyRIxCk62ZP7d49ejuCXknyuEHo4DT55iyzTYMaxy
 Wbeh1XzfNtYcgmdhOIe0eeV0XYTQgc7+P/CutyW0j2R879M3mY/On8YDOmCPXZLHZ9sv
 WNOU7KR3sqfEd8s/skTmkW9SzhFImtm1zThsMC57ZgAZpe6gEaTVOdpHj82Rk3J4x3uS
 OfKIP1nAATVlBGmFRNdIewIMmONZ4WG9WYKOiUiD0391CsIDz2RVEa1XoHniJX/KS8cW
 O+RHVasaQcj2LP+C8kbfjMHRsIc7CYudDZy/UL+N4RToc6o2M53v6AiJPW9sU/DG8S1P
 V3uQ==
X-Gm-Message-State: AOAM532a37mEOHf6LXAx9d7wBhSDTv5f5k+FL34obhQ66dlbJ0fyt0uo
 RN9JTXf6IEMPKgYo884jzPZTaov9XnI=
X-Google-Smtp-Source: ABdhPJxBBUFTQNe1hDJaUQ/xMg1I/Xba9UdmAtEBlDoGXypnOBiCOx/TzGbqw7w2Iif2EuEnGQMChA==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr27482590wri.158.1633990960134; 
 Mon, 11 Oct 2021 15:22:40 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id b10sm4338925wrf.68.2021.10.11.15.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 15:22:39 -0700 (PDT)
Message-ID: <ea99b4dc-cdb8-5eff-ec4f-3f4c0878a150@amsat.org>
Date: Tue, 12 Oct 2021 00:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/8] target/mips: Use tcg_constant_*
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211003175743.3738710-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 19:57, Philippe Mathieu-Daudé wrote:
> Replace temporary TCG registers by tcg_constant_*() when possible.
> 
> Philippe Mathieu-Daudé (8):
>   target/mips: Remove unused register from MSA 2R/2RF instruction format
>   target/mips: Use tcg_constant_i32() in gen_msa_elm_df()
>   target/mips: Use tcg_constant_i32() in gen_msa_2rf()
>   target/mips: Use tcg_constant_i32() in gen_msa_2r()
>   target/mips: Use tcg_constant_i32() in gen_msa_3rf()
>   target/mips: Use explicit extract32() calls in gen_msa_i5()
>   target/mips: Use tcg_constant_i32() in gen_msa_i5()
>   target/mips: Use tcg_constant_tl() in gen_compute_compact_branch()
> 
>  target/mips/tcg/msa_translate.c | 87 +++++++++++++++++----------------
>  target/mips/tcg/translate.c     |  4 +-
>  2 files changed, 45 insertions(+), 46 deletions(-)

Thanks, series applied to mips-next tree.

