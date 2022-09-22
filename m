Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F65E6F3B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 00:00:34 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obUFF-0008FH-GC
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 18:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUDW-000667-L4
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:58:46 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUDU-0004Oe-RP
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:58:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id 3so10505199pga.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=lUVPh0YF5rXP10BK/aJ9DkQhGUYpq3ZT688Uk4UZrio=;
 b=GRVZHoeUDCV0fG+/+NHFKblFTlk6KOBERBAqNRiAcnJhmdIBjnCKBGYTAp/esSW7vu
 N4GM3ZEfV7U9AdMTvgWHF1yeK1INdPUEzaRAHNdE62IqMEralXZICEIQKSxmwmMabcEH
 NSBAJ/wgbH6SH0hYJQoKdo0l3A2/sSJ2dX6DoftWq9dAs2+QKyt/Det9r+iSNPz8EuA9
 muUAmc+ip2jqmKHLIIuSfmtfUd47i15Fp1N5yj9wQS3nAbbRn0R+kMk5CV/ng0cBDcd0
 YkmF2Huppyrig+5ZLuxeGARZCoQd35G44UUKgsmdO1lSOjdP1T3yzPoEtoOsbf+7zqBO
 vASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=lUVPh0YF5rXP10BK/aJ9DkQhGUYpq3ZT688Uk4UZrio=;
 b=0H2G5TcrWhyUd9IBgumTJuYzU/lB/l8vsX4YqlcSQcJv+4v1h/Dn+iKG/BtLf4Y+Pf
 MrIaxJcVDKILynUMP1T4pSA2pkZu4SK5kIN87lLs/72nEg8G3o2Lq2VCZtYSqC5yETS2
 UMUOllHP6guHjWf2AZ3FBz91H0JDm/Pu6nUMUX/4xEXp9zOXRRnS1yaqU4mmAfwcElOg
 mR7HVDNJ7y2tFsHs0NeiUPyDaqoxnRWFK0+powZgEwHp6tGY+027Xg3GOwV2aSsDv0gL
 pLiJYAXCvjEP5b5bjlbZwZBMiUjIC5wAB5nD7UYRC4EgLaOIVg0ZMDSMfTKsNUmXg10D
 Gg1Q==
X-Gm-Message-State: ACrzQf2DGaWMtZOmWzByvGnH0jS0sWfxiMvbP8Snwm6/5o1kAOAA1oba
 8J9oVmWp6Mu4rggPVAZlgKY=
X-Google-Smtp-Source: AMsMyM7KxPzHPVEWyw6XnoKk4bMTawaJ+3H6NjpAEDGMCRncI4xbir+25Uf3AxfPdEUQY6CrPTj6vA==
X-Received: by 2002:a05:6a00:b8b:b0:536:71f7:4ce3 with SMTP id
 g11-20020a056a000b8b00b0053671f74ce3mr5665136pfj.74.1663883923269; 
 Thu, 22 Sep 2022 14:58:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s21-20020aa78bd5000000b00540c24ba181sm4823537pfd.120.2022.09.22.14.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:58:42 -0700 (PDT)
Message-ID: <a6733ad5-cd30-0622-5423-a27ff3af8169@amsat.org>
Date: Thu, 22 Sep 2022 23:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v4 01/22] hw/virtio: incorporate backend features in
 features
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-2-alex.bennee@linaro.org>
In-Reply-To: <20220802095010.3330793-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
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

On 2/8/22 11:49, Alex Bennée wrote:
> There are some extra bits used over a vhost-user connection which are
> hidden from the device itself. We need to set them here to ensure we
> enable things like the protocol extensions.
> 
> Currently net/vhost-user.c has it's own inscrutable way of persisting
> this data but it really should live in the core vhost_user code.

TIL inscrutable!

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220726192150.2435175-7-alex.bennee@linaro.org>
> ---
>   hw/virtio/vhost-user.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


