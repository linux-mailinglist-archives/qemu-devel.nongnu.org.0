Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F044E79
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 23:29:48 +0200 (CEST)
Received: from localhost ([::1]:45712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbXI3-0004EQ-P1
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 17:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48953)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXFo-0002IP-Lq
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXFn-00087e-Jq
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:28 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXFn-00087C-Ed
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:27 -0400
Received: by mail-pf1-x443.google.com with SMTP id c85so66486pfc.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=InjAVFYXBl3GO/57PaoNQaNvJqjPduaNKa2tmuWIaII=;
 b=r5KC9PQ385E1UtOo0TV+RRYz6oEx6HYnDQ51A5aspG8VWYmW+H4J/1pboXvR+Zx99+
 iunLqowxyd7HF/D5sKqLyPZjuIM0ZRaXFBX96v6yrNdECli9WskMBl9WoashxxaD9l92
 oAjSe4JGlVsobFqkYxH4m59sbLOQHKaZFTV2kZyfZw8YM05ci5Bv00xUjGJpSCq5Q/SU
 j8kNf9cuDlqntgmhXOcQHkw4ycRFQzzhEaloEEhXQn1wucZrD3/2eq/izbz2gZit9xo5
 pu2BDVZ9wLQgMkMyGNwoW0L9EBhZGEyICnK46cX0eAxoCVxUlsYRIuYgEj9WjWn/W84+
 Xxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=InjAVFYXBl3GO/57PaoNQaNvJqjPduaNKa2tmuWIaII=;
 b=Cywn9voHdxpvRpWvSNHViq51hl+zp3NTK4r0D0bFl4V42P1XsfzJCLvEmW6u9dRvCN
 iRnJOLNT650neCq1DCvDPgxyelLcBO9Vdp9NxI6qU0+lT2jCxvFRQkj2wBSnbRFdfySE
 c+lzWcKZYRUKPc4Vao4z7fDF+kOS+i/XETZixBPaIQ2eJaA7842HKrQtivOarBm49PWE
 TOhXw2XTcsfUY9UIW0jp0UWtCU7nknQgmL3qb5ibGk3fO0/7knB65kwOSe5uPFSU8/9D
 jTC+HYoBB/8+s44Vhy6LKOpVShHlIKOwhnBovLkt4GNxVgRcMtB73jtam+aAMZ3qOA0u
 aMOA==
X-Gm-Message-State: APjAAAUVO8hcWDh9D248+YfMg69PoWNjUfALvRzg9fxNd9pWst4zyOld
 563uQRmq7gJjEus3P4tfTjazMNmUqRY=
X-Google-Smtp-Source: APXvYqy6rRlVsCyoSi01tEA7GBxt9iULr5mGDYijO8mvivuGo3kQibUFsFr8Z/rTy/hdvdDoODbP/Q==
X-Received: by 2002:a63:441c:: with SMTP id r28mr32540324pga.255.1560461246117; 
 Thu, 13 Jun 2019 14:27:26 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id 27sm804454pgl.82.2019.06.13.14.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:27:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <409b6e38-eea8-5ae9-aba9-0780ba3bd053@linaro.org>
Date: Thu, 13 Jun 2019 14:27:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 06/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VCVT[ANPM][US]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Stop using cpu_F0s for the NEON_2RM_VCVT[ANPM][US] ops.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


