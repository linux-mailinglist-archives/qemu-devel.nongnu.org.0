Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61784F741E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 05:36:32 +0200 (CEST)
Received: from localhost ([::1]:40972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncIwh-0006O0-En
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 23:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncIv2-0005jD-Ic
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 23:34:50 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncIv0-0007fU-C3
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 23:34:47 -0400
Received: by mail-pg1-x530.google.com with SMTP id z128so3899097pgz.2
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 20:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=0iZ2sotYZOzbqSqUpyeSc7B8BnJGBEDyaVitrg3NLso=;
 b=n9WgJo8C46EpNGNnbqktqHgeD6BNGm3vqWBpScDfWviPUAjpcgTBV7QplxGFkqOJcL
 0enHIDvJEEvk+aJtJsbNmeqqNiBRmD/hX3LpU6eieqKq0qHC/y34j3yXvtvWm1gfpZrE
 x4OyvDM/G9OvExWlXzjprpLjveCkdxHThU7LXI5qKZ6+IE3Y+reTZyH3mGjzqEWRID3Q
 AwwZwrAlPP/ScIhLtPIDOpQyWfji6K97fKzwWmLNWk4Lu1AOBKXfPdWTkfH1xKMqd7VE
 Kv04cYdLFZYLEOOLBF/1oI3M1ujkhElDfyCQT6BZ3+wJ8I26vmzKf8EYXZA5VVd6aKF8
 6nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0iZ2sotYZOzbqSqUpyeSc7B8BnJGBEDyaVitrg3NLso=;
 b=rt+Tiysy1fNhVZVaFmXmi39rE4WGokvloqBdeaA5d6RJqoN9u9e3eyOQYhcujWPH68
 gPVnXNEiD3qp7kzvbUifPStEhDkpacRfYBbG6qXtifkKAI9LseWjCX5CQt3jbysccma3
 UHs/lQk7YlBN+2iy60VO07cjtHt9Gk8IUsZVGN2tcyapUDlp/tooKaHKPVhKKq4KzgJZ
 zY0GyQ1W8BLuF+JsThylXpCMuv5pdYA/DvHaLPXGJA4Urkvt1+6UfigoLlr87MEQ93ue
 9mFM9loMhDTzlAXHBcHZbvBP5DNvYV7EAqS7Kl9zYsD13WAZ3zP4Ej8QLLfHreOkbCxd
 rNPA==
X-Gm-Message-State: AOAM531ZOEYt65rtCtmAS+5fbJSJimlOvtvPEsfRltbg8+rBCpC5jMWQ
 yyIIiBE0uw9MfbV6upZSCXQYQQ==
X-Google-Smtp-Source: ABdhPJzUa0uuxd2n/djEBIewsxOzY2aC6WHVNEPw+mzVrfU0AngwSMJsxvRbTytv8uhlVW35VOqUBQ==
X-Received: by 2002:a65:5245:0:b0:39c:ce49:e97d with SMTP id
 q5-20020a655245000000b0039cce49e97dmr163588pgp.301.1649302484654; 
 Wed, 06 Apr 2022 20:34:44 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c9-20020aa78c09000000b004fdac35673bsm20372186pfd.147.2022.04.06.20.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 20:34:43 -0700 (PDT)
Message-ID: <79fa875e-0f67-5e21-c22f-9df700716575@linaro.org>
Date: Wed, 6 Apr 2022 22:34:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86: Implement Linear Address Masking support
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 qemu-devel@nongnu.org
References: <20220407010107.34734-1-kirill.shutemov@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220407010107.34734-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/6/22 20:01, Kirill A. Shutemov wrote:
> Linear Address Masking feature makes CPU ignore some bits of the virtual
> address. These bits can be used to encode metadata.
> 
> The feature is enumerated with CPUID.(EAX=07H, ECX=01H):EAX.LAM[bit 26].
> 
> CR3.LAM_U57[bit 62] allows to encode 6 bits of metadata in bits 62:57 of
> user pointers.
> 
> CR3.LAM_U48[bit 61] allows to encode 15 bits of metadata in bits 62:48
> of user pointers.
> 
> CR4.LAM_SUP[bit 28] allows to encode metadata of supervisor pointers.
> If 5-level paging is in use, 6 bits of metadata can be encoded in 62:57.
> For 4-level paging, 15 bits of metadata can be encoded in bits 62:48.
> 
> QEMU strips address from the metadata bits and gets it to canonical
> shape before handling memory access. It has to be done very early before
> TLB lookup.

The new hook is incorrect, in that it doesn't apply to addresses along the tlb fast path.

But it isn't really needed.  You can do all of the work in the existing tlb_fill hook. 
AArch64 has a similar feature, and that works fine.


r~

