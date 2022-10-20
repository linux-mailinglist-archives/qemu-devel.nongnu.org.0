Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6ED6068AA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 21:09:21 +0200 (CEST)
Received: from localhost ([::1]:60358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZHE-0001KP-7d
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:24:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYpy-0007k3-KQ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXyv-00058D-Hk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:01:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXys-0008Kk-74
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:01:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n12so35115847wrp.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=prUux7dCJiCpSQqM8N41WG+9JveZiqsx0XtIHNJSeOI=;
 b=jaFAuL50FjUb4dNCc6uxEuLhFiSlBjbIIMrl5lNUnPE9TME2aKFTPT8TGBD/A8irs9
 GzpJkwJhskZBM2o9T5e2y2DPH2jHXNmuiFOUSOO45ELZI5jzGBcTVj7SngD/DAFQbOVN
 8WEstLsD8SK3eS4eyMU0pBOvllUwccS/zO3VsBq1I78sG3rK7qYZ5/TaR590790gNju7
 AriFpEeNpHwUD/BuoPwAOGW8HYCqNdbKB/icqeO2vIivZAChu+LYYSolFeyn+WUs21mN
 //DVqJtAuamzMdVDkC1rnsj2giDfrJRDNyBxw2sSbr/trcBjesXKRs07KP87g1vlvTuE
 Sr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=prUux7dCJiCpSQqM8N41WG+9JveZiqsx0XtIHNJSeOI=;
 b=mxIbop9Ev3jAo9BYGT+C8XCaBuRpKxYDCK3QCtnQjlfcCbcLqsTZ9kRoBdYIOujmYN
 LcAClzaHhUlEiZaUR62xyqN75Gwax5iW+HTC/UOb5Jo8gLVQrzsOQNCSMKCyieFkHWu3
 DU7ok1Wl5xRmvGqUCMwdn0Z16bnDpxb/IYY7X9TBmkp5YZ2524BxIiCpcxepvdsE01gK
 YOH6M59oSEX1hUUYjIoQKQFHdzhBzFz8VNcocs2dYgZ8AtfFy515LzcKofsRe0XRGfxM
 C/twQgriGx3BbP0MjpESMTJ8bYzpYFYZDS4PIVwGrk2JNdcuGDJtBoTokQvXJ6C3WkDp
 4hTw==
X-Gm-Message-State: ACrzQf2n75YfzF7SxiMUiPkr2S9denkMhOKPfPyfU+qZXgyUxJNmS2nK
 sZ+4DBVnujtj+o++MzmxCr4iRmKf4zrwBTlU/Qw=
X-Google-Smtp-Source: AMsMyM6fVdPnI3RQh7pqU0tyTHfTkjROGgFpnMcNn/6qcefj1U+CW5kfpJ2ztHXVYmmSq+wOC6RedA==
X-Received: by 2002:adf:e549:0:b0:230:6d12:fc84 with SMTP id
 z9-20020adfe549000000b002306d12fc84mr9142625wrm.64.1666281672587; 
 Thu, 20 Oct 2022 09:01:12 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b003a3442f1229sm205769wmq.29.2022.10.20.09.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 09:01:11 -0700 (PDT)
Message-ID: <2990a4a4-73b4-cdb9-e931-59609e14a009@linaro.org>
Date: Thu, 20 Oct 2022 18:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 15/26] MAINTAINERS: add entries for the key build bits
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-16-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 13:51, Alex Bennée wrote:
> Changes to the build files are a bit special in that they usually go
> through other maintainer trees. However considering the build system
> is the root of everything a developer is likely to do we should at
> least set it out in MAINTAINERS.
> 
> I'm going to nominate Paolo for meson stuff given the conversion was
> his passion project. I'm happy to cast an eye over configure stuff
> considering a lot of the cross compile logic is in there anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> 
> ---
> v2
>    - s/Odd Fixes/Maintained/
>    - nominate more reviewers
> ---
>   MAINTAINERS | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3d5b7e09c..6a6f4d62bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3764,6 +3764,30 @@ F: docs/about/deprecated.rst
>   
>   Build System
>   ------------
> +Meson
> +M: Paolo Bonzini <pbonzini@redhat.com>
> +R: Marc-André Lureau <marcandre.lureau@redhat.com>
> +R: Daniel P. Berrange <berrange@redhat.com>
> +R: Thomas Huth <thuth@redhat.com>
> +R: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +S: Maintained
> +F: meson.build
> +F: meson_options.txt
> +F: scripts/meson-buildoptions.*
> +F: scripts/check_sparse.py
> +F: scripts/entitlement.sh
> +F: scripts/symlink-install-tree.py
> +F: scripts/nsis.py

