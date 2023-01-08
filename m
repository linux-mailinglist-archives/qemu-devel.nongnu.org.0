Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184BA6618EF
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 20:55:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEbkk-0001tR-JT; Sun, 08 Jan 2023 14:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEbki-0001sx-6I
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:54:44 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEbkd-0004qh-0V
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:54:43 -0500
Received: by mail-wr1-x42e.google.com with SMTP id az7so6227531wrb.5
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 11:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CParpKtz2zG3EtqKHObV6LoiKRwxhz04e5rq7idVjEM=;
 b=H57Nk9948Pgq9XryE51nweNsYM1IIfkP91pK9IRvA+JZDEEb+47WMA740vMCIU4gE7
 MVSoP1lCAfXMZtYZTfN4J+Ea1olEbFZUgAqvZdUwpPMksFwOxFbkAXBPDpA7czGOkBAc
 ytFnlDtf5BXccM/WJ+tDotn59yk3jLd8S8ba64bD6ywXhQ7rSfNFsGTQjW8PwLz8kku1
 FQvlQJboW+T8cG2a3X/e4NIYQ3vdgKTR7lWBBV+qW9eleSb9pLIRBTrJfD7+wYxR575m
 FHRXKHdJd8C+yWFTsF62ZtAGxHJqwVPG+IA/HWkf4YA4+1WZDOhXRaVRYEZYG2mu5tEK
 uFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CParpKtz2zG3EtqKHObV6LoiKRwxhz04e5rq7idVjEM=;
 b=fYHTtcy4gDvla9L1cANoFRaa90gH/WGGkTAuYRIT8+s80c264p7peod8H3dNh8CL/x
 3z+9tBB4xZQ0k2eNgicx2A+RAIbIn+RlEevb5n4rKJPSjYrG9NNFMuBowbQe52bsKD+P
 v4qaIvclCXBpouuzm4oexvQe3Yzv7G3fwWKXRu7yyjS/WiyUd5oI7cEjaKPh6h1sDftd
 paRU5KMs1tQZuCdPljp+/HV/ge05ehPRiM2rFE33ou88MUj3SHy3jY7GyyctEutxw2c+
 vXXd6ZqWB5y/yL4/GwL81KflMU9hBkd/4hEQvXAlLjEbCae8tSAdBicMcLBurJGmlYAh
 ctNw==
X-Gm-Message-State: AFqh2krLMC4cLgLyo8Vr1iurGkG1pku2L6yvpICZdHojqeO1fAZGCkQ3
 zKusqjiiat/DpOY8ElF0rvkgLw==
X-Google-Smtp-Source: AMrXdXvsg7nKpN+gHsU0jpd2KkmXCaA/HWS3cxse76i6paBSoQ7/KVEK2n0QrduPOLInuhDtT6eDKQ==
X-Received: by 2002:adf:dd88:0:b0:242:ac4:4a0c with SMTP id
 x8-20020adfdd88000000b002420ac44a0cmr47213510wrl.32.1673207677138; 
 Sun, 08 Jan 2023 11:54:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm6866748wrm.6.2023.01.08.11.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 11:54:36 -0800 (PST)
Message-ID: <69690aa0-9a6f-a189-5a21-bc2e5a8203ca@linaro.org>
Date: Sun, 8 Jan 2023 20:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] util/qht: add missing atomic_set(hashes[i])
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230108163905.59601-1-cota@braap.org>
 <20230108163905.59601-3-cota@braap.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108163905.59601-3-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 8/1/23 17:39, Emilio Cota wrote:
> We forgot to add this one in "a890643958 util/qht: atomically set b->hashes".
> 
> Detected with tsan.
> 
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>   util/qht.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


