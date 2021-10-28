Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017C43D874
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 03:15:07 +0200 (CEST)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfu0Y-0007X9-7n
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 21:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftwO-00044M-OC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:10:48 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftwM-0002mB-LG
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:10:48 -0400
Received: by mail-pl1-x629.google.com with SMTP id i5so3264010pla.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ippkNK4wYCdmdq02MwHe/okgfOfAfmPcGtUK5fGYDl0=;
 b=OQIWJV+Xg2FaM8z0kE6cLizPSvTVnp02R0ASBKZZbbTXaOsa21tJttHI+o2Sf75j5M
 HnNsVWRVQVouGr4ndzxBN43L+ftQe/AgxUE5RD1p7PdzlSO26ug2VEYgysT42b2YSv+b
 vQugOuCEblmegYL5WzsCcYQCrLhecUsdqvdfdJLyjDHjG0VCl6Dcl+rN9b+UofO3Aoun
 lKWRhWHFx59iXAlhHMvMZRcGAj6J6DWLGEDtbtq1bveN9TmObc4yY41dYCVkmmCtzCR2
 49UGMisU4uRi+J0b00JJxrZzPZaMFt4F4kKETrBj06QwahcYj5EDrHXqNZlc5KH2KVsl
 Ifsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ippkNK4wYCdmdq02MwHe/okgfOfAfmPcGtUK5fGYDl0=;
 b=pyZtIffC8emjWHizctDz4svnbtjVZT4ve1vQjo/X8H2Ioyy2Jgt5gMFiRCxW5o7n2+
 gMrZNVhzLrajhQuUIQ+WpxTgfaFuiZGXhV1HSPlMe/1tHQA5F5T2f+8nloyHYpsylK77
 OHVeuKRam7RqmoQQgK+RNeFofOGw723N72jicUZgcMwbtjwK5xfU0AC80A/KRjqQ2YxN
 nRyhI8p7BfXaSWeADkRl+NP1ko2z2EKT0LDcFbqCUJvWzZfrVQYOaUucBEuSHRRJBrJy
 s03JKOPkKYxw1RAfMbINxHc4xhm6LwjQVXaEgMSv9tWU6vmIL1RT6U5qBnei9/qn5fSe
 kH4w==
X-Gm-Message-State: AOAM533Xg3EioPkNu2JgV4HqPiChTT4QrhDMbxeqfpMDRf1Z4G+q4Xra
 DsaETyT2OTFgMExcY4z/kcTOeg==
X-Google-Smtp-Source: ABdhPJwlmDK9qkC4EuHAbYEnYvPHZAh66rvszhtxjO/i+yNGdNd+X/wUaBLjSnNMYrc9In+q/dF32Q==
X-Received: by 2002:a17:903:1111:b0:13f:d1d7:fb5c with SMTP id
 n17-20020a170903111100b0013fd1d7fb5cmr908871plh.47.1635383445231; 
 Wed, 27 Oct 2021 18:10:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u13sm835122pga.92.2021.10.27.18.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 18:10:44 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Agree to maintain nanoMIPS TCG
 frontend
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027041416.1237433-1-f4bug@amsat.org>
 <20211027041416.1237433-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed566043-b36a-54f2-519b-426365851d05@linaro.org>
Date: Wed, 27 Oct 2021 18:10:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027041416.1237433-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 9:14 PM, Philippe Mathieu-Daudé wrote:
> As of this commit, the nanoMIPS toolchains haven't been merged
> in mainstream projects. However MediaTek provides a toolchain:
> https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01
> 
> QEMU deprecation policy schedules code for removal. If we don't
> need / want to remove, we should un-deprecated [*].
> 
> Since I now have spent more time with the ISA, I agree to maintain
> it along with the other MIPS ISA. Therefore remove its deprecation
> notice.
> 
> For historical notes, see commit a60442eb8 ("Deprecate nanoMIPS ISA").
> 
> [*] https://lore.kernel.org/qemu-devel/YVx7YGqUENP83vNF@redhat.com/
> 
> Cc: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
> Cc: Petar Jovanovic <petar.jovanovic@syrmia.com>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

