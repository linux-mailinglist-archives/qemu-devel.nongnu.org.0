Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42435BBAB9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:41:52 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfZP-0003Vq-UH
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfXR-00012h-UZ; Sat, 17 Sep 2022 17:39:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfXQ-000889-H3; Sat, 17 Sep 2022 17:39:49 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so1929089wmq.1; 
 Sat, 17 Sep 2022 14:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=UuxlmufKDaO+uVhqh434cR8OZGtikvtxCDQMwyzPUDg=;
 b=VNJkQefiZ8CtsVmyF/p0QFLF9afGazBT24Og6lL6U+0jm/ABVUFt2C9T7VeQcOTH1y
 bCAxUfca3sJdfduGFWYtQE07kDzw8UdREKg4SzRiWX/3edcUWApA3lRpsfbsrt5n9a+C
 DWiYNSuywVbl+AOWYctjMBB46x6KKWXMX8wBeO8yv5T6kGeUZ0g6Wv9zsRF+L3yIf8Uh
 Zave+cjPU2gUI6NCyDKt5KAS9IEVEKFsFyFAmZEiqFdweiJ6GldwxCq8MMXVzRdDo4iC
 jLUwOYU/P1RA/fRTnZuL86YRQ/WgKIre9EKcs5N+iT9Rd53pYQ3Vzb27ag2kaf8DZQ//
 2J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=UuxlmufKDaO+uVhqh434cR8OZGtikvtxCDQMwyzPUDg=;
 b=ylomVk/4d0xa5poQyISm55ghG/cQZlpj1gWrWUs10icbHDPWrFyh2ovuifsFfkZCtn
 j/POVGgFK29Uo5LrkF72xyTr7LOHgvHbC3pOER9phv8nNzb9zrs6D6DnmU3eK62Ri6rD
 RA/pv39XiTpOTuixe9uRbjHc+WlmiGwNN8WOnOFI3E7wvu6z61ynDhCBPEYAwCdqgsLO
 M9BLD9bpLBLiMMFQmWxblunmNSjv8ybAKW5ALjgpz+DVZdaFLpzaoOWcNNSvYrge1HGR
 Oby/Rg0ZKCCLJkv5kcY76+xvypdLprdt9PFlU/idwTWLH5gQxzkOrndGs5wryUevyQ1D
 p0mw==
X-Gm-Message-State: ACrzQf3OzDr8/5wqM679KY3jBEyQ+711Z7OJWvC5RhoxPQfxkX2DzrhZ
 iwMDFEy333/fIOwuFFZjtv0=
X-Google-Smtp-Source: AMsMyM4VEzNjWX+DIvRxsRDeKWviiS3epJjRpOEM+YnLjCI5zY7u4P4YPCVZcwzu2u1ARLSCnLzOvg==
X-Received: by 2002:a05:600c:33a8:b0:3b4:874c:f48f with SMTP id
 o40-20020a05600c33a800b003b4874cf48fmr7392003wmp.131.1663450786853; 
 Sat, 17 Sep 2022 14:39:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 185-20020a1c02c2000000b003b482fbd93bsm7096378wmc.24.2022.09.17.14.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:39:46 -0700 (PDT)
Message-ID: <9af8b91d-92d4-7e6e-2c8c-34bc29859d46@amsat.org>
Date: Sat, 17 Sep 2022 23:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] scripts/ci/setup: Fix libxen requirements
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20220914124153.61017-1-lucas.araujo@eldorado.org.br>
 <20220914124153.61017-3-lucas.araujo@eldorado.org.br>
In-Reply-To: <20220914124153.61017-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

On 14/9/22 14:41, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> XEN hypervisor is only available in ARM and x86, but the yaml only
> checked if the architecture is different from s390x, changed it to
> a more accurate test.
> Tested this change on a Ubuntu 20.04 ppc64le.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   scripts/ci/setup/build-environment.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> index 6df3e61d94..7535228685 100644
> --- a/scripts/ci/setup/build-environment.yml
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -97,7 +97,7 @@
>           state: present
>         when:
>           - ansible_facts['distribution'] == 'Ubuntu'
> -        - ansible_facts['architecture'] != 's390x'
> +        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
>   
>       - name: Install basic packages to build QEMU on Ubuntu 20.04
>         package:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

