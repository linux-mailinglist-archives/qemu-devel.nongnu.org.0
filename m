Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B903869DC9C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:12:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOhK-0002dO-Ul; Tue, 21 Feb 2023 04:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUOhI-0002cz-7O
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:12:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUOhG-0007cU-Dr
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:12:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id p8so3720391wrt.12
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R1lJZhJgpjsmzCZYs0F+9mTdkIJglnumCGzCEgh6HWY=;
 b=UOdn9/C4fXdBKZO4v4fU/MuB1AkDVPE+NGXWbDdNmjl7Mp84A9f5v6vWjvEsk+Ui9W
 D9tDMDVH5YWFQNqPdknU3muUuXTNV/CEvib0tTaoCbspaUpciy35AlAjEJ6Ix1mgI6Zs
 s6n9H+GmdjDG1mr5sAqIftJgHcjMiodDET5K4nfZ8x7DnWEXmzj0H7Qm4zpasaAJ8D/b
 x7swkFzKG2Q4HkFe09zEP3D21CpWPUHF37SGOfKjdbY29pqt+wP8qS/vywklakGj5RXx
 YFTMcRfNaueyE9YogB4cREBjpAApvVGRfen92ki7CISyv09b7N24pGvF42v1XHyoLLfo
 RWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R1lJZhJgpjsmzCZYs0F+9mTdkIJglnumCGzCEgh6HWY=;
 b=Ci+o/sTqIPQXB9Sm4fJ/tL9TvA8Z6LWU2cuvU6b/eiW1AXmcP7JI0E+VFhmda00j47
 7RNHpV9zucYYNqZQZCpDjH1AUO6BvH4Nxo0kBhtBDKZ26TThXGLTq0ltqU42UNn9sLlE
 1XZBIQTcKzMvIxUvuvP+q2j5Jw5EC5u2+qsr8x3KyIgD5DIAnNatC74/tUzbHC0pgbS/
 P3ndh6HP6WpJGqO9oP0bdtJVWFDD4EqWC8CTnRO+orgLFqyEeBAoNAzd9CFG9FCJtnKc
 Hgci8QqbaBKRtJxmcwkGPR4K/Of2pKOgxmHhkaOd8yNcl1f8aRnieeRRsRiRk/D3j9YB
 ydBQ==
X-Gm-Message-State: AO0yUKVFsKCPC7EQUsRxqUpOYSZBO4y8vDhJ5r51cYN+eiN3Q16TBkq/
 f0jubKLP5ljg8tm8bCkijNF7rA==
X-Google-Smtp-Source: AK7set+udaF2tUkdPMwQ2J+o8E3JlbCYsCTiddgsZ2AXBI2NhdpqbaHp8sVHo+EGKEe3xs2JG+0sNg==
X-Received: by 2002:adf:f94d:0:b0:2c5:4c7c:6aad with SMTP id
 q13-20020adff94d000000b002c54c7c6aadmr3355956wrr.8.1676970744670; 
 Tue, 21 Feb 2023 01:12:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l2-20020a7bc442000000b003e1f319b87bsm2843693wmi.24.2023.02.21.01.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 01:12:24 -0800 (PST)
Message-ID: <55d9c0a9-4d3e-52bf-3c2e-73b9a830ea4b@linaro.org>
Date: Tue, 21 Feb 2023 10:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 8/9] simpletrace: define exception and add handling
Content-Language: en-US
To: Mads Ynddal <mads@ynddal.dk>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
References: <20230221090104.86103-1-mads@ynddal.dk>
 <20230221090104.86103-9-mads@ynddal.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221090104.86103-9-mads@ynddal.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 21/2/23 10:01, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
> 
> Define `SimpleException` to differentiate our exceptions from generic
> exceptions (IOError, etc.). Adapted simpletrace to support this and
> output to stderr.
> 
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>   scripts/simpletrace.py | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


