Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD15BBAAB
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:24:18 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfIP-0002bk-3u
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfGh-0001BH-4H
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:22:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfGf-00069z-IP
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:22:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id e16so41323061wrx.7
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 14:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=JIImjRtsZ5T0qjwbjDWkll9Z4MQ1gUr50WfsCcN+oo0=;
 b=VxYfs8rpOTLaAjL90lAXMCfe1QdqDQFMnRUqVFpetnFoNJYN0BhbxVtsvcbUAH3kcG
 pjH5nFNm9lVCiKMlcvM1V4X0q20hzX1hfsMoKxtgL6gSUtLK9oGFda+JNw1oXjT7nUXd
 s2A2wO4MQC2ssU/8RgYgI+ax98Q5XqksG+SWBMeHa+XTQcJQq0l+K4tV9XuNrwwxD0Y6
 bUZ8xYJPI5JRWN7F8J6R+5hzeb9o7jDHnfeIBvsjYWmI0WQqKwzBAM7cYhuSNFj1wbJp
 tSZ/tFlKO0DRrJQBm/k1O3+WuhH2p8VLBd0snd0ULN9GiTKruKFMYyau7qa5/+a1qhJo
 9BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=JIImjRtsZ5T0qjwbjDWkll9Z4MQ1gUr50WfsCcN+oo0=;
 b=o2To0xFXMxAQCgeDI39Qbhwk+lASnfnvAxPZKuWRjcBWjLO4TDDNHudcuMEeKKj/ne
 zBAmr/mFPahUC8Q8K7NBpHk12GLeT+qPQHGaPButwerUu56wbhOnKTXP1pw+IDK2bhZF
 8w7IYkgQWx/ZnC17iceqDWcDvCJ5ICEn0R3pQ1N5F3qeJ//xzXv5ESK5UZQIOFdmBpD3
 Qy575khJALD5HvOhEh0Q8snAYbKRXML74ItuS7uM4n+4/e8Gq06XSy8hgvdeCFNmv5yD
 +7oiwzcCSolMwmIh3J8yjH1uH8X1/QgMC9n8Pzj9MwG4/GUyYRxOAUAcZS6OiBqvsrTq
 PkkA==
X-Gm-Message-State: ACrzQf2/rvyVksSQcOf3NFQFhVRi47C8V52dmaobuIWRhgWFXccpj/e1
 u1QD6SiJtJb2XCb6SO4l/Zy00yVDeYI=
X-Google-Smtp-Source: AMsMyM4mBnQVSU6N1NSq17FpNu9ZpIDz9vSnWymOu/R6pFnX7HArXfVoQTTD+CGaGP3Walcw3NW9gw==
X-Received: by 2002:a05:6000:15c8:b0:22a:59f8:ad18 with SMTP id
 y8-20020a05600015c800b0022a59f8ad18mr6305320wry.631.1663449747764; 
 Sat, 17 Sep 2022 14:22:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003b33943ce5esm5073647wmo.32.2022.09.17.14.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:22:27 -0700 (PDT)
Message-ID: <0d2fdfbe-de05-d84f-5af1-b3451cbfa1a2@amsat.org>
Date: Sat, 17 Sep 2022 23:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 4/7] .gitlab-ci.d/windows.yml: Drop the sed processing in
 the 64-bit build
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-5-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-5-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 15:28, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The sed processing of build/config-host.mak seems to be no longer
> needed, and there is no such in the 32-bit build too. Drop it.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   .gitlab-ci.d/windows.yml | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

