Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25B61DC45
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 17:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMQu-0003De-UZ; Sat, 05 Nov 2022 12:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMQh-0003C9-FM
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:53:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMQc-0004G4-K9
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:53:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id w14so10826860wru.8
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v8SQF5Wl6eAwhSQtss5w1Jlr+jYQZdEuizv/UAXQ9lQ=;
 b=RBGxF1SGzyHyqyRyYJcq3K8yQUIrquCH/+STL4ssmen14E45zBWYCD8AruCsIb0dZu
 nEGubGFI8bNZ41eCieHYTB9IP2xhsL2/GoRhslm+1A2N0cX6cQF0Ak5R202CbTqshlFu
 NTGiUGgaVm2dHa0l+lxH7eDtbpQ4BqieavJcbd9J744YoBuWOIbLVg4gVcOfSoewHxq5
 1/vSgiBylIJE/F5JTk5tuX1AaNHlIikWHagMDTMQDe+C4Jtb1mmAWwJXazhUOjy66mRm
 Fs2mCBk1H/zhj96IY8Gsvuyn3/FFLMVG3h3nRCkMe5cHMtlieBpHsDX85OUF5D8X7qh5
 qOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v8SQF5Wl6eAwhSQtss5w1Jlr+jYQZdEuizv/UAXQ9lQ=;
 b=wKOTeADtvC/DZOzv/G8izH/YJpll4NzhH+eWht0sNH+llKt42LKFhgDYIG7P+kS1Vk
 XUbODIhicG1oxt5hNNgKyDekeN//cQQCy7KUSjm7vzVJVlGDLpEXW26oEeyM0lz3W0WZ
 tnkPVgWGpvAOjOSQSnPbwnziw7px0tzHhpsueSh9fhE7/QzRu7Okj76oogGR1bjvy89z
 /YWHGafEQgOFZKdKlGnn/68ajCXLKm1Zr99ea22w3XiPckzSrGgGGUMUt19oEhc49XTa
 zWrdUODjX2VQALvLuDHS07leaEgZvu3HsnQcRGgLSbG1NxGtTVx/6Su5j3CDwvp4Z3xq
 WRjQ==
X-Gm-Message-State: ACrzQf37kHCkqfyYqmfI4KBGKCtp54MmfrFbfyNctBIoPIGZxEygmdb8
 5P+nwzrDXlPXCuZGUcct4ubK0SaM5z6P8w==
X-Google-Smtp-Source: AMsMyM4lwQTqEu8JelInj53aiQAm6mDbv/J1gKJ5Qg0uRXAcdByIuIomXD6V8Qx8HJaoD/Tj3/V1/A==
X-Received: by 2002:a5d:69c2:0:b0:236:86fc:4400 with SMTP id
 s2-20020a5d69c2000000b0023686fc4400mr25938661wrw.69.1667667230900; 
 Sat, 05 Nov 2022 09:53:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a5d6651000000b002362f6fcaf5sm2559811wrw.48.2022.11.05.09.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 09:53:50 -0700 (PDT)
Message-ID: <6401597e-eff1-5369-e137-02c7064ad5e5@linaro.org>
Date: Sat, 5 Nov 2022 17:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/qtest/libqos/e1000e: Use IVAR shift definitions
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221105053010.38037-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221105053010.38037-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/22 06:30, Akihiko Odaki wrote:
> There were still some constants defined in e1000_regs.h.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/libqos/e1000e.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


