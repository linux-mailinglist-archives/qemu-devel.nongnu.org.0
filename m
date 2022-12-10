Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B33648F94
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:58:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42Eg-0006kO-6Z; Sat, 10 Dec 2022 10:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42Ed-0006gN-Dz
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:57:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42ER-0007Zm-DC
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:57:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id bx10so8038772wrb.0
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UOQPvpqOdAmvIUdpUB/FDn4S/QlWG3hknWaYFBa30VY=;
 b=LsOTCZvVFnz1tjjQBirA0tQRFJgwoeaLsYMLEFek7VGmmBcX+gAxhRVV3GiD3k8qWS
 Yef4+bDfWKru7IlT4ZbAeSGZlCqiCdUs5IyTPK18FJLgwtcDKu6/UsIejPTTiJgBD9ad
 sy9Vcdjay2sppLSRXoisNGJoShqU/H94OHdIkKxAUx6WehV5eeY2SJODvUlpVeU/mPdN
 tPmuv3zzSh++UndIKVoRkOWra4CpmSr0ZWExa2vQPi7ofhBmLltuyBChCFFeWvNRz1+/
 0NlIdtqdlEB2IRaBRp/Wrw2kG8l5W10ylCGtSbSOut18LU9JmJNowLyTxHOkuchgcxgN
 rOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UOQPvpqOdAmvIUdpUB/FDn4S/QlWG3hknWaYFBa30VY=;
 b=qQKnPsZusMnmbg3OjDswkPSIIoCgEoKmVG1SsyfbT7+LrZPC/8dtYiVRwLlH6meZG2
 sxp4ThUgsfvK8u0L0qKgcRUTQR2QqKwBpo0ja68u3GkbF3OVcMUFsmU6uNX7dMhOmSM9
 gYUiQMflmNhw7WPWhn3rrQZeIuLpX98w84ug17gpxN09bVRSDF6bI1mUojLemiWa05N6
 d66nOT68VdwUDLEE5HxYYz10yXbcTndYVZx7LyNWBdCpcsxzFqVyDsMZ3R2A9EH6HxlQ
 6/AlLGrapB87IhOVzkIWtbNZRfIk4FIZTnNkpAi+jPehSWZf4SMsuoSFMI7lU6eSR7sn
 byCA==
X-Gm-Message-State: ANoB5pkpw+JdqE9Rtn0W/lnqlecNmCmKP0DU+px+INxIx/1njEz2fQL1
 M4pGkdM5JnPjvEr7f7r9Ujhesw==
X-Google-Smtp-Source: AA0mqf7eHjzqSQbnJFx8tbE7yLFTENWAFrDfchVB1tMNKSUUmTjUDm9+oEGo674GpXnUjXrnhRXsfg==
X-Received: by 2002:a05:6000:608:b0:242:2875:93c with SMTP id
 bn8-20020a056000060800b002422875093cmr9381439wrb.8.1670687861785; 
 Sat, 10 Dec 2022 07:57:41 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a5d5915000000b00241d2df4960sm4140789wrd.17.2022.12.10.07.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Dec 2022 07:57:41 -0800 (PST)
Message-ID: <03fa0278-c68d-ec12-e7fe-6d93b7897dd3@linaro.org>
Date: Sat, 10 Dec 2022 16:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] include/hw/virtio: Break inclusion loop
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu, edgar.iglesias@gmail.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, jasowang@redhat.com,
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de, Stefano Garzarella <sgarzare@redhat.com>
References: <20221210133915.4104305-1-armbru@redhat.com>
 <20221210133915.4104305-2-armbru@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221210133915.4104305-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/12/22 14:39, Markus Armbruster wrote:
> hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> former doesn't actually need the latter, so drop that inclusion to
> break the loop.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/hw/virtio/virtio.h | 1 -
>   hw/virtio/virtio.c         | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


