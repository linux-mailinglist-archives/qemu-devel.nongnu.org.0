Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72345F31F6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:28:57 +0200 (CEST)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMRE-0008NW-F8
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofML2-0000cB-S5; Mon, 03 Oct 2022 10:22:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofML1-0007ow-D4; Mon, 03 Oct 2022 10:22:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so5944033wmb.0; 
 Mon, 03 Oct 2022 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=ruftJfDTsQy8mpz59In5NxaGnciYDBSuMJMvRoqVi+0=;
 b=oWEO41HaCCWO6nNGgdgnC/kzifvHyG4oBA7c+W0dvX5pOPXP0PdNdV99GALgVxBDn7
 HYIGVmKXyoMktp67kflfpzARotp7UXoRLydOzKiPGWl4QPIjatBFW97WVJpHouxlC6LO
 EGI7B5SBwwZYphc1FEL/ZjEu2RkdYU2qsZEH1MbLqaoOU6Boe+4g6KLwzhSp+BoaxVWj
 LlyRwlBSSUZT7dg10VtE+2i9Ld5v1aefdOMarT6hYHTyv0ccee9dZxTFqbquZ/5nOd3E
 j0llnXz5P9T1md5gv+nQpTxOmtGI0/NcKoIV3JPGhDnJHzhNQO8fzzR1NHzFjqExdXzn
 eMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ruftJfDTsQy8mpz59In5NxaGnciYDBSuMJMvRoqVi+0=;
 b=ykVrPxNLSBnS4QTyLU4SfvniwVPgN5BYcINt6ceQ1M1+gRgz0EtTiKwxTgX/o8Yple
 KkMVjanNqMFpvE9/FludCDxtrpV+Cy167foRBXS7efNd1mh+QYh0frvThLMeWcgTJZbP
 0cY2Wzf4yq7/B69ljXSvWQJEnAawFEb3e04cEHRRF9dbh1fEpwXvRVygYhfeb1WW2mVI
 4iaSLZjTVdIwL72AhRRjtqAC0ADGaX1WKDQx7hz+ylGj1jy3b/rFVpOUpfsKpAPfiH7z
 1Rq+XaSO8JNqAdyNCFnrqT9vPnrKKMftwszI49lReclBKt+HV4kbFumYPymnnWoGOjYL
 eUVw==
X-Gm-Message-State: ACrzQf0iOiXT45meJ9+TaVVIRk7hnCmtik/S7PDv0zWhTSI7//ko2MX5
 ME+WCaC+sdLaKLcAaYMMsXw=
X-Google-Smtp-Source: AMsMyM790py0XoYzAyBGUKzJylkrgkskj+CAt8a6KhfGz/IacXZiU3JEpBT0UukxBuAUKIy4jjKR9w==
X-Received: by 2002:a7b:c050:0:b0:3b4:fae1:6bce with SMTP id
 u16-20020a7bc050000000b003b4fae16bcemr6873795wmc.131.1664806949602; 
 Mon, 03 Oct 2022 07:22:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b003a83ca67f73sm12094711wmh.3.2022.10.03.07.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 07:22:28 -0700 (PDT)
Message-ID: <e011bb71-2ff3-616f-5554-4845e8800f1e@amsat.org>
Date: Mon, 3 Oct 2022 16:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v5 5/9] target/arm: Remove gen_exception_internal_insn pc
 argument
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-6-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/10/22 00:03, Richard Henderson wrote:
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> Since we always pass dc->pc_curr, fold the arithmetic to zero displacement.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c |  6 +++---
>   target/arm/translate.c     | 10 +++++-----
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

