Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E31D738B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 11:11:53 +0200 (CEST)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaboN-00079Z-V6
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 05:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jabnX-0006i0-TN
 for qemu-devel@nongnu.org; Mon, 18 May 2020 05:10:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40412
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jabnW-0007W9-C5
 for qemu-devel@nongnu.org; Mon, 18 May 2020 05:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589793057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=datTDL3xLtt9An9huHFRm8NAi1StmLKwus16g4K1PgA=;
 b=PEGurffkjGJrsAdP0UxCO1CQUHRPPa9JPS53N5prfDOxrfJzymDS7wM1IxKeAAS0FMcSx7
 f3CREkmbY5ebycGHDfAyh+X854ngXTjZfgQhy7MEydxneTdEORroWTyc6bVvl+/jGBIgIj
 OXT+1DPn2UjzyrERkxQU4szlyyCq1Wo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-KyFQ9xlqPyOT_RPyHUeieg-1; Mon, 18 May 2020 05:10:55 -0400
X-MC-Unique: KyFQ9xlqPyOT_RPyHUeieg-1
Received: by mail-wm1-f70.google.com with SMTP id e15so7007672wme.1
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 02:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=datTDL3xLtt9An9huHFRm8NAi1StmLKwus16g4K1PgA=;
 b=tbT/fChCpW9y23ov9sj4OKwoxiq+PQmPlT0elja7rvaAVriWAl1iANbU/skkZhr3kw
 LT+C1rETh2fTQmEztSe8KS9o7jx7+eA9dm+69/Q7xvsJYb2X2b6rMcXT4MYwG4K+lk6h
 80hL/BU9XeXtF7yy1pN3Rynd83bo/N8VJUDLj4ZtVQyz3NtmfgZKAdS6IHC0A6ra5ZeV
 BEiULjLL50tr5+YkE+jyflQP1MdNJW9y9UC6T9Mc3dONdx5R7PQ7iqkLMHhynxVF4GMo
 TCwADClUqoJPMsSyPu3Wia3nJW+01+9QVJiXnSiWglp02sHupWUV0Xd2pbZ7QJZd9SMp
 vRwA==
X-Gm-Message-State: AOAM532rnKiZjMzF4XfMjGRbK47NDCJUFIBh1NtQXlVHZJ7E0MZUihTE
 tdJX6QOEHuf+KMjw8rnmDOvN8vW6S7UZR5XvRVA2IoyfXPP4A++QUQjS7wdSkQhbahtm7rF+hns
 Ga1p7bLYnNDgoS5w=
X-Received: by 2002:a1c:9d50:: with SMTP id g77mr18689115wme.56.1589793054236; 
 Mon, 18 May 2020 02:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWBrnfBdotHSkGNuTqFU586mbr0dLLdPxzFOkLxe1IsV+oUNe18NknKd9iVhSk6Q/EzJr1WQ==
X-Received: by 2002:a1c:9d50:: with SMTP id g77mr18689089wme.56.1589793053954; 
 Mon, 18 May 2020 02:10:53 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id u23sm1340475wmu.20.2020.05.18.02.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 02:10:53 -0700 (PDT)
Subject: Re: [PATCH 24/24] qdev: Assert onboard devices all get realized
 properly
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-25-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <deccdf13-388d-0941-79df-23086032f125@redhat.com>
Date: Mon, 18 May 2020 11:10:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-25-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 5/18/20 7:04 AM, Markus Armbruster wrote:
> This would have caught some of the bugs I just fixed.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/core/qdev.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 0df995eb94..fe2dea8968 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -429,6 +429,19 @@ void qdev_init_nofail(DeviceState *dev)
>       object_unref(OBJECT(dev));
>   }
>   
> +static int qdev_assert_realized_properly(Object *obj, void *opaque)
> +{
> +    DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
> +    DeviceClass *dc;
> +
> +    if (dev) {
> +        dc = DEVICE_GET_CLASS(dev);
> +        assert(dev->realized);
> +        assert(dev->parent_bus || !dc->bus_type);

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    }
> +    return 0;
> +}
> +
>   void qdev_machine_creation_done(void)
>   {
>       /*
> @@ -436,6 +449,9 @@ void qdev_machine_creation_done(void)
>        * only create hotpluggable devices
>        */
>       qdev_hotplug = true;
> +
> +    object_child_foreach_recursive(object_get_root(),
> +                                   qdev_assert_realized_properly, NULL);
>   }
>   
>   bool qdev_machine_modified(void)
> 



