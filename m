Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC144DF1AB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 17:36:03 +0200 (CEST)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMZj0-0005c9-Rs
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 11:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMZXZ-0004d5-7V
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMZXY-0005n5-7m
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:24:13 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39552)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMZXY-0005mq-18
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:24:12 -0400
Received: by mail-pf1-x441.google.com with SMTP id v4so8632314pff.6
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7k8PiUo6WURTmb2SeAwBFRUg+bgT6tPrhxx66QwzWZ8=;
 b=jaKq2ISoDkfz2e9ZqfbFAGVdf+EEbyNkzzL7HZ/qHcc4hust/2JrgW4DSF0j87lCP1
 hPX3l9kigpO3cffhhyoEK3yH4DYiGf8UlBBJJBPy5tNs5hsXWZlgmg0VP+Dt8Ci19Kpm
 mP+x9xSDcNd2wkXWfdDbBoYQ5g/xPS4DuCrKQPYKOnLxburj24M86PwzIoi5j3rF3xhl
 N4NM6bujG7CFO4fvMi4uceCBe/XTkBMHaidvfIaTnYpLAeLNGB/IGNoUVCEeM9y+N5bH
 AltWj8n/ICj1r8KECAGHgaSjPTCGH9cKWudcP6bTFP0jsgIoANm8pvt0B5ZteYSW8ET+
 jR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7k8PiUo6WURTmb2SeAwBFRUg+bgT6tPrhxx66QwzWZ8=;
 b=I1hZ60lR7asm6O3FaCnq5pIkTM5E6m8m1ArCBpmWHCppj2AnhCXwhHg3sZh3XHSth1
 uIW7Cp5+zqVrEVKENmD0yR++y2oELYh7SOUS2gAH2fw5LVohwDwJGKT4NSd6/Ac/9SaA
 rkbnfoVn0cu4cquliGDiph9uPgTlFdubATTGZYmNL6wcnL9Za5EvwkC8/UarmYczeovJ
 +Rxkj7b+c4N49fFYHLAQds7Zl6D9MjkojD7N44ucvAuHWFSoIRCeECHc2BClGiMTcg1D
 /BUVBzNRco5C+os+1QyKgCMOr72HVONArQG/a9lNJuKjUxmkf+mPx1vAFOmVEELM5hia
 FrSw==
X-Gm-Message-State: APjAAAWomVjgf8y6vGx2iJK9fcR1G5ZHrzNITo7i+c4eHo7ZP4gNUy50
 bJQD1kMCM01nDNesBI+xCHDrsA==
X-Google-Smtp-Source: APXvYqyVlbnflOC6Ib5S8bTPly6hLWmw9RRBjkv1FxPkR2eHuok7+M1pVeCxEqWrPZ4+EOFjjbe7kQ==
X-Received: by 2002:a17:90a:8a04:: with SMTP id
 w4mr29154407pjn.135.1571671450693; 
 Mon, 21 Oct 2019 08:24:10 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id y8sm20285583pgs.34.2019.10.21.08.24.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 08:24:10 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] s390x/tcg: Fix VECTOR SUBTRACT WITH BORROW COMPUTE
 BORROW INDICATION
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20191021085715.3797-1-david@redhat.com>
 <20191021085715.3797-7-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bbe77425-250a-6d88-fc1c-76aaf694fc1b@linaro.org>
Date: Mon, 21 Oct 2019 08:24:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021085715.3797-7-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/19 1:57 AM, David Hildenbrand wrote:
> The numbers are unsigned, the computation is wrong. "Each operand is
> treated as an unsigned binary integer".
> Let's implement as given in the PoP:
> 
> "A subtraction is performed by adding the contents of the second operand
>  with the bitwise complement of the third operand along with a borrow
>  indication from the rightmost bit of the fourth operand."
> 
> Reuse gen_accc2_i64().
> 
> Fixes: bc725e65152c ("s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW COMPUTE BORROW INDICATION")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/translate_vx.inc.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



