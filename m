Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DF4606016
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:25:14 +0200 (CEST)
Received: from localhost ([::1]:58874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUbl-0005ej-RF
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:25:10 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUH2-0001eD-0v
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTMm-0003lv-Cf
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:05:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTMi-0003D1-EH
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:05:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id a10so33719600wrm.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k5OMfOF+gS3nVw6PJtVCPK8dnzLUIJZIwge4jOXVGaY=;
 b=Q3uI8GXwyKyIP/hJ8ICeZ90o8G5KP1HxNrbJKqV4bZijJ9NAYQLz5Has63oHv/UY0F
 TPgIPIu9gMaj0LwIjn47ASRYx/5Ijuz/woJVxhwg6Kk0WQSWfdrgWDFj+jE4nIaltvwZ
 F1PVBCaizepN29HktXcKcuUddH/DLLChsqmkQ+eF1PvRA6RAwKuifOo3bQ0ky3UF/j6P
 K/o4h+bgwux1xZNXunciRNvmAm0U5fD787zpFYclAugl4w00MRKQJ8+1z5NMFz6ebaX6
 8MYrphl+jyUh4Crsr53ot53E3wKsktc/hBqoUKtTQwEnN7U9CO64gShtDjrPnvXZrVVa
 Y7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k5OMfOF+gS3nVw6PJtVCPK8dnzLUIJZIwge4jOXVGaY=;
 b=1duy/HM21FfB+SRGnP+1VD4iE6j33r7vUQsUfgYJpopVGKK6gFO5uWD32QbAasXCKw
 wBhwttXmTpU2K1pATu9SYTl5wdI8T/v3c7+FEERpAKzNuFuRSCanXvh5C9w1FE89lvx3
 IV8T+3kVIknlxxHxCX/m5PeSsc2NEgn9+BIIHlnqBonoPXMK2DgXxP8a5uy0Sr6wEcgG
 IKrdc2a20bhxQGVP1LwNuruUhZHIsnANUanCpuHsOjevqvwVQIw8xWm+AZ6LapOUGvtj
 f2XUISffvApQ6bTFh+Nu2wfBcQsGzVH9NwbPEiGtwyF+3XelX0SBh0C1fbQGrcPX3guy
 E9Ew==
X-Gm-Message-State: ACrzQf2vlJ7zW5m0N9XZMyjWEgdEl7HtjUr6UFeyg9jaqjJ+FdoGE9kS
 1pKjcS5PzCCD368ob4WZGw1zIA==
X-Google-Smtp-Source: AMsMyM7gylTucNUFEga3J9dhpDrprY9hwVzIWXDjPCT/TC8wr/MH8Kg0yCzIyLZ5QQ9FJN6bsVX6Vg==
X-Received: by 2002:a05:6000:1565:b0:22f:1407:9bfd with SMTP id
 5-20020a056000156500b0022f14079bfdmr8099685wrz.620.1666263930079; 
 Thu, 20 Oct 2022 04:05:30 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 s9-20020adfdb09000000b0022cc6b8df5esm2545875wri.7.2022.10.20.04.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:05:29 -0700 (PDT)
Message-ID: <86d3bbf2-375c-801c-1576-60eeddad6178@linaro.org>
Date: Thu, 20 Oct 2022 13:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-16-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-16-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 20/10/22 11:16, Laurent Vivier wrote:
> Use QIOChannel, QIOChannelSocket and QIONetListener.
> This allows net/stream to use all the available parameters provided by
> SocketAddress.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   meson           |   2 +-
>   net/stream.c    | 493 +++++++++++++++++-------------------------------
>   qemu-options.hx |   4 +-
>   3 files changed, 180 insertions(+), 319 deletions(-)
> 
> diff --git a/meson b/meson
> index 3a9b285a55b9..12f9f04ba0de 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit 3a9b285a55b91b53b2acda987192274352ecb5be
> +Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18

Probably unrelated submodule update?

