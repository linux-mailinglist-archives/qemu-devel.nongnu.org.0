Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD683F4EF7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:06:01 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDOa-00080q-4N
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDN5-0006WT-9p
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:04:27 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDMx-00040e-L6
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:04:25 -0400
Received: by mail-pf1-x42a.google.com with SMTP id t42so13340908pfg.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3P41T0jeqHRPlkBVKKsu0DVAal9JpGfJ2rzWBJM3HvY=;
 b=k4/yLEw/rPqChPdOV1FiqWZVYNGyzxawmJYNIZ4tBkqLxNVT5kIMKpSQ8B9Czeu4zz
 Yt1MkmwM1ol7F8o9HAfoIYmwA5bP4pgmWJNjTawRGXsucn7raCD2iIGUJxmzGnh9WQjw
 Qu/+S24Oh0HG/j1tJOSB9zffYzMRZ3cRycqgjZ1BaTBASEulcuXaCzwPrrkoP1GZ/yPV
 vvsdjXZMGJ0ySner7LH0MqtszwlKlko5TKSaEvfoTPLqVPQfwJcvNZ5ihe6mPlUJe45S
 ZvzE92dF0TVCz6WIeeL+fWny1PibevEVCwhIdu8Qna16dkKavnOHkJzn4syNmGc93oBs
 70zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3P41T0jeqHRPlkBVKKsu0DVAal9JpGfJ2rzWBJM3HvY=;
 b=kVdwKs6ozu7ifwlLf7VL7rpyiijWNYwlWKsdPgza5EXdGl/Rs+tZ9rq7f5nlwluxJh
 X39EGbjQVpq29Dkhy9YL6IgIAvlqmoyV69ly35hZ6UaMsybitoU5AyU/W1ZwvOLVtUqy
 iRQrdVAWhSlbyqO99ZAx+Om82IDIecfk41hsHlmI9mAgGqGBXdbeTb/Sj9s0W0gz6ya3
 3SbDS4psGYdmTTQCaTfUggxloAkODLBfmyofE1+Bd/J32ZGEcLS1PUTlR1yZlNETBoOU
 euThemE3VZYVXTOJ+fJkbqDGqYTArh/6kDHVP+ojj7zE48zR8gKBueiO41QoWJeZeN7T
 IIgg==
X-Gm-Message-State: AOAM533PMKlIXqX9NwyoQf3IEuX8bg2VJutIVuf4bgTEvvNAuPaS12GA
 UXaS9lGOMaFax1/u2AkpqOtt8g==
X-Google-Smtp-Source: ABdhPJyyUKtJ5aWWkckMR7TcKXH2SvvadoNg5vra5+C2NWPHb/zOT73jzQLUM2AHApbEEz86UjKttA==
X-Received: by 2002:a62:8407:0:b029:39a:59dc:a237 with SMTP id
 k7-20020a6284070000b029039a59dca237mr35443001pfd.30.1629738257947; 
 Mon, 23 Aug 2021 10:04:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u10sm16390033pfg.168.2021.08.23.10.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:04:17 -0700 (PDT)
Subject: Re: [PATCH v3 04/15] target/riscv: Remove the W-form instructions
 from Zbs
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-5-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ff2366c4-a95b-be1f-56c4-143cb21bf78e@linaro.org>
Date: Mon, 23 Aug 2021 10:04:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-5-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> Zbs 1.0.0 (just as the 0.93 draft-B before) does no provide for W-form
> instructions for Zbs (single-bit instructions).  Remove them.
> 
> Note that these instructions had already been removed for the 0.93
> version of the draft-B extenstion and have not been present in the
> binutils patches circulating in January 2021.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - Remove the W-form instructions from Zbs in a separate commit.
> 
>   target/riscv/insn32.decode              |  7 ----
>   target/riscv/insn_trans/trans_rvb.c.inc | 49 -------------------------
>   2 files changed, 56 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

