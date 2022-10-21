Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF256075E5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:16:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olq0y-0002ka-LD
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:16:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpym-0000I6-Sc
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olpyc-0008Cg-OW
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 07:14:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olpyb-00037l-30
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 07:14:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so1756718wmq.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4SKfLPpIAxLCKbWZj1rohu1DCFOrNb7lblpLi8/L+LI=;
 b=xInPVt1c+V3/2r7ppFz23gNCyv9l9uxiAA/nY4vxJt5CERGzduWZJF/3PrQ29nVZll
 PDrtPg7TuYjMZjvkKVP3pP7dziw6pIWExNRQ74Dk9TgI/ov/OS7+VtJJMhTKvHT0TS9z
 c684zAdgZR+NrzMZs71Afit3RbNtRSvT7tt/I90SBGWP5R4E8VfkgKx6+/tXwfbYU8EN
 vmM59MdGPtkRjOYJNi0iaDr+MjnbG/TV4VGjEsqYLxIVIj23m3j3NqY7Y0v8xG0v5EEo
 m9jDPdBWDWsh65sQvn7Z4b0iqtGnVJCaOk/jNEsugrX3zOR2H1Y3sCxz5Z8su3jdr2E9
 1ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4SKfLPpIAxLCKbWZj1rohu1DCFOrNb7lblpLi8/L+LI=;
 b=jusQIzldmemmWTiJ0iHz8KCZ2A2h8deQiyp3V/dhjkLpPcRNpxmgqc4mptTfpKs1Vj
 TE46X9rAa6b/Vujlw6jHChtvlP00ossZN97w6iLB9j/kWzMAeKuR4m4+rq650pwEDxp3
 J2ZQ6B7JMy08W11ZV3zwZZV+H1hRX4sPdiqcEpV5VsO1/PEW55B3GihSZy5O+AFcVzpQ
 j4sWkZIMqk9egfYKHaadvTC/+iznHSSkBZrYTOdW0v4/e2V7FYw6v/aS48wpDJShdpbm
 co6HCWFu8LgT/SfHQ77erWUjoPww7DlRiCUf0rfm7BmekYrmc2Iizynq+qYDvnvOeI6P
 DTAw==
X-Gm-Message-State: ACrzQf0I8Jb6PTUF+D24sk62Tjh7lkmblFz8eLuiKGM596BzIFABEwaw
 y50kxm1+B1sinl8pgSQVLd5kOQ==
X-Google-Smtp-Source: AMsMyM4eRM31QS1cseB+pg9IudfD59DN0nTBURKobOBUuxodf107u7nF7oHkKhfEXtf+lQ+njTfv0Q==
X-Received: by 2002:a05:600c:1c24:b0:3c6:c206:9ac0 with SMTP id
 j36-20020a05600c1c2400b003c6c2069ac0mr33363005wms.172.1666350847231; 
 Fri, 21 Oct 2022 04:14:07 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003c409244bb0sm2597555wmq.6.2022.10.21.04.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 04:14:06 -0700 (PDT)
Message-ID: <92533e71-500d-b816-1d06-0740d50e3ec8@linaro.org>
Date: Fri, 21 Oct 2022 13:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v14 12/17] net: dgram: add unix socket
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-13-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021090922.170074-13-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 21/10/22 11:09, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)
> ---
>   net/dgram.c     | 55 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   qapi/net.json   |  2 +-
>   qemu-options.hx |  1 +
>   3 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/net/dgram.c b/net/dgram.c
> index e581cc62f39f..9f7bf3837653 100644
> --- a/net/dgram.c
> +++ b/net/dgram.c
> @@ -426,6 +426,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>       SocketAddress *remote, *local;
>       struct sockaddr *dest_addr;
>       struct sockaddr_in laddr_in, raddr_in;
> +    struct sockaddr_un laddr_un, raddr_un;
>       socklen_t dest_len;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
> @@ -465,7 +466,8 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>           }
>       } else {
>           if (local->type != SOCKET_ADDRESS_TYPE_FD) {
> -            error_setg(errp, "type=inet requires remote parameter");
> +            error_setg(errp,
> +                       "type=inet or type=unix requires remote parameter");

Thanks for updating.

> @@ -546,6 +595,10 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>                             inet_ntoa(raddr_in.sin_addr),
>                             ntohs(raddr_in.sin_port));
>           break;
> +    case SOCKET_ADDRESS_TYPE_UNIX:
> +        qemu_set_info_str(&s->nc, "udp=%s:%s",
> +                          laddr_un.sun_path, raddr_un.sun_path);
> +        break;

"udp"?

