Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B78E592DE6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 13:09:19 +0200 (CEST)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNXy9-0000sX-Fe
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 07:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNXoy-00060t-Dk
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 06:59:48 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNXow-0000kL-DI
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 06:59:48 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x10so6050882plb.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=DI3mYz6wo0UbVBePbbvu6zaIsUocR+fdlReeTrU9jI0=;
 b=lzlWr5lDjxIjMBAW2z4DFphAPRV7rH+o6Ql38h+J/0/LnpAyCRW4zcWFdUKMR9snM5
 E4EUYIhQAGORxjkDO02CZC0hllBkB/1c/JL+NEbN6HhaHGcc4sY/mQsHL6VYDkfYQKfj
 HWkHvM+FRFZokS4lR+Il8Vr153ekx7xzloSbEzfOqTfyzLRs5Vzn4erXxQP8i5FRNVgZ
 LepjGCxmpovyrO786BLkDMpsv0B3uCU2Rq1K4uM3Bkyf/tsntbCYy7MDi0xY4tJ5GNT8
 wfuW2VuxTnAJA9alZ8PX2Jv10J4WeGbEvE4qmoWqMFR7EWAHAAqY2UDVA4s1dMkP+hS0
 oETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=DI3mYz6wo0UbVBePbbvu6zaIsUocR+fdlReeTrU9jI0=;
 b=vcMAw605YVNc6oCGH7OaanJSZ+QETux++cM7CGGhyMXA8bWxTawfedDcjI5H0B9UtB
 dch9n3Wq/G4SV/41WjSiSPMtYjPwMcr79czLRAZtgWn3udjCNZokTlzR/ni2JIeANC12
 WMS3jxW3HW3VsclhwnPnTPsutsnEx0jsPN24Pj5XhKjQaaqWPKJPaXb3uwiZcVi2LQBr
 BRdh8mWdIPqNkEG3EqWA9g/geoymUhP1wF+ff6nwwmSRqMrPzGdaUhKf+cooK25RGcxn
 Jn4NYh0r3Xc1c5bl71tMHjC9RrbQCYqHJYMtKxpnQj1U77qqzcx7eC2asDqQJeY9KwZ9
 9tGg==
X-Gm-Message-State: ACgBeo0FlFrQft2+YFl70J4n/zzjg/huFx199X6d12+qdMMTjeRlQg/L
 TZGPcG+1Q+SByNwAAZUmTuA=
X-Google-Smtp-Source: AA6agR6lYRLpssL+zOwaEK16F6RF5I6ckx4fFq4nhFYQxpv6C4Oh8iBu8UP+j9crMraFTeuuxHBfiQ==
X-Received: by 2002:a17:90a:17a6:b0:1f4:f635:93e2 with SMTP id
 q35-20020a17090a17a600b001f4f63593e2mr17881128pja.156.1660561184568; 
 Mon, 15 Aug 2022 03:59:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a170902e84e00b0016d88dc7745sm6740794plg.259.2022.08.15.03.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 03:59:44 -0700 (PDT)
Message-ID: <93ee6d8e-7ecc-6dfb-cca7-f5b5eaad333d@amsat.org>
Date: Mon, 15 Aug 2022 12:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 03/20] disas/nanomips: Delete NMD class fields
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-4-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-4-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
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

On 15/8/22 09:26, Milica Lazarevic wrote:
> Class fields have been replaced with the public static variables.
> Therefore, there is no more need for a constructor. The main goal is to
> remove NMD class completely.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 6 +++++-
>   disas/nanomips.h   | 9 ---------
>   2 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

