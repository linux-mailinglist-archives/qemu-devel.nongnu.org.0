Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A593308739
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:08:23 +0100 (CET)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PlO-0007ZE-HU
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Pjd-0006Ul-3A
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:06:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5PjZ-0008HM-PX
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611911188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtBlQT58W0uDWIb4j5BwpPSxycOBFXaS1asX9OSSYW0=;
 b=KPvfEqu77bx5UvJgMGxgS7Al53QpccyhMKlGYkR+gfIe4AHikFuKewqbtV7bWoXrUgVusJ
 KWQxNhYNfaXy+kiLps4wWnTbYOS1Ph6mUEa9i2cLU8yBREZJgMbx2oNsL5NtmV4XwDFFAx
 2cQxHPetbXoDeFGHYHMmSfQuzZiclqs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-qlbeQAeUMPqZ7krt4mCo6w-1; Fri, 29 Jan 2021 04:06:26 -0500
X-MC-Unique: qlbeQAeUMPqZ7krt4mCo6w-1
Received: by mail-ed1-f70.google.com with SMTP id e25so4600248edq.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 01:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RtBlQT58W0uDWIb4j5BwpPSxycOBFXaS1asX9OSSYW0=;
 b=TaKbACUPXpyuR2Y3QbYJWPUu1xEKSp3MoaFV5dq4ECg1hnDTbLKQibD7fT97mhnsGW
 Yp/Gque9VfT5AU5cdwvRWijnhgBa+6Q8J2lvOwLTsABkAsQsQjf9MYlBBheaePIu/PWI
 9mKlqdqxjbVLGsX92Sj7gmDG3+h6rz2UlFH/gzcRGlmGm9j8I6sF77dn38fNEmclXGK7
 GNII5EsdVIa0z5sMlvelpXJ5ugW0huO6tOz3IKmaNHLhJqnXUnoUTNHVHHtdWoENV+X5
 PTapN/P4RV2Md7g2JRPPfGo5oHr7C/p2UMDWWhK+wRC1pYPlC6nAL+Z2ArWsRRRPyYpJ
 QRnQ==
X-Gm-Message-State: AOAM530McZknA/wsCMmXxwIa5zVDhZmfLkfFnEKru1kIC1jOk1KMQr6J
 4I1aBaKb0kWbg0+XYFMMGP7Ql7vSrxK69ZeBDoRJNERmwvcYuTqTyJDzS8Tlp1JPvoSiWMif4e3
 dxzyFipXPsUc4m+s=
X-Received: by 2002:a05:6402:424a:: with SMTP id
 g10mr3996129edb.236.1611911185358; 
 Fri, 29 Jan 2021 01:06:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2AvlAjXnNnkuzuXbDajmHOxLKcTYGJ2DpynGJcLr2tSA2bGnFjl8PyE2PZPxvkI1La6rwuA==
X-Received: by 2002:a05:6402:424a:: with SMTP id
 g10mr3996087edb.236.1611911185049; 
 Fri, 29 Jan 2021 01:06:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x20sm3436607ejv.66.2021.01.29.01.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 01:06:24 -0800 (PST)
Subject: Re: [PATCH RFC 1/1] hw: Replace anti-social QOM type names
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210129081519.3848145-1-armbru@redhat.com>
 <20210129081519.3848145-2-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6d69c392-1c53-cc35-d504-0ada33ca37c5@redhat.com>
Date: Fri, 29 Jan 2021 10:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129081519.3848145-2-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 frederic.konrad@adacore.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 jcd@tribudubois.net, qemu-block@nongnu.org, quintela@redhat.com,
 andrew.smirnov@gmail.com, marcandre.lureau@redhat.com, atar4qemu@gmail.com,
 ehabkost@redhat.com, alistair@alistair23.me, dgilbert@redhat.com,
 chouteau@adacore.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 jsnow@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/21 09:15, Markus Armbruster wrote:
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 7fc547c62d..0dd158bf73 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -2547,7 +2547,7 @@ void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
>      DeviceState *dev;
>      FDCtrlSysBus *sys;
>  
> -    dev = qdev_new("SUNW,fdtwo");
> +    dev = qdev_new("SUNW-fdtwo");
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sys = SYSBUS_FDC(dev);
>      sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);


Missing:

         fdc_name = object_get_typename(OBJECT(fdc_dev));
         drive_suffix = !strcmp(fdc_name, "SUNW,fdtwo") ? "" : i ? "B" : 
"A";
         warn_report("warning: property %s.drive%s is deprecated",
                     fdc_name, drive_suffix);
         error_printf("Use -device floppy,unit=%d,drive=... instead.\n", i);


