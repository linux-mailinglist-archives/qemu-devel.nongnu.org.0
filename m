Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27325F7B11
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:54:03 +0200 (CEST)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpfl-0003j3-R2
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogomz-0002h7-B5
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogomv-0001sh-Kl
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665154638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53dJ8Yo53Jk8b8Pizdks+jIgRERvGsWrWzy4efdtWbg=;
 b=I/pJDUpgIeUpynGXiGtcL0rL98CcIlo31EJfvQ8eO9YksuQdjchaDdeovVaY+nLKnONsrM
 sn8EipnpF3OfZAvSN27t/MzqWIAE0gnUPm5f8lXJkgTXpE/1aDjXzops/lGnSwg0EYwlKh
 VCPkcUFvcdbjqHms+u+/WNu7wuS05nU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-gIg-jMP_M0SgGx2-YAQUqw-1; Fri, 07 Oct 2022 10:57:12 -0400
X-MC-Unique: gIg-jMP_M0SgGx2-YAQUqw-1
Received: by mail-qt1-f199.google.com with SMTP id
 ff14-20020a05622a4d8e00b00394aaf0f653so2749438qtb.19
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 07:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=53dJ8Yo53Jk8b8Pizdks+jIgRERvGsWrWzy4efdtWbg=;
 b=KU4ICKdw7QJiTqGD5uQaXhXAdMFSLfnVbAkLOSqgjvtwZofHrY9IQWiRH8fhDG9Dpo
 CZ5ndcUJuajUVptGwM4wTNSADQHekzUXxym8St6MA6aXiQfgbAnr32f2YmeQhngalzU5
 ko24OWnTg1tIJ12pQ6bBY7iWeZEg3+EjYZSo2KcUvixJePSzG0k1Y0h8k+ugNE/KuRzW
 U2+qj+LIF1tZYCxFD9N/j459HUtmoiY/ZgIVxHx1aCLpRWcZm8LbnIW57mG/PdpnVjWK
 hecCs61UAmQCoW7wIIrcoku12bGHuyGOaQx8L54Ycx01mRAorlBH6pzzlgmthwOhWGGj
 wbaw==
X-Gm-Message-State: ACrzQf1UVKAFzdSf2Vn+p+TtSWYTtpZAJZ7cpJXv/TuTBYrWIXjPMTv5
 b5YdcBf7aFoo2JB6f1DNhHKB99a3S87ZRFOtTRSqU5i52e7qxvQioo7q5CkHkTI1ZQw8ROtBaoh
 UTQu5A3fkFhIhet0=
X-Received: by 2002:a05:620a:2184:b0:6e0:42c5:f47a with SMTP id
 g4-20020a05620a218400b006e042c5f47amr3918375qka.89.1665154632374; 
 Fri, 07 Oct 2022 07:57:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Q8hmU41sO2bTreg/xHZrCWJfC4G2BGZsHtAP6KIgCAfiDVcELtk/+f6vRj4bBHgnxIZSbeQ==
X-Received: by 2002:a05:620a:2184:b0:6e0:42c5:f47a with SMTP id
 g4-20020a05620a218400b006e042c5f47amr3918353qka.89.1665154632094; 
 Fri, 07 Oct 2022 07:57:12 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-222.retail.telecomitalia.it.
 [79.46.200.222]) by smtp.gmail.com with ESMTPSA id
 y8-20020ac87048000000b00342f8d4d0basm2299111qtm.43.2022.10.07.07.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:57:11 -0700 (PDT)
Date: Fri, 7 Oct 2022 16:57:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, tugy@chinatelecom.cn,
 baiyw2@chinatelecom.cn, dengpc12@chinatelecom.cn,
 liuym16@chinatelecom.cn, yangchg@chinatelecom.cn,
 yuanmh12@chinatelecom.cn, zhoupx@chinatelecom.cn, lic121@chinatelecom.cn,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH 1/2] vhost-user: Refactor vhost acked features saving
