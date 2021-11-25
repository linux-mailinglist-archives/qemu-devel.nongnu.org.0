Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7354C45D80A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:13:16 +0100 (CET)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBkh-0005YW-94
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqBig-00049u-VJ
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:11:11 -0500
Received: from [2a00:1450:4864:20::332] (port=44855
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqBid-0007IR-1j
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:11:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so4271173wms.3
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 02:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JjBfRvRd5OuquW7gnGSF3kSf1xNKTr/zovsdKMb0xIs=;
 b=TZw9aANqaanXeXBsy1iV6dC1pLV9eMLaXxKPPChssvpF5Gao1ZVehz6FhcjKMq9gOA
 BwP2G9KHBNsTqUFZHnn6yTU9UA6geDskbRNeqpM6lDQld8gEod+dKqKpS4mZRcToBIZu
 0wLWZCIGu0kBAiVwnrbB/bKyWzGVBKj96F8udKOzeRGJvFIzwDhz9AqVS3PzuUrEKHdN
 8v9W96qhunf46PsyIj5u9rk9dxthlnq+jNcuCTtRVqmrHv++77THw684Ip7PWx65VkrP
 WfsFJu3FtkhJIr+rLM1tnM2GyGwDtZEcMWoY7xQ6cRQo/155rxQuVnwEY1m6E18PWe0c
 AoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JjBfRvRd5OuquW7gnGSF3kSf1xNKTr/zovsdKMb0xIs=;
 b=4QyMrWhgomoLoCpBN7KpmJxZZ8xrMPEeoowCOz8zwEQkgxS7wX2CCaD+O3TjK6GIdq
 TMQDH0vsgX+jTyuK+nfHVHTVTYuKr1i5AtG2WI2MxclR2JdpR7/ovSeC7c7+BSLHaq9l
 UizFxmpv6/gIBU8Z5Z+mZ7w/aORRVJL1wu22GJ7ZsE+gYVfnVxy+frCZbunZqwmiWmc+
 1mDPn1o5jpVQe7DUEFvQe30Onz/FWZubIgTvw+x7b6qFR1V/GCmaPud7+44alAda6xJ0
 fpPcaotjjsL7lZfh5FpxMWh83sYD89ZBoJnBYFGCWhFPGJEXfgR3xDBCBP2o+kd9gQOo
 3ziw==
X-Gm-Message-State: AOAM532a6YtJTIPvPdkubfSGv8ef1c8gmYfcEdWV6sM70vlphEsU2TZ6
 UeyPID0FmMH+B8tQ0gTcThtyCA==
X-Google-Smtp-Source: ABdhPJyL9C1IbZVCDCB/jg0sspeMp1TYuWz0H2gePYeMtS4ZhPpMrwiaMkNrQlInxfPbxIki5QxWTg==
X-Received: by 2002:a05:600c:6025:: with SMTP id
 az37mr5769973wmb.194.1637835064765; 
 Thu, 25 Nov 2021 02:11:04 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id r8sm3165923wrz.43.2021.11.25.02.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 02:11:04 -0800 (PST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: gaosong <gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
 <510493a2-cc80-428c-4fae-43988a1e0fd1@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62de0456-bbdc-4c48-027b-56f7ed79adc9@linaro.org>
Date: Thu, 25 Nov 2021 11:11:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <510493a2-cc80-428c-4fae-43988a1e0fd1@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 4:03 AM, gaosong wrote:
> I also see that TARGET_SIGSTKSZ is not used.  I think  we should delete it.

Agreed.  This constant will have been baked into the guest executable.


r~

