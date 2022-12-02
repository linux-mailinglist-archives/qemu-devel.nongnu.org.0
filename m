Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB76400E9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 08:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p108l-0004WF-7K; Fri, 02 Dec 2022 02:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p108i-0004Vo-S8
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:07:16 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p108h-0000Ys-7A
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:07:16 -0500
Received: by mail-wr1-x430.google.com with SMTP id f18so6444697wrj.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 23:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EcqQL/ZizWrnpHMjGdFtp/KhnA24UId7fItCFmRMZA4=;
 b=v2OGdm3x+NHQ4qE7XEZ3WD70Oeb+Wv2Tf6PpV0ciBflZarn5rlDT+GrVmyRGH3yrUc
 jRKjPkO9Y7EZwNHbA3HlJopmPCSLg1k6IM96LQRU67DHehqz+JMtqfHq2plXw1sor6ZJ
 XZmHxEhQCgswkxikESobGazqXlneGvNKaSDnnigEGCcV3vjHf4AXzyOemsmRZ2q6VkJt
 CiNuCap9XUSDnv9ixKXRJ+1QhKZx1qOAJZ3uXZytLFnjT3Pi5gwf4uo1yzpSLxm/6ayy
 TJ3hFqJ/rNPMkFybwp7OrzEPaNfhxuEnGMAMbQWYd89H1kDS3RjChNn+S9KXTnkhSlTe
 a6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EcqQL/ZizWrnpHMjGdFtp/KhnA24UId7fItCFmRMZA4=;
 b=I4HEjMWHdQJAT2gad7lQuIcvtdq5eTRl8maMf2a6fGsKJk2JTluoOQMmJjsx+/wB2R
 e8KUqZb0/XghdpwNgss9bv1QB6hW8XgMzoNU/8TmtDz8ZN+tB9b0sldB1CjxZ142U0Wi
 PF51L+Ddi7Okoc7Npdk4pgmqJX7J0qtEcPSjMnG3CFgbvlI2u0Ia5J+i6BsHiyMUg/sH
 R5UveoZyy68HXIjVbJZ7EbTEVTrgBGqzWVt7T41g2uaBex51K8NZoRVqKL4kGgMcjxHD
 LcdrEFFb4aXuJg3nqB36ETdhA+TeiiFJwLFR7sxLjeHVfgVFmQtBZYAjKRf/3lVjcvaL
 f+Ew==
X-Gm-Message-State: ANoB5pkE8QIl8oNQs+oZyZSinIZfwg3DYUEn3dy4wIvdw/Id2Sid3Ldr
 ZvklZ5d+IeWaD/BDlTKpJckh8g==
X-Google-Smtp-Source: AA0mqf58bRtPu7gG0d8EAP4vIVJyFeK01H0sUh15HI8xUl9C9vICGdlkwIobwLyY6GU41CY4qopnfQ==
X-Received: by 2002:a5d:4d51:0:b0:242:1bad:6f79 with SMTP id
 a17-20020a5d4d51000000b002421bad6f79mr13790807wru.342.1669964832241; 
 Thu, 01 Dec 2022 23:07:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e14-20020adff34e000000b0024228b0b932sm7589601wrp.27.2022.12.01.23.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:07:11 -0800 (PST)
Message-ID: <a124e139-7072-7290-93fc-da22c6a0758c@linaro.org>
Date: Fri, 2 Dec 2022 08:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 01/11] hw/i386/xen/: move xen-mapcache.c to
 hw/xen/
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-2-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/12/22 03:59, Vikram Garhwal wrote:
> xen-mapcache.c contains common functions which can be used for enabling Xen on
> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
> accessible for both aarch64 and x86.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/meson.build              | 1 +
>   hw/i386/xen/meson.build          | 1 -
>   hw/i386/xen/trace-events         | 5 -----
>   hw/xen/meson.build               | 4 ++++
>   hw/xen/trace-events              | 5 +++++
>   hw/{i386 => }/xen/xen-mapcache.c | 0
>   6 files changed, 10 insertions(+), 6 deletions(-)
>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
> 
> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> index 213e2e82b3..cfdbfdcbcb 100644
> --- a/hw/i386/meson.build
> +++ b/hw/i386/meson.build
> @@ -33,5 +33,6 @@ subdir('kvm')
>   subdir('xen')
>   
>   i386_ss.add_all(xenpv_ss)
> +i386_ss.add_all(xen_ss)

Not needed ...

> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index ae0ace3046..19d0637c46 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -22,3 +22,7 @@ else
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
> +
> +xen_ss = ss.source_set()
> +
> +xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))

... because we can simply add in the softmmu_ss list at the beginning
of this file.

Otherwise LGTM.