Message-ID: <20221007145704.qjlbzqndyqf7w6ff@sgarzare-redhat>
References: <20220926063641.25038-1-huangy81@chinatelecom.cn>
 <20220926063641.25038-2-huangy81@chinatelecom.cn>
 <20221007095800-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221007095800-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Oct 07, 2022 at 10:01:21AM -0400, Michael S. Tsirkin wrote:
>On Mon, Sep 26, 2022 at 02:36:40PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Abstract vhost acked features saving into
>> vhost_user_save_acked_features, export it as util function.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
>> ---
>>  include/net/vhost-user.h |  2 ++
>>  net/vhost-user.c         | 35 +++++++++++++++++++----------------
>>  2 files changed, 21 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/net/vhost-user.h b/include/net/vhost-user.h
>> index 5bcd8a6285..00d46613d3 100644
>> --- a/include/net/vhost-user.h
>> +++ b/include/net/vhost-user.h
>> @@ -14,5 +14,7 @@
>>  struct vhost_net;
>>  struct vhost_net *vhost_user_get_vhost_net(NetClientState *nc);
>>  uint64_t vhost_user_get_acked_features(NetClientState *nc);
>> +void vhost_user_save_acked_features(NetClientState *nc,
>> +                                    bool cleanup);
>>
>>  #endif /* VHOST_USER_H */
>> diff --git a/net/vhost-user.c b/net/vhost-user.c
>> index b1a0247b59..c512cc9727 100644
>> --- a/net/vhost-user.c
>> +++ b/net/vhost-user.c
>> @@ -45,24 +45,31 @@ uint64_t vhost_user_get_acked_features(NetClientState *nc)
>>      return s->acked_features;
>>  }
>>
>> -static void vhost_user_stop(int queues, NetClientState *ncs[])
>> +void vhost_user_save_acked_features(NetClientState *nc, bool cleanup)
>>  {
>>      NetVhostUserState *s;
>> +
>> +    s = DO_UPCAST(NetVhostUserState, nc, nc);
>> +    if (s->vhost_net) {
>> +        uint64_t features = vhost_net_get_acked_features(s->vhost_net);
>> +        if (features) {
>> +            s->acked_features = features;
>> +        }
>
>Note it does not set  acked_features if features are 0.
>Which might be the case for legacy ...
>I will need to analyze this more to figure out what's
>the correct behaviour....
>
>Stefano? Raphael?

I just noticed that we now call vhost_user_stop() only in the error path 
of vhost_user_start(). We used it elsewhere, but over time we removed 
those calls.

Do we still need to save acked_feature in that path?

About doing it only if the features aren't 0, it isn't clear to me.
I see we did in e6bcb1b617 ("vhost-user: keep vhost_net after a 
disconnection"). @Marc-André do you remember why?

Thanks,
Stefano

>
>> +
>> +        if (cleanup) {
>> +            vhost_net_cleanup(s->vhost_net);
>> +        }
>> +    }
>> +}
>> +
>> +static void vhost_user_stop(int queues, NetClientState *ncs[])
>> +{
>>      int i;
>>
>>      for (i = 0; i < queues; i++) {
>>          assert(ncs[i]->info->type == NET_CLIENT_DRIVER_VHOST_USER);
>>
>> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
>> -
>> -        if (s->vhost_net) {
>> -            /* save acked features */
>> -            uint64_t features = vhost_net_get_acked_features(s->vhost_net);
>> -            if (features) {
>> -                s->acked_features = features;
>> -            }
>> -            vhost_net_cleanup(s->vhost_net);
>> -        }
>> +        vhost_user_save_acked_features(ncs[i], true);
>>      }
>>  }
>>
>> @@ -251,11 +258,7 @@ static void chr_closed_bh(void *opaque)
>>      s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
>>
>>      for (i = queues -1; i >= 0; i--) {
>> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
>> -
>> -        if (s->vhost_net) {
>> -            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
>> -        }
>> +        vhost_user_save_acked_features(ncs[i], false);
>>      }
>>
>>      qmp_set_link(name, false, &err);
>> --
>> 2.27.0
>


