Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8A3FEEDC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:42:50 +0200 (CEST)
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmzR-0000cR-6a
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLmTq-00078C-Qf
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLmTi-0002JK-FN
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630588200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cAiDyoB4+HKkYi84yijqxsz8tfdiOFxslWDuiiZyjY=;
 b=XV9f0OCWkO9xlGduYZdYqkUAD0HzzjaziNkgHhaFKOwrJTZU1HRoMxw4niQxH1ROV6VAWs
 Q/yRDrqOQ16AzxwrQi+38tocQZoPp5R1YVcGIYZZXOn5Nt4kBKIN13AodqPHt9J+Te2DP7
 E1jlfYT0YyFdq0ZCSmu4ZfEhaJm5NKo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-MTzZjVo_Ozif3uwjkuUXzw-1; Thu, 02 Sep 2021 09:09:59 -0400
X-MC-Unique: MTzZjVo_Ozif3uwjkuUXzw-1
Received: by mail-ej1-f70.google.com with SMTP id
 q15-20020a17090622cf00b005c42d287e6aso886455eja.18
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 06:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8cAiDyoB4+HKkYi84yijqxsz8tfdiOFxslWDuiiZyjY=;
 b=eyTA8Ds+QV44z3w+zkHnk3LPCKaiGKCch2yGxeSthB0gNnmfDmmeNVve+LJfO7Ycu2
 +J83p70cJ1Po0mcHZwhdkH11ufrJo/LaSsjIb8uWws4tNnTJ6mpBOz3YxWRVeXx65qBR
 b0hfX4GV9l+RHQdQV9iuG8CITa6AyuDFVLRm0mkuNsXWnLr6rAxGAvyuN6zWJYrcgIsv
 l+UT4+dLQWlqaw3/nbBGoXdBHCVQI+JBbGA/sNiHnKYgi0mRXzhvVmVlzs0bIcz3lPsw
 yDZgR1cKIwF9iMDyj0+kSZ1gCH9rRreC2jvpiyvFX/u9Hwy4qGVTdCjFXKKstWziilK7
 CS9w==
X-Gm-Message-State: AOAM530Nq0r1/yUQJbvfCOK0BsEuJrjshtUU5pr/dbhKooPQhuXhAsMA
 QFjaGheWGoKRqRhx61N8rTCKQHgtCDo4KbOOxd5yQnlwEdGjRhGsIpdsmIAukjw7dLJqOeAgfeP
 mtRHM36CdOk/nBD4=
X-Received: by 2002:a17:906:b84a:: with SMTP id
 ga10mr3840559ejb.143.1630588198237; 
 Thu, 02 Sep 2021 06:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiXRV7SOESuCm2GNRabgH55/hTvQpzD+UHcBFx3LlIUv5grUC37cUSuw6mAPX93AM9Xls61g==
X-Received: by 2002:a17:906:b84a:: with SMTP id
 ga10mr3840548ejb.143.1630588198071; 
 Thu, 02 Sep 2021 06:09:58 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id ck4sm1169796edb.67.2021.09.02.06.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 06:09:57 -0700 (PDT)
Date: Thu, 2 Sep 2021 15:09:54 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 3/3] hw/virtio: Have virtqueue_get_avail_bytes() pass
 caches arg to callees
Message-ID: <20210902130954.sdzkzfyeflc6sc4s@steredhat>
References: <20210826172658.2116840-1-philmd@redhat.com>
 <20210826172658.2116840-4-philmd@redhat.com>
 <20210901155538.vbtxakrtbjwon3pt@steredhat>
 <YTC/savtIjlbzFsO@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YTC/savtIjlbzFsO@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 01:12:33PM +0100, Stefan Hajnoczi wrote:
>On Wed, Sep 01, 2021 at 05:55:38PM +0200, Stefano Garzarella wrote:
>> On Thu, Aug 26, 2021 at 07:26:58PM +0200, Philippe Mathieu-Daudé wrote:
>> > Both virtqueue_packed_get_avail_bytes() and
>> > virtqueue_split_get_avail_bytes() access the region cache, but
>> > their caller also does. Simplify by having virtqueue_get_avail_bytes
>> > calling both with RCU lock held, and passing the caches as argument.
>> >
>> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> > ---
>> > RFC because I'm not sure this is safe enough
>>
>> It seems safe to me.
>>
>> While reviewing I saw that vring_get_region_caches() has
>> /* Called within rcu_read_lock().  */ comment, but it seems to me 
>> that we
>> call that function in places where we haven't acquired it, which shouldn't
>> be a problem, but should we remove that comment?
>
>Do you have specific examples? That sounds worrying because the caller
>can't do much with the returned pointer if it was fetched outside the
>RCU read lock.
>

One was the virtqueue_get_avail_bytes(), but Phil is fixing it in this 
patch.

Should we fix it in a separate patch to backport to stable branches?

Other suspicious places seem to be these:
- virtqueue_packed_fill_desc()
- virtqueue_packed_drop_all()

Stefano


