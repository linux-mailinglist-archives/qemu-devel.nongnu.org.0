Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254CD2BAB9E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 15:06:40 +0100 (CET)
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg73e-0006PT-Lt
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 09:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kg72m-0005yw-Vy
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 09:05:45 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kg72l-0006vi-Cq
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 09:05:44 -0500
Received: by mail-pf1-x444.google.com with SMTP id t8so7925036pfg.8
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 06:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=P9qcI98I2w3LgMGtpWhMDZ3CjhkzNpmeqsk8XJO5Rm8=;
 b=YQNnJuKoTp4cChJG5rwSdxDPdx4AD0sMW+sguemRcLRS28z18nz2SYIj9SxAYPEbmc
 l0Xg5l1cymvyy8+uuhfVQps/ZpkqRUy+r0LVoqbz6HBTsZiSuC2o2hAbnyfCfq4SIqz9
 cQLPJ9ngVS5XgXvi37RN/4XNS0twWYxH2Q6Xtsu7fyPscCpiAQvnlgzqcxW7lIqXtZUH
 2EyLaDK8KgL9wm45SuJWG3Nq0w52Q8YScAum3oztgk7oZombacaNwxNzWf4qhPed1eOH
 SQkbI3cvD/HhcIFvIyE1e8flV7cCVLaBnZPMQtXhduLhM8iDltfH6RtYo027luEFIYdW
 sVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P9qcI98I2w3LgMGtpWhMDZ3CjhkzNpmeqsk8XJO5Rm8=;
 b=WNbm24oJFsqp6p3B8/eqTkDVycTGGWzYUVxRhPqdasYBYFRngzDUQyogR3NJ7bt9Sy
 wi0m/6F6ldZcC89A3gur4DZ4jqX5h9pkDGNYNA8CBi+j6ImDoC4wzveYoNG9c/I5ZyRF
 NTd9xrEe/mOVFF/GSGfOVMiaxG0EClD1B4oFu/2SKUb4UX3ut+Haj4GeMrr69XnhG/bQ
 AxKOEHNo7W7jtSJHU14JjN2V6Y4dGcEv5Oc9pHgv5NMpT2su+NCdw9TZtDo02WQ6iPmW
 kVo8kefb8VkjdLqIzkTccSqr6X5IlAp54oWRXgqHDGP8eAJ/4Oh+D495ciCVvJIbvqcJ
 c0jA==
X-Gm-Message-State: AOAM533yvW59kWQEhpiXNa4UtR8R1Se+pY9AtZMgqFrPs+ctH8f8QVfi
 7cbJKrd7QRmnCilzN3Kth3CTnlXDFCxHaw==
X-Google-Smtp-Source: ABdhPJzp+vP/P9x5XPEP1BLXII6D4caLCxZxiiPEjwuVevuRtLjkue6N2uELPts81cRuwbYbTtOcUQ==
X-Received: by 2002:a17:90a:f0c7:: with SMTP id
 fa7mr10828788pjb.3.1605881141212; 
 Fri, 20 Nov 2020 06:05:41 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 22sm4224336pjb.40.2020.11.20.06.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 06:05:40 -0800 (PST)
Subject: Re: [PATCH] meson.build: convert --with-default-devices to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201120073830.99939-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4067c73a-3351-7837-4dc5-d71568a57066@linaro.org>
Date: Fri, 20 Nov 2020 06:05:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120073830.99939-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 11/19/20 11:38 PM, Paolo Bonzini wrote:
> Pass the boolean option directly instead of writing
> CONFIG_MINIKCONF_MODE to config-host.mak.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 12 ++++--------
>  meson.build       |  5 +++--
>  meson_options.txt |  2 ++
>  3 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


