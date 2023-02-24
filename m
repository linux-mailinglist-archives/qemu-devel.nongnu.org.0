Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D26A17BF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:10:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVT9g-0000O8-R6; Fri, 24 Feb 2023 03:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVT9e-0000Na-Pp
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:10:10 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVT9b-0005Tz-Pd
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:10:10 -0500
Received: by mail-wr1-x432.google.com with SMTP id r7so12858842wrz.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p2q64GqGv093taHNS42iTUsShqPQIBpegQhJbe3yYmE=;
 b=esG5KOs2xM6lr40UYGzmP7bGRdDeGiuuQTyWLYsAM8ZdYStz3MItsRPtocUuqjSk0q
 Oc4qzW937XnzFSANjKypwNDFNPBh/I/ld5OZ9YNgDsFQYM8UtKvUYwtaTlzicJhBBPDv
 /ShF+Kg7wjGFA4qgFVIqbw/MZ28MYD9fgnJJT/fV29Hm8ijusH5v7/7HrxYrCxVGuTyB
 VA/8Qtq4j6qYyYfHxqboEeX7eEBLpQGE76CDq3OnmnsKINdQ8JEsV/SeT3cCQsKXq4kW
 nDd9PXVrJ0pxaQPz2K/oRQAx6EQPtp/IELQqveBJ1zZrMox57AXDOgU2A2jU2Q0ZNMTu
 igGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p2q64GqGv093taHNS42iTUsShqPQIBpegQhJbe3yYmE=;
 b=GNn7TG2jJGbmTVTs3+3a+i0eALTtCTuY77Hc8+u5JrOLy0Lm08brYviuYYoSwkNvUw
 CubL0PBEqPLpAbESiHuzeTDY+7PWwMeSPdiXrK4Ohhej3nDojgachlJMPSxOwF4OpCbj
 T01Iw+IgC5l9eR5LH8QLz4ppv0odFnQlBjjMGtuKKS/Me0F0nr/CO9a9wJku8QR4sUXw
 NwLebnAuV/sfJ8/T5ez/1F8BaasGhGqi+uYRWr8+/GVOxpGdg/utdfX1HTQb3lyBxCMG
 NU+v9rjw0hP+OVZwJiD/paudWZpuqHR1kRUw89o+Z+7BMTGlBJrgsJ9B9Go2HTVozwY+
 v1Fw==
X-Gm-Message-State: AO0yUKXGGBpCervS0IuXpZKoXbiPaM2hwQh5rcnNghZfZnyJytmp1x7V
 pocvDQ2h4xy0ML2V8BqkMW4NCw==
X-Google-Smtp-Source: AK7set9F0pxw3nZViVD9tRMpncruzMtaYzs7PWAigiXbEbOdpQJMM+aACjEq3cJE5JIv9XNwogXWJQ==
X-Received: by 2002:adf:ef8e:0:b0:2c7:fc3:5f36 with SMTP id
 d14-20020adfef8e000000b002c70fc35f36mr4461041wro.45.1677226205665; 
 Fri, 24 Feb 2023 00:10:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h11-20020adff18b000000b002c567b58e9asm14369089wro.56.2023.02.24.00.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:10:05 -0800 (PST)
Message-ID: <a47f1b0b-c583-b76f-a141-d84593a4a0a5@linaro.org>
Date: Fri, 24 Feb 2023 09:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/28] tcg: Remove branch-to-next regardless of
 reference count
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230222232715.15034-1-richard.henderson@linaro.org>
 <20230222232715.15034-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222232715.15034-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/2/23 00:26, Richard Henderson wrote:
> Just because the label reference count is more than 1 does
> not mean we cannot remove a branch-to-next.  By doing this
> first, the label reference count may drop to 0, and then
> the label itself gets removed as before.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c | 33 +++++++++++++++++----------------
>   1 file changed, 17 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


