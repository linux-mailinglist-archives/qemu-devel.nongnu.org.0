Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9912A546829
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:17:09 +0200 (CEST)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfRk-0006Js-7B
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfOa-0004SJ-0N
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:13:52 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfOY-0006zQ-Eo
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:13:51 -0400
Received: by mail-pf1-x436.google.com with SMTP id y196so23964580pfb.6
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=guuaXfjZV9TXbScCxO9DxvOwGqZMY//9w8sU7QFcxEw=;
 b=P0QVvOeTQyCpeRdz57tqH+Jx7KDXl9EMY2qBy3JlmJtQOUXnZF/nbuh98Bd4JgSVMe
 51tk8VqMXtkuJ9IPEzq7Plks8tPq7kf73jVvE5rjGWNJNS4FTez2LXhQr+DudjWx6B3N
 BdLlMGFp9vmssxU5MZTXgUqYdeYcZhgeT2q5epZkg0uDXlQNG5z4eS2Q6fldiGVeLcoR
 o4ylpHzyQpZpEC7XA0fSNZZvYlMQfWaAD3X6VCjcRs85WPSFcDruU8Ka6awY1BNgjWc+
 WdxrZtgQItbmll6xo1iNPvwrmhpz6mZn2zOASxuePaCvA/bCWSGiTeUxMc08vJAMcMJ8
 VEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=guuaXfjZV9TXbScCxO9DxvOwGqZMY//9w8sU7QFcxEw=;
 b=zoVkBOViqdVYJbn8HtL7SaH4Z8IUHhkaUiaKpFLwoidkP67MqlmmhLY8Yq3Kv3a8Pt
 Z0m+GTVw/+tTNEH+CfLILnd+FB5wQ7HLXcpzVPLix67aMd2UoDi9oTlUsUiLiWgMKHK1
 DwdhHPwWrth7hmkOw65yRS/pBGXnApN/1LI4n5AFXaN8zd/LFNfEJ7ciQ47lAvCGHJ8R
 51VMYAvLkyxvCvAdrutrLW9N7MkipwFghqq1oGNoquAyAKA4L+kMKM/JXx+4NB2PpYMz
 5kBu90UpJAOPUKqSu7g0fWj8tOvRIgyG7gE+unLMKj49CtKiMmJsNgKVQMePrMCJe7xH
 n0eA==
X-Gm-Message-State: AOAM5307pDwwsbxbS5NEpChwXGzk+yqAsgZjrMK/GPSjy81WnbAS1amP
 lWon2PrpeNlvAvN85G0WUCw=
X-Google-Smtp-Source: ABdhPJyXgQv03uBSG3rfwigCoIl3LPVodCnAPSQnjSBybRkbHEJjyQXHTWkzcJCaAV/BzFHmtQoNPw==
X-Received: by 2002:a05:6a00:1901:b0:518:916e:4a85 with SMTP id
 y1-20020a056a00190100b00518916e4a85mr45920129pfi.65.1654870427234; 
 Fri, 10 Jun 2022 07:13:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a170902eb4300b00161ccdc172dsm18669679pli.300.2022.06.10.07.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 07:13:46 -0700 (PDT)
Message-ID: <3f4cf089-510c-467a-006a-bdbc5f05053c@amsat.org>
Date: Fri, 10 Jun 2022 16:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] target/mips: Fix handling of unaligned memory access
 for nanoMips ISA
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-6-stefan.pejic@syrmia.com>
In-Reply-To: <20220504110403.613168-6-stefan.pejic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/5/22 13:04, Stefan Pejic wrote:
> From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> 
> nanoMips ISA does not support unaligned memory access. Adjust
> DisasContext's default_tcg_memop_mask to reflect this.
> 
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
> ---
>   target/mips/tcg/translate.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


