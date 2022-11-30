Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAE063D347
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:27:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KIX-00060z-6O; Wed, 30 Nov 2022 05:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KIV-00060e-AF
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:26:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KIT-0001yu-Rz
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:26:35 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso1027312wmp.5
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oer1BpPdI9L/q5r3Sl0XSLMyghhmNUZg3zC6EqZdta4=;
 b=hcwTmnKLdXu6mdCPaxvaTubOzxG1gIieC3dRLi/UwHVAfFPEepVLie/2p/WAxMLqIp
 IBQJDQZqFi6GhkzwzMNIhvt1eOk/m8JGExXZ4sc2VlDNZkFEnH8WrJAa74b76Ek+PbJu
 5zHse9qylLF/tiK2Y7gd145aNm6XB1LU0cLsQL18ZSc3JedXdBH9Er7JC4DS+OuvgWIh
 fD2yGaiS6fMXSTDen7fJHiUmUlLaAgnhNIMrjzVVJBijk1sUzGSYClkuXEnZ8EvecMoa
 96sFUaSk3tV1B66vLw7p9jrDRO8Yb95zVSfoTC+660r9633YQlC+q3+cd6ItbJaAWW1f
 maEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oer1BpPdI9L/q5r3Sl0XSLMyghhmNUZg3zC6EqZdta4=;
 b=cNvdQwtdlv9HUa6NAhIl4zP0vhzYcxHV1c9aRko7XPXkGU893p7UtYEafS9h8NYDXp
 Bx5fx/8CJpeAHfN1jdr5mFD55LWyABeKusn25XYdXFL/qyrHAt/nL2B0NDAObbBniYJw
 oU8txPBlONW3sWTBeMgzF2jxhGzGtpTZKZ3LytIUWHboSeSWeQDkB+XUhuPW55Io2Vvw
 xOPkzoN9JuriS9oOOod3+iJQfW2Vq9y32yGQ9t9neSCZCTCOaG9DHEs5IIsl3+V3CdrU
 s2twQCClrk5VBUY7wCVUkkFOZnNeSwt9LTHzGwVvei7HcsY5Q6qsCu2lNXUKzav4/EtQ
 yZ+g==
X-Gm-Message-State: ANoB5pkdnmmrgFHXZGzTQ3Nt8XLdCrl3WJF4WRpPBGgcDbBTxbuBTJl6
 JVvBWQNUcd8DFtWL7WAE5kKzUw==
X-Google-Smtp-Source: AA0mqf4tzPaYNOOzfjtsCKpTiPuRJcz19jelFFauGoRn9Ii5SmLik2dy/Nmib4fnhOqiE2BC5dDnxQ==
X-Received: by 2002:a05:600c:3d94:b0:3d0:552e:8d86 with SMTP id
 bi20-20020a05600c3d9400b003d0552e8d86mr12026221wmb.112.1669803992611; 
 Wed, 30 Nov 2022 02:26:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bg9-20020a05600c3c8900b003cf483ee8e0sm5513109wmb.24.2022.11.30.02.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:26:32 -0800 (PST)
Message-ID: <6fefaf2e-dc34-623d-6236-1abe55b694d2@linaro.org>
Date: Wed, 30 Nov 2022 11:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2] e1000: Configure ResettableClass
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221125143233.60372-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125143233.60372-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 25/11/22 15:32, Akihiko Odaki wrote:
> This is part of recent efforts of refactoring e1000 and e1000e.
> 
> DeviceClass's reset member is deprecated so migrate to ResettableClass.
> Thre is no behavioral difference.

Typo "There" (also in your e1000e v2 patch).

> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


