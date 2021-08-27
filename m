Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683EB3F93B3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:29:15 +0200 (CEST)
Received: from localhost ([::1]:39906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTUQ-0006FC-GK
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTT5-0005ZY-Br
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:27:51 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTT3-00063F-PB
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:27:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id d26so8459857wrc.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NU8WXWzgK2XLkH5ZocDWaB6WEgaGc2rlnUwRCQuefBU=;
 b=QSrOwVoadoVkjiLPQ8Za82eC2YdaGTOdKjHQhjyZQNG+jl4dpIVD3ulim/9Xl7Zoac
 ad/IJDy1hzr2oFCWpGT4NAFmkw1dNvq/dR4FrMz7MGcr0Lwg/VIT6KABNFRp/cwWJpR3
 Iv7T8n76WGpXTUfIGwPXFLV6Z9owIMNeazuBJaEgnK3OaE+Y2T7VFSukLE4R2lfFuKoL
 yiSTTVRz5NtWB5RAb7by7Ap9YfjlnoMkKeB8mKJFcWkFu4ZKpAk2t88XjJ2PCqYfjN5n
 iqque5zPVNMHNvU1g/tbxAK4unxnGyHatX19S2Y3EDwCXbGoriVN9v6SD5PmAS3hnGwC
 do6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NU8WXWzgK2XLkH5ZocDWaB6WEgaGc2rlnUwRCQuefBU=;
 b=eeK57CRBFbXApiD5LtSk0ySAGkq/uOIxPLWaW3xKHI+xewDux38imCBpkTKd+HpZ/e
 HRspLRby2z4c6rfflbc4xH6pV4HCfqRZR/foDA/WQEmpaWVUjJMT7IHzRAG9EiG491eL
 MwbCv/TZ+KjXy83jmq1CyYsiSKqu1NJCMIALT1WUPHiI7foeSLn3HHqkH4ETtL143H5A
 J9UV5RoOh/YMdmcbUkcbD8shEMHsCvWHbBo5AGD/qMHqryh99BfapWAYiUuJaAqJngpb
 5ilvwVzkKSaCX4ZXr7PQ3q5aSgR6oXX7SetrPQp544Ap6UAxXfYZ64fZup82He2C5k1/
 BtBQ==
X-Gm-Message-State: AOAM530HiLVYDs7XdSzL6RLGES35U98YiwnuaTdwWq4QinDEPWvCVTNu
 Dts5AMCMF0Bx9cFdRWZNziQ=
X-Google-Smtp-Source: ABdhPJw7hadCkdLcxUzQ2Mx30tI+eGwbXs71tILRkhfVpeVQJyZ2rKYB0j12eYPoDLxYyvLlH87VzA==
X-Received: by 2002:a5d:638d:: with SMTP id p13mr7560287wru.223.1630038467538; 
 Thu, 26 Aug 2021 21:27:47 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n8sm5160022wra.24.2021.08.26.21.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 21:27:46 -0700 (PDT)
Subject: Re: [PATCH v2 12/43] bsd-user: remove a.out support
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-13-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2c7c5c1a-40b1-6391-6586-56057ccc6605@amsat.org>
Date: Fri, 27 Aug 2021 06:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826211201.98877-13-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> Remove still-born a.out support. The BSDs switched from a.out to ELF 20+ years
> ago. It's out of scope for bsd-user, and what little support there was would
> simply wind up at a not-implemented message. Simplify the whole mess by removing
> it entirely. Should future support be required, it would be better to start from
> scratch.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/bsdload.c |   9 +---
>  bsd-user/elfload.c | 105 ++++++++-------------------------------------
>  bsd-user/qemu.h    |   2 +-
>  3 files changed, 21 insertions(+), 95 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

