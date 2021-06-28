Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD73B66D7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:35:00 +0200 (CEST)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuDr-00068r-Ko
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxuCj-0004f6-HZ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:33:49 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxuCh-0000LM-7X
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:33:49 -0400
Received: by mail-wr1-x434.google.com with SMTP id u8so8730890wrq.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gzJxsWwOlHjpQHmfyOrvrk55BbxojOYk83Jgqinc6DE=;
 b=Tigcfkfyal6/vwh2gUVs7NLHdzGm4K4f4RtuD7y86QLArRnGd2crEXMt0My7UYrF9Q
 JEhaFV/cr8r5DZ6Czfa3ElVWEM5NZU7XBOpgbKsc+Ic48r/Wb4focAfKIUkxoauc1U6c
 0xgrBtKMuQvwuBnvzlf4FQQPVULpIzvnhvyUQgoPl6wyrCgz4Z+Z1RCFe94X4Y+5+MQ0
 QJ2Y6l5k+Xz0WVs69lO8VcDl/8kBBNICUdvwzKB28HKl/XlLILLIMx+PVuiRaN1f5xBd
 Oxex9+zQon4SyBpsKKEEnXdTIQFoO3bIacq6M857uSjRp+9vZ6P88juN6gT3eMeZGYx+
 QoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gzJxsWwOlHjpQHmfyOrvrk55BbxojOYk83Jgqinc6DE=;
 b=ek8nUcZN3cEQI1MExvNmlafX+sl38PpNq3lMPve1vJ2dky5Zp9Xf8hR42yb+3dKfXw
 VE3m37aTkGol6H5RrUzcADUgo1JPSOwI79PmufQ9yNS4nZHgx4/AjgZMwH9xUYwwGbZR
 fjGnc6ck2MfJmxqoXVjXjU7/v6Sqd24LZk65UlzlzpTvd8h9/43aUMOARIPTtjBm/AIC
 pib0U740FyZ2SqU0s9REk3kh/LpSA5mt3HgWNlsLE3DAe8fNjmvn5CllwKOkW8h70iS1
 5p/ZcVs1oaPUKWCXfjO+T9pbcbd0B+v84HSttfC1NvwCifKQvj0o4tBEi7pyToTp5tQf
 JYkw==
X-Gm-Message-State: AOAM532X8giwS5ysuzshgwbVQFihJPehfo2SNze5Gz7eB80HD6UuXY23
 VU4OlHLGA0MKXBWjMviAYZM=
X-Google-Smtp-Source: ABdhPJxqOgnMU0guuknUwBk8fXiB2mtJ/38BaYlLtwqWmAWlCuzlGA5F95dXRiFKjOhPML6eqW/HvA==
X-Received: by 2002:adf:f083:: with SMTP id n3mr13483332wro.197.1624898024791; 
 Mon, 28 Jun 2021 09:33:44 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f19sm13867820wmc.16.2021.06.28.09.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:33:43 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/mips: Add declarations for generic TCG helpers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210617174907.2904067-1-f4bug@amsat.org>
 <20210617174907.2904067-2-f4bug@amsat.org>
 <a586a9e9-ea77-04da-f1f0-45d79d6eb626@linaro.org>
 <ea1ec188-d011-e8f2-7131-3946bfd6d963@amsat.org>
 <79cfc24f-d271-fbf6-33bc-b8c2f1381b5a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <876235ff-c85c-9b6c-d1a7-a3fe3f602cc1@amsat.org>
Date: Mon, 28 Jun 2021 18:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <79cfc24f-d271-fbf6-33bc-b8c2f1381b5a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

Hi Richard,

On 6/19/21 2:41 PM, Richard Henderson wrote:
> On 6/19/21 2:26 AM, Philippe Mathieu-Daudé wrote:
>>>    It doesn't seem to match the next
>>> two patches, which don't create new compilation units.
>>
>> Indeed. In a yet-to-be-posted later series they get renamed to .c,
>> becoming new units.
> 
> Ah, ok.
> 
>> What I can do is hold these patches and post them later with the
>> yet-to-be-posted series, *but* that breaks the "extract nanomips
>> from translate.c" which you already reviewed :/
> 
> I don't mind the ordering, just that there's a reason.

Is that OK if I reword as:

---
We want to extract the microMIPS ISA and Code Compaction ASE to
new compilation units.

We will first extract this code as included source files (.c.inc),
then make them new compilation units afterward.

The following methods are going to be used externally:

  micromips_translate.c.inc:1778:   gen_ldxs(ctx, rs, rt, rd);
  micromips_translate.c.inc:1806:   gen_align(ctx, 32, rd, rs, ...
  micromips_translate.c.inc:2859:   gen_addiupc(ctx, reg, offset, ...
  mips16e_translate.c.inc:444:      gen_addiupc(ctx, ry, offset, ...

To avoid too much code churn, it is simpler to declare these
prototypes in "translate.h" now.
---

?

