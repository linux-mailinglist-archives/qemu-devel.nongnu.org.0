Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5563A418128
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:59:58 +0200 (CEST)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5PR-00040f-Cy
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5O8-00038O-Lw
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:58:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5O7-0005qF-8Z
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:58:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c21so5549802wrb.13
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cme6BD9kT/gzNnBQPwfnTIJEkq68DvD6K6y+BpDl7Fs=;
 b=hODdlS7Ej7vVrFPFnzy1IyHaTyzL0SBrY5VeKfqu605+LXQqf4yzOQcZdO5pGpDINo
 0WBO6WRPaV/konCm39MO8iIIZ1RENeEr2pboP4wyiphCNVJS+E25TiuzPGcHdz5Lrkqy
 14dw8Fo/I2pLaxRV1YQRZAK5tQd5qCLs4M2bKs0AP0bdZWdfrkVbdve4HvEoANuLTbo2
 tTjRJgK4NUZLBnv60tjtE/Fo+sufg9QvPP4VSy5lz9UA/CWZDAD8vTU160beRi7fYwLD
 2lueRWBD4kV4tbwGk55C6PWCAO3hR1Vwl9Nd9bpExQcz+0SUk/bmgvvWwdn2jK2uQX4A
 HFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cme6BD9kT/gzNnBQPwfnTIJEkq68DvD6K6y+BpDl7Fs=;
 b=d5LdM2ZophSUAiQW1L/Z18wY9vAvJ9GOD0soeX74L0qzzXzbWe7lxGNncMqMoJFz+J
 HrV3glMtrEoziztWis8IGkPlxxTSjY8dQIdBYUDUbNRiWjy5/nQjiZlVOR+6Wgs/rbTO
 CTe9+UyL5dTjVjU0R2vbj6uG9eiLdLCfIY3SvWzWbCzI0uslty5DW0iTDVJH7mZwTHgU
 bORmDMrKnGgGE7G7fLPlExX3Zg6JWf5p1IGZe4ygTOGbDhP9XQjnSljbItoypSj4Q+W6
 XyWA012Db15BUpLpHHH2fc+mGOaQtIvr+QW9Q88zKkhuGHmQsjrdpvBt2c3D9IjXQ/MW
 9AxQ==
X-Gm-Message-State: AOAM530lbnt3yCsYFWRTS19/bl6LMtUe4TtkKszMO2AZXei84v1EhraY
 c73VOQIc/PKwJrxRm5BkDYjtJl7Dwkw=
X-Google-Smtp-Source: ABdhPJwcy0MypIMuoIAAikanfP3LwFmBCKQk4FqkQbS91oErzY1O/sFh32E3rw3PZJ2W9BvnAXNGdA==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr16423423wrz.84.1632567513725; 
 Sat, 25 Sep 2021 03:58:33 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n7sm10832209wra.37.2021.09.25.03.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:58:33 -0700 (PDT)
Message-ID: <c5a57ce7-20c4-ff9f-ed1c-50d2995011d5@amsat.org>
Date: Sat, 25 Sep 2021 12:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 9/9] bsd-user/mmap.c: assert that target_mprotect
 cannot fail
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-10-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922045636.25206-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 06:56, Warner Losh wrote:
> Similar to the equivalent linux-user change 86abac06c14. All error
> conditions that target_mprotect checks are also checked by target_mmap.
> EACCESS cannot happen because we are just removing PROT_WRITE.  ENOMEM
> should not happen because we are modifying a whole VMA (and we have
> bigger problems anyway if it happens).
> 
> Fixes a Coverity false positive, where Coverity complains about
> target_mprotect's return value being passed to tb_invalidate_phys_range.
> 
> Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

