Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E25043257
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 05:31:43 +0200 (CEST)
Received: from localhost ([::1]:36728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbGSk-0000Pb-OB
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 23:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55167)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbGRA-0007ts-4f
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:30:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbGR9-00062E-5U
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:30:04 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbGR8-0005z5-SG
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:30:03 -0400
Received: by mail-pf1-x441.google.com with SMTP id i189so10866224pfg.10
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 20:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+K2tEgA5AdrjOrS5F3CdOVsdMBQgZzodRYob7QSmmug=;
 b=KJ325YqJb3dqRXflvLry28CoQdOeVy42/UHNklM2oPOOkgYMKMz8YPiAdty0jIQFB3
 rmQxQkAD1qMrG3Zuj2rr+3hG1fU+/Aji4t1QzLyU1ty4YLhueKoGzWqrSVV7yo8X/ycz
 9djOwc81/7DHsifQLaN8gaT0SBX9TLv4x8Idzs1/g91k9fkfYa9pFVh6dvQViuo1p0k0
 kY79M78nWJMFakuNQQdTkHZcKFVcAmrXr4gKFDhio+o2ca+7AODH1fg5wkoXTh2ety+6
 8XLOFlMvEh5Rhm4Lw/rR/Jhe2YgrqUlmEWjTGpDigQ8amhyWlzZfmrmhCdBYWBAxhSk/
 bmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+K2tEgA5AdrjOrS5F3CdOVsdMBQgZzodRYob7QSmmug=;
 b=Tmg1rTNzO8s8XDO0x42NrT38B8A68n8ygpKwZzCTDVtojnxI4XNENpBBjRSKfN8saf
 NnJq5b+nZrO6sCUDrodLCIMxWbejPp6/v/sCwsvWIJ+GxsPjOXA9bDilirxrWFCkl3du
 cprAIOzvGx3fQjt9IsnvOXNIKYhyAPzFZh1BoJsaxmIxnw+oX5/7P44pcIloz67LUVqa
 aOAZhDcfZ3Yt74w/kdmKhoWYE/GZN5STI+S0E7TxjHGFfJYG3c38U4teCMygvc+x/lD8
 IokH5odAXgcz8aLh8kcoZjQjou6QSQyhJaj5iSgHqxmOWF3a/IYypbVu/W+UM+09GPf4
 9Jyg==
X-Gm-Message-State: APjAAAXDTxQxWrQe8wmXFoAYfl2X2Buy/9UbEOMK2yFqO0dzLUUqa//P
 ey8E9fCx43M10wjnYqyUiqZoxQ==
X-Google-Smtp-Source: APXvYqwqcNeCkZi7S4Za2wQzDUUFlaYdwAqzgM5/tQvdadDljLQZjuxhRtGbBbqGlUrePF4sIeu2ig==
X-Received: by 2002:a17:90a:9a83:: with SMTP id
 e3mr2467634pjp.105.1560396601813; 
 Wed, 12 Jun 2019 20:30:01 -0700 (PDT)
Received: from [10.1.2.220] (50-247-96-158-static.hfc.comcastbusiness.net.
 [50.247.96.158])
 by smtp.gmail.com with ESMTPSA id l63sm924689pfl.181.2019.06.12.20.30.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 20:30:00 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, rth@twiddle.net,
 gkurz@kaod.org
References: <20190602110903.3431-1-mark.cave-ayland@ilande.co.uk>
 <20190602110903.3431-11-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8be10499-df09-6f17-4556-0d75ab7edf22@linaro.org>
Date: Wed, 12 Jun 2019 20:29:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190602110903.3431-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v2 10/15] target/ppc: introduce
 GEN_VSX_HELPER_R3 macro to fpu_helper.c
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

On 6/2/19 4:08 AM, Mark Cave-Ayland wrote:
> Rather than perform the VSR register decoding within the helper itself,
> introduce a new GEN_VSX_HELPER_R3 macro which performs the decode based
> upon rD, rA and rB at translation time.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  target/ppc/fpu_helper.c             | 36 ++++++++++++------------------------
>  target/ppc/helper.h                 | 16 ++++++++--------
>  target/ppc/translate/vsx-impl.inc.c | 36 ++++++++++++++++++++++++++++--------
>  3 files changed, 48 insertions(+), 40 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

