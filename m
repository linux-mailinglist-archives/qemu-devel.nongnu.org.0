Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61C300500
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:12:50 +0100 (CET)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xBB-0006C6-Gm
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2x8d-0004o4-Er
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:10:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2x8a-0005dg-HA
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611324607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/G5AOqSCsfh5m/2A8c35GHXNLtZSWsuzFZqZrINSKw=;
 b=ANsdjPGvKcX9rHCFBbN4+3ISYrbNxiPBgPi/UcbP83d/6xItVzxUwIO6wFlZ/t7eFJqKMq
 0kfCnbnNb3vJefvZkS7L7eLdHDM7Vm8p7fDgmFuNacLMBfvBYb82J3i0O3rqdGlFSktw5d
 o3a8HKuxfnL1VDqQzDST0ce7nvRnfFQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-B1E_1h2oPEq3xXklykkSrQ-1; Fri, 22 Jan 2021 09:10:03 -0500
X-MC-Unique: B1E_1h2oPEq3xXklykkSrQ-1
Received: by mail-ej1-f70.google.com with SMTP id rl8so2236360ejb.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F/G5AOqSCsfh5m/2A8c35GHXNLtZSWsuzFZqZrINSKw=;
 b=H+AqFzSvxUKyUA44uqmmU4VQa8lhitU1QRu8ps8fY3vwOb6ZCOiiFsgxWf+4NuCJiq
 9+axsAveWAb6OWnk8Z2YyiHPkrKKtrlvHby9ep2iIn8tA6UYDsXYNSa6VGUv/Lif7++G
 qGJ+kwQeIv85qZjgWjcN18nrBLlkyU+IgJRjxiA2rV1idPYCIdttUO4yL09RO82R1eJP
 33DeXyE4OTCYmLeUpRaLkRgMrEJaGOLHfs7B4YrN03g455WqJUiDgaOQFUVvmwvAvMTn
 gNCrqAUfBtGCaroGJSlTcwWR9srko78XcflA15d6GgYDxNtsBZ3KdcV/ijbRt1JUDBXt
 oEBw==
X-Gm-Message-State: AOAM532ExL8Rlmvtb2G493ziRr7rk2W8zvDC9/yJE4GfJo+/I64hGkN9
 /Pw7zvTeDGwMMi1RYYgBbF3TmsU41sQ8FFCUtCL2ILKBfJJfPiiQ/1oarJUGhW2770zLvYvEja2
 Obg8SN4H8LelkcLE=
X-Received: by 2002:a17:907:7356:: with SMTP id
 dq22mr3133201ejc.318.1611324602440; 
 Fri, 22 Jan 2021 06:10:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxikMjWM+AMwz2lzwIMaMvF+P0Izj8FLOYFfQJCOhYpH695PjJbuXny920Oe/AM4QziNKwIeg==
X-Received: by 2002:a17:907:7356:: with SMTP id
 dq22mr3133190ejc.318.1611324602266; 
 Fri, 22 Jan 2021 06:10:02 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k21sm5452144edq.60.2021.01.22.06.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 06:10:01 -0800 (PST)
Subject: Re: [PATCH v2] hw/core/resettable: make in-reset state false during
 exit phase call
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20210122103629.5412-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9a988b13-207c-ba8d-8965-ee38ecfa357e@redhat.com>
Date: Fri, 22 Jan 2021 15:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122103629.5412-1-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, Michael Peter <michael.peter@hensoldt-cyber.com>,
 alistair@alistair23.me, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Damien,

On 1/22/21 11:36 AM, Damien Hedde wrote:
> Move the reset count decrement from "just after" to "just before"
> calling the exit phase handler. The goal is to make
> resettable_is_in_reset() returning false during the handler execution.
> 
> This simplifies reset handling in resettable devices.
> 
> Typically, a function that updates the device state will just need
> to read the current reset state and not anymore treat the "in
> a reset-exit transition" special case.
> 
> As a side note, this patch also fixes the fact that the reset count was
> not decremented in case of recursive reset.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1905297
> Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
> --
> 
> Hi,
> 
> Following our discussion:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01013.html
> here's my proposal to fix Michael's bug on a global scope.
> 
> I flaged it v2 because I've taken Philippe's remarks there:
> https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg00635.html
> I've also changed the patch title, I think it is better this way.
> 
> Thanks,
> Damien
> 
> Cc: f4bug@amsat.org
> Cc: peter.maydell@linaro.org
> Cc: alistair@alistair23.me
> Cc: edgar.iglesias@gmail.com
> ---
>  docs/devel/reset.rst | 6 +++---
>  hw/core/resettable.c | 3 +--
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/devel/reset.rst b/docs/devel/reset.rst
> index abea1102dc..021a7277a2 100644
> --- a/docs/devel/reset.rst
> +++ b/docs/devel/reset.rst
> @@ -210,9 +210,9 @@ Polling the reset state
>  Resettable interface provides the ``resettable_is_in_reset()`` function.
>  This function returns true if the object parameter is currently under reset.
>  
> -An object is under reset from the beginning of the *init* phase to the end of
> -the *exit* phase. During all three phases, the function will return that the
> -object is in reset.
> +An object is under reset from the beginning of the *init* phase to the *exit*
> +phase. During *init* and *hold* phase only, the function will return that the
> +object is in reset. The state is changed just before calling the *exit* method.

"An object is under reset from the beginning of the *init* phase to
the beginning of the *exit* phase" ?

An ASCII art would clarify all doubts :)

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  
>  This function may be used if the object behavior has to be adapted
>  while in reset state. For example if a device has an irq input,
> diff --git a/hw/core/resettable.c b/hw/core/resettable.c
> index 96a99ce39e..c3df75c6ba 100644
> --- a/hw/core/resettable.c
> +++ b/hw/core/resettable.c
> @@ -201,12 +201,11 @@ static void resettable_phase_exit(Object *obj, void *opaque, ResetType type)
>      resettable_child_foreach(rc, obj, resettable_phase_exit, NULL, type);
>  
>      assert(s->count > 0);
> -    if (s->count == 1) {
> +    if (--s->count == 0) {
>          trace_resettable_phase_exit_exec(obj, obj_typename, !!rc->phases.exit);
>          if (rc->phases.exit && !resettable_get_tr_func(rc, obj)) {
>              rc->phases.exit(obj);
>          }
> -        s->count = 0;
>      }
>      s->exit_phase_in_progress = false;
>      trace_resettable_phase_exit_end(obj, obj_typename, s->count);
> 


