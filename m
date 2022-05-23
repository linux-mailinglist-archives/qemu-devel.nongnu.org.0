Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8925B5315BF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:30:50 +0200 (CEST)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDlR-000598-KR
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntDfJ-0006wk-0F; Mon, 23 May 2022 15:24:29 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:39950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntDfH-00009P-5B; Mon, 23 May 2022 15:24:28 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f233f06563so8073064fac.7; 
 Mon, 23 May 2022 12:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h5gTeRCpWVuto91yR5rY4R40C+fWc6zdi4d5KfNGHYs=;
 b=OwP9sWA0pEl3CXY2NaWsVQ67Rx5kq/39rg95XjYCPVkYpoiARFQjnQsHUeUPOIO+io
 F8AYPnIIsoYfNguH/xOS1Dglh5oH106w/wRr+FgLZRMDyMGQatzqcb3jcwBRL7xCOK2B
 GP5Yt+lSsr2sBevFaaNHkxWCXOt8MVYY0XBWpT4+d78/T/Npwi1+ZmC/LrUi30AQ0jGV
 OeDo0SrcZVU8CfhW5YKmSc/D7j5dzpE3V+d5i7lcDujKQbqhcRFZCTtAK+Gp1oE2eJ1y
 73l+yTuUBzoDsD64TuGH83Z3vBJtbFvc0ylmEo9mm8CvMVrXmooxZWMfbbvroYeCdPtP
 F+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h5gTeRCpWVuto91yR5rY4R40C+fWc6zdi4d5KfNGHYs=;
 b=m/yyZw3REy8+jArm4L0X7vaJ9mLUPKlaLrrgDVwf9FnLmlTfeHbdYFLB38rtEBa3YM
 /o8nDH7OeaPnIaGfwmNrMZylra4zWiZVT2j0SCkJJOcNXzkDz0EBi+PPWov1IIweUM8v
 RjFlxRZ85awxDqhvpoSaxjLgcfcA9E2Yqw7Yf5azUEiULaNpsTP6SXs5NMQlNEtlaFDL
 9jt6tUjAA4cFh8sy/zM1BKjREz9C2Q+rxCq3GXUHfOsf8x/3NTRcy27ul9QbQDOkLd5v
 6YBAcEDtpAfxHHAN4pKFHh9RWbkfX18jTHSVmIXQI8ullzgfUje4VfXxO6n3jzHPkd60
 V3Yw==
X-Gm-Message-State: AOAM533ej41siTD2MXb2B6ARVBiSYrFeE56muRXWlNbLmhzv7yLrvSeM
 ysjHf6aQ0KtQ7f2skrqovMw=
X-Google-Smtp-Source: ABdhPJyNyKM9bE7I1eu0454GG60IgmUNHc5fCGISaqoVskoTCtsUEErFoNEwZxsis7odSmZAPYI/UA==
X-Received: by 2002:a05:6870:e30e:b0:de:ab76:eed7 with SMTP id
 z14-20020a056870e30e00b000deab76eed7mr342077oad.101.1653333865681; 
 Mon, 23 May 2022 12:24:25 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 z8-20020a05683020c800b0060b0bf08ef8sm2091173otq.7.2022.05.23.12.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 12:24:25 -0700 (PDT)
Message-ID: <a7632f4e-156c-3efd-949a-4e56408ddb7e@gmail.com>
Date: Mon, 23 May 2022 16:24:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/4] ppc: improve some memory ordering issues
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220519135908.21282-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220519135908.21282-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 5/19/22 10:59, Nicholas Piggin wrote:
> Since RFC[*], this fixes a compile issue noticed by Richard,
> and has survived some basic stressing with mttcg.
> 
> Thanks,
> Nick
> 
> [*] https://lists.nongnu.org/archive/html/qemu-ppc/2022-05/msg00046.html
> 
> Nicholas Piggin (4):
>    target/ppc: Fix eieio memory ordering semantics
>    tcg/ppc: ST_ST memory ordering is not provided with eieio
>    tcg/ppc: Optimize memory ordering generation with lwsync
>    target/ppc: Implement lwsync with weaker memory ordering
> 
>   target/ppc/cpu.h         |  4 +++-
>   target/ppc/cpu_init.c    | 13 +++++++------
>   target/ppc/machine.c     |  3 ++-
>   target/ppc/translate.c   | 35 +++++++++++++++++++++++++++++++++--
>   tcg/ppc/tcg-target.c.inc | 11 ++++++-----
>   5 files changed, 51 insertions(+), 15 deletions(-)
> 

