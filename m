Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76141D734C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 10:54:14 +0200 (CEST)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jabXJ-0004oW-OM
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 04:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jabWO-0004Nm-Nt
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:53:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30078
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jabWN-0002gq-6E
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589791993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoAlWydFx2mzj9VGVLSiR4BBE+kVQ8/ZaGtmn/SIiaQ=;
 b=MCU5Z/Yy5286argXvug2LCxSDNlFJOHgvULQlM/k0boSoW7UFWcT/7oJl3iAx9TyqJRRtg
 hS/ygo27Qe/i5/NaRSJ+JknWPX70VpJET7XITUro/MmzKo7BIZbWDEub4xncXXL44rI51U
 REgsGqUGq3oC0GvIQM7BlR/KUKBF4V8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-3gX1sGr9OiCTCX-RS5CEwQ-1; Mon, 18 May 2020 04:53:11 -0400
X-MC-Unique: 3gX1sGr9OiCTCX-RS5CEwQ-1
Received: by mail-wr1-f71.google.com with SMTP id u5so5284389wrt.22
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 01:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CoAlWydFx2mzj9VGVLSiR4BBE+kVQ8/ZaGtmn/SIiaQ=;
 b=kQx9T8jza/N0fEwNwVt7GRdEt3UGu7NjZsWG+gkcJyjJReZGued4b62uv0ooTA/NRu
 XT0jwiyoRkgo7f4UVxB5cA9fKTKvKGWc55URMCmD/Nf2sjTYt2irqEa+RPVBKf2CoFJ5
 ezU2+GODO6B/q82t/mrtaKmtBv1sxXZcfZKEMWjPjmRm6EDaqGHztC8vr3ahawaDxnkl
 BmpMM7xBKJnn6B4Jlslozh0PzBWnp957QaF88C0u0tRHc4Tn51JlWp0nxbqdrpWBcqxy
 a1JktqBGMuUyhFOjPH+QOJ0WSmF1Av/zevEFqp17qSfAattqsHHeUKvNF0UgN3O2/m5K
 84Mg==
X-Gm-Message-State: AOAM532IQMT8q1xiWtwMD+9m8S+AiskLbYiZfhQRtVLaQnPnH24rBZGa
 j0RB1B9F7uX2+ftwGoGH+FNNyRH67QAYWhOnVM4Aoma/W6NXHJw39xltbfIuJlDQAuK4YGuLtWA
 tJVmFCzJokXw/wY8=
X-Received: by 2002:a5d:5710:: with SMTP id a16mr18001784wrv.209.1589791990662; 
 Mon, 18 May 2020 01:53:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhuTdtQJqbHdXMM/ufcbnqmQDgK4WDB7r9mXGpElTiExic2fgk1a+vS/yVd43LQlwsw9JqYA==
X-Received: by 2002:a5d:5710:: with SMTP id a16mr18001767wrv.209.1589791990454; 
 Mon, 18 May 2020 01:53:10 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id z11sm15596896wro.48.2020.05.18.01.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 01:53:09 -0700 (PDT)
Subject: Re: [PATCH 07/24] auxbus: Fix aux-to-i2c-bridge to be a subtype of
 aux-slave
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-8-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1d26dd77-d9c0-f8a1-ed9b-5ad54ce4f786@redhat.com>
Date: Mon, 18 May 2020 10:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-8-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/20 7:03 AM, Markus Armbruster wrote:
> We plug aux-to-i2c-bridge into the aux-bus, even though its
> DeviceClass member bus_type is null, not TYPE_AUX_BUS.  Fix that by
> deriving it from TYPE_AUX_SLAVE instead of TYPE_DEVICE.
> 
> Cc: KONRAD Frederic <fred.konrad@greensocs.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/misc/auxbus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index f8e7b97971..5e4794f0ac 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -244,7 +244,7 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
>   
>   static const TypeInfo aux_to_i2c_type_info = {
>       .name = TYPE_AUXTOI2C,
> -    .parent = TYPE_DEVICE,
> +    .parent = TYPE_AUX_SLAVE,
>       .class_init = aux_bridge_class_init,
>       .instance_size = sizeof(AUXTOI2CState),
>       .instance_init = aux_bridge_init
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


