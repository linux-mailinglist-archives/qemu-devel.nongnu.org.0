Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7411611D7D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 00:44:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooY4j-0004xn-LJ; Fri, 28 Oct 2022 18:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooY4c-0004ve-FS
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 18:43:35 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooY4Y-0000KL-0q
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 18:43:33 -0400
Received: by mail-wm1-x330.google.com with SMTP id n14so3986071wmq.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DPLSvVPR+S0ni3aLPWTGaQJgz447Dpki8F0IqG6gjNc=;
 b=T+9BCqIY8iQ/khixGVBdU/nsukbeoeaIpwyJCN9pomaF/gkfenO6jiacHkGqkgicih
 Z03WhhNCsslNPcaB4RVvIXdJqxw8mWc1bRWLVky5h5GxDRQXOZ6Jnjam4aMPIZrrS5Gd
 MHTkQZ3os08kn7+yN4OKHoYZs85g93bDYtv3KZ1K2zPDHlMxkeJyVtAo5p2MpEJcxEn9
 dDYltbYalykx3nrH8xclfgu99HKLhB8P0WD9FwubVvdrfZY8xt2Aa4YTjUzESSYBHlzA
 I+q32e9y8g+v58lWpiQSJCUmxIYX2n8+EOkCGN414T6skguqYsvVAlEt5cpYDlnXsOaF
 2nEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DPLSvVPR+S0ni3aLPWTGaQJgz447Dpki8F0IqG6gjNc=;
 b=cHX6fmhFebYLu12wxvmUidGYzpElQlecSqJ0lxCsLEkjaYTd3WLC2okSQHGIiAp2qD
 qwZWhdmhinz+FuOEVhTmxfPMrfpy2UdL0T9Fajus/o1bYkV5v5BOgDX+AM1ciN8OnnfU
 z+03Nm0/UlupwtAiMoEUQSF5dt100gJU8cNTN8jJMBkRFjGMWC1MV4298SFqQp9d9oCV
 6we8IdmLWJy7ZMeaIlw8JPjL6bFv2ZyIWMYvvG8AoKmdoVKH2+pevp7zjgqBFX7R30gy
 zIW2r4l0S7DgLr1YVJnUPeSfbKKz6Zx2ncvjepi9152ZLngwoTwL1W4odkxqfVaRZ7Vm
 M0Gg==
X-Gm-Message-State: ACrzQf1tCNPIQvl/YkFhh02y4tbekLmtYMLYYp/3ubuc8Qx+425E/ocx
 Jhqp/kOPnHiFM3/uNz4BVv097w==
X-Google-Smtp-Source: AMsMyM4G2XIyzKCI9Xa7PPbELtiq13plMR5cm9/wK1Qbil/SosPp7LElI+r6auDuPNoAHbuLjDw1xQ==
X-Received: by 2002:a05:600c:3512:b0:3c8:2c4e:8680 with SMTP id
 h18-20020a05600c351200b003c82c4e8680mr11483927wmq.165.1666997006275; 
 Fri, 28 Oct 2022 15:43:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003c6deb5c1edsm5390304wmc.45.2022.10.28.15.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:43:25 -0700 (PDT)
Message-ID: <12a458e6-a48c-fcd8-bc7e-1185dedd2826@linaro.org>
Date: Sat, 29 Oct 2022 00:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] vhost: Delete useless casting
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-2-eperezma@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221028160251.268607-2-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/22 18:02, Eugenio Pérez wrote:
> The used event is already an uint16_t pointer
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


