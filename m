Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94501DB25D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 13:53:57 +0200 (CEST)
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbNIK-0001t5-Lp
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 07:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbNHV-00018A-RZ
 for qemu-devel@nongnu.org; Wed, 20 May 2020 07:53:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47330
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbNHV-0008Jc-3A
 for qemu-devel@nongnu.org; Wed, 20 May 2020 07:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589975584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qri14Msi9BU2BD1z+Ox+m9OIiWj1DJPijAw5aya/39Y=;
 b=MFBMgCIrGIHgewnYjxdAhzR5N4UH5NpHx/qp+2N1a62EL71lnE4J5C/3O2sCvoux7dymi7
 lYTl0BXngj9S6rPGj88qKQ6YlXTd6XSP/y5drV+DxXTfT0YmsiqodpODCtA4VJbi4Z78JT
 irtXKDkxRRvehs4zUWpkd2olTQKPiRs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-9oIA7ysgNICbIbeHri2dEw-1; Wed, 20 May 2020 07:53:02 -0400
X-MC-Unique: 9oIA7ysgNICbIbeHri2dEw-1
Received: by mail-wr1-f69.google.com with SMTP id p2so1310182wrm.6
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 04:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qri14Msi9BU2BD1z+Ox+m9OIiWj1DJPijAw5aya/39Y=;
 b=kuJn6b5XwhJ59ux5DqI4hBZd5KNUPZzeijMpmoNwbbDY0O1Gwr13WJ4DqppZp9KjtX
 qRE6qNm5dL5O/9eVAo+e2ZVNKl3GxQyVH12m7P4Ewfi8/bZ9iU7QTHKVascj/LjMUvh3
 R9vTclZSCtiVY8gogK3I03OEYklCOYScekdH5TCBvCNphKnikke/SuH/Xb0gGBF97du6
 PQ6ykCYzQFjXZz+bt5SgBFF0f13YuRK5oYqmahPJwF8kW0pTYyVM1lbJHIdACYsYLnUW
 4yNO7Juv0LHdwBLE+GFUc72QKYU09NTk20rjpptg3xW6xw5q+dv4ZDfZlgVtVzDSs+5p
 wpvg==
X-Gm-Message-State: AOAM532AD2MJpMZYKqYtG+bK9BxxAbSzQeZD2cGy6TujzTIOrnQLV8SU
 FMi1zWm7pg7kp23/5f4KXKhYXQAjG6nZg/EhW3EZNbda36r+wIiVm3MjclvecOmRZAJTKGlAI31
 02UE99cGhamVUx0E=
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr3721654wrw.93.1589975581026; 
 Wed, 20 May 2020 04:53:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIOz+W/uf/IHltLCXl7P44X20WzmmHC98WJKWupQaxnO1KLl8e3g/ZWyEc4UlyBBNywYjOhA==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr3721638wrw.93.1589975580801; 
 Wed, 20 May 2020 04:53:00 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 10sm2918480wmw.26.2020.05.20.04.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 04:53:00 -0700 (PDT)
Subject: Re: [PATCH 32/55] auxbus: Eliminate aux_create_slave()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200519145551.22836-1-armbru@redhat.com>
 <20200519145551.22836-33-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6285e11e-7e46-7241-c199-857a745d24fc@redhat.com>
Date: Wed, 20 May 2020 13:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200519145551.22836-33-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 22:48:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/20 4:55 PM, Markus Armbruster wrote:
> aux_create_slave() has become a trivial wrapper around qdev_new().
> There's just one user.  Eliminate.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/hw/misc/auxbus.h | 7 -------
>   hw/display/xlnx_dp.c     | 2 +-
>   hw/misc/auxbus.c         | 9 ---------
>   3 files changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
> index 6ab6cf5bb6..60b6311eb7 100644
> --- a/include/hw/misc/auxbus.h
> +++ b/include/hw/misc/auxbus.h
> @@ -131,13 +131,6 @@ I2CBus *aux_get_i2c_bus(AUXBus *bus);
>    */
>   void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio);
>   
> -/* aux_create_slave: Create a new device on an AUX bus
> - *
> - * @bus The AUX bus for the new device.
> - * @name The type of the device to be created.
> - */
> -DeviceState *aux_create_slave(AUXBus *bus, const char *name);
> -
>   /* aux_map_slave: Map the mmio for an AUX slave on the bus.
>    *
>    * @dev The AUX slave.
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 75de65ec96..77636db893 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1247,7 +1247,7 @@ static void xlnx_dp_init(Object *obj)
>       /*
>        * Initialize DPCD and EDID..
>        */
> -    s->dpcd = DPCD(aux_create_slave(s->aux_bus, "dpcd"));
> +    s->dpcd = DPCD(qdev_new("dpcd"));
>       object_property_add_child(OBJECT(s), "dpcd", OBJECT(s->dpcd));
>   
>       s->edid = I2CDDC(qdev_new("i2c-ddc"));
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index 682c35ece8..1e9316ff73 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -273,15 +273,6 @@ static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
>                      memory_region_size(s->mmio));
>   }
>   
> -DeviceState *aux_create_slave(AUXBus *bus, const char *type)
> -{
> -    DeviceState *dev;
> -
> -    dev = qdev_new(type);
> -    assert(dev);
> -    return dev;
> -}
> -
>   void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio)
>   {
>       assert(!aux_slave->mmio);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


