Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C2309C18
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 13:48:54 +0100 (CET)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6C9s-0002lu-Rr
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 07:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6C45-000190-UU
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 07:42:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6C43-0001K0-Ov
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 07:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612096970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+fgSsYmJt0f3GPKQSs64Hq+gfQen9Lha7MbKdEpdgY=;
 b=C9d3ycWZzthtencFEXyBArQqBMFUIM+7Uw84ewvjKbRVfyq5Z9ghtGVuAXWrNOADsQhz2/
 zzvW0siZmrwwjTxSe6jrVP51WOTkR+vRQSOzE5av8eQQ6BqcHv84lseCTMxaog2B5wo2Eu
 CKKznFSaH+lG3e0U0FUT/2APRwF7AbI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-DYDNHma0MlGk84WYeCRQug-1; Sun, 31 Jan 2021 07:42:45 -0500
X-MC-Unique: DYDNHma0MlGk84WYeCRQug-1
Received: by mail-wm1-f70.google.com with SMTP id z25so491087wml.0
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 04:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r+fgSsYmJt0f3GPKQSs64Hq+gfQen9Lha7MbKdEpdgY=;
 b=F0xLaZN4wsUBWxOBaHyLQ6MeOlgPQVV63hGKUND5Ot1OI0+z1YwRHMjplFB4HmWpW9
 EIpaFWwJK0k6IkppI9Ek9uuqRcZB7HCSa34kOsE7E8eEp1c83RnkFaLifWo8D+vlVU8g
 fVCt+6VlcC6EfqyqT8KVlY+vOa9UaB+2QialNFGEKNM2NZ3iLNlopRfWFgSEv+h4g+aN
 I5BXAqYA/94U91U+z6GfabCZZAHjhDZ0EaER/OYQkZF0BUDu5cx90weqkb52CfB3s6L9
 B8I3FuqyRiBV5+iAcAtBUqfMwaJFpYts5ZKXFuPOQXFKqYmDh6jBFbAZyq2Z99SJ7B/p
 sXVQ==
X-Gm-Message-State: AOAM533k+AAc/DhgT32+hxISuDkVENBG+cXqZS3f2utHY4f8XPj4ajAO
 tEdpVnvMf9YNzUCxIdKLiaX/Ky6gwf8uYS4gbQMRJ5qfAgj5wk88BvQ4PP0OkCkDYFx+w1/2v1W
 aR6T4OGwicCEjG/c=
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr13064340wrs.289.1612096964651; 
 Sun, 31 Jan 2021 04:42:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs9GPD9xtKflLpJnbdjV3KK6LBZIj+1CU+JafEN0VHboDucTozFmqLuwCNxpKvag0RcpZQhQ==
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr13064319wrs.289.1612096964476; 
 Sun, 31 Jan 2021 04:42:44 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id h207sm15855648wme.18.2021.01.31.04.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 04:42:43 -0800 (PST)
Subject: Re: [PATCH v6 06/11] target/arm: Restrict ARMv7 R-profile cpus to TCG
 accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-7-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <80af7db7-2311-7cc5-93a0-f0609b0222d0@redhat.com>
Date: Sun, 31 Jan 2021 13:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-7-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
> 
> Beside, KVM only supports A-profile, thus won't be able to run
> R-profile cpus.
> 
> Only enable the following ARMv7 R-Profile CPUs when TCG is available:
> 
>   - Cortex-R5
>   - Cortex-R5F
> 
> The following machine is no more built when TCG is disabled:
> 
>   - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/aarch64-softmmu.mak | 1 -
>  hw/arm/Kconfig                              | 2 ++
>  target/arm/Kconfig                          | 4 ++++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-configs/devices/aarch64-softmmu.mak
> index 958b1e08e40..a4202f56817 100644
> --- a/default-configs/devices/aarch64-softmmu.mak
> +++ b/default-configs/devices/aarch64-softmmu.mak
> @@ -3,6 +3,5 @@
>  # We support all the 32 bit boards so need all their config
>  include arm-softmmu.mak
>  
> -CONFIG_XLNX_ZYNQMP_ARM=y
>  CONFIG_XLNX_VERSAL=y
>  CONFIG_SBSA_REF=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 6c4bce4d637..4baf1f97694 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -360,8 +360,10 @@ config STM32F405_SOC
>  
>  config XLNX_ZYNQMP_ARM
>      bool
> +    default y if TCG && ARM

The correct line is:

      "default y if TCG && AARCH64"

>      select AHCI
>      select ARM_GIC
> +    select ARM_V7R
>      select CADENCE
>      select DDC
>      select DPCD
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index fbb7bba9018..4dc96c46520 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -18,6 +18,10 @@ config ARM_V6
>      bool
>      depends on TCG && ARM
>  
> +config ARM_V7R
> +    bool
> +    depends on TCG && ARM
> +
>  config ARM_V7M
>      bool
>      select PTIMER
> 


