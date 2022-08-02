Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE854587CDF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:08:06 +0200 (CEST)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrcz-0008Eq-Ha
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIrTw-0006Ml-RK
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:58:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIrTu-0000RF-VL
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659445122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yq6b3r4cU7XWV1QeuqEKpbRWynzzQldZYw6g3MOiIc0=;
 b=OJf953HTpPYrcksgptbbjKsFhJKWyimTFHM7acGOyXjApYxmiLbrW0kANVYZtKsrMUDkKH
 lcNeWKxHjuddJSVKzZmpcwW7XaM03Wo0KY/OV3ilHPzo6ZZHtx3ZdySGFyG9ry54g6Ikob
 A86KJg+S+8CdMnsA6Px1MZN9t8i2wJM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-Lb7iqxuBOWawyYc2cRXeFA-1; Tue, 02 Aug 2022 08:58:41 -0400
X-MC-Unique: Lb7iqxuBOWawyYc2cRXeFA-1
Received: by mail-qv1-f69.google.com with SMTP id
 nk7-20020a056214350700b0047688bd2105so3194130qvb.16
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 05:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yq6b3r4cU7XWV1QeuqEKpbRWynzzQldZYw6g3MOiIc0=;
 b=hJ2z0i0ny574d02vsmenbiyFokFVsX7YwtzD7iBiWeltenTFgglcXhCrwLqLcSDgAF
 6yltzpstPQ6vmpj0BUPQS1KG/Fy7Z3b9R2nzkNgAyVZWGHny3e86+2XT2CpASsaazT5M
 dtA3IvFJNF05FF1w9FpZu1x2Xa2pzWXhZQDvGGFnA5PaeVjfZVbDhgtr5Po3sjvelUmD
 Ty2TJPHQS5iPECiVZyaiQGuBpzcM0hVnTUVeM4HuEiHU4NkDqtvaHEIhZ7igxvOJIUmN
 wjHJOwq7BHBiGg1mMS0Wz/BCdDjP8tYNSPAHXsrLg8y3Uzqu83hNkndKTUPbzJHetHCb
 NAUA==
X-Gm-Message-State: AJIora8RIBoRERyXmnWMWsjMwpKLNNmu//+ltcLONlgtgSWN3mFvOq8t
 CtcGrkVvEcymI0K46cYBirkW398tCS2+yCDWg2hJpVMiNqCSYuO/WTdSNX76LOTkc89F9jXUKiH
 p4Lk2yzA5G2g+JH0=
X-Received: by 2002:a05:622a:60c:b0:31e:f64a:6d87 with SMTP id
 z12-20020a05622a060c00b0031ef64a6d87mr17818927qta.52.1659445120561; 
 Tue, 02 Aug 2022 05:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vwSzZsv7mNGURUr/AcysQatF4aaNbPDieqsMhrINlp75ExPsHflePVyaFcltOhgRCYrdc2/A==
X-Received: by 2002:a05:622a:60c:b0:31e:f64a:6d87 with SMTP id
 z12-20020a05622a060c00b0031ef64a6d87mr17818908qta.52.1659445120314; 
 Tue, 02 Aug 2022 05:58:40 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 a83-20020ae9e856000000b006b4689e3425sm9809104qkg.129.2022.08.02.05.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 05:58:40 -0700 (PDT)
Message-ID: <ef5bcff0-a297-2173-40ce-6b8070ea9b3c@redhat.com>
Date: Tue, 2 Aug 2022 14:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] vdpa: Merge all net_init_vhost_vdpa error goto
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-3-eperezma@redhat.com>
 <72375be5-36d8-155c-9df8-da76c1d820c0@redhat.com>
 <20220802085655-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220802085655-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02/08/2022 14:57, Michael S. Tsirkin wrote:
> On Tue, Aug 02, 2022 at 02:10:43PM +0200, Laurent Vivier wrote:
>> On 02/08/2022 13:24, Eugenio Pérez wrote:
>>> Few steps allocate new resources, and all of the allocated can be
>>> checked to avoid trying to free an invalid one.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> 
> 
> qemu-trivial too I guess then?

For 7.1 or later?

Thanks,
Laurent

> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
>>> ---
>>>    net/vhost-vdpa.c | 6 ++----
>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index 303447a68e..ac1810723c 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -588,8 +588,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>        queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
>>>                                                     &has_cvq, errp);
>>>        if (queue_pairs < 0) {
>>> -        qemu_close(vdpa_device_fd);
>>> -        return queue_pairs;
>>> +        goto err;
>>>        }
>>>        if (opts->x_svq) {
>>> @@ -604,7 +603,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>            if (invalid_dev_features) {
>>>                error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
>>>                           invalid_dev_features);
>>> -            goto err_svq;
>>> +            goto err;
>>>            }
>>>            vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
>>> @@ -640,7 +639,6 @@ err:
>>>            }
>>>        }
>>> -err_svq:
>>>        qemu_close(vdpa_device_fd);
>>>        return -1;
>>
>> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> 


