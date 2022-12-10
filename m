Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF2648EB9
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 13:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3zGR-0001Sn-IB; Sat, 10 Dec 2022 07:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3zGP-0001SX-9P
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 07:47:33 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3zGN-0003iO-Qe
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 07:47:33 -0500
Received: by mail-wr1-x429.google.com with SMTP id d1so7730397wrs.12
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 04:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vrYYWEs0K56NmuYC57hBme/Q8cby+FYsvXefKeD0eNc=;
 b=VGWShGNAIRKpdaJQy8IGJA4KEfmiyRwFWGG8ebCUZZA7LclbwYqkMMZr0ACnZtMQfo
 XiNHD5oHUI4SqYu5S2dDdji0YxaEfQIa4gZ4+SJkm8WHyHLf+oN1R8QpxX6dNlesle7T
 PiVfCdTQ7AomAoff3+KtL6vbmL/LkHB3wyRUYmyDGsgn0nnBIQar7Vf9VSBX48LRJDk3
 ELWmyyQJMt++jOVkHsI43yAzQxk2g9Xi8ClXwyG8a0GPulIDBRR6tH3EmXBiAYBnQ0rH
 f30VcmlTk6kE+FKDNtWPfriwDWNmgbmmMMFnGJz+FqHdV7ua17su83/WY7A1pNMtQ1oB
 rRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vrYYWEs0K56NmuYC57hBme/Q8cby+FYsvXefKeD0eNc=;
 b=Y9o/CdJ2uBIBLIk7OqGV705j9saqTeNJYfqNm8uzw0BNeyDjtSgrnEWQmG0j1CHvFo
 ieJH5YDXLKmkQSbafMqE+Y/mxTxPU4XxoPyZWCvcLkfktvxY2Bagocio7SQ5Ju93YnZZ
 srXEc233SLQZ6+TxQC+O2018dz9FAnd8bFb9joRF29s15tBqT4eGkgyTv3grpMByiQsZ
 mAyv3VTrCXK+KS+OHXqvPZlKNsNTCqAGoSOeYVJTxbXuUHQ4Op9gjutGhMSWoRRCCozX
 Jq3otFlL5hEUpUDPFwPs3F1iKZFs3XEMstNP02Eet//hELFXYTm64a1A/OLzubOXYloB
 f8zw==
X-Gm-Message-State: ANoB5pnbQ5M/RRXyAGBRkxBKygmDKL6AMaqDdkr3YlZv4f/40wS6Pc6E
 CrbLl68PeC8eQOrGTDZwF8VMHg==
X-Google-Smtp-Source: AA0mqf7/gUip20Ml2BS0vcJS4OkT0eUA+w60lptit07J3qopFBh1i2x1ct52pBVCwUSxC7X6d8A98w==
X-Received: by 2002:adf:df05:0:b0:242:1ef2:cef3 with SMTP id
 y5-20020adfdf05000000b002421ef2cef3mr5922510wrl.12.1670676449575; 
 Sat, 10 Dec 2022 04:47:29 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n11-20020adff08b000000b0023662d97130sm3872779wro.20.2022.12.10.04.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Dec 2022 04:47:28 -0800 (PST)
Message-ID: <3331ac39-4452-8a24-3276-15f27060316c@linaro.org>
Date: Sat, 10 Dec 2022 13:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/4] include/hw/ppc include/hw/pci-host: Drop extra
 typedefs
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: clg@kaod.org, qemu-ppc@nongnu.org
References: <20221210112140.4057731-1-armbru@redhat.com>
 <20221210112140.4057731-5-armbru@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221210112140.4057731-5-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/12/22 12:21, Markus Armbruster wrote:
> PnvChip is typedef'ed in five places, and PnvPhb4PecState in two.
> Keep one, drop the others.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/pci-host/pnv_phb.h          | 1 -
>   include/hw/pci-host/pnv_phb3.h | 1 -
>   include/hw/pci-host/pnv_phb4.h | 2 --
>   include/hw/ppc/pnv_core.h      | 3 +--
>   include/hw/ppc/pnv_homer.h     | 2 +-
>   include/hw/ppc/pnv_lpc.h       | 8 ++------
>   include/hw/ppc/pnv_xive.h      | 7 +++----
>   7 files changed, 7 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


