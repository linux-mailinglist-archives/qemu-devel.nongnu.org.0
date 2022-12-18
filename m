Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A747C64FF05
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 14:46:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6tzC-0007Ne-0J; Sun, 18 Dec 2022 08:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6tz9-0007NK-8w
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:45:47 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6tz4-0007XA-DH
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:45:46 -0500
Received: by mail-ej1-x62a.google.com with SMTP id tz12so16057910ejc.9
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 05:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=acnLxlNNTOvX9Mhg/3LB7JjpVxV3ZcbYk/IvgBFFoOg=;
 b=fTiO/SpvVEdcRULW82bFmjUcZFJW/VBmtAaZVUlE7NZ7+vjf9xCY3uV3PwWgLPafso
 aoY4fH579WY8eQiSw4z+7B2YqXq0cyF9GLXgHsmteJtMQvu14uEYVKEJMRXII0Srb0Gc
 oiLDR4bLJ1tWp7sgIOwaebmWRcNeQjbRaP8Aj7ehKY3NaIBy4rz5JWBlk77JsUtuW7La
 xybUN5G57IKvmw1KG7vUClWNKhHHsnIeP5dH2TMGafT0wzQ0gFd4QGYDPNxTLBKBLClH
 gVvy+TLQslX41cHpokl7A9CLxCCj3+WwWtXcTIckpMoODQCnFxBZ5Aqo0vPMIoamqlJ5
 0UOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=acnLxlNNTOvX9Mhg/3LB7JjpVxV3ZcbYk/IvgBFFoOg=;
 b=OxWKIXhyeF9bsv6bXoGDUsKg6SoZ2nD5yZlZS9fMI8MOJheuqyZphnmhyzDx/4qG4S
 OHNBOujmnldV5JSlFnI6Q4DG8oCOANVAIswfj0uN9zwL9zh4fUmv7WD4LIo9iG0CXvAs
 nnlH/H2bxX7b5+NDZk2r61KE02UvmdbI4ow893UZaLtelu6LuVxi4xxHfcchHJhasp7t
 oCI41+KZWmBZgkpsazBHHhfLLeSSw7MFq9ZVePRE98JxhkoS4BdLfviNFy6yvjxDNQ5t
 wvS8+Duv6qhPUagMNRWZmkqgfzlFOgqgwasLe5MobdN7DBDSs4qI03qkK2xmxJ22IOhq
 pvHQ==
X-Gm-Message-State: ANoB5pkJ5K7j49BqXWKsjuzNi7oZNB0VDUgzqozHjd52rEC+DSITZd3D
 YeArDP0dEQgbri4QCVF2eMbHTw==
X-Google-Smtp-Source: AA0mqf5x3eT3+GZW3gXhc4cBqhMTFK1OLA/+eAvEFdvLO3nqIr5rP4wuDlRSn2GnbJlXqZ4a5Y/h7Q==
X-Received: by 2002:a17:906:ca51:b0:7c0:d23c:ead3 with SMTP id
 jx17-20020a170906ca5100b007c0d23cead3mr19589833ejb.27.1671371139674; 
 Sun, 18 Dec 2022 05:45:39 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 vr14-20020a170907a50e00b007c0bb571da5sm3135251ejc.41.2022.12.18.05.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 05:45:39 -0800 (PST)
Message-ID: <5b04a521-9ab6-5eac-4db4-f0c041d76cab@linaro.org>
Date: Sun, 18 Dec 2022 14:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] util: remove support -chardev tty and -chardev parport
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221218000649.686882-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218000649.686882-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/12/22 01:06, Paolo Bonzini wrote:
> These were deprecated in 6.0 and can now be removed.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   chardev/char.c                  | 33 ++-------------------------------
>   docs/about/deprecated.rst       |  6 ------
>   docs/about/removed-features.rst |  5 +++++
>   docs/qdev-device-use.txt        |  4 ++--
>   qemu-options.hx                 | 11 +----------
>   5 files changed, 10 insertions(+), 49 deletions(-)

If you don't mind, please squash a renaming of
HAVE_CHARDEV_PARPORT -> HAVE_CHARDEV_PARALLEL.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


