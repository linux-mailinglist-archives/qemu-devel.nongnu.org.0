Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBE9481D45
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 15:49:15 +0100 (CET)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2wjx-0004Wa-8s
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 09:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2whU-0001zo-Oy
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 09:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2whT-0001ZL-CT
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 09:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640875598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMrKXo7xkCpLD4GNZ+ajbcGDV/Mzs/7dS6YnmXW9hF8=;
 b=CfVQFr9humH1qcSKLEZoka9e64WLGzf4wxpoDO30nMY3XWMF6FA1rW6f+nrnhxpwp8GyS0
 qC/v7TQ8kHfhWr6i2d3vgkvU9XWJ7iRxY9pgqmt9jJmLHrGMe8MuDOoFROJtVfqHvO60hg
 5qSeT1a80XWfiUZZus8Il9oz54MhzJs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-fyAartHHO3uQIb6XZky4eg-1; Thu, 30 Dec 2021 09:46:32 -0500
X-MC-Unique: fyAartHHO3uQIb6XZky4eg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so5002024wrh.23
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 06:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kMrKXo7xkCpLD4GNZ+ajbcGDV/Mzs/7dS6YnmXW9hF8=;
 b=V3SNRWpZFWwYZRqVzmaZmFl1PBOPiL8QJPsPmTpSHxBmu4dZEDPVYaPaC8FE9Drf24
 02clZLfh/ERDNezjd32k6hB+DLEIhBwuqoqvZ6DNGirN4VgGljNnG5Jrg1sftKWRIB8r
 N4tUV5Ou+IrMOimxMJ8Imzxp/1Lbw7NRjkSpkFvXevn0cPheJuXUkXxzdz/dOXRjcOjC
 /RXWfUft/RoKevYkag5pctupYmAmglrds56OCpEMl5bvydN8rSUIh0R1aDG6yACitveq
 LyI7L5AMjTUt3vvYPZi7hnOz12wxdbrnVjsn6vtgm9lMZtmuDwEi9tNXo0LKVi2nDVth
 l+Bg==
X-Gm-Message-State: AOAM530jz2cvUss7MybZqdt02Q3DQZweQKXcHMK8TwJ/dphqLplK7UY3
 dwddp7rteTwCPXpLgEuMkOKZsAFPP5F8Ec7IrQONaCvUghTUI5nzG1HvtpeZEPAfd4g98HS6jCb
 MA0kmBrATxcNAirE=
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr26727586wmg.62.1640875591412; 
 Thu, 30 Dec 2021 06:46:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTh0Cqw1A4+rQmVnp8vblZpwCTEv8fj5GTKJAbENF9W2OZ2aAjlQNLNoHEIKpsl6ZeQ4IV7A==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr26727565wmg.62.1640875591135; 
 Thu, 30 Dec 2021 06:46:31 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id bd19sm26348672wmb.23.2021.12.30.06.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 06:46:30 -0800 (PST)
Message-ID: <faa025d1-0c8f-b0ed-74d6-575c008edd84@redhat.com>
Date: Thu, 30 Dec 2021 15:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/7] crypto include/crypto target/arm: move sm4_sbox to
 crypto
To: liweiwei <liweiwei@iscas.ac.cn>, richard.henderson@linaro.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
 <20211230143058.7352-4-liweiwei@iscas.ac.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211230143058.7352-4-liweiwei@iscas.ac.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/30/21 15:30, liweiwei wrote:
>    - share it between target/arm and target/riscv

"Share sm4_sbox between ARM and RISCV targets."?

> 
> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
> ---
>  crypto/meson.build         |  1 +
>  crypto/sm4.c               | 48 ++++++++++++++++++++++++++++++++++++++
>  include/crypto/sm4.h       |  6 +++++
>  meson                      |  2 +-
>  target/arm/crypto_helper.c | 36 +---------------------------
>  5 files changed, 57 insertions(+), 36 deletions(-)

> diff --git a/crypto/sm4.c b/crypto/sm4.c
> new file mode 100644
> index 0000000000..1cdcb8a620
> --- /dev/null
> +++ b/crypto/sm4.c

> +uint8_t const sm4_sbox[] = {

Please explicit the [256] array size.

> diff --git a/meson b/meson
> index 12f9f04ba0..b25d94e7c7 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
> +Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da

Unrelated change...

Otherwise (without the submodule change):
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks,

Phil.


