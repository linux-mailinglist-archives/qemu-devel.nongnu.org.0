Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623E3F93C3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:43:27 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTiA-0003Ne-Ev
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJThJ-0002jA-2Z
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:42:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJThH-0002Hv-Iv
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:42:32 -0400
Received: by mail-wr1-x436.google.com with SMTP id h13so8459138wrp.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ca1/rHLPLQV8VjJd8cSLfcO8z6fUUqMaNzchSsIfj24=;
 b=c3nqwQs832fXXbDoDQJj+Dn73T64FPl9OXjL6Z24xdSDjQA6s8KCu3NkXvxUneehKw
 Uq3zAMBGU01hU2HtuaufKe9AmYWU1P+Av+EQZrTjrakgduqYcjS7ztcTUNoC51iWPaji
 SbJ/KgQr6iMbXscbRM629CnhHK3sJyUs8JXKhmagSua9I+DJLZOPwx2pf0+8QJJmXsxY
 o3MqXGo1Y3Yf4z5sAL/iV/TfPY6ePNRCQz93P9AjSOXGrcVOsQIA0Se6HvxbpvYjPZIG
 XruKr8wWoOjaeJmoZ0zJIN3/LQa0lSBbxJehj1joARXIa2WmM1aaFd/foKo/in53kaJw
 sk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ca1/rHLPLQV8VjJd8cSLfcO8z6fUUqMaNzchSsIfj24=;
 b=XJmJOwhLpDHI2wtv0ByCSp8jP2amrEFW3ejvY4HLSkwMUzZ/3kvsAP5kwUuQvOHrP2
 hLIZt6hniG0srWuWAE6zbZCHIHSkaFQPhYXZL+gJdUqKJUmeA22iMdQ6cd25f//Ts+MY
 1MSlJl+3vaE+1zCZdF9x/naAen4vdOwIdH3Vv7L/7OcA2N/vKMGtYLqCGYmqD+nEoF4v
 FLCOxLoFM3fcoZRYHDACfdttXkubWgStEAH0p562g71csxxAM4RXQO5s9wdFhmOx46U5
 Q8rYogcqqB4S2Sq6VHVHpViOOnVBYxZz7nspXafQIzVODulRglM2K3F5DN6lE0F6FHL3
 VdTA==
X-Gm-Message-State: AOAM530AJHSnkHtXz1Sem/XPz8m8HP68XI4q9Z7x1aBvZaLj3oEEbwnz
 0kUVbbYgGBU3fs69JEzmbCk=
X-Google-Smtp-Source: ABdhPJwiexCR9e8wzwewkNugzI0cpuAKiwjn7jwQZZFWseE2xzSuzxurSwi4LKRG6YwVXLQ+naDUgw==
X-Received: by 2002:a5d:4689:: with SMTP id u9mr7878923wrq.330.1630039350149; 
 Thu, 26 Aug 2021 21:42:30 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e2sm5901836wrq.56.2021.08.26.21.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 21:42:28 -0700 (PDT)
Subject: Re: [PATCH v2 30/43] bsd-user: Remove dead #ifdefs from elfload.c
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-31-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <de44e02d-5da0-3347-c2b6-5bbb344ae354@amsat.org>
Date: Fri, 27 Aug 2021 06:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826211201.98877-31-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Cc: Warner Losh <imp@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> LOW_ELF_STACK doesn't exist on FreeBSD and likely never will. Remove it.
> Likewise, remove an #if 0 block that's not useful
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/elfload.c | 20 --------------------
>  1 file changed, 20 deletions(-)

Move as patch #14?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

