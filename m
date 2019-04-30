Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA9EFDFD
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 18:34:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLVhm-0006xm-T3
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 12:34:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLVgb-0006XU-EE
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:32:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLVga-0006i6-Jf
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:32:53 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40750)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLVga-0006h5-Dl
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:32:52 -0400
Received: by mail-pg1-x52d.google.com with SMTP id d31so7080003pgl.7
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lkjBHBvCplHrTs4Mzz7pz5OdOckgwrFqXNbc7OsrtuY=;
	b=Gfx3vIc87jl12g2i78WDAQVOo3BBaRV+uUCveaCWJN62YLywaI42rQ6Q6iJpzvrKd2
	51HL6VSlNGgZeHLxEAe+Gn0+Es9dcIVPIBJnqiLktELjmdciL09CzOq59W4lYNH0mLn/
	Sxspc62PP/znit5RhFhVJBzEsZCGxfuaiWOigMEO20Ka6MKXddHwiRn/eNRmzfm9JqRN
	5jMcdXDdansJtA4QcLWBQom7igABkNuKrT4zsYaachBHCFD2hWGIrv3i3BgBpYaHZUDo
	+l/Y+wn4wkzvmERHugaZyqvZ423XOXCO2f41mcRbFe18hAlZT1T4BaEM9CYFwvWuwS45
	5xKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lkjBHBvCplHrTs4Mzz7pz5OdOckgwrFqXNbc7OsrtuY=;
	b=eZg5U4cL10zZKdRdJzKJJNuD3ftKewGu0o4mb5+oluxs4w3H+AK6K5Kis2rMcLWRy7
	zB+heN+J7dgMn3pZ19jnJCGeCSF3ubqeg6Rrmy7LSf/boJbtPandGcmbddDJSyxRUN4v
	gJy0KbZUBduq+79mkF4YJNb/vqKG/O/IToFkoYrtIfG4SBgmw0wbcnjfLpo8QH6TnL0T
	UOTic7z4CChGUyl5Au70b50A9712Phs95NUb+lUL9wbTBx+m6Y+nSWO/Ls6oZbJ0Tj3k
	mQzT5tp08XgdCIigPIDMauwOqaqkMGzGzFRAc07B+ImbHnh0nQ3Lj6whudON0UQg0bok
	XYOA==
X-Gm-Message-State: APjAAAWSivGkCevc4rcUiLxsDKS+nD/iP+2y8BD/QFEB2FBcDDBkNI8p
	S3TW0Pbp+kpb1p2GQYmb0G3REA==
X-Google-Smtp-Source: APXvYqxsAfdtxh2S7h9snHIwzSTD4QDmgSPNckSM4QwZ2OCppR4rWGWNOtPEjDu32xS/Q0F4ar1Tsw==
X-Received: by 2002:aa7:8c9a:: with SMTP id p26mr16305078pfd.251.1556641971178;
	Tue, 30 Apr 2019 09:32:51 -0700 (PDT)
Received: from [192.168.1.11] (97-113-18-231.tukw.qwest.net. [97.113.18.231])
	by smtp.gmail.com with ESMTPSA id
	d3sm49843621pfn.113.2019.04.30.09.32.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 09:32:50 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, rth@twiddle.net,
	gkurz@kaod.org
References: <20190428143845.11810-1-mark.cave-ayland@ilande.co.uk>
	<20190428143845.11810-4-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3df9625c-2d66-82f8-119f-61af3bfc1f86@linaro.org>
Date: Tue, 30 Apr 2019 09:32:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190428143845.11810-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52d
Subject: Re: [Qemu-devel] [PATCH 03/14] target/ppc: remove getVSR()/putVSR()
 from int_helper.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/19 7:38 AM, Mark Cave-Ayland wrote:
>  void helper_xxextractuw(CPUPPCState *env, target_ulong xtn,
>                          target_ulong xbn, uint32_t index)
>  {
> -    ppc_vsr_t xt, xb;
> +    ppc_vsr_t *xt = &env->vsr[xtn];
> +    ppc_vsr_t *xb = &env->vsr[xbn];
>      size_t es = sizeof(uint32_t);
>      uint32_t ext_index;
>      int i;
>  
> -    getVSR(xbn, &xb, env);
> -    memset(&xt, 0, sizeof(xt));
> +    memset(xt, 0, sizeof(ppc_vsr_t));

This fails if xt == xb.

Similarly for xxinsertw.


r~

