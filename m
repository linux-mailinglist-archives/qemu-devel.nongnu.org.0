Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A583F6E8DF5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:23:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQTr-0008As-GU; Thu, 20 Apr 2023 05:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQTb-0007wd-7J
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQTZ-00070B-DC
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oKIaaA43LEdto76cISwdT3W7LZPO4XuM1D50BhjLAoQ=; b=e2GCXLejeu4UWeS3e2wHrt8fcU
 mWAY8LOhVoKS3L4wijZNH1KUTNZc5/DV+MMAzb9sVh+rv97qthJWBKsP89kSQHAPJFqfCeNf94778
 76TXVHiDy41t5zzU6LmztwjD7KcPw/Z7Cp/UolBJ3jgef5PZu5ETBQEUfMsqdTifjzsoMBAz2ByhB
 RQkv9lIGlTq0YvI0gFcieJPwISfcY7HiXCEm3nFAqZqegiTk2GWAszXWkGzMF3ep19qQvP8RImwMG
 Hnz4z+2lfsxIXE1KN9l9OM0ORPRRvqLQS7q6xd8aBu/sVgLXhupcg81frNCJlQfMDoVH2DzXSP/dH
 fbpucoQsMsRWYYdTwSjnKkSCpYOIU4qxh2lAl1K22/Y8jrMDiqk6AkglXhuLDOQS2I+0i4hGX25LG
 p//QFScM+JN2jd8A5+nnbDCx1zHfJ8dUhJJuNcP1LQ98LE46Ye4Oer1zLjnVKGiYNoXig0RpTumpM
 u4aVFzYHVAkv/fWzQ9YhEeRUfv2m53ubXVUe1ihfd792g9dUBUH56cpwnhSGbmYwfB9Nr5hukzhss
 XKjEX49ZWnkl3iD80dYo+VH4nx6G66pfnrAIlZhPRBo6Apsarc30fnOkHIjAXtE1/WkAayhfPl1sA
 lc3CCJYoVbds6gb9GTEHC5V5Su1Gy8QymKtpgiqFQ=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQSb-0009li-3v; Thu, 20 Apr 2023 10:20:17 +0100
Message-ID: <2e1767b9-c171-40df-1bc9-2c4c14d5292b@ilande.co.uk>
Date: Thu, 20 Apr 2023 10:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Viresh Kumar
 <viresh.kumar@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 virtio-fs@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
 <20230418162140.373219-2-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230418162140.373219-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 01/13] include: attempt to document
 device_class_set_props
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/04/2023 17:21, Alex Bennée wrote:

> I'm still not sure how I achieve by use case of the parent class
> defining the following properties:
> 
>    static Property vud_properties[] = {
>        DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
>        DEFINE_PROP_UINT16("id", VHostUserDevice, id, 0),
>        DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>        DEFINE_PROP_END_OF_LIST(),
>    };
> 
> But for the specialisation of the class I want the id to default to
> the actual device id, e.g.:
> 
>    static Property vu_rng_properties[] = {
>        DEFINE_PROP_UINT16("id", VHostUserDevice, id, VIRTIO_ID_RNG),
>        DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>        DEFINE_PROP_END_OF_LIST(),
>    };
> 
> And so far the API for doing that isn't super clear.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/qdev-core.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bd50ad5ee1..d4bbc30c92 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -776,6 +776,15 @@ BusState *sysbus_get_default(void);
>   char *qdev_get_fw_dev_path(DeviceState *dev);
>   char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
>   
> +/**
> + * device_class_set_props(): add a set of properties to an device
> + * @dc: the parent DeviceClass all devices inherit
> + * @props: an array of properties, terminate by DEFINE_PROP_END_OF_LIST()
> + *
> + * This will add a set of properties to the object. It will fault if
> + * you attempt to add an existing property defined by a parent class.
> + * To modify an inherited property you need to use????
> + */
>   void device_class_set_props(DeviceClass *dc, Property *props);
>   
>   /**

Can we say that the use case description above is now obsolete with the introduction 
of the abstract VHOST_USER_BASE class (i.e. it was a modelling issue)? If so, I think 
the comment is good, except that the last sentence can be removed.


ATB,

Mark.

