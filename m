Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA964A0D8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iqM-0003cN-J5; Mon, 12 Dec 2022 08:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4ipz-0003a6-N2
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:27:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4ipx-0007F0-Vo
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:27:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so5141641wmb.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=e7wo3+26a3I5/3pEWh8YqFatRN8wr4lZKCgxJGOH/T8=;
 b=CSjuJH9OkqSQ6IfbUc7+u+S0kkE3tbdfj09R/UrAvl9B0I9l89V7YEmZA7dK7JdvcN
 3szPSS4UtgUG4oDha81WQ4NwA9AtBDKRMSywaGPogu77/9MiaGq++ggfR9ndL2qFhNtX
 482Auc/bUs5mquBAzopO7CwDUhN6IymtFmAnQL/dOZkpo0NruGJMRLMz8SwG5vyP9+Ax
 mOVR+QOozh1WHTdpGAHb5e/e0KNh5C/Qzizev6RmobbB5G93uEJJYEQaXw0ubARWEKCU
 lbllLzO9Mh7nGjY8+wHyzBVXWkU0aro6eCIZznMHC3TKQWHE2RuPTbFbN9naS4deM3Pn
 oYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e7wo3+26a3I5/3pEWh8YqFatRN8wr4lZKCgxJGOH/T8=;
 b=gs3Q9Mw60VSxMwOLtEhRKho2cLIGc7HXBt+E4QMYW+bSCGDHZidWWgs4zSZNujcGRr
 wIxBlo3RmhhMu3daxrOIYUPgRlAZ6vanbVBEfIvxfUf5U+UdJy7MiSkrjFWLIumypw3y
 O8OBBfOrJVS93fFi5psRjRwuPRpMAqpNLy5vX8kn+WTtL9STqZm2Mg1xMirQpiHfAnVM
 oL2Uet+IHdwahyh79lLELsZraQYWQEcmGcxejA97bTM9i8OHgcmuA0XfdL3wH5UJ3tsi
 /MSDGqFEJ34g8aOMG89Z7tIg0uBky6/KCmSxL65i65rluPYvKdBAsUSLgepo19JfxO2F
 9PTw==
X-Gm-Message-State: ANoB5pmvyoeQBCudWKFKF9Fjli/T8j6yiUC/fhGTVw90IORalA3apS7f
 6SEqMTrxPi3YXr4bqT918lYBH2JrSPngNw==
X-Google-Smtp-Source: AA0mqf77yIDw8tRzOWs0q9vqw+ve5tnYhBxX4BTiXd+QugsZQde8r0QHt6CK4wp/V0OnN3GIeFg2Kw==
X-Received: by 2002:a05:600c:4d22:b0:3d1:cdf7:debf with SMTP id
 u34-20020a05600c4d2200b003d1cdf7debfmr12294526wmp.26.1670851636339; 
 Mon, 12 Dec 2022 05:27:16 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003d07de1698asm10440773wmp.46.2022.12.12.05.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:27:16 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <44a77662-352e-5492-4755-12861080082e@xen.org>
Date: Mon, 12 Dec 2022 13:27:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 06/22] hw/xen_backend: refactor xen_be_init()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-7-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:55, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-legacy-backend.c         | 40 +++++++++++++++++++++--------
>   include/hw/xen/xen-legacy-backend.h |  3 +++
>   2 files changed, 32 insertions(+), 11 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


