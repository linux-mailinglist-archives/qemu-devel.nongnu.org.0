Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D9A656D13
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 17:45:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAD3e-0002Ki-L1; Tue, 27 Dec 2022 11:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAD3b-0002KN-84
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 11:44:03 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAD3Z-0007z0-H4
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 11:44:03 -0500
Received: by mail-ed1-x529.google.com with SMTP id u28so14853482edd.10
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 08:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+FfpF+FjQHf2K/Why644/rkCWMvB3ndTPKqURFE50Mg=;
 b=kVOJp9/u65YIB8dg59py+OzDkGaUbj0sGNMPKQgsH5KtfP1TuFi/ch59XY22PRuivw
 +yuRfRLE8SA/Hc5seuMBxGLgrzqRc98921yZ4u0Ywg/roRU6AJ3GjC/EJIEy0CL7g4NH
 v0XmwPA+SzXVvSjq8HRlc74Y76pzwt+9xkp1zYBP/VgOnd/oxanl1iib431+zf3X7y20
 hElyFKTPjLfPC9YCvxuvF5sZ5iAe7S9wE855kYs97M5eJOnUuliUDgWFOYa23kows2sS
 DwToOzDYwDwR4/cLFDok0xNc6nDTn/V4BhrupjuAV1OfDHy/TRt4Vf+4g7doIjaFie6n
 DISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+FfpF+FjQHf2K/Why644/rkCWMvB3ndTPKqURFE50Mg=;
 b=1Gp9XZPvefiJdffv6uGpf5jDTR/sv7enDZrP3mS33KPunNiwektH4lvmFeRHN5NdoB
 Y4LCIbf5bOOHZaoLDCDi7gnje3iqId/vI2qwbMJgG1JJSc9eBY5BNJvorf7PjS/HKw2R
 /CIWPk6lqLNrjMIzn+HJj5fVkgrqakVCuIzJwPrEIrttOagjJy32andBzE9PMegJns6L
 WV0PGgA0DXxp/l/IddMNCf/L6GEfp4ISlUo3XdDWzXCWbpp8xD0XMkYJLeJZF+XHF7nl
 tLbR/QCHaUzGQCUsrQIXuqjb8EAkAVjHqvdjaSLQtbYyOWIuQ1QWiS47ux8Wcf28dFcU
 +Vjw==
X-Gm-Message-State: AFqh2kpRyT3uCXz0rT1ck9y7DhmbnEEd+gEgen5iby6uvQKEOc57bMA9
 PLQHlRbEPbxZ1e4+XxUs90SHQQ==
X-Google-Smtp-Source: AMrXdXt4QSMUcmBw5q3ebUQXrzCoVsfQLZnIDxZ5DBjJKvObHKV3X7Lo8iSPpFjOCcHUp2mfOuA+9A==
X-Received: by 2002:a05:6402:8d9:b0:462:8a68:1398 with SMTP id
 d25-20020a05640208d900b004628a681398mr26887271edz.1.1672159439676; 
 Tue, 27 Dec 2022 08:43:59 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 es12-20020a056402380c00b00482b3d0e1absm4649469edb.87.2022.12.27.08.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 08:43:59 -0800 (PST)
Message-ID: <8054d186-0196-ccb0-091d-0ee9caadb576@linaro.org>
Date: Tue, 27 Dec 2022 17:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/3] vhost: configure all host notifiers in a single MR
 transaction
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 mst@redhat.com, jasowang@redhat.com
Cc: cohuck@redhat.com, sgarzare@redhat.com, pbonzini@redhat.com,
 arei.gonglei@huawei.com, yechuan@huawei.com, huangzhichao@huawei.com,
 qemu-devel@nongnu.org
References: <20221227072015.3134-1-longpeng2@huawei.com>
 <20221227072015.3134-3-longpeng2@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221227072015.3134-3-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 27/12/22 08:20, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> This allows the vhost device to batch the setup of all its host notifiers.
> This significantly reduces the device starting time, e.g. the time spend
> on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
> and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device)
> 
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>   hw/virtio/vhost.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 5994559da8..064d4abe5c 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1562,16 +1562,25 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>           return r;
>       }
>   
> +    /*
> +     * Batch all the host notifiers in a single transaction to avoid
> +     * quadratic time complexity in address_space_update_ioeventfds().
> +     */
> +    memory_region_transaction_begin();
> +
>       for (i = 0; i < hdev->nvqs; ++i) {
>           r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>                                            true);
>           if (r < 0) {
>               error_report("vhost VQ %d notifier binding failed: %d", i, -r);
> +            memory_region_transaction_commit();
>               vhost_dev_disable_notifiers(hdev, vdev);

Could we 'break' here, ...

>               return r;
>           }
>       }
>   
> +    memory_region_transaction_commit();
> +
>       return 0;

... and return 'r' here?

>   }

Otherwise LGTM.


