Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D1617B61
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:11:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqY7f-0003nK-Nh; Thu, 03 Nov 2022 07:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqY6T-0002tu-TD
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:09:51 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqY6S-0002GL-CA
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:09:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id j15so2246433wrq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 04:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7anERXc48CNXuudpDCognfHeywEJdwRgR/Ch39k9+Es=;
 b=dKAscfuIrOKPjYf+hbV+pG0Xh6+dBpwR96R3dNRaHCvEQbKgDYjM+JdM7nr/9VIXwF
 jEoNDwV18q3DFEXhn711PUC7aTiEkl7praXd4AabVseS3ocK21vdT/p2oGDx8jQGZa8l
 KWJUS9Crf8Y+R+tBNFDfSkRB5dQ+Sfx5UQhwvWawpJvMSG/kF0Th8rOFJL9DGzXNnSy2
 8XgqLE3OvXEB5GfqHMxbaqZgXVrFEJIZGvuaS+VvLx05Vc0K8GP9O46pgqkfx4YtGfmJ
 enM+y6ktfLA7mbpLNKV1RXugl5CiMEBfcsfPcQ8UaCgTGtxxvbcKGp4mDwZyV4l++FzK
 LZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7anERXc48CNXuudpDCognfHeywEJdwRgR/Ch39k9+Es=;
 b=MMJaWjmbSL1U57QSCvwJYGKS2RlkE8QEoGgh+h/vSsWCJc913YVOkV7EoGf6Z1OQVW
 brCDFtbxBfw1jcOhLv7KCBiP+LNlOerE1auDXRKGD6J5FX8upUs6B3pk6r35M5J0VSh7
 v6eksnoEOaIoWd3QL37MRMtkM0JgUtE1X0oIVp/dkzqEaPqVWE4LnA2T8hpu5CGlodqr
 czj9CJLEQIddgV4o/dh1CP4KEsmjQW2PGUgAKS3X1nutt2Tm9yV0oxnSucGkAv0g5Pfq
 Oqv770KyHhCj3Pb4Day9EBqlYNP4hYlpkthgsUcDAGC9W18/vmzGDbsOLJCEAlHyilim
 KQ+A==
X-Gm-Message-State: ACrzQf3iQ+cuQcy7k6ePKZ0euQn+gYUdT7rSpsCF3pdOHMAgqYBWCbwE
 8IS42L+MrJmMQxFcoWg8O8GJTX552ZKsxg==
X-Google-Smtp-Source: AMsMyM6qVeavFuFhBReSShZIRLiZvZk0vwuRtppEYm9hHoW/+SUHhNAuwH68xuFvsHvgQsr0EdDgyQ==
X-Received: by 2002:a5d:4dd0:0:b0:236:afa3:4309 with SMTP id
 f16-20020a5d4dd0000000b00236afa34309mr17071085wru.523.1667473782989; 
 Thu, 03 Nov 2022 04:09:42 -0700 (PDT)
Received: from [192.168.182.175] (216.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.216]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b00228daaa84aesm606985wrs.25.2022.11.03.04.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:09:42 -0700 (PDT)
Message-ID: <7712b258-1109-c692-3cdf-ebff0c673313@linaro.org>
Date: Thu, 3 Nov 2022 12:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/qtest/libqos/e1000e: Use E1000_STATUS_ASDV_1000
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221103083425.100590-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221103083425.100590-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 3/11/22 09:34, Akihiko Odaki wrote:
> Nemonics E1000_STATUS_LAN_INIT_DONE and E1000_STATUS_ASDV_1000 have
> the same value, and E1000_STATUS_ASDV_1000 should be used here because
> E1000_STATUS_ASDV_1000 represents the auto-detected speed tested here
> while E1000_STATUS_LAN_INIT_DONE is a value used for a different purpose
> with a variant of e1000e family different from the one implemented in
> QEMU.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/libqos/e1000e.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


