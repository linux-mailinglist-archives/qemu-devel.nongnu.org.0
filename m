Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B571C42FC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 19:36:00 +0200 (CEST)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVf0Z-0006sg-9u
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 13:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVezF-00061H-TB
 for qemu-devel@nongnu.org; Mon, 04 May 2020 13:34:38 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVezE-0002Ic-So
 for qemu-devel@nongnu.org; Mon, 04 May 2020 13:34:37 -0400
Received: by mail-pf1-x443.google.com with SMTP id f7so5870900pfa.9
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SByHO5BiXIiTMBQoPQa8Q7boUFai60oNWTTLpLycIgs=;
 b=MLK+vS/PcFKOdLw/HE5HCA1YQwRywEcOgB/Wd9S6kkxXK5/48T+SZxDM+II5nAXgjk
 MzDK21jnmcehqNySlL4VBncA1Kn0S7nDi94+Oznv6dujSIKOd3N84IQfLJ/PKyC9NmHm
 TFd+SZcZ4hdKJbzkILHvMauyBPOa0BSu31wSG9QiYauvwR1IF4S0kuLAeE8wj1+MNAmQ
 U8dLQPDwA6Dk+KMvV2qqsVGF4Im0nB3rLZmxZlMRCbnsFPQgLZG84cd55F+RCP/KzedX
 Cr8q3chPFVO9DlGDk+iXX/cdBGng7l8lJ+RfVjcZWj1EXVETUuBqddr6NKIwWuu3IIU1
 mBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SByHO5BiXIiTMBQoPQa8Q7boUFai60oNWTTLpLycIgs=;
 b=iF3rbpfUjMO7MDjOo9wyWfC9/ef1A80pl9KCg5PbqLtuf0ON/f03eQ+cVdl0MR7daT
 6/btck2yL0M9P9gGmcl/BkZuuPL+2j2XNMEipP7e5jknePG1QYs8jsw1MX4vj6dd3v4G
 UjsIdSOvJzWYeHRK/fgHBo9UlmnSh3FWqZHXhHAU6wBTCXG/cP3YsGqC4vu5L5lyszcP
 aNUuljpm90g484MNwoiZvG5D8z1BDc+6mfE7QpUFRCetw5jDU2X6FxQG77m12FrKZ4T+
 /X94S4I4isL2Dq9sBQYaRj35eDeG140VxC9NL1USfmTAlQodxYKkaygW6h9IHKUsQEBs
 NqZQ==
X-Gm-Message-State: AGi0PuY4Xy9h2c5dNqYEdrUdL6e69vYcwo2kdDpGOGN2RtkX21sxiBk0
 ANaPl9SOY9P+D2+Ua51gYhwtBg==
X-Google-Smtp-Source: APiQypIDasKeO7I5hVCxR3pQdWGlKaOW6n7+tU5biK9TuIJJYx6D56lQqEMORKla5uwbduXivrhGiA==
X-Received: by 2002:a65:400d:: with SMTP id f13mr67394pgp.336.1588613673840;
 Mon, 04 May 2020 10:34:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c15sm9366465pfo.188.2020.05.04.10.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:34:33 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/display/edid: Add missing 'qdev-properties.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200504082003.16298-1-f4bug@amsat.org>
 <20200504082003.16298-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d078a2af-34f7-1688-5af2-0ccdb4336849@linaro.org>
Date: Mon, 4 May 2020 10:34:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504082003.16298-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/20 1:20 AM, Philippe Mathieu-Daudé wrote:
> +++ b/include/hw/display/edid.h
> @@ -2,6 +2,7 @@
>  #define EDID_H
>  
>  #include "qom/object.h"
> +#include "hw/qdev-properties.h"

So, are you intending to remove this include from other c files?


r~

