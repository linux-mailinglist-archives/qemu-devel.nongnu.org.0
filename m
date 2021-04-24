Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507F036A285
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:18:35 +0200 (CEST)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMrS-00039T-CN
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMn7-0001th-K9
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:14:06 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMn5-0001Tw-1S
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:14:05 -0400
Received: by mail-pg1-x532.google.com with SMTP id d10so37362680pgf.12
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kuqTPOnSRNdnXV/Sw+p8yxApKr1/+7eQE+sDGi5jdyQ=;
 b=juw74jurrt8yGZIXQdVwgPzkwbeK3dru5WGfnLP8BRjQie2caRrZl/sLCt7115ESmE
 jZ1PZjPdLxYAzK1XbWIoiKckIa8Zj0W1t+Du5YHXPyopx0wVrPtfmmNxrhz5pjTGLLsH
 XU65eVIrUBLOWuSG18GNm+p/2skwer1GXgwfVIQAB8OVQztyJ7tJUHYF2yrnE10fB3Wx
 mDk3azTIwU0bapxuQUU0QX43zXy5pwArfeuM98yBzkdr29EabXZOuLq7KJllOTibz1SF
 bwyrvk53M4z0z17I0KOL6yIaHFtlFhuGjeEYrOrosFhF4hX5Db47P5dL2i8hCuZWKbmM
 RsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kuqTPOnSRNdnXV/Sw+p8yxApKr1/+7eQE+sDGi5jdyQ=;
 b=qnib+NUQq/EMoSOUGii6QwnLoOwmYDr6vK3+Fr1n13wDE0GqelweTIUUU6qwCwWi8T
 bkpb1mSX8V4ZM08DHoT4TQE+2hW0etNYxsCnFqoKTTH38SneGliMMUDXIM2DZXvI8fQr
 YejHlyuIKvgfYuHtTAPqgVPksAqTra0XsEJfp5fJTl3LWc9K0P1/HcYgEqDX+EbYMuqj
 nIVZ0wazRMdrD3mZKOSnTdFrtPrLwbVnAobbTNW0c//tcLo8Kt0ShkKFcE/ahbhU5Oid
 215RWhA7Vw8FS4TCoae8IQu/WN0BXkcafXizwJRO9mx2onQMf/oTtQazxE2fEcoCElDm
 u2Ww==
X-Gm-Message-State: AOAM531XBiMzEKmm7FkARGIgIE7xzW2LG88wm2tCSaKV2pchy5Z5ui4I
 zOrGKr1uE7UGRwMy/qPHY2WuqQ==
X-Google-Smtp-Source: ABdhPJyZ+yCP4A/HpWUBNYsGhNDpCD1JzGfMdnGYO4Lqm59pksRhunh15nCr5bhAyWgAWsAgzSFyTg==
X-Received: by 2002:a63:ee54:: with SMTP id n20mr9700568pgk.415.1619288041494; 
 Sat, 24 Apr 2021 11:14:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id c21sm7279331pfc.165.2021.04.24.11.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:14:01 -0700 (PDT)
Subject: Re: [PATCH v2 36/48] bsd-user: style tweak: Use preferred block
 comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-37-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <012fb09d-b9f9-23ff-708c-8481a0cf7d83@linaro.org>
Date: Sat, 24 Apr 2021 11:13:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-37-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/uaccess.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


