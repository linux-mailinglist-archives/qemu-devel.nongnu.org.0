Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E4345E6C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:47:00 +0100 (CET)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgR2-0003cU-0e
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOgOs-0002g6-Hf
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOgOm-00073s-6y
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616503479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/9Lt6Uh7tJa6F7UesLRaFhqu7uxzsnOEDR6vKbkgzk=;
 b=GeJtrkSh38OpzYayW3/bJvbKa6o4n+YwDxDVZIttCoBiTFFN9eQNxZv+j7C5s3pnmm4gNT
 qoqUs8dUyvjOxBnPaXUkFwYtA/cN9oWtthguuCKfsv2GedTxxgsCUdY7mSOJP+BJZEBaQx
 odjNvZASTWFo9dSdtdBMJI3GGBmXuvA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-LfXDgUnLOECBSgsQ_LahYA-1; Tue, 23 Mar 2021 08:44:37 -0400
X-MC-Unique: LfXDgUnLOECBSgsQ_LahYA-1
Received: by mail-wr1-f69.google.com with SMTP id m9so1060038wrx.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 05:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W/9Lt6Uh7tJa6F7UesLRaFhqu7uxzsnOEDR6vKbkgzk=;
 b=mZ1ooWeBXY+7/6RwvU65cAxW2HBtzgiL6+3FCYf3szii8WSl9VEKDqaUpYLA7sDW0A
 qKBMdvqOlOKc5twM8x6M9v/H3xf9e2mJ6g+kopJOnbFNgni2g12aduDF5Qq7/BEpO8hy
 hdenTZHlfJIruzIy8reylov9DtPyBAlHpbajqfZ2Na5g98wFEFHowvhSkxNk+1/vMawl
 rV1t4YpbLbK/hGChdpemhLERIPjiP8L09nMKG6kJuirHyW0qpuoITxy/egr9a4XdOLMY
 wtgLi3pD4sR4fi+XhtSudgOjLOSyy/lncsJ3HeWFELmj5jkcV7lVLbBqs3VYbRXnm1A+
 Se/A==
X-Gm-Message-State: AOAM532nEQvz883a57Qs6JAuad9YkfBdIUad/Bw2maaaEnyEEKL0eG25
 36mLFMFQC2ASdylKN+r7ATaMkSp5myhVGaaE3NVDuIEBJcajVYsYGpCfTde8hl2QujddBXEU0Mr
 3uUgVpsw6tb/boCQ=
X-Received: by 2002:a1c:771a:: with SMTP id t26mr3264485wmi.60.1616503476262; 
 Tue, 23 Mar 2021 05:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD05HtSUTNdQhopfZAUt3whXw0Ll3i2HHxmsfE0PUlWyUCyWvUW/9QCb3O6A3eq2j8tfXxUw==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr3264472wmi.60.1616503476083; 
 Tue, 23 Mar 2021 05:44:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i17sm22679565wrp.77.2021.03.23.05.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 05:44:35 -0700 (PDT)
Subject: Re: [PATCH] qcow2: use external virtual timers
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161649773401.599835.8362213390558184647.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <82f53c2d-c153-cd48-2b55-9852d8a752fa@redhat.com>
Date: Tue, 23 Mar 2021 13:44:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161649773401.599835.8362213390558184647.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 12:08, Pavel Dovgalyuk wrote:
> Regular virtual timers are used to emulate timings
> related to vCPU and peripheral states. QCOW2 uses timers
> to clean the cache. These timers should have external
> flag. In the opposite case they affect the execution
> and it can't be recorded and replayed.
> This patch adds external flag to the timer for qcow2
> cache clean.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   block/qcow2.c |    7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 0db1227ac9..2fb43c6f7e 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -840,9 +840,10 @@ static void cache_clean_timer_init(BlockDriverState *bs, AioContext *context)
>   {
>       BDRVQcow2State *s = bs->opaque;
>       if (s->cache_clean_interval > 0) {
> -        s->cache_clean_timer = aio_timer_new(context, QEMU_CLOCK_VIRTUAL,
> -                                             SCALE_MS, cache_clean_timer_cb,
> -                                             bs);
> +        s->cache_clean_timer =
> +            aio_timer_new_with_attrs(context, QEMU_CLOCK_VIRTUAL,
> +                                     SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> +                                     cache_clean_timer_cb, bs);
>           timer_mod(s->cache_clean_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
>                     (int64_t) s->cache_clean_interval * 1000);
>       }
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


