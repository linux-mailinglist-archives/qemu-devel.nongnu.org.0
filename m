Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED804D681D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 19:13:46 +0200 (CEST)
Received: from localhost ([::1]:54178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK3uj-00088M-J9
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 13:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iK2tt-0001G2-MN
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iK2ts-0001cV-A4
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:08:49 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46577)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iK2ts-0001c0-3M
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:08:48 -0400
Received: by mail-pg1-x544.google.com with SMTP id e15so2365142pgu.13
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3+JWM5Gz13YlZX39mERjEq1vu6mXRE9D7OMu76eWgko=;
 b=KIYoLX37aXiEJuMCiZtXyIOPte3UVs3uQgEtDI1PUgYvuS6yTghmlnw3M1Fo5Tv3QO
 Cz4r1IlxuZZ3808FqQpU9LcY5zQE+V3gni2aHRmVtUx7eqeoqPUNAjWy8V6EhYcBv72x
 +ZAEH6u8cLsZXnAyw0K2cE540QvXASP7GsTOeoYXbPnwCqVX2rrb9tNF/UEMD675Wvay
 3cDcTrGYa9WfQ73BzLHEH6BEoZx3oRzIxtgPADcRV81f7FlacxIDOpzJ/LVUm9SybIKs
 7KUnzcj/L5MFHR0CujM2joY8Mtt0f5ZKvx9GNRQIziY7F6m4iGV8c+dx/P/67okV1Ftv
 gn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+JWM5Gz13YlZX39mERjEq1vu6mXRE9D7OMu76eWgko=;
 b=Hq+EOwFx7xDKqJWmi0v57qNJ63ACYZEFecNYq8z9jgqNj1Sa/l12t7Kr5Of6fEhwbD
 NvqPqJVEKpS556MyTYieaJGWAmZCflBtp55wYBUASXCXtfDFxUOgJBkgz1COxLz4TAAu
 MYbZ52DEgm3d/uPBVhM4QrpyCyxtaKyZiMroFl8wLrkSkRidtQRFV5qlul1kS2Sp6UFB
 WGTk1hpL46T3t+WipshHi+909iTN2OgFOcNoMDeHw/seARLjHGjL0Tw0HzMJ5UFWW7kI
 e8SQLKlcYAMHUgVXoqxW1MKzKlQzGQYHavMcFXXTRMv7O8Jf40rH7Cg5lVuk/UjJf/M1
 i/bA==
X-Gm-Message-State: APjAAAXgJaVzMW8KbwpOSOBa286jS+ZUOpqwiekV4/ACaTVRi1NhQ5kP
 Nqju7U14E+9O6YXjjRFUdP6aSw==
X-Google-Smtp-Source: APXvYqxfgWNvrExsABzgIkZSPc4PTP3nM3fUU4gj2Yf4cWhCLlZc/BaCDEkvJL2qUxjkbBOKy5cCsQ==
X-Received: by 2002:a17:90a:fb85:: with SMTP id
 cp5mr3074255pjb.19.1571069326129; 
 Mon, 14 Oct 2019 09:08:46 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t21sm19135444pgi.87.2019.10.14.09.08.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 09:08:45 -0700 (PDT)
Subject: Re: [PATCH v5 23/55] translator: add translator_ld{ub,sw,uw,l,q}
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191014104948.4291-1-alex.bennee@linaro.org>
 <20191014104948.4291-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cefab505-ea0b-75bd-e6f5-a5c53c4559a7@linaro.org>
Date: Mon, 14 Oct 2019 09:08:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014104948.4291-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: robert.foley@futurewei.com, peter.puhov@futurewei.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/19 3:49 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> We don't bother with replicating the fast path (tlb_hit) of the old
> cpu_ldst helpers as it has no measurable effect on performance. This
> probably indicates we should consider flattening the whole set of
> helpers but that is out of scope for this change.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> [AJB: directly plumb into softmmu/user helpers]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v4
>   - don't use the cpu_ldst helpers, plumb directly into the lower
>   level
>   - mark the CODE_ACCESS/SOFTMMU_CODE_ACCESS as deprecated
> v5
>   - expand commit message w.r.t. fast path.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


