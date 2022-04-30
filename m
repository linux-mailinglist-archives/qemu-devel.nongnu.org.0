Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF73515D08
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 14:49:42 +0200 (CEST)
Received: from localhost ([::1]:54206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkmXd-0000xH-9W
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 08:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkmVg-0008HB-CK
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 08:47:43 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkmVe-00087K-HT
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 08:47:40 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v10so8430358pgl.11
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=lpPYvk3ivGGEdlTLcl8bZGoD5/aaM+foSUucffACUe0=;
 b=n6kmIVvgDSzOMTZ2D1PxhMitOF9J0Y2PUi5vjDholWjKvBiIKeJh/1Df4m29ZqfYQr
 TtFWmhYCwXahqLmuAwoxPBe9K5++kyZSXD4a9rWu4i7D0+yyKXCiI8/ZFlOE/6A0HSD2
 sa2418lyCbsrbSwOW4HesGqYjgg6CuhKTZd5E9idCKOmKPG3U4TCSu6LA+NB5Zh9RVk9
 DUYW9bfk96Q+IheAq0obsYhdYyivHu2IhtsppVJJaa2YSWt8bEyC98XntUlji2QMZu/R
 kicLkKiDZ3aCjGadGhco1Kp4jkRsB2V0Pn/mEHa8MFwMijZutSmKQaz2mK93ETY0HVU3
 oJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lpPYvk3ivGGEdlTLcl8bZGoD5/aaM+foSUucffACUe0=;
 b=3u2DKY1TwfxFMTCTJwHJkoJfRo9cAnabkiPfzRFZUG+oAUwTyqry/u6Pgt/8cunl6a
 DDZ91Z3tB4hx/Rer+47qFghfbIx23EKYSfPL1fkYDt7Q4vv4m3jQ4U6eK1FZN1BdXUzC
 w3BO5+TbCWgaLsBEphYBcwxxpCN17cjU39EUtkL3CJZJOTWo7Uvgsme2hSbjXRE179Ds
 TdcIG2WHQQnRoY8C7JiCM935kAJaVZ0a23NL1tQ82joBkvgPEVuNv9rWOCa80+PyTl3Z
 UmPd9Zdjnk/p60tXgiseHhnTqYJG85NDyL5oTIQiRq/YSSia2+yOkvGKJB5i47WQHmZ9
 ybWA==
X-Gm-Message-State: AOAM531exxOx9N7VY3ys3D6PmATXvJm9qYiaAPoxwiPxXuFJjCOlu5F9
 lqSDo//kUDEHDdcPprc2CFjARA==
X-Google-Smtp-Source: ABdhPJzlC858YxqLfGIildDTte/bl/323VJEHZyPXXxG9u4yYeBYBKA2VIGy7NRF8wHzSqVNhRGN5w==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id
 l15-20020a056a00140f00b004e069959c48mr3368794pfu.59.1651322856974; 
 Sat, 30 Apr 2022 05:47:36 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a1709026b4900b0015e8d4eb23csm1391127plt.134.2022.04.30.05.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 05:47:35 -0700 (PDT)
Message-ID: <f7b03b95-697d-71b8-0c73-e31ceec7ef83@linaro.org>
Date: Sat, 30 Apr 2022 05:47:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 00/25] Misc patches for 2022-04-29
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220430092522.440466-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220430092522.440466-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/30/22 02:25, Paolo Bonzini wrote:
> The following changes since commit 731340813fdb4cb8339edb8630e3f923b7d987ec:
> 
>    Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu into staging (2022-04-29 08:46:55 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 189fad0006dd4f2f336e05a99d981cc1ecab1b33:
> 
>    pc: remove -soundhw pcspk (2022-04-30 10:10:05 +0200)
> 
> ----------------------------------------------------------------
> * WHPX support for xcr0
> * qga-wss fixes
> * Meson conversions
> * Removed -soundhw pcspk
> 
> ----------------------------------------------------------------
> v1->v2: fix WHPX build
> 
> Konstantin Kostiuk (2):
>        configure: Add cross prefix for widl tool
>        qga-vss: always build qga-vss.tlb when qga-vss.dll is built
> 
> Paolo Bonzini (22):
>        meson-buildoptions: add support for string options
>        meson, configure: move Xen detection to meson
>        configure, meson: move iasl detection to meson
>        configure: move Windows flags detection to meson
>        configure: switch string options to automatic parsing
>        meson, configure: move --tls-priority to meson
>        meson, configure: move bdrv whitelists to meson
>        meson, configure: move --with-pkgversion, CONFIG_STAMP to meson
>        meson, configure: move --interp-prefix to meson
>        meson: always combine directories with prefix
>        configure: switch directory options to automatic parsing
>        meson: pass more options directly as -D
>        configure: omit options with default values from meson command line
>        meson, virtio: place all virtio-pci devices under virtio_pci_ss
>        configure: simplify vhost-net-{user, vdpa} configuration
>        build: move vhost-vsock configuration to Kconfig
>        build: move vhost-scsi configuration to Kconfig

One more failure, in the centos-stream-8-x86_64 job:

  ERROR: unknown option --disable-vhost-scsi

https://gitlab.com/qemu-project/qemu/-/jobs/2398420231

 From the patch description for vhost-scsi above, it looks like you merely need to edit 
the gitlab ci file.


r~

