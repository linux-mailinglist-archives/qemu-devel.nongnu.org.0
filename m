Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5D484F36
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 09:22:45 +0100 (CET)
Received: from localhost ([::1]:58496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n51ZD-0000DO-I6
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 03:22:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n51Vo-0006Wc-ND
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:19:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n51Vk-0000Aj-JV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641370747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqvsDGafEeb6jEuqer8QDiXlsjBwlR9s+p8sUExp4HM=;
 b=hG/6/Iec1xiaxULwfU02WVxT1a3f9Lc73T49DdsmXeLQHLG3Pc6W8/rggXjrOtEKa0Yw8V
 fB5f4sUUHBpKFEcuxU3M0LezqP3vH2YFdrczHuC3jBxpbifyunQxxJ8yO97wniKw3im0Gs
 4FZTPdaNfMwqun8cGO1le15fQty5fdU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-JM1izReqNsWLjjomTuu3hg-1; Wed, 05 Jan 2022 03:19:06 -0500
X-MC-Unique: JM1izReqNsWLjjomTuu3hg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so799783wmp.1
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 00:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=LqvsDGafEeb6jEuqer8QDiXlsjBwlR9s+p8sUExp4HM=;
 b=n6D7dDzEAcBGzhorjKJCoLOs8i3bb5RCH62IuNhat5oPAlnu24k8T6i51G+e8oT14X
 VaGEL3cKgZYiZ3dMbJjiEohRH57CIq3OYHveBxsKvAq+ZjM+v7zDWYg8o2mineJpoTd8
 XUiRlTTvgq0YXSSP9PzGsml28wiEbBOqJwZI2u7kY0YsajmgAcbzal92d6A9LQucXnly
 4uYjxMQURfL8h/Un1YYPS2693kiV2BlkJ6Feblvr3l1l4JjIxXz71WsrM27oRgh41wu9
 qKeJU2fux/LnOTKn5mRAd9z7FRtVoNCQt4XyPOvl/ieyM9wI4C1rbOvgDt3idtd2I/Gp
 fvyQ==
X-Gm-Message-State: AOAM531cWTzepaOMk2xi2rJN4JaBBT9XqYHWUBUyJTONmSFiKEPIPESw
 lTu7wVMbekfPtbR1Ph3SRdiHOAaSnWdbLaOaojTu6b3WlOD/uZqZc5PyOEamDWO4gDpe/rSo8dN
 ycsQ61aIHnvjIp9Gce6CDrLl7IbDCHLZF3qEby2yEZ+4frahdaKWWl89V8/vVxV4=
X-Received: by 2002:a05:6000:1a88:: with SMTP id
 f8mr46978505wry.75.1641370744930; 
 Wed, 05 Jan 2022 00:19:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycSbWOMPk5Edylz4ZyWgujte7XpT/9I9MKl+o3SZUxGIUQHzZBo/F9H6W2DhG6Xa/Y8pe9nw==
X-Received: by 2002:a05:6000:1a88:: with SMTP id
 f8mr46978493wry.75.1641370744724; 
 Wed, 05 Jan 2022 00:19:04 -0800 (PST)
Received: from [10.33.192.229] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id m5sm1849868wml.14.2022.01.05.00.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 00:19:04 -0800 (PST)
Message-ID: <b8696783-8dde-28c1-da80-22b276e99a73@redhat.com>
Date: Wed, 5 Jan 2022 09:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH for-7.0] hw/i386/pc: Add missing property descriptions
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20211206134255.94784-1-thuth@redhat.com>
In-Reply-To: <20211206134255.94784-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 14.42, Thomas Huth wrote:
> When running "qemu-system-x86_64 -M pc,help" I noticed that some
> properties were still missing their description. Add them now so
> that users get at least a slightly better idea what they are all
> about.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/i386/pc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc..837f2bff4e 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1734,15 +1734,23 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>   
>       object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
>           pc_machine_get_smbus, pc_machine_set_smbus);
> +    object_class_property_set_description(oc, PC_MACHINE_SMBUS,
> +        "Enable/disable system management bus");
>   
>       object_class_property_add_bool(oc, PC_MACHINE_SATA,
>           pc_machine_get_sata, pc_machine_set_sata);
> +    object_class_property_set_description(oc, PC_MACHINE_SATA,
> +        "Enable/disable Serial ATA bus");
>   
>       object_class_property_add_bool(oc, PC_MACHINE_PIT,
>           pc_machine_get_pit, pc_machine_set_pit);
> +    object_class_property_set_description(oc, PC_MACHINE_PIT,
> +        "Enable/disable Intel 8254 programmable interval timer emulation");
>   
>       object_class_property_add_bool(oc, "hpet",
>           pc_machine_get_hpet, pc_machine_set_hpet);
> +    object_class_property_set_description(oc, "hpet",
> +        "Enable/disable high precision event timer emulation");
>   
>       object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>           pc_machine_get_default_bus_bypass_iommu,

Friendly happy new year ping!

  Thomas


