Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FA6943DF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:08:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWgi-0000SH-4W; Mon, 13 Feb 2023 06:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWgT-0000Q5-C5
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:07:47 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWg7-0005kX-QO
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:07:44 -0500
Received: by mail-wm1-x32d.google.com with SMTP id he5so607210wmb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 03:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yPudw3VtFV98rI4afWMwmTvOsHz5CM7AxRs0ENw44hk=;
 b=Q393VsCW26yBqPYVZFN356bWbxgVHejnyTQZimrJcPBrbbAuby8z00KwPNUVQB0Vdg
 zMuYKiIlbM9rLutOW/wazOmA0Zle48ADU+dx8lsndC8BLRxza+CQKC1+qSLeA98FdI2d
 4+YsNRfPZUtES081qfDnKkUOVZnCkTopUwUM5LNYfLZ7210J59p6QkUSHnOgtVbVixej
 uzFsE9Hb+6NqDg0leRxURtATHj09UE180LWI6bDmuxZ33SsL7qj/3z9fG3tGD2TagKDu
 BxnmP9Lo4e+7+Z10yg3QanZ65JWA9GA7i5JE5VpRkYmZn1F3dmzHWWh6tJndrd5if6IM
 cNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yPudw3VtFV98rI4afWMwmTvOsHz5CM7AxRs0ENw44hk=;
 b=BrCy+y+ZktBMpDvxDDjjfN3FK6LrL0w+EFeg0/b64SHhUpOwI99YAzfTd5LN0J/JWj
 MueglxBd3NbV4aLyt7fPCRL05mW4f5pccpcX96E/vvJmcjBW/FeV3X4kS9a0JVhT4ydB
 8IlvO1BcXe0pLSDcmK5P29SM111oxIa55m3rw/GI8W0h4Ns9hXEOVBQW6a1SAECBoeDo
 Gk8S8DI5bgU7XKFURxjXw2kiMnqSrH+Ng2Px1GPkUFxg/zj71Oku+eYhY0fkwvNBwNA2
 HWDcD+sazAjqKfo0ywt2lVo0szcOotrS/PubHLNKv+m/Dlp70xRIgYpG7gbq7484YyXO
 D3ng==
X-Gm-Message-State: AO0yUKX4tm1Bpz/K0/tJs+V2tkVCvEYc3XR229KWT9Za3ZG30+Kjlajl
 oG69/GBcGincGeiJ5ZwQ1Zcudw==
X-Google-Smtp-Source: AK7set8qdcfy4qtVc5Ca5CcVToShS8IdN40ueGkoSsKOC3SADW8v2b4keaBf5f+zFjaNKl0e6umbaw==
X-Received: by 2002:a05:600c:4d0a:b0:3dc:16d4:a99f with SMTP id
 u10-20020a05600c4d0a00b003dc16d4a99fmr19045705wmp.8.1676286441893; 
 Mon, 13 Feb 2023 03:07:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 iv12-20020a05600c548c00b003dc521f336esm14807003wmb.14.2023.02.13.03.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:07:21 -0800 (PST)
Message-ID: <108a692c-0088-0e4a-35c8-b8aacda6ecf0@linaro.org>
Date: Mon, 13 Feb 2023 12:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 0/9] hw/qdev: Housekeeping around qdev_get_parent_bus()
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>
References: <20230213070423.76428-1-philmd@linaro.org>
 <20230213055302-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213055302-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/2/23 11:53, Michael S. Tsirkin wrote:
> On Mon, Feb 13, 2023 at 08:04:14AM +0100, Philippe Mathieu-Daudé wrote:
>> v2: Convert more qdev_get_parent_bus()
>>
>> DeviceState::parent_bus is an internal field and should be
>> accessed by the qdev_get_parent_bus() helper. Replace most uses.
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Thanks!

> who's merging this?

Oh I forgot to mention. Probably easier if I merge this myself as a
hw/ omnibus pullreq with various other similar series, so I deal with
the rebase issues.

