Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95000658619
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 19:54:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAbYt-0001nG-Oq; Wed, 28 Dec 2022 13:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAbYr-0001lZ-9P
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:53:57 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAbYp-0003Hl-I2
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:53:56 -0500
Received: by mail-ej1-x636.google.com with SMTP id fc4so40143940ejc.12
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 10:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cAdz5IRi19g3ZNc/UMIaHLfTbqWkbw65NHprRzsch2Q=;
 b=JNUsQRZK9puSYcEGhnqa+y/LGbT2T97/RdUKzSRMLpyUwE0ADwILqZo8+rRJ9DlbUS
 1VyG7nNTbC2pyw18d4zFsmKDx3l4wgF/D3zjiJ3x6oDYMSZFuGfeuRGzXZApuI/ue1xy
 5DCFO/TveOFPOxODCUb3OEi53Ai7zadCYBD31nkGVo6uMd75f03L9IhxnO82K2mugMTY
 bFeJyrn2T/LCFlPAKLjB1UrjnK575413B1z/ozAYaPQDN3uXQG1tYrp82Bws/6m+SQFJ
 20VlsG1ZNSOYP+uQHamP5bNLzMBC7Zj0u6KyyzN2P20ZYLy29Aa3x0pRj8F6Nd1/7aan
 6NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cAdz5IRi19g3ZNc/UMIaHLfTbqWkbw65NHprRzsch2Q=;
 b=L3xPD4WxSbG/+RURSS9EjF06NQcVwWXx0p5njStkwir5FnIF8cFSv5RQKa8lUGGhy+
 7RCvM2ToUnDbN3I1dKoTKRcslhPhEx65NVhG0mIZCDo7wjj5r/od3Boo/BjqEuyFZtuL
 mmFfF9nVR0yVbyoRwioBSfHnjC3eAk61Y6o0n11v7HGIDH0dU7RIQZSq03ojKV3CSzet
 RDJw7Uz56PhN9f8XohAi6CzoBSom8poY5bUKN65rkJTUeDczz1TkmISlLed8y0BMcP2u
 dHT7OW3l/0r+R5WoYy/5KaJat3I+UlNHwqgOuAfj0iO3Bz5eU3Lg//JilFwKw+rJzmKz
 DdWw==
X-Gm-Message-State: AFqh2kroiZ0E8GD0AXN7y2CvC0m4isZ4K8PpsBzT2/War57qlYRak7oW
 vR+/CJITrECPw3hhJpCsORoDAA==
X-Google-Smtp-Source: AMrXdXtNJZWx5secnbM20zDUi3Qz1s+4rtLRmET86vwjWHyJx0jsotBrgUyLhZZ7jTZuCFujmFCKAA==
X-Received: by 2002:a17:906:6d5:b0:7c0:f462:575a with SMTP id
 v21-20020a17090606d500b007c0f462575amr22335046ejb.29.1672253634260; 
 Wed, 28 Dec 2022 10:53:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 kz17-20020a17090777d100b0084c643582e0sm3303862ejc.14.2022.12.28.10.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 10:53:53 -0800 (PST)
Message-ID: <069fff0e-cece-d403-1a89-c2082b8d86ef@linaro.org>
Date: Wed, 28 Dec 2022 19:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] accel/tcg: Handle false negative lookup in
 page_check_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-4-richard.henderson@linaro.org>
 <d8cae78a-705e-b536-82c8-ddbc6eafda3b@linaro.org>
 <eba7c0ee-96dc-928d-b2a2-19fc46dbb8f4@linaro.org>
 <376567a3-bf28-4faf-4ca7-11d467c826ed@linaro.org>
 <cfbbcf46-7e3c-5f52-390e-ea5f39829716@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cfbbcf46-7e3c-5f52-390e-ea5f39829716@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 28/12/22 19:30, Richard Henderson wrote:
> On 12/28/22 10:27, Philippe Mathieu-Daudé wrote:
>> Oh, so you are using this variable as tri-state?
> 
> Yes.  Perhaps a comment on the -1?

Or name the variable tristate_lock? And a comment :)
(No need to respin, you can keep my R-b).


