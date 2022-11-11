Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5862585B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:31:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRIm-0007IX-DF; Fri, 11 Nov 2022 05:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otRIj-0007IJ-KA
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:21 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otRIh-0000GK-VK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id z14so5885296wrn.7
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3tzCq5of27kWvYBqp9SgucldvRR784nX87pVlQEN3+8=;
 b=cZatBe7lCxe4QClz4+syGNTwyPegWTlO0rFt6mAeYNVXF+L0y16g8pqyFLGT4hnppd
 jhjRsalgsEbmcu0wWWnqRb0wQookgvpjwPa/KxeImCQiLinvkd9fr6KnVmQ4Xsh0QUeX
 zJ+JmmGc6J2HbTw674e9c4VU9/X9QUdQDq+2axIX8AqdBKsjmst4czOo0zchnE3n2xmb
 4ExKL0Z8NBt3HHoihjX/bby6D5CIJ9DHwGTMnEw5Emn41wJVob+vcYQutPgtDMIxrQzH
 XsArBziza6uos0Qy1bw+4BGrSjyTuQtubv2dFiuARCVXwb6zJGWCFMJkastjIW46PGXl
 GGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3tzCq5of27kWvYBqp9SgucldvRR784nX87pVlQEN3+8=;
 b=4crgf+DDSQfIiOckn+lXm5zV8So5yxsZkXaf00FQcIH1FTbBpG9a4XnN63XXhVcU+s
 4ta6xELuLgCYZ0vRWHc1WFKMM3Jmfteki08Iowqty712Ytfw0ehr8aim6NaJk1VKmjJr
 RfKx+jxIPHMK6RnQr0rr4XcsFcrvrsvrgZFimCA8enQhMe1VYaRyYPkKqtXqGgrVbjDp
 1c0oo1qnXExTfF5SfakO0D0b9niSLcuISbTFfS3mldcksoYRdd9uoOJCCyDoC+hki+W5
 Yg+hfsc2Zp+S1CPH71CX6hdUQCf8rQAKfTTN+R7qb9BDwIjKbQHf19Ti7NiCNqohoF/6
 Wtyg==
X-Gm-Message-State: ANoB5pleeSRrCgYEfoKEVovh7+hA2bYHvUNOA8bRpqqu9twbsaGBn9Hs
 E6NIyKm2dbn18T0Ty9waZcfqlw==
X-Google-Smtp-Source: AA0mqf4ylO5lFCfTMEzjFspNcfr/Yi3R4WQbyVssAEzPT44mzc9Dbsi1zNt5NHaMbltw0YKRVlG+qw==
X-Received: by 2002:a5d:63c1:0:b0:236:7af8:9734 with SMTP id
 c1-20020a5d63c1000000b002367af89734mr845825wrw.301.1668162617204; 
 Fri, 11 Nov 2022 02:30:17 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003b4935f04a4sm2999957wmb.5.2022.11.11.02.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 02:30:16 -0800 (PST)
Message-ID: <c8d33127-5ea8-5196-09e6-2fb0362fe39c@linaro.org>
Date: Fri, 11 Nov 2022 11:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 17/19] hw/9pfs: Update synth fs driver for Windows
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-18-bin.meng@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111042225.1115931-18-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/11/22 05:22, Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> Adapt synth fs driver for Windows in preparation to running qtest
> 9p testing on Windows.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> (no changes since v1)
> 
>   hw/9pfs/9p-synth.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


