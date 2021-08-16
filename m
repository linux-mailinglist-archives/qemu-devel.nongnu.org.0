Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C83ED990
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:10:48 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeGF-0008TJ-SF
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeED-0006qj-CY
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:08:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeEA-0002I9-NT
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:08:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v4so16988435wro.12
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lO4Bn8yHLR7GcSUd4JmHTAGqPjKF2gy13ajNp6kKnMc=;
 b=N50TYdKAo//O4ejnOBjSzRfYBGCaXc6Fl4lzGvtJVZvRyJo7zqUSK5dAonomYPE8lT
 P5+RlzWKa1vc16KfpqoDBWYAG8kRBVzvVLrp2tV56IkAH1UPCq1OqodKhkyDl+yknURy
 4gNMjuh/o2uCxVU6/DfexeciW45q5FWS6s+tdBD+T1PxG1SYdngvZwgiMJ9Izsyi6i/P
 4/vHUgGf6xv/+gW3dUYK2mpRD4M0zuN29b3ZOIxrjUedXs7IcvJ2tw+AqirRbyzAQ2sg
 KRZo9nSqn4wIkPktPOa5BRWU1i7Gdh2iM15mghUJDJUXmMLn6zce/dtRbSmVsgq5p564
 Twhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lO4Bn8yHLR7GcSUd4JmHTAGqPjKF2gy13ajNp6kKnMc=;
 b=egtuB7pEiUNIwGfxQxTuBSMKOav7KBLWnDjJJZK9SdQeuYYuiq7zJIFWOjIGOjC2yv
 pCZmDDPF0BtktLncq64+u2Hdcy8yoqPUNIr+nIO2YVLHUt6jPqYhnGw+U2L+hjH4ucNQ
 c7UuEzU+4pkJWXYHg51rbusTWio1THOXxI/goWqLD1HGqDc6TgFZyTMOGnTH/zN02BwP
 HbZh/jmCY4fn+zqa0lLTbR/DqmHUkzk1YrQpgxqZbktvRrXhluSvnz50d4p+ShEVqN8g
 pwxX5t5M4vrbR1Cu3xJBnKEPvXu5QwmIvjZP9WHvSeiQkY0YueA6Z6ijcBB/Q6iNDaSh
 lGEw==
X-Gm-Message-State: AOAM533Qw/0mxfijc1Pz3QbNUGVKFn0lmlh4nyNZoEFioJ4mz6sMQ0Dr
 CVTwcOgMoviyODtxheVLiXlfkFfYN3o=
X-Google-Smtp-Source: ABdhPJxZcL9XTJkGzadz2xnOwTMtm+8YCx5m8x973TkFWBprj/Gj4S5MY/UeyUQFrw0PViw9P0KdVQ==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr18870738wrw.412.1629126515660; 
 Mon, 16 Aug 2021 08:08:35 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s12sm12295518wru.41.2021.08.16.08.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:08:34 -0700 (PDT)
Subject: Re: [PATCH] tcg: Remove tcg_global_reg_new defines
To: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210816143507.11200-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0a93f28e-dd0f-cd26-0977-0974a393846a@amsat.org>
Date: Mon, 16 Aug 2021 17:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816143507.11200-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 4:35 PM, Bin Meng wrote:
> Since commit 1c2adb958fc0 ("tcg: Initialize cpu_env generically"),
> these tcg_global_reg_new_ macros are not used anywhere.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  include/tcg/tcg-op.h    | 2 --
>  target/hppa/translate.c | 3 ---
>  2 files changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

