Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B7355B581
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 05:15:37 +0200 (CEST)
Received: from localhost ([::1]:42382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5fDs-0004R3-9h
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 23:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5fC0-0003el-Ok
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:13:40 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5fBz-0000Hx-2u
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:13:40 -0400
Received: by mail-pf1-x429.google.com with SMTP id n12so7793859pfq.0
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 20:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=nhfT/J10ChbggGVkDnIIRP+RUqJ6RSdJr7ythrGzhCE=;
 b=paVDaSsBpskJEyq3vLRfocOM5zGIBnfmCqCTJahVuY4oABv9ZGety9k/YZ9OKHc9tH
 9kWBJ6KuO/9hUq5g9oLldaJSG5clEghx1dGRU8qACrgWYsppWLVReV6UovtoEZQ0KmZ6
 VYUMvCwScp93HoPgMPAWwTenQm8qoMNLDUF2Eo1C5WSwFNx+v+tCSFNCDRr91bVx8d1n
 j87QOo2crciRrPz2Zyrb1K9NOXpErgX0/srZfXjwOzvtDvIqMuGFfS1HfmZp7IGyadew
 Ku7VfYhxUbIMHfepQohiWVHATQjrlzig4JFW6x9s3oYu/+EEYMXh8ww625fXEas7XRag
 /+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=nhfT/J10ChbggGVkDnIIRP+RUqJ6RSdJr7ythrGzhCE=;
 b=5Xz102xa2obJPLmra9yA8ZSWY99HoaPMtHdmS9nm5d5JuKvKPU2izbK5fj2a5shPGq
 owmdN4w6r2n1iRPGT+eK1ZHrPgEVddxdW5J48HpfhMWRiEPbpIKdFn9faPQr4jsZWvAs
 4/+2fvsWckAAS5YA+Ebe8tJz9mvB7vZn8BTBPR42+p8VM+DouAH/2nyddOCjbNQ+GNOn
 Mtyi5ZKh3X4tDJk2jtLU05GYKMFnp3Tow4MwrgqkfyJVh1vJWQdeDeY4rACXvO8vcS5M
 Ek/kWjWRMjPdzPar1OXjnSA13vO4R2LLVsnpzZ5BsRuLu6VRW8m3rc8TBhmLr03pLHJC
 ying==
X-Gm-Message-State: AJIora/uwM0ERoyacAOvARiGtZHycOEcSHE3yEquNg1SWRHMx6wU2IUv
 XdS6kVLO1Qrx1xMmIjX6z53B1w==
X-Google-Smtp-Source: AGRyM1vWttm5AOj++DxZ7fBOLLYOz7SojXiq0d0jM2DvLepkxPLWK5A1aZNXaN1JCD+ysdQepWoyhw==
X-Received: by 2002:a65:6c08:0:b0:3f2:6a6a:98d with SMTP id
 y8-20020a656c08000000b003f26a6a098dmr11100762pgu.30.1656299616799; 
 Sun, 26 Jun 2022 20:13:36 -0700 (PDT)
Received: from [192.168.44.231] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 k63-20020a632442000000b003fd3a3db089sm5799697pgk.11.2022.06.26.20.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 20:13:36 -0700 (PDT)
Message-ID: <7ad664fc-ca40-e446-028f-47ea1fd1c21d@linaro.org>
Date: Mon, 27 Jun 2022 08:43:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: virgl avocado hang
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Mark,

> +    def test_virtio_vga_virgl(self):

> +        """

> +        :avocado: tags=arch:x86_64

> +        :avocado: tags=device:virtio-vga

> +        """

> +        kernel_command_line = (

> +            self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"

> +        )

> +        # FIXME: should check presence of virtio, virgl etc


This little nugget really must be fixed.

The observed behaviour is an indefinite hang in avocado, waiting for qemu, which is in 
zombie state.  A manual kill -INT to the parent wakes it up like so:

  (159/184) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl: CANCEL: VirGL 
not enabled? (1264.25 s)



r~

