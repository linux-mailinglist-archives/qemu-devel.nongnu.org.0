Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA4640106
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 08:28:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p10Sj-0002ol-8A; Fri, 02 Dec 2022 02:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p10Sa-0002oL-47
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:27:48 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p10SX-0004ek-Dt
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:27:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso3566066wmp.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 23:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3aB0mnOQ+ZWhak1nLkfu9FqkmgJit9mNfH8A6i2La4=;
 b=yG712CVpxij29FVeedIFV5f4Sda6349it4wloq9uXkPmF+kxUEjMmriknqlV6jZLZp
 jgctrIRqBlaJpxDb1MdhYBr9EPam+GUxXWeewGe/PHrGm/9YP2SmY2aUGsjYEg+86+sT
 OpO9auSJocldxlADDXZzuqiis9SgZs+WTthpMSqDIsvSemQT9lu1l0Qxyh1o6NsQInu6
 eVe1dlOynNiIPJKN1XOIyRp7ZD5f4LJdDPPPRXV0iE5oy2t8EQQdcf2YOuTr0tr9iPb8
 qOa3la7e2mWgHQbKUan2ZY+BaNLMm7Tqt4vfDyXIhVqC7yB7LA8XBlh18DcBFRMD+8F/
 Ku8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3aB0mnOQ+ZWhak1nLkfu9FqkmgJit9mNfH8A6i2La4=;
 b=u0EZ/TRtQiOzCgEcMThlD8naBmQcEqlFRVzM75Q34pezaycg1Z2uL6HOJAxHy5OC8b
 jWY7gkDikohLduMPSNteYQJAPOdOts2lqyzHHZ4zDkjghI3zjFWHQtFa8fwGdNK6zSUR
 6372qAbLq7tF4Kwy/ckpnvphXviPflDQLUlMez24MbiupIbcv6xmz2/BXN4cKVnoyqu1
 4COQoFeKNimu8A9EqWe85o40m5+2no1TXI/Mp4bm72zcKepx2aLdbdK3WraeQIRRwIDf
 x9CDN8RRIr6+YJt5HgqS3NmWJeQy8m3MQHulN2G8QNKqqFFNBquXX0/P9o6KbY67bnx8
 yCBQ==
X-Gm-Message-State: ANoB5pnb/xTyP2Hl+QWYZY/r4J472xfIpAiDT/nUcY5FH9uNTrfwjTc4
 1lQZyq+eIG039NjaXRHO9XP1+A==
X-Google-Smtp-Source: AA0mqf4Pv2F57J6qsiF3Ay5oqePGdDmBDyK04oa/2DfZ1Ogn7g2NjAIFUFxPtvHmjc5ytZPSBTTeiQ==
X-Received: by 2002:a7b:c2aa:0:b0:3cf:5d41:bea1 with SMTP id
 c10-20020a7bc2aa000000b003cf5d41bea1mr39428515wmk.118.1669966061821; 
 Thu, 01 Dec 2022 23:27:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003c6cd82596esm13400449wmq.43.2022.12.01.23.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:27:41 -0800 (PST)
Message-ID: <e7922267-9a87-8936-942e-e73a789672f9@linaro.org>
Date: Fri, 2 Dec 2022 08:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 07/11] hw/xen/xen-hvm-common: Use g_new and
 error_setg_errno
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-8-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-8-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
> Replace g_malloc with g_new and perror with error_setg_errno.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   hw/xen/xen-hvm-common.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)


> @@ -717,7 +717,7 @@ void destroy_hvm_domain(bool reboot)
>       xc_interface *xc_handle;
>       int sts;
>       int rc;
> -
> +    Error *errp = NULL;
>       unsigned int reason = reboot ? SHUTDOWN_reboot : SHUTDOWN_poweroff;
>   
>       if (xen_dmod) {
> @@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
>               return;
>           }
>           if (errno != ENOTTY /* old Xen */) {
> -            perror("xendevicemodel_shutdown failed");
> +            error_setg_errno(&errp, errno, "xendevicemodel_shutdown failed");

See "qapi/error.h":

  * = Passing errors around =
  *
  * Errors get passed to the caller through the conventional @errp
  * parameter.

Here you are not passing the error to the caller.

Maybe you are looking for the "qemu/error-report.h" API?

>           }
>           /* well, try the old thing then */
>       }


> @@ -857,16 +857,17 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
>                           MemoryListener xen_memory_listener)
>   {
>       int rc;
> +    Error *errp = NULL;
>   
>       state->xce_handle = xenevtchn_open(NULL, 0);
>       if (state->xce_handle == NULL) {
> -        perror("xen: event channel open");
> +        error_setg_errno(&errp, errno, "xen: event channel open");
>           goto err;
>       }
>   
>       state->xenstore = xs_daemon_open();
>       if (state->xenstore == NULL) {
> -        perror("xen: xenstore open");
> +        error_setg_errno(&errp, errno, "xen: xenstore open");
>           goto err;
>       }
>   

Ditto.

