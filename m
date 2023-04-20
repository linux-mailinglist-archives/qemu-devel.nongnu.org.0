Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F96E8EB3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:55:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppR0s-0003Hh-Ak; Thu, 20 Apr 2023 05:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppR0n-0003HJ-55
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:55:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppR0l-0001F9-8G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:55:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id q5so936004wmo.4
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681984529; x=1684576529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bi/QWEo6T19Q32EAIyUtyJzM34gPnX0GalgTgktQBQQ=;
 b=wu9Yz+W802ptsiOaceD8kiNBAe1D5zKPyfaTJVv/m8y8ejUntH4DxlxCFyGHV4xnoe
 hqv5IeLgpJ39z44RhTlx4EfN+BKlr5QUZh2FAWAkitKl6G6eNnrehi6UZ8dRZ6/ARPo1
 HlApe9BtjUiuaGSS+KATMv3HOZr3XwB1ubUjOc7CBWS5HxhyrhO/rkrOyegyKw1SksMC
 s6LMhlWLAjvSUE1FZ9hplV29lDPVthn40Vcc4u+uQtIIuA8j+R5YwDqkwfiFosVRvwm2
 IRxzLqDPnpKH4As0T0cOyg6fNq1284Ci6g4TBto9igjC+0OVB2WoxPAZzodDRSiDH0e+
 cf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681984529; x=1684576529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bi/QWEo6T19Q32EAIyUtyJzM34gPnX0GalgTgktQBQQ=;
 b=N+43gcWiGdk5DToAnM16EqW9DEYHOPE/b/otxRDZrGzhkWA1WMTnsDhWkuIkmUREwG
 jlTsI1a8oAINJWyZa7CtC1ya01TMa3J6gwpMU6TwwXekughkn8HRd92kZStwjYRzMbew
 GAHo/agw3XJa7y5JXFGvRISMyRpgeadUsJbPItm+3ntWgXZn7sZ3AEMDbjTP1ihpzocd
 V/Pl7rYzZ3YVhWegWQL2fkuoAvKkpyBRJgQHvvClsNeadOfdj6IoZt/Pt+4gPML2ldbr
 i8EvVhcGiorjlFcfc1Lii2EwmjZAYdyyemzTFwSJc85oamqIbZNltTxFJko7c59GnOrr
 muxQ==
X-Gm-Message-State: AAQBX9eElO54w9w3DNnf1juud14LutQhFd6NNT3mUDYEVGwN6XZrcWOy
 kY1ESwg7ydwYJPN4VegpsqYoYA==
X-Google-Smtp-Source: AKy350YeOBe2EXY4YuEAQnzZmVcnm+Z/6aidYXSV0A9B66KQSgGNlaz2C7dw9z5vuwuLWLCPcrOiag==
X-Received: by 2002:a1c:7417:0:b0:3f1:74c3:3c51 with SMTP id
 p23-20020a1c7417000000b003f174c33c51mr700434wmc.35.1681984529124; 
 Thu, 20 Apr 2023 02:55:29 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f182a10106sm1574645wmq.8.2023.04.20.02.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:55:28 -0700 (PDT)
Message-ID: <ec5baaa4-1d03-fd50-b4e5-38282f3e4f4e@linaro.org>
Date: Thu, 20 Apr 2023 11:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 13/41] net/eth: Rename eth_setup_vlan_headers_ex
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-14-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420054657.50367-14-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/4/23 07:46, Akihiko Odaki wrote:
> The old eth_setup_vlan_headers has no user so remove it and rename
> eth_setup_vlan_headers_ex.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/net/eth.h   | 9 +--------
>   hw/net/net_tx_pkt.c | 2 +-
>   net/eth.c           | 2 +-
>   3 files changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


