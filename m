Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E02528832
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:13:44 +0200 (CEST)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcPn-0003rV-5h
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqbzc-0004XL-Nr
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqbmr-0005Qc-C0
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652711593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKPBgWBFtYsFKbNO8Ry0dcI/s2YyGwnSLBbOytNVTtA=;
 b=MhLNINpeTPCqZBJyupO5ooscUyTCjEWqfTPl4yJRlYQ9cy/nyXeHgER+sWYeqQp7T0NYCH
 PY9cEkpjoHGoH44ZJZOw+ftdmd2C3HbF4gpmvruEVZJjVRo+Tn/FVofK7TL7S+j7YjQB06
 S48f2qmElIp1fyuWnTBqQujop2Z7ejQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-ieNqI1oqP72Tvnhbj8nm8w-1; Mon, 16 May 2022 10:33:11 -0400
X-MC-Unique: ieNqI1oqP72Tvnhbj8nm8w-1
Received: by mail-wm1-f70.google.com with SMTP id
 p24-20020a1c5458000000b003945d2ffc6eso6851907wmi.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HKPBgWBFtYsFKbNO8Ry0dcI/s2YyGwnSLBbOytNVTtA=;
 b=a8jJueNd2eu15ZIlRKN/vfvYu5hrRqUI8FGqjwYqIhZ3Z9IIjS2CW1d+35ItaYk4Gm
 uw/T4nzz2ucUytkX5ZPOZbVly7Kd3FDwVzRpO3mRck5uiAIRJjcFA82zLCLHtAgtilil
 JtJIgyUbqMqGT+6+G0f+Isc0DtBP5X/gavNwRuKydUqQFKaknp7r687YdcF5T0ir2Jpc
 R0zAtrlcvp1LmRgNYzUONsGAICwcaVY8Z4VDzqCpxampg8XQQ5aKWjnQqWA1QxAd3gUz
 p9Eo24laSwO86OMLUdEhoH/G8L4wX3Oj4YV8MikyxkM0zU3jGpRTuXAhqBoBb9+yaLPi
 Ab+Q==
X-Gm-Message-State: AOAM530kyiOsVW8jrVDMVOqHqAQjgdtyIovWTsFMqIk/StsovS+kO1YX
 gvidO/vN91cBWQr4rRONAdpmASPUcLN23PFiZgWPa6ROU8grfZ5m8dRW2ZnP/GOnH2Kudqa7jY1
 2M12bdWTsCBJqLwE=
X-Received: by 2002:a05:600c:3d8c:b0:396:fad3:6c2f with SMTP id
 bi12-20020a05600c3d8c00b00396fad36c2fmr8510497wmb.45.1652711590801; 
 Mon, 16 May 2022 07:33:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYw13OeyOWTVk/jOz07g3AFSBfVxuJuAfthiFC4cDyfkNMMQcx45+4itAmUBWXpUp/dHSpNw==
X-Received: by 2002:a05:600c:3d8c:b0:396:fad3:6c2f with SMTP id
 bi12-20020a05600c3d8c00b00396fad36c2fmr8510467wmb.45.1652711590490; 
 Mon, 16 May 2022 07:33:10 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-178-142.web.vodafone.de.
 [109.43.178.142]) by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003942a244ebesm10754908wms.3.2022.05.16.07.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:33:10 -0700 (PDT)
Message-ID: <2d9f4a3c-aae5-f407-e8ea-2762de5ad4a2@redhat.com>
Date: Mon, 16 May 2022 16:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] mos6522: fix linking error when CONFIG_MOS6522 is not
 set
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, mopsfelder@gmail.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220510235439.54775-1-muriloo@linux.ibm.com>
 <aca5b885-daea-bb59-e79e-3317e3854cf3@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <aca5b885-daea-bb59-e79e-3317e3854cf3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 16/05/2022 16.14, Daniel Henrique Barboza wrote:
> 
> 
> On 5/10/22 20:54, Murilo Opsfelder Araujo wrote:
>> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
>>
>>      /usr/bin/ld: 
>> libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined 
>> reference to `hmp_info_via'
>>
>> Make devices configuration available in hmp-commands*.hx and check for
>> CONFIG_MOS6522.
>>
>> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>> Cc: Thomas Huth <thuth@redhat.com>
>> ---
> 
> Thomas,
> 
> 
> Are you going to pick this up via your misc patches tree? If not I can take it
> via ppc64.

I didn't queue it yet, so please take through your ppc branch.

  Thomas


