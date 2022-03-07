Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F84CF31D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:02:17 +0100 (CET)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Js-0001O9-Ot
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:02:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR8FD-0004ra-DA
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR8FB-0000Pq-Rs
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHlMScSujGBF7XpUqOJ3oYWxK4j4bQCRNU2Qi86AtOM=;
 b=SX4TgarSrr8vA9nObdsO62827gelWdtYSAeDldYbdxHBrA//C6TBjnmF4FxUxtrLoW5p/5
 roQrXm6HX3JczKTHvWcU7AQr2PBX0CiYUuPv2XOWHrz45xI7np6LR71D/cpqta2pKV9aFi
 8PSF2uqadm9TtQCIr+eDUbYKt4q1EXg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-Pz6VZ-1vN4mARak8CBWnSQ-1; Mon, 07 Mar 2022 02:57:24 -0500
X-MC-Unique: Pz6VZ-1vN4mARak8CBWnSQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso4977266wmq.6
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nHlMScSujGBF7XpUqOJ3oYWxK4j4bQCRNU2Qi86AtOM=;
 b=bXej7nccROpnLuJb0z+dLWb+eME4WlPH+8QMP+PLxDLzUKIScB9/2qW4XWk7L+XiFb
 rLgsOujWjq2oBVrAB13qs+paLne2RlqgmKv4ajx/Sg6mLhiJof4Rq43i34/xFpo2A4DJ
 OtqofDEioxhGNMZtzJjPwNlAYjQL4UzKbF5Xd1NLcHcHkwLZQVjmtl/Hb4jr2YtitUOg
 qbTCidGrdgLbNTvtRI+yOCAsgsz0zFURskvlmw5FCADCddhGbv+p/mbQnLvsCngFFMf9
 IVuhPaH/AzuKSiBpDurzAQiGkHyWDtgt4vTStO21DXgOsss1o6wTvQrRw+4RZp9W7jSu
 wJZg==
X-Gm-Message-State: AOAM532GqkT2FphshaRhCT3z5Y23WQZZbz+yKSln6CsDJQ9INuMEOkhS
 8rlq3HCZaZLVsks5t58J/e0HrKaW5FXiNXb5HIlMd+U4Xhr7w2lbux4L2vdyEZPFWT2xrdF59nF
 aNpO7fNVIaQXw1gI=
X-Received: by 2002:a05:600c:3d0b:b0:389:a525:7b92 with SMTP id
 bh11-20020a05600c3d0b00b00389a5257b92mr2680121wmb.152.1646639842786; 
 Sun, 06 Mar 2022 23:57:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycVTv1kWvYSKTI6H62yOPNDCFPCPnStl1kq9MJWCnf7TfptECjpn6kZr9BLAEudfB/ilS/KA==
X-Received: by 2002:a05:600c:3d0b:b0:389:a525:7b92 with SMTP id
 bh11-20020a05600c3d0b00b00389a5257b92mr2680107wmb.152.1646639842510; 
 Sun, 06 Mar 2022 23:57:22 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm28696219wmb.1.2022.03.06.23.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 23:57:22 -0800 (PST)
Message-ID: <da7f2d2f-bdef-c1f8-bf2e-68c98331d7d0@redhat.com>
Date: Mon, 7 Mar 2022 08:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/5] qtest/meson.build: check CONFIG_TCG for prom-env-test
 in qtests_ppc
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220303153517.168943-1-danielhb413@gmail.com>
 <20220303153517.168943-2-danielhb413@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220303153517.168943-2-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: crosa@redhat.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2022 16.35, Daniel Henrique Barboza wrote:
> 'prom-env-test' is a TCG test that will fail if QEMU is compiled with
> --disable-tcg:
> 
> $ QTEST_QEMU_BINARY=./qemu-system-ppc64 ./tests/qtest/prom-env-test
> /ppc64/prom-env/mac99: qemu-system-ppc64: -accel tcg: invalid accelerator tcg
> (... hangs indefinitely ...)
> 
> Fix it by checking CONFIG_TCG before compiling prom-env-test.

I guess it could be made somehow working by using KVM-PR for the mac 
machines ... but considering the bad shape of KVM-PR nowadays, I think it's 
fair to limit the test to TCG-only now.

Reviewed-by: Thomas Huth <thuth@redhat.com>


> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   tests/qtest/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index f33d84d19b..0c2f2d94e1 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -160,7 +160,8 @@ qtests_ppc = \
>     (slirp.found() ? ['test-netfilter'] : []) + \
>     (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
>     (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
> -  ['boot-order-test', 'prom-env-test', 'boot-serial-test']                 \
> +  (config_all_devices.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) +                      \
> +  ['boot-order-test', 'boot-serial-test']
>   
>   qtests_ppc64 = \
>     qtests_ppc + \


