Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECE667073
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:05:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFvB7-0000re-K7; Thu, 12 Jan 2023 05:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvB4-0000nn-I4
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:51:22 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvAz-0005jL-2p
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:51:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id o15so12875443wmr.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n6zZehrI7n8RuYH0SOlen325h2YyZmfkLZSf/9FCbDw=;
 b=WQ0oVBlsRWqJNuXmK/DuTmgDn0psv/uNy2gUgoV/iQnNpMYvP0NBVE/rG6fozUKM5G
 wnCCi4Stf1V7ssjVetMztUK142qf5C2VV/YzxkDv5Z+u9H6YHL4NuIh4sWKCW1YluPg3
 tbzl4q+2bLkV3RiZJwlaYd118PNFNBQyXsz5aXqyuKhC+lIhqx9/MQvNmm8gBXWkX9Gp
 q7lfVXdXPzxx12/rU0vbNmJa+h66+qvr3rqPBNm1k+TsN1EVUzO00yBIamBwc8kIconm
 iHEPn7Cwt/YxKbjFr2aINXBd5BWHNHPI6Yt46c+VJvNQ7hL9JJeYZpWLQNRBaLFhEOd6
 cIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n6zZehrI7n8RuYH0SOlen325h2YyZmfkLZSf/9FCbDw=;
 b=2VP9w6UvKtPLnDrIKLEjcmMOQpRtt/EtTHlbDc4AK8Y5bzqNgpjpR6QrHxRzptJ4Oi
 jVREgHGKwztaEV+sWpqCZsy5jsfe838fCjWCO9UMgy4CWYKjmPiIIhNKnHSfm7S3lMQW
 IQ+npaGke64TL7DNwEHxfc17wZ7D0ALAemLn6Kl+69esFYDKlH5eIHabLkT8dwdRQP3I
 nuEZFK581+Wg8f0A3tQ6Yqdvf2McU+tzC5PzH0pk3GkpYldJ+A38AzD9pT4qWx8z743H
 aQf8QNepfLXLK3VB6828A73iW58kO2u/6vdhw4YZM3i06vzMo9juaOfmz+7RNHJnL71n
 4GnA==
X-Gm-Message-State: AFqh2kr2ZZjMQclQBt9Bm2EUoKhxDKjf7XebaWBahn+tMFYv0acu4dnf
 q5P+LUuFceTbx3q/+DXOiea+UQ==
X-Google-Smtp-Source: AMrXdXvwlveeNiZ4TGMVbPmzfOCT8OwraN+sLRDdY5/woLx3CK2g7MJAgKG2U/RKZLsQ3vvKjskPxw==
X-Received: by 2002:a05:600c:4f08:b0:3d9:efd1:214d with SMTP id
 l8-20020a05600c4f0800b003d9efd1214dmr11429420wmq.25.1673520675606; 
 Thu, 12 Jan 2023 02:51:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003d9ed40a512sm17985657wmb.45.2023.01.12.02.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:51:15 -0800 (PST)
Message-ID: <db314837-8830-a212-b168-a0eca26f4d0b@linaro.org>
Date: Thu, 12 Jan 2023 11:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 16/31] e1000e: Set MII_ANER_NWAY
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-17-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-17-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 12/1/23 10:57, Akihiko Odaki wrote:
> This keeps Windows driver 12.18.9.23 from generating an event with ID
> 30. The description of the event is as follows:
>> Intel(R) 82574L Gigabit Network Connection
>>   PROBLEM: The network adapter is configured for auto-negotiation but
>> the link partner is not.  This may result in a duplex mismatch.
>>   ACTION: Configure the link partner for auto-negotiation.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000e_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


