Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A04326B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 05:47:30 +0200 (CEST)
Received: from localhost ([::1]:36796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbGi1-0001qf-Kk
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 23:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57659)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbGcG-0005A3-2O
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:41:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbGcA-0006rT-TE
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:41:29 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbGc9-0006oc-Ge
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:41:25 -0400
Received: by mail-pg1-x541.google.com with SMTP id v9so8372066pgr.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 20:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FI9jdYNMjmJargd61o90EgkEeCknbftp8ly7GCgo1/M=;
 b=zJfCSEOb9V0B75hRZDodJM7RglyGtasxEE7vRnzAXFS6kkeLHoOIZ838Yy/sNv5Vw9
 0xRazEsOWfuN6r1F6hpNoJV+xHtu1llD3UcQou/mlrgRKWewkJbYRFef1tfwmvdlkLHa
 MtOwB4pvtseGHynJx5X1dPitUFWeqWu7tIOAIxO6qJyy4E+8DHpuVySkDK+//l84F3/z
 PGSmo2h4WXFJFuWzIlFhD3yrMeCZDvT89W+caF00IaXnLeCrsGC+3O8YNrhZdjk1COqU
 T3QUADctJ/Z2ZM8RVpYXn75LfWRxzEe5t/skJFsJjVHlCyXBBGLyXYiTn55oLt++sPx0
 FNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FI9jdYNMjmJargd61o90EgkEeCknbftp8ly7GCgo1/M=;
 b=jYE20ahAr1P87B8bRgnTTupO+NLYRXn/Fsk4eyL5GrqOp3dpRjNrFH1hOIMlmgyboQ
 I0vbDcraRYDFCE3xpxTnXmqDNxLYMsXPwjMHQ73sxNlfCtBg7Vj8y/dwqu11lmChc4mz
 E5u0f/QWQAI7dxqzno2Ek0MfwVLbEF0yeDs039S5GkXX29+i3+vtTgt4Z0aIDFn0dbw8
 w/WbeMmcuYZWexhBM/MjpwNb4Yev8WTm6obnf8Lgr7+eSAzjsJpbV+3IXJslkzg/RWSr
 moRiJb7YW2yX1n5YFOEU8BK7DnuhvoCdpddiDeaSkcgC2AbdduMgvgRwOz8QJ1BLfDTg
 MCBA==
X-Gm-Message-State: APjAAAWgwwgGSpEQ9TkyRObd5zsO7Xyohwnbl/ek/LDcLdqJnd9ABWWr
 Uzb7wsO+H6iludke911TuspvXQ==
X-Google-Smtp-Source: APXvYqwh6ujaaO2tZgFut6a/5CUlOlyL0PLUkn90cxH6qVikBYV0m9UKw0TUjFzewalLcjIkhDMP1A==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr27601952pgt.388.1560397281671; 
 Wed, 12 Jun 2019 20:41:21 -0700 (PDT)
Received: from [10.1.2.220] (50-247-96-158-static.hfc.comcastbusiness.net.
 [50.247.96.158])
 by smtp.gmail.com with ESMTPSA id e124sm1021034pfa.135.2019.06.12.20.41.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 20:41:21 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, rth@twiddle.net,
 gkurz@kaod.org
References: <20190602110903.3431-1-mark.cave-ayland@ilande.co.uk>
 <20190602110903.3431-16-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <04c12588-11ca-f77a-28e0-343a7accc666@linaro.org>
Date: Wed, 12 Jun 2019 20:41:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190602110903.3431-16-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH v2 15/15] target/ppc: improve VSX_FMADD
 with new GEN_VSX_HELPER_VSX_MADD macro
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/19 4:09 AM, Mark Cave-Ayland wrote:
> Introduce a new GEN_VSX_HELPER_VSX_MADD macro for the generator function which
> enables the source and destination registers to be decoded at translation time.
> 
> This enables the determination of a or m form to be made at translation time so
> that a single helper function can now be used for both variants.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  target/ppc/fpu_helper.c             | 68 ++++++++++---------------------
>  target/ppc/helper.h                 | 48 ++++++++--------------
>  target/ppc/translate/vsx-impl.inc.c | 81 +++++++++++++++++++++----------------
>  target/ppc/translate/vsx-ops.inc.c  | 70 +++++++++++++++++---------------
>  4 files changed, 122 insertions(+), 145 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

