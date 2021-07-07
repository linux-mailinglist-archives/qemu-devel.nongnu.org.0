Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778923BEA87
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:17:58 +0200 (CEST)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19JF-0003yt-IC
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m19Hr-00035b-ME
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:16:31 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m19Hp-0008UH-Gv
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:16:31 -0400
Received: by mail-pl1-x631.google.com with SMTP id y2so1237824plc.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cE/oZqCyRrQhGJ0F2xVASQWnscaPE8Xbwch6Tuysiv4=;
 b=lLakqZC9ZL4vfFn3DqofzmUahZkPIPDefKlgYVuigf6omkVBnt9hNCOg0nSKv+O/uS
 qrLPp11ae5JaQKAtP8nfJlKzmxfltpJcabZ+9vpYbjjVx7I86ZGTyforbND5f3/SXbgs
 Q2aXYXQrIhs1k74nksOIg7aw+CoHiqOQfvDtIiSCdeDH2mB5S1k9go+Is0Fta8QBTIVE
 Kli2NViA2qHK/NzguUUM6u18Ki55RaWyHKLAnLeYizKNrlPyu+RVpJTEHqZZVoJHATCE
 l2PVkGGwPu9C7hoiC2tGXb4x6PxNSbaJWI5xxaCdw9WfKGOtLvrWVqGm6WcTJ1YZ6alQ
 wctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cE/oZqCyRrQhGJ0F2xVASQWnscaPE8Xbwch6Tuysiv4=;
 b=cBMxL9OT+WHCkFkx18jMUAgsQRe/77xscNPm3IVdtghuVl3c37ROZUx7dcA7lsoE4q
 ghKoD78ipvALCnMBcg92Pf50In9ijPDprci/YqemvJGoo9TQIAETlVeiwPgjXsmYxpC8
 0GFyWx3z61sRMLGivAN224tX1PlmijkPdiCDWE3JVTiy8Ah4Y/k8+SXS6SXG9kd1wcgd
 P2rMDxtQQytM5fOgFDd3ZkF5oW+kyD+/3j7uoCST6mOgyZBG/Y/Jigp+9kg8J/OXF3c+
 6E+ojhYk/z+ieOvVLC0ZlnpVtvWPvlzRBvY/HB9lICq4dacVhhv+vJnc0l4seRN+dcOf
 8crA==
X-Gm-Message-State: AOAM530EoMx4Jy6k/Kl1Cxi/GnL9rO3PbLjcoO5ncE3skEj/Efd4ocS1
 w+YwHvN0vGYqa/i14uMU/n5jmA==
X-Google-Smtp-Source: ABdhPJzd+Ptti9xCoK7fxOu7hpTHhgDJJeRJ1v7kEon1MxjrFo/NVzhI8iq0UWglCyyC/4YMlv6g0A==
X-Received: by 2002:a17:902:a582:b029:129:c8a4:1e48 with SMTP id
 az2-20020a170902a582b0290129c8a41e48mr1954776plb.19.1625670987892; 
 Wed, 07 Jul 2021 08:16:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm23285889pgh.59.2021.07.07.08.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 08:16:27 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] configure: allow the selection of alternate config
 in the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20210707131744.26027-1-alex.bennee@linaro.org>
 <20210707131744.26027-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85d9f5fb-36a7-4c25-411e-f3cd9cbcecd7@linaro.org>
Date: Wed, 7 Jul 2021 08:16:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707131744.26027-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 6:17 AM, Alex Bennée wrote:
> While the default config works well enough it does end up enabling a
> lot of stuff. For more minimal builds we can select a different list
> of devices and let Kconfig work out what we want. For example:
> 
>    ../../configure --without-default-features \
>      --target-list=arm-softmmu,aarch64-softmmu \
>      --with-devices-aarch64=minimal
> 
> will override the aarch64-softmmu default set of devices with a more
> minimal set of devices that just enables the virt and sbsa-ref models.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé<philmd@redhat.com>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20210621152120.4465-6-alex.bennee@linaro.org>

I guess I can just follow the shell scripting.  It's a shame we can't just put together 
the properties section contents while we're parsing the command-line, and instead have to 
break it up into N variables.

> +  # unroll any custom device configs
> +  if test -n "$device_archs"; then
> +      for a in $device_archs; do
> +          eval "c=\$devices_${a}"
> +          echo "${a}-softmmu = '$c'" >> $cross
> +      done
> +  fi

Do you really need the IF around the FOR?  Shouldn't the loop iterate zero times if 
$device_archs is empty?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

