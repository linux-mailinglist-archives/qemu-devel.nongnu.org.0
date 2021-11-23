Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7945A445
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:59:38 +0100 (CET)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWKf-0008A3-To
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:59:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpWIz-00072I-TX
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpWIu-0005x1-5q
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637675865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekJ+Ytt7dbTKeAGjTnW54K3FrMtFbGxKe4kB2YlgvxM=;
 b=WnEmVM4hTGazRze4htUMtSIyZgy4Y1w+YjHFLBAPTC2lyB0RtVW7qAFEwqqt9+ozXCqBrr
 SKYWa/hOPEJcH077hO1cH5xg7vy1jZi0lSQF+dCJ/++293MlQ3L3qpZ6XN3J5Bp4dLccmb
 jG0j2jryJVsHnscz9BV3wLDsnvOfVsA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-tqrXoVu6O6CrBz0cC5HQpQ-1; Tue, 23 Nov 2021 08:57:42 -0500
X-MC-Unique: tqrXoVu6O6CrBz0cC5HQpQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c8-20020a7bc848000000b0033bf856f0easo1279824wml.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ekJ+Ytt7dbTKeAGjTnW54K3FrMtFbGxKe4kB2YlgvxM=;
 b=5/KPW/LoNYtx7BhObA3PoHf1SpWUasA0+JGfCwWOWYFfVDIyermWE6Sy8AGjn74+2p
 rE74YZZfLKHdo4Qz7+SHehmojGPwuhlz+ovvhjFtIgA1fmi0d2pVoH3f/ZHBoqANl/ss
 cdmqb6dwmcLgYTYr5AvrU5NSKSCKTSrLYOXqNO+HvAdE5TSFDtWePA6POfFbsIqGlYA5
 +A0/GNsPlIGTqNBnQUoWktQsxwatsjxscBBKK3HiFHuWUQIueisyd5xykR7idW3WyRhB
 hOnXlfKnha8IVVVvIL/9CHvT55DwS+WDgwVvSBxEFSxjlsqUzTyfVT4jtJIQHItH6rX2
 K8ug==
X-Gm-Message-State: AOAM5322Vo/ZHUFqubqnLc6VqFpvSA5r1eJlOIYzyUMQsKGFIqdSjE1T
 KLRWNQvBmPdF8K//JDr2848TsXI+L7mU7XewB9c1Xu/FF8dSgKyS8z1sJ1hsjELRHiVJ2U48GQ0
 salvLmnUSj8NSdvQ=
X-Received: by 2002:a05:600c:1c20:: with SMTP id
 j32mr3294595wms.1.1637675861530; 
 Tue, 23 Nov 2021 05:57:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoZyb6eECiTZ8MnWKCBB4+ixLdQRajUFV14OrBf/dXEYLCEnqMrJujMZoILUpzWe/dHjRoiQ==
X-Received: by 2002:a05:600c:1c20:: with SMTP id
 j32mr3294551wms.1.1637675861263; 
 Tue, 23 Nov 2021 05:57:41 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w17sm12317450wrp.79.2021.11.23.05.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 05:57:40 -0800 (PST)
Message-ID: <e7dea0a6-b01e-74bf-6c0c-4d378140c629@redhat.com>
Date: Tue, 23 Nov 2021 14:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 v3 1/2] hw/block/fdc: Kludge missing floppy drive
 to fix CVE-2021-20196
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20211118120635.4043197-1-philmd@redhat.com>
 <20211118120635.4043197-2-philmd@redhat.com>
 <f01963c1-9445-1d0d-ae8e-6649d8397934@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <f01963c1-9445-1d0d-ae8e-6649d8397934@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 14:33, Hanna Reitz wrote:
> On 18.11.21 13:06, Philippe Mathieu-Daudé wrote:
>> Guest might select another drive on the bus by setting the
>> DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
>> The current controller model doesn't expect a BlockBackend
>> to be NULL. A simple way to fix CVE-2021-20196 is to create
>> an empty BlockBackend when it is missing. All further
>> accesses will be safely handled, and the controller state
>> machines keep behaving correctly.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: CVE-2021-20196
>> Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
>> BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   hw/block/fdc.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index d21b717b7d6..6f94b6a6daa 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -1161,7 +1161,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
>>     static FDrive *get_cur_drv(FDCtrl *fdctrl)
>>   {
>> -    return get_drv(fdctrl, fdctrl->cur_drv);
>> +    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
>> +
>> +    if (!cur_drv->blk) {
>> +        /*
>> +         * Kludge: empty drive line selected. Create an anonymous
>> +         * BlockBackend to avoid NULL deref with various BlockBackend
>> +         * API calls within this model (CVE-2021-20196).
>> +         * Due to the controller QOM model limitations, we don't
>> +         * attach the created to the controller device.
>> +         */
>> +        cur_drv->blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
> 
> So to me this looks basically like a mini version of
> floppy_drive_realize(), and I was wondering what else we might want to
> use from that function.  fd_init() and fd_revalidate() look interesting,
> but it appears that fdctrl_realize_common() already did that for all
> drives so we should be good.

How the controller / bus / floppy / drive are connected is a bit
confusing. Did you ever try to hot-remove the magnetic medium from
the floppy plastic enclosure while the controller rotates it?

> Then again, fd_revalidate() behaves differently for the initial drv->blk
> == NULL (drv->drive is set to TYPE_NONE, and last_sect and max_track are
> set to 0) and for then later !blk_is_inserted() (drv->drive not changed
> (so I guess it stays TYPE_NONE?), but last_sect and max_track are set to
> 0xff).  Not sure if that’s a problem.  Probably not, given that I think
> drv->disk and drv->drive both stay TYPE_NONE.

I'm not sure about the future plans for this device model...

> Reviewed-by: Hanna Reitz <hreitz@redhat.com>

Thanks!


