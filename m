Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D275BBDC0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 14:20:51 +0200 (CEST)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZtI2-0007Km-Dl
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 08:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtDE-00022K-VY; Sun, 18 Sep 2022 08:15:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtDD-0005fv-4q; Sun, 18 Sep 2022 08:15:52 -0400
Received: by mail-wr1-x435.google.com with SMTP id e16so42982599wrx.7;
 Sun, 18 Sep 2022 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=2XkhRFcxQvxkTKQ4gcmJPLKwkZok0TiFv5WWBYXhBxg=;
 b=B8l+12bi/VpAe7ykbZtcrdoVtBZzRfBklNSHjiC5XcNOO0rdYqiUTu0Lhta2lGnNpE
 NAG8GpkChtinmM0Bmyvs0raDNyRF7TtKdB1aLy3adak/2Cubr+0+FRJYDoO2ix1mH20l
 xCLvqO9cdKxutfnRY8IJJ3ZpQ4vDqKEOaJcXntVgvvorH/SXACgEasSAFpDjLB89m1tZ
 WUqf0438S3Qk2P0viAOKRVe2VyQufikK+nI6swOJUyIGJvfkqhOTiW/Lp4TACM5WZkgL
 RXFAYohNVAf4elG6itxa2uaqP89uOgd7j2wE8HFGaXlcn/4Tbh1kp8oCxpT0ASt8oYKr
 L8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=2XkhRFcxQvxkTKQ4gcmJPLKwkZok0TiFv5WWBYXhBxg=;
 b=yo3QBb4b3WIoQHXafXUpVGpMABItFEdHxYFEOWwWVmjgQV6du+KOoxxee3Hd5mN3BE
 SXMGaqXMmdM9fp77rSYPBTRYk4R9elQhgPjxO9YeLOREIUrGV7a5ZgVi5sCrn/QABGJK
 zxujILa+pNs3MFRjRcTCqarO1nfwXbGFf2YA/DzWKM94x9b4zn8R0hNW97YXvRgWDZX8
 l7MPBzmmMvZIQPES+sVT3Wl0DT5ordWS4rw7lFlupx++Ni1M/sEAY8eLBpdlQtpPY6nA
 AyVj4oGcMzRpq/Tni14o+kAQ5aQcA18V8LZ//HTGqRhQir3tqDKUWWiIbI4/7n0IPRAX
 MJjw==
X-Gm-Message-State: ACrzQf2jpzE5uYR1drKqBIMg5qPgtb0saxJKym2OyG5Eq2RZqBKsW7CU
 DZNN7RDbAM2GKpK4LYP7s4sQECCRPAc=
X-Google-Smtp-Source: AMsMyM5jnGP+IcgIKqAke3C88qggLprRZvJV/z+m0c/IRqDNoZa/PhUj7ktVRnN7muUVuIsfVrbd7Q==
X-Received: by 2002:a05:6000:18aa:b0:22a:b61d:877a with SMTP id
 b10-20020a05600018aa00b0022ab61d877amr7879027wri.512.1663503348946; 
 Sun, 18 Sep 2022 05:15:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m17-20020adfe951000000b0022afddab5dfsm725790wrn.7.2022.09.18.05.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 05:15:48 -0700 (PDT)
Message-ID: <3522dc76-1783-c0e6-7dac-c77f3c6c412c@amsat.org>
Date: Sun, 18 Sep 2022 14:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 02/11] hw/gpio/meson: Introduce dedicated config switch
 for hw/gpio/mpc8xxx
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-3-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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

On 15/9/22 17:25, Bernhard Beschow wrote:
> Having a dedicated config switch makes dependency handling cleaner.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/gpio/Kconfig     | 3 +++
>   hw/gpio/meson.build | 2 +-
>   hw/ppc/Kconfig      | 1 +
>   3 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

