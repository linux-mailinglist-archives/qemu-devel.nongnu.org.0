Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE84D3B53
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 21:46:04 +0100 (CET)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS3C6-00071t-If
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 15:46:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nS3Ax-0006It-Hh
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 15:44:51 -0500
Received: from [2607:f8b0:4864:20::42e] (port=35626
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nS3Aw-00023K-2c
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 15:44:51 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a5so3316753pfv.2
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 12:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VCAoBU6FNDD3K34Biaobh1zuWMS0iIRjbQ6cPY2fO34=;
 b=S9DAz7A4QNSAKHWo2njMlNFzQOH5+oa78R3d/9Ld5uADcxsS902zhDtAktQpp1d+ai
 y9evcwaviK/xpT0Zkw/fvvdQIYtkXhjqoEWtwGnZ3efUsPA3WYRQaiNlcaptgpC5CPOh
 Rwaorm14jwlNchh/9XDj0QLr+VBJf8SLCPoIKz9ixdZUFo382ynCAxIS6Bl5rmjiGCc8
 1L2UfcBbETBdYV1ASpQUkPmswjhqRSJt1LceDAnPVDN+iJp56lg62EMQuMKWCUIBzy5M
 m8ZNVG9xKUW2bt54RrW0hPHO2LxuQlu4jEdW9YezSYJKGgMoiCi00xT7NYXO7jnFxA0E
 VQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VCAoBU6FNDD3K34Biaobh1zuWMS0iIRjbQ6cPY2fO34=;
 b=kZggZuGDC3PfDnD2wReq3RO4cdZ7TCYD4cYnH4NImXC4K6lByab1f1i5+raJMWzcDe
 jU5oAMshnAuFhNL6hglyLtLiCJsqViiJt1WixBv4NVKTXMUX2ngkkF4NV2mU4R75Sx3o
 RIREG1D5/pdlvi4toW0FB2yQL3Gpy4HGWnZAmyJnIEtFGUI92To9IzdSq+wOl+dUK7vQ
 LCBQ7wWJ+g4YlqKr9QC03VfcZ9Z0e5Jm2wE3HZPQ9mlMKCCYcWIK6OLfpX5aP6m068TX
 8i194/a1+42NRYCVTCjv3k1vUzAW6HPKTiSoXxmxw17wU4KAr/OgfKt6eFG+vZtEJ2pJ
 K6OQ==
X-Gm-Message-State: AOAM533VUOlMteDNgtzaGWe9It4ATqMQGy83zx47biNRMEIdEG7gYseT
 KoYvmlbrKevNIIPPsohvPAx5pQ==
X-Google-Smtp-Source: ABdhPJxwTZToMiNky2CYUpD0lIw4d4H+tjWalMjaf5q021zg6ZTg3b+FaX76FXjTHprJLHDvsYjEUw==
X-Received: by 2002:a65:4c06:0:b0:373:a7d1:75d5 with SMTP id
 u6-20020a654c06000000b00373a7d175d5mr1238414pgq.502.1646858688067; 
 Wed, 09 Mar 2022 12:44:48 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p186-20020a62d0c3000000b004f6fa49c4b9sm3770127pfg.218.2022.03.09.12.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:44:47 -0800 (PST)
Message-ID: <094d3a71-e7e5-e97f-a525-6e7a20880254@linaro.org>
Date: Wed, 9 Mar 2022 10:44:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220309112248.4083619-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220309112248.4083619-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/22 01:22, Alex Bennée wrote:
> With -cpu max we get a warning:
> 
>    qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
> 
> But dropping the -cpu max and it still runs fine.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Thomas Huth<thuth@redhat.com>
> ---
>   tests/tcg/s390x/Makefile.target | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

