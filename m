Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2836460CD25
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:14:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJkW-0004Zr-Ce; Tue, 25 Oct 2022 09:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onJkJ-0004NG-J2
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:13:33 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onJkG-0007qO-Hk
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:13:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id y16so10407020wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=18MAZ578oFY/aR/BXCz5HEv7GcIEgV4rz1YjxSZtAv0=;
 b=JP07SaUOgix5xHB0P56HUUnN0F26KfeAyoDkVPs87WxRAPN6ohxwX70s0cQ3wti6b6
 pwBo7AM6nR8FryOs4GgoKRfRtCiaM4uKIs5W+72AfPK2sXDwZeiK8mQSYquFtjvAUu/T
 eN5YXF90XBRuID7geJYnP2Kj8x4IagbOt6yjtZG72CCtHvLDb2ZBXQhkvfrp19YY7V2s
 EjsSFqdC3VI/v+iih4cPRkhv5Z8/vHswfHXSwgYdPDlRMQE1TRhESd4mJsm6gzO4ZvcE
 1auGaFb8PNex9rw9tYsXLHo/IZeJg22nXu7kquD/bQpDZvfY16jk81JnTMILqS2oDWOI
 leYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18MAZ578oFY/aR/BXCz5HEv7GcIEgV4rz1YjxSZtAv0=;
 b=Gxfp0wYAfgXrCMfhjpY37B0TnwG7D0hws4mv0qLXOLY4RwTjOniyAWBvsQNrXY1zM3
 hhjFJX+oY3Fm3AXpqH+mloOy9wujjjIUpbcBGF6Qguqv50TA3H9N5TrlJmr2CeMjXZmH
 nG5TOBS9ZJWEdz7mh35iy5Kq0qheg0BhLHHlAfUZsUIqrtXu8CpcW3P8YqzDz3gj8naO
 kAa7E2z2ju1OayNL4p1TVJtDQKK6taxoKg/Y8chRgVUTFNMdDHrbzqF0XRIFJbiPfQCF
 INcN5/vvrtwzafJ8GBLQ3qHQBqfSwr0SOPjHpOdLQnJZJKGPIQW9s/9xhBnSua7DexT5
 RhRw==
X-Gm-Message-State: ACrzQf2OaQjI+3oRcPuYPjYH6/06JuHU6epf2orrfO5JBTyMh2bwlVq0
 IgFdJm+mw/oCAEtwqpcl6Y5Wdw==
X-Google-Smtp-Source: AMsMyM6n+wX66RehpvzUqPvJtRhdpWEFmoAfZeUZlTnZlEXNT8CGVc9eHa9N+f2GNjEwvJF5Cnu/mg==
X-Received: by 2002:a05:600c:4588:b0:3c6:f8b2:dd34 with SMTP id
 r8-20020a05600c458800b003c6f8b2dd34mr30039337wmo.178.1666703606052; 
 Tue, 25 Oct 2022 06:13:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b003a601a1c2f7sm12015742wmb.19.2022.10.25.06.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 06:13:25 -0700 (PDT)
Message-ID: <6d4f3fc9-b91e-3978-affd-fbe8e29671c2@linaro.org>
Date: Tue, 25 Oct 2022 15:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] seccomp: Get actual errno value from failed seccomp
 functions
Content-Language: en-US
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <b971585976862e52df4c373286104dd0540be8b7.1666699164.git.mprivozn@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b971585976862e52df4c373286104dd0540be8b7.1666699164.git.mprivozn@redhat.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc'ing Daniel (maintainer)

On 25/10/22 13:59, Michal Privoznik wrote:
> Upon failure, a libseccomp API returns actual errno value very
> rarely. Fortunately, after its commit 34bf78ab (contained in
> 2.5.0 release), the SCMP_FLTATR_API_SYSRAWRC attribute can be set
> which makes subsequent APIs return true errno on failure.
> 
> This is especially critical when seccomp_load() fails, because
> generic -ECANCELED says nothing.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>   meson.build            | 9 +++++++++
>   softmmu/qemu-seccomp.c | 9 +++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index b686dfef75..5f114c89d9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -636,10 +636,16 @@ if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
>   endif
>   
>   seccomp = not_found
> +seccomp_has_sysrawrc = false
>   if not get_option('seccomp').auto() or have_system or have_tools
>     seccomp = dependency('libseccomp', version: '>=2.3.0',
>                          required: get_option('seccomp'),
>                          method: 'pkg-config', kwargs: static_kwargs)
> +  if seccomp.found()
> +    seccomp_has_sysrawrc = cc.has_header_symbol('seccomp.h',
> +                                                'SCMP_FLTATR_API_SYSRAWRC',
> +                                                dependencies: seccomp)
> +  endif
>   endif
>   
>   libcap_ng = not_found
> @@ -1849,6 +1855,9 @@ config_host_data.set('CONFIG_RDMA', rdma.found())
>   config_host_data.set('CONFIG_SDL', sdl.found())
>   config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>   config_host_data.set('CONFIG_SECCOMP', seccomp.found())
> +if seccomp.found()
> +  config_host_data.set('CONFIG_SECCOMP_SYSRAWRC', seccomp_has_sysrawrc)
> +endif
>   config_host_data.set('CONFIG_SNAPPY', snappy.found())
>   config_host_data.set('CONFIG_TPM', have_tpm)
>   config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
> diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
> index deaf8a4ef5..05abf257c4 100644
> --- a/softmmu/qemu-seccomp.c
> +++ b/softmmu/qemu-seccomp.c
> @@ -312,6 +312,15 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
>           goto seccomp_return;
>       }
>   
> +#if defined(CONFIG_SECCOMP_SYSRAWRC)

Maybe add some comment here such:

  /*
   * This must be the first seccomp_attr_set() call to have full
   * error propagation.
   */

> +    rc = seccomp_attr_set(ctx, SCMP_FLTATR_API_SYSRAWRC, 1);
> +    if (rc != 0) {
> +        error_setg_errno(errp, -rc,
> +                         "failed to set seccomp rawrc attribute");
> +        goto seccomp_return;
> +    }
> +#endif
> +
>       rc = seccomp_attr_set(ctx, SCMP_FLTATR_CTL_TSYNC, 1);
>       if (rc != 0) {
>           error_setg_errno(errp, -rc,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



