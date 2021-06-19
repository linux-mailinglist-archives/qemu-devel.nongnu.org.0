Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D033AD8F1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:28:25 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXH5-0008Dt-T0
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXEy-0006l8-I1
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:26:12 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXEw-0003iG-U2
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:26:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id r9so13538065wrz.10
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PbIvpje1ZzMDSffGkqZSLskA8RLgkBVPhzMfJDsQvNg=;
 b=UW9WmL91LbeN15hYCdN6oXRRI5YKxD/p5O6Gtm7DgDhPQrWZMIzlqZ52InNq3xmACP
 4DYKezmj1bvopvs352wRPJk4xF+qfk9HVWsEFtY+bPLVnXT3e5ppo7EhP/jFcwTukC3T
 9H+I1fortB15ygZY6mJF3GBO8V8w4VIaDcCRJ5oENSE7ZCjwfNFrhtxY4L2THASydeeF
 HqpvXSwZJ6/dB8zN6QZw/Pmo4n+wtMgbJahD7po4luofW8mGq6ehZ0ltW6Nfvt1FcfaD
 5FtyEngS4p0H1hkViVqTUh7mW/gq+awQkLfVCtnIO/E0LdmBguXYaJUTgi2vmya2u1oR
 YO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PbIvpje1ZzMDSffGkqZSLskA8RLgkBVPhzMfJDsQvNg=;
 b=eNCQmIi3XToDH3+Pk8dUfoRd1m7wpPpCRgIBVJ3pgjKlnhMTooP6v9ZYlXiUAXyI/q
 G/P+4Rm7tBU5KUhc2O10c4d5y9agAnO7rcEuVfcDtJiK2wVn+sIcmHfF2dQDsE1Z8ugN
 HIKvC0Qn30LjYY77q+FCKhb6RBMxg3jjX6a4IxA4hRy1ZLbF390nAZsBLKBTRM0tlFSP
 HgI77OE1IpYwmW2z8YqS6JoEz7qQ3z3xmjjex4FuTePlEGrRCPNUidzMfTJSebgzM0ga
 3Y4y4XWJblEDQnSAxQ+pyInyzy+wFzFi+7Uk4QMTV/g7FpWlLRkGhG6kHhtQ2/1AjYic
 9pJA==
X-Gm-Message-State: AOAM533dv+ZcjVnXKS7Z35avChIQaWik2IRdUVwUr2y2JMw+4BzE1e26
 Slg6p1siF8FYcHn7/AdnTfw=
X-Google-Smtp-Source: ABdhPJyeJsZYoLFRf6He3/BAAjE02hgqkGKvmO6dDS2hAGmPVNuElr5WkL+3LdOGUn1RLsglyE5olQ==
X-Received: by 2002:a5d:47a5:: with SMTP id 5mr16381422wrb.259.1624094769366; 
 Sat, 19 Jun 2021 02:26:09 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m18sm10998003wmq.45.2021.06.19.02.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:26:08 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/mips: Add declarations for generic TCG helpers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210617174907.2904067-1-f4bug@amsat.org>
 <20210617174907.2904067-2-f4bug@amsat.org>
 <a586a9e9-ea77-04da-f1f0-45d79d6eb626@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ea1ec188-d011-e8f2-7131-3946bfd6d963@amsat.org>
Date: Sat, 19 Jun 2021 11:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a586a9e9-ea77-04da-f1f0-45d79d6eb626@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 10:15 PM, Richard Henderson wrote:
> On 6/17/21 10:49 AM, Philippe Mathieu-Daudé wrote:
>> To be able to extract the microMIPS ISA and Code Compaction ASE
>> translation routines to different source files, declare few TCG
>> helpers which are also used by translate.c in "translate.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/mips/tcg/translate.h | 5 +++++
>>   target/mips/tcg/translate.c | 9 ++++-----
>>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> What patch set does this belong with?

micromips_translate.c.inc:1778:                    gen_ldxs(ctx, rs, rt,
rd);
micromips_translate.c.inc:1806:            gen_align(ctx, 32, rd, rs,
rt, extract32(ctx->opcode, 9, 2));
micromips_translate.c.inc:2859:            gen_addiupc(ctx, reg, offset,
0, 0);
mips16e_translate.c.inc:444:        gen_addiupc(ctx, ry, offset, 1,
extended);
mips16e_translate.c.inc:481:        gen_addiupc(ctx, rx, imm, 0, 1);
mips16e_translate.c.inc:682:        gen_addiupc(ctx, rx, ((uint8_t)
ctx->opcode) << 2, 0, 0);

>  It doesn't seem to match the next
> two patches, which don't create new compilation units.

Indeed. In a yet-to-be-posted later series they get renamed to .c,
becoming new units. It seemed simpler for me to do it that way, but
I'll see how to rearrange the patches. Ah, now I remember, rearranging
the patches modify the next 2 big patches (total 4k+ lines moved) you
already reviewed... So to keep your two R-b it is simpler to add this
one first.
What I can do is hold these patches and post them later with the
yet-to-be-posted series, *but* that breaks the "extract nanomips
from translate.c" which you already reviewed :/
It is hard to split this huge 25k+ spaghetti translate.c :(

> As far as it goes, the patch is fine...
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 

