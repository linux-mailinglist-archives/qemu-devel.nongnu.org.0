Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981385694FC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 00:04:45 +0200 (CEST)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9D8W-00010y-3o
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 18:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o9C9N-0006ch-Jy
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 17:01:39 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:47088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o9C9K-0003NU-IR
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 17:01:31 -0400
Received: by mail-pl1-x633.google.com with SMTP id l12so9276228plk.13
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 14:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E+DUmmWw5ML9LyVgXGJQ7TucbKYQVH7LAu5PyX0z+V8=;
 b=V0wkCwL7RzzfTE6j91n0YEBN8RpKTeZElE7lPRLWDalLjqI+iWxptaaXkApD6CZaB3
 zqmYHSFT9pDJxfv/lYzXEEqrsfZW+ac0EjvhtGlC2yPyB+XeuLzXzPxJjXosU2mn+MwD
 RwDRS9XfxLIMY7WTvozpLcRW0ps8Ozrw5Za6KBcYozrT9jU0ZvLvvzMvVPzvtNCyE+1I
 NHienC6rEU4itot4C2gjbFPoRrrCWWl2OGPpO7KuHREfJA4FNf80CJCe36OL6zwgVSF1
 +FeTuAuV3zf1czPegIvjg1julhDw3ehJ96zUGRxSLjT1x8tZNMb3cTpaMICpGMkTMoTd
 uevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E+DUmmWw5ML9LyVgXGJQ7TucbKYQVH7LAu5PyX0z+V8=;
 b=3dZW4MSxP1x9sb3q847kjmMyXB+1ikeSnxMD/jDL2D6TaCRlfci0LeS+3W+cu7a2+l
 LXDSuts/9Kn6G6o5SnU4gySVbT1HqvVp0LAVPNAuQjfKIJR+tkx0EU7YR/wM2nOztlM0
 jQ8FXgRiEBuyZ+28ek1ota+PWw+4aeB9Ez14SS05vWR4TQNzsXdc4//e7O6SRltBmjtJ
 I+iC00DGWCSG56JeIW0zBCUatxNGTBJsr9yRB8eJvj93ABTfenw4DHfUgC9kJlYCj7+L
 XFIw3q8Wq+vDLi/vt7vl5etnrk3i2y1ktsqnfYkd1OiKgu+KwX2/NWAB7jXVk/2gX7lL
 Y9Wg==
X-Gm-Message-State: AJIora+orGpTmpwIHfNsv3wyjwEONBPWysLm55cH9Km9+HejT5UxAqXO
 mgmOQy2TTQ59NsdYchE0Q7w=
X-Google-Smtp-Source: AGRyM1u5B+DrhAq7FCQJXGG9kbSmlHS7KSQc7FUA+oj5tQIOqM3nJEw5DEUA5SSAVTruTK4RfCBNUQ==
X-Received: by 2002:a17:902:bd47:b0:16a:71a4:9bfd with SMTP id
 b7-20020a170902bd4700b0016a71a49bfdmr48914489plx.109.1657141288828; 
 Wed, 06 Jul 2022 14:01:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u27-20020a62d45b000000b0050dc7628148sm25380652pfl.34.2022.07.06.14.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 14:01:28 -0700 (PDT)
Message-ID: <44297893-a43c-578a-648f-6de561546c85@amsat.org>
Date: Wed, 6 Jul 2022 23:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] tcg/tci: Remove CONFIG_DEBUG_TCG_INTERPRETER
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
References: <20220705083623.1142250-1-richard.henderson@linaro.org>
In-Reply-To: <20220705083623.1142250-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/7/22 10:36, Richard Henderson wrote:
> There is nothing in this environment variable that cannot
> be done better with -d flags.  There is nothing special
> about TCI that warrants this hack.
> 
> Moreover, it does not compile -- remove it.
> 
> Reported-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci/tcg-target.h     | 5 -----
>   tcg/tci/tcg-target.c.inc | 7 -------
>   2 files changed, 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

