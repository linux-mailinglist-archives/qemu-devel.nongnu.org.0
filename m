Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D6649E56
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:02:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hTT-0006xP-Mz; Mon, 12 Dec 2022 06:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4hTL-0006tI-ST
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:59:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4hTK-00075t-6I
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670846388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slYIY5elq2zYs2NJWPvmcwxdpul+fPF9di2UKBy4lzg=;
 b=e7dHNfwu1vN/lkdkFdJ8mRGck5ximJPNIeMlvw77T/R3ilhVAbS/ka6/6eQgl/PVCcQ2xs
 ZsElyM9YWxrzr1W3yAyYs3D17WrwZH/3olax5wmUreHwzihT3iwRDjUiWsFrTMuNDqYYT6
 8wpM66F7dAMk5m7DniTH1ll3o9E3F7U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356-Akc4rNHtOlqofZZxKIWE-Q-1; Mon, 12 Dec 2022 06:59:47 -0500
X-MC-Unique: Akc4rNHtOlqofZZxKIWE-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso3258351wma.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 03:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=slYIY5elq2zYs2NJWPvmcwxdpul+fPF9di2UKBy4lzg=;
 b=l2oUjj7S8DBnL22/EKt7jB3rTWo32XSL9zgbsdmfRl7AUvBKoxLhzvXjZgbHcqJOpV
 ZpvCYLjeOvyy9/PShfiI75AKgRt4Zp+CLEXxeCD0jPvkaoIrFa5AhyAhwlSvv3c7RTRQ
 y90FuCiJ97r7gItF1YzRiIT627/xEoE4Uq5IjhW6YEW9OG7o2Wq5oB3KPirxaoawHCU8
 zHydYuaejHxXM+5mYAr9ROABSxu8F3yMqabwiDcjm6MdrmADoHHKgcJrM/Oa25+7Yf7C
 rY0oVIGzWV4GgMUUnmKTBeqV+wddwDzTvRPu1ifFGGthNUWX5qk0fBxZoYUL5tfWLNQX
 KwxA==
X-Gm-Message-State: ANoB5pma0yDa0AQWGX9F0xJq0UEHs8DF6m4zchigPhLpHg7hc+l6X/JA
 SHgk3S7YUe+3QKA3rOGpThrQHbuc4m2YX4O0icIeLhAu0NrRld97rP6UidY7AFuioWCaixfyFWd
 IH8/WVaMz9R84Q1o=
X-Received: by 2002:adf:da42:0:b0:232:be5d:4899 with SMTP id
 r2-20020adfda42000000b00232be5d4899mr10399281wrl.13.1670846386206; 
 Mon, 12 Dec 2022 03:59:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ThAkxKeGJ0sfWopEugkkl3nu7kpWXro0XU9Xrhc3yU9U57TLaHG+4IZhIGapgLCvisE+n2g==
X-Received: by 2002:adf:da42:0:b0:232:be5d:4899 with SMTP id
 r2-20020adfda42000000b00232be5d4899mr10399263wrl.13.1670846386007; 
 Mon, 12 Dec 2022 03:59:46 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 v3-20020a5d6103000000b002423edd7e50sm8694581wrt.32.2022.12.12.03.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 03:59:45 -0800 (PST)
Message-ID: <bb6eab21-79d3-62a4-ec3d-1060fd0a61f0@redhat.com>
Date: Mon, 12 Dec 2022 12:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/libqos/e1000e: Correctly group register
 accesses
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>
References: <20221110114549.66081-1-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221110114549.66081-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/11/2022 12.45, Akihiko Odaki wrote:
> Add a newline after E1000_TCTL write and make it clear that E1000_TCTL
> write is what enabling transmit.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/libqos/e1000e.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
> index 80b3e3db90..0e5cceafe4 100644
> --- a/tests/qtest/libqos/e1000e.c
> +++ b/tests/qtest/libqos/e1000e.c
> @@ -152,6 +152,7 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
>   
>       /* Enable transmit */
>       e1000e_macreg_write(&d->e1000e, E1000_TCTL, E1000_TCTL_EN);
> +
>       e1000e_macreg_write(&d->e1000e, E1000_RDBAL,
>                              (uint32_t)d->e1000e.rx_ring);
>       e1000e_macreg_write(&d->e1000e, E1000_RDBAH,

Thanks, queued:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


