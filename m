Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C48B686161
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 09:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN8G4-0007gl-W7; Wed, 01 Feb 2023 03:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN8G3-0007gK-4I
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 03:14:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN8G1-0005cN-Iv
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 03:14:18 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so724904wma.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 00:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F/Vw/HJ9804TPjURiNeMztP8GKmGdQ0ZmBWYFwpo6sU=;
 b=ZlfifIyYcmm5osq4qaA8KWeuTssdtaKbzI/RxY9BNRRxJdulfcKxI6RCF67Sg0HEjw
 33uA6ueES666tBkvQCRFXxSvGDmvKPpm1fofdsA9pYbDV06C1SHaIWzRvFMYn3xxiDSM
 2u10WnEyeMXV3flwSzSHXkW7fSmEtnqJVAZqAZuPnbvviJdQ4txp6BhDTvSN61betrMk
 mlh/AsHTHef0/Z28IwContLr5JlV5ActEY7xbeQnVaEhOkQL9MIWfvL4kZwMfbvzSCkf
 M+MEaxrJ5eDEeZHZnp/PLfC2Gc9dsHb2pnOUk+P9G++yvtD0Z7tfP5+HJPpC7v0UcH+C
 jdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/Vw/HJ9804TPjURiNeMztP8GKmGdQ0ZmBWYFwpo6sU=;
 b=54CgeGxQaM7aBmAxdYimFVTXo/e3rZ5XGvIz45ep5yrvFEohczd8E0nkBnUVuBNE36
 YLWSpjLm8dlmwhCcwi+O0IHUB8NOV/yia5GuYP9YYraZGeaEDwFnWHA/MJtUQoOzjbNs
 +AFCNIrBd0Uq7ZMvwU0gonJV9txtBtfFRu7+IiKHyHJSAo5sb1P/+80fjxoirRLv6IC2
 wnJxx4E8D2BOnp1rIezZr6XrEfxlmZccv5ltCh+KV4Zw55/OxEGegbKdfCQal6d3uDSs
 E3xK+TOsfrp/DdOXaqWC3BQHojOqqvWUeMF2QFji3Q29vvNSH6vxZkSM2cfi3hH9V5OG
 zevA==
X-Gm-Message-State: AO0yUKU/b2S/2IjDI3j6pv/EU3UnW0zdLQVEj2MDSn8vVBSciOQkKFCe
 3OBphtioQbU/6iN0EPDnGE8=
X-Google-Smtp-Source: AK7set8FYyYat2mEAdrY3TWWOr2r1XU7G6WQmgtbej6WHPHtT9bkmmiNACZfL1ZRdyn4QWCiJ9vWCg==
X-Received: by 2002:a05:600c:4e09:b0:3dc:4633:9844 with SMTP id
 b9-20020a05600c4e0900b003dc46339844mr1219238wmq.17.1675239256096; 
 Wed, 01 Feb 2023 00:14:16 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c17d500b003dc5b59ed7asm908852wmo.11.2023.02.01.00.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:14:15 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <38dbb7bf-91aa-8254-728e-53001a4f0439@xen.org>
Date: Wed, 1 Feb 2023 08:14:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v5 06/10] hw/xen/xen-hvm-common: skip ioreq creation
 on ioreq registration failure
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-7-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/01/2023 22:51, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails continue
> to the PV backends initialization.
> 
> Also, moved the IOREQ registration and mapping subroutine to new function
> xen_do_ioreq_register().
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   hw/xen/xen-hvm-common.c | 53 ++++++++++++++++++++++++++++-------------
>   1 file changed, 36 insertions(+), 17 deletions(-)

Reviewed-by: Paul Durrant <paul@xen.org>


