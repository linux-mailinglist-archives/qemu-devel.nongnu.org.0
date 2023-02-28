Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4836A58C0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:00:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyeV-0000SA-M7; Tue, 28 Feb 2023 07:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyeS-0000RW-Tf
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:00:13 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyeQ-0001qk-If
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:00:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id j2so9431506wrh.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f2tlH52WgVkP+yDnzx0qQIh/BKfDqkHSQjojXc809dk=;
 b=C3PPrETWuI/3AVBWzzVSeoEaDjNhYgdyoq2siNsCrmlNItnpib2EfiLLWAH6MTHpNy
 m3LlZ1wZmzLomlg3YV+D2W/5tB/G1QLRW0XlsfLG+4J8AourVJ3YCElHtkKi+QOoqITj
 gBp6E47iK5RGQ2feCxrOA4o5BQm89zq5cZsDQHnACA/L41NAnkwDZ0+ODSg8KGokLOE0
 VD+LvgtH5xjVdbpup34st4u979JMk6rttBHjdLjI08SF16nv4mLkdKeDbdzphQ8OdW6y
 vYQXozNmEuorRw/Mx/gAXFnl8vzLmPBhllwOsU8h2AdGQZQVOr9/p54I6IfquNBFHoae
 5oZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f2tlH52WgVkP+yDnzx0qQIh/BKfDqkHSQjojXc809dk=;
 b=1UwxCe/RakDIGyea+TguMCgSApLzPOHqaoD4HpPnTfhtB08feiCwpoUcVZpk9RsLJu
 Fq7XyOgoVlLoeGAoWmRNk0RLNfJ8/xuntu7d2APcFo7ekcEIpQNZ9KizFfmPxgW+KSAt
 qdO/lZsb8LGzMPe8jUW1FjxVgzaGxogl1xcuUkt0elZ5GPWuO6FLsnFdGtVn8KWNWyLq
 QzACdLMB77Ha0NONm1llfQT2zxXk9phEt8usWeYnqv0eUpqnY130j//Z1EwmBUofWBCN
 AYF2kxf4d+U7SkeDE85O8xYqdaIjI2/I6mw059OJfbspQB+72QFhm+Rq119e3NHEDpXY
 8IdA==
X-Gm-Message-State: AO0yUKW1LK2lLGaCXxRVsgMfv41BnMoxkE7743Y4FvKbhmk/b5PmDFT5
 hblNtHrqcKWafFNgsrpL2lNFNQ==
X-Google-Smtp-Source: AK7set+k9ud+EfRmHX1Z5Zw5V2mt3n1nEWhIv3e/afap7Wd+ilSWcNzFgeBer+285gWP5A0Yrb+P/Q==
X-Received: by 2002:adf:e790:0:b0:2c8:c440:cb05 with SMTP id
 n16-20020adfe790000000b002c8c440cb05mr1693729wrm.55.1677585607797; 
 Tue, 28 Feb 2023 04:00:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k11-20020a5d524b000000b002c573a6216fsm9364862wrc.37.2023.02.28.04.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 04:00:07 -0800 (PST)
Message-ID: <125689c6-a156-8df5-a47a-3f6c44449c9c@linaro.org>
Date: Tue, 28 Feb 2023 13:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] MAINTAINERS: Add Fan Ni as Compute eXpress Link QEMU
 reviewer
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fan Ni <fan.ni@samsung.com>
Cc: linux-cxl@vger.kernel.org, linuxarm@huawei.com
References: <20230228113926.11485-1-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228113926.11485-1-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 28/2/23 12:39, Jonathan Cameron via wrote:
> Fan Ni has offered to help out with QEMU CXL emulation reviewing.
> Add him as a designated reviewer.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> --
> Thanks to Fan for stepping up after I requested help following Ben
> stepping down as co-maintainer. Fan base been active in testing
> and review recently so great to have Fan on board.
> 
> Based on patch [PATCH] MAINTAINERS: Remove CXL maintainer Ben Widawsky
> 
> Based-of: Message-id: 20230220212437.1462314-1-armbru@redhat.com
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


