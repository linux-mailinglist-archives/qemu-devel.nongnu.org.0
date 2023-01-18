Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B7671991
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 11:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5z1-0001Vv-9L; Wed, 18 Jan 2023 05:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5yv-0001Ut-3O
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:47:49 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5yr-000248-0i
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:47:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so1107125wmb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 02:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iog5WF2G/vImaly9nWHyzB47r7oe5u859s8q/Iq03KI=;
 b=baioGDKsZeIOuXCxkxK0Ra7D23iWhGKshy/++/xIuPq2sQQ/+XxHH7eL05ZfU7dVb2
 7AqoIIoXkQ3xVsE3kvUoE5zXZ8Ks4Kmwvok/yBqZfkLipazMyBAzMpgCexZvYM0gtTyI
 aWlyRFi/c4jjCuFmyHmH4caIUKVQ0jBkmC3q7iozSvhE8X/bewUwpxGzkaiSAtznviX3
 af/RwQnW5GgyCe/1llnhJ+NJceFoTqSlA6e7vSrh9WphusQWeElXBH5C0jsGLTP/wrJD
 Kzae6rrRg9c2GCXElW1sSy2uqnMOalRNnHLCo7hnxR/u2rkqlh0ss/ooi/05HtSIPelW
 zreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iog5WF2G/vImaly9nWHyzB47r7oe5u859s8q/Iq03KI=;
 b=jBeMO7m6+ctmCM3r2W4hpTZxcDWanMWctBWlbnNKvuou2RMgvZqXWHMUSFLo/GkFEW
 dlWw+aPVMhkPeazc3pdPcEnIBe0EOqcKegBWKHGWgSSZs275T984mMmG+GJcat9F5OGD
 n9dtg71D95SiibyAPiCaeQFHCOIZCabo7gSq7ucaGfrPN2VCsCQM3MtZjrHyXpxoeqEB
 QHVt1oCBraJhAOVH+IV0w81bJCIv6y+0dBX3w9QMqZ23lD7ge2piXb4Is6qcCRS7gXxk
 TPWj9wWr54TJFokXEK9rxNzEB3vwYxi5ttAdUgzheUF8BqbEnUXtzAtA1Cd4V+iAbT2N
 m5vg==
X-Gm-Message-State: AFqh2kpsx7DmxkyfNcP4VUK76WV3u2BWzwFQBKjMge8o1rEYKveRgL5a
 oFvNXRJSEYUM8Fk252llmh5UsQ==
X-Google-Smtp-Source: AMrXdXvFTNuzmkgTU4C300XWj40ncWfv5L7TaSZMhcJPVM9Yn3eurxfVrkPwO6s8SjgTq+Xk0eEQsQ==
X-Received: by 2002:a05:600c:4e08:b0:3db:1a41:663a with SMTP id
 b8-20020a05600c4e0800b003db1a41663amr197239wmq.20.1674038861899; 
 Wed, 18 Jan 2023 02:47:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003cf71b1f66csm1725100wmb.0.2023.01.18.02.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 02:47:41 -0800 (PST)
Message-ID: <29287d50-7bff-2610-afab-b7ea96e427fb@linaro.org>
Date: Wed, 18 Jan 2023 11:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 00/28] target/arm: Allow CONFIG_TCG=n builds
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/1/23 15:03, Fabiano Rosas wrote:
> This series makes the necessary changes to allow the use of
> --disable-tcg for arm.
> 
> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
> 
> branch here: https://github.com/farosas/qemu/tree/arm-disable-tcg
> 
> Since v2:
> 
> patch 5: removed extraneous include statements
> patch 6: removed extraneous tcg_enabled
> patch 7: dropped in favor of "target/arm: Introduce aarch64_set_svcr"
> patch 12: removed inline
> patch 13-15: dropped, not needed due to Kconfig changes
> 
> new:
> 
> - cpregs.h changes I had forgotten to include in v2
> - moved CPUs initialization into tcg/
> - skipped tests that require TCG
> - fixed the migration tests for aarch64
> - Kconfig changes, left only the 'virt' machine set by default with KVM

For v4, consider splitting it in two parts, first reviewed patches that
Peter can queue directly, and second part requiring more review.

