Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244432D8CFE
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 13:07:57 +0100 (CET)
Received: from localhost ([::1]:51828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koQAO-0001Kv-80
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 07:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koQ7z-0000L9-JY
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 07:05:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koQ7x-0007YX-Hq
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 07:05:27 -0500
Received: by mail-wm1-x343.google.com with SMTP id x22so11296662wmc.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 04:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LyMTOr1WvsGdRs7E5DV/F6LxWXyxRH5lrSk99+NsyEc=;
 b=geRofvK/qfQgyAcD6XdC66mNwclzzK2K6vOoDhf2KHQfbD4lozFD65oHRdQH/X3h/l
 CBz4yjMLo6C/GB97J0LmEmSfWtuHyHhIX63qAIkerInjNxrcQgRZHiWr4s5/+ZADZgwO
 26iE+f5sbM7jH2uIswIzJ7lVXMEZWtVirRPvEfR/3+sobpb7GogfF/kqqDuuRnaM/jlq
 JpvQSrbPbvx9wWL0awRZRgtQv4XKJWK9HUB1Rp0gszUdg6bcZ0tdXsIEFeAqYMpZesj/
 RiQg2Qz7pYRU/tT3LXkkLS67/dsCsZMB6bL4Cv7MpyijXi26KPXxg4ZZiYxjodsFdWwM
 D/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LyMTOr1WvsGdRs7E5DV/F6LxWXyxRH5lrSk99+NsyEc=;
 b=F0hvWx/rUkv8g3urLtr8EZbDyIcd8GzrT6MkBAxfGNWmlMlGilysUADQEdMOzllAJ9
 cdisl2DY6SE646mMx1IKiC7byzem93FBCN/n9NWSDgZQAsd3szsX/cXaTgrgfjk9H24R
 p6koxl+ZJwFD3AIbkkBktEHfky5/XAiMvUXw1x7rJf9brS6+ccJAwqQo3uuw9IPaqxaJ
 x5v7X6ElO5n2eXW7oOHoi088teMk2U6yS/3pxDA7lA+rT7+GSGzghp2LVk19qq8BRmor
 kN+sKJHEbbRxREdpZizwC4EtZgCOljeGb3kL8lzos6T7vC7P5Tv4KPWqXVwfYuFMOD6r
 9leQ==
X-Gm-Message-State: AOAM533gRSAUOjxtE6sXqoLm/CtqxH8G/bS3RhBB9owLmF0QjqXyFAzE
 KRigXxURR0Zvv8R1OFEBlsg=
X-Google-Smtp-Source: ABdhPJzU4GIyEtw7ZTylwTWt6pwH7Y6cGEWS2g7jXY6S0lvSXbycdIVunWVYBhKUGTCr85cF3ZyP3w==
X-Received: by 2002:a1c:6283:: with SMTP id
 w125mr22541966wmb.155.1607861121032; 
 Sun, 13 Dec 2020 04:05:21 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id p9sm19792246wmm.17.2020.12.13.04.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 04:05:20 -0800 (PST)
Subject: Re: [PATCH 2/2] include/hw/sparc/grlib.h: Remove unused set_pil_in_fn
 typedef
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201212144134.29594-1-peter.maydell@linaro.org>
 <20201212144134.29594-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <87dbe5c7-3c0e-ff67-ddde-796fc2f36614@amsat.org>
Date: Sun, 13 Dec 2020 13:05:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201212144134.29594-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/20 3:41 PM, Peter Maydell wrote:
> The grlib.h header defines a set_pil_in_fn typedef which is never
> used; remove it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/sparc/grlib.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

