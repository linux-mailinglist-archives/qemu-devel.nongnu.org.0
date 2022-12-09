Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C28647FB3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 09:58:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ZCq-00027z-OB; Fri, 09 Dec 2022 03:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3ZCk-00027c-Vo
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 03:58:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3ZCh-0000JU-3S
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 03:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670576276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTtbloTj2Tz6vpODNKnwZ1n4yf1Q8z7L3C72i1yI1vw=;
 b=Lc2i+KgO64s9ETMr5fD+NBM4b8xMeMcpS4SYdiVzb3IKUzXImtDZJyymOrmLVXZe5g1kh+
 ttVgX0fa6TF2OJiz/6GKnbH0EKLtQ2PB6M7S4Zbgfbr8GzsbN6k16zll2g5YriOT/ucHv4
 KfFlcdH0l0u8mlLRZWItIfR6Hnrgjtc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-Jg5Bi622PZuVOGASHR--zw-1; Fri, 09 Dec 2022 03:57:55 -0500
X-MC-Unique: Jg5Bi622PZuVOGASHR--zw-1
Received: by mail-ej1-f69.google.com with SMTP id
 hd17-20020a170907969100b007c117851c81so2714635ejc.10
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 00:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTtbloTj2Tz6vpODNKnwZ1n4yf1Q8z7L3C72i1yI1vw=;
 b=IhRDYPUF9py1e+eb2Rlq1BgbBUg2BolUlMvkpMZ/1rYyh8l9YswvQNU+pXI8E1Yys6
 p/5f4qrPLexZfJeL5ma47O6X1IBsnVBT+eNUCuKZRuFPmxUBjMvzFBvJZ3a6BwfDFkcw
 YgUcEcAnAR45iyK5uD+/yFpcCCcaYba/YF9cCjKZRzUPSRYmu2cTI3cG7X8ybvNwMDso
 oQfw0X4+imLO1tG/rBTe5JTWlBBxb1CP8WcaPn/z5PEjdeSL7EYy6zf848Y6fOPT6Jdf
 T84RpYqsuSu0JnCu/9n7yR/U1iAboJS4cWykG7zekdacFx5knDIGx5REgJY60MKW/xbj
 BlGA==
X-Gm-Message-State: ANoB5plZZXXFhmte3EniqHbXdT76bjU7mpOEKn0jPwkW5LxupLr77z7h
 rIcD9uQOFlmcPxEvOC/95pEhQvT7DumUMvN4zhCb8FZaXWK0O5/Ott6vJ66ymHCl6U8jXowBvda
 aC1gNfUF+WajrCwc=
X-Received: by 2002:a17:906:a081:b0:78d:f455:b5fa with SMTP id
 q1-20020a170906a08100b0078df455b5famr4435183ejy.58.1670576274303; 
 Fri, 09 Dec 2022 00:57:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6N0gQo1fIEXLAn+yIibVNgmRCqObcV+jPukEK6CyJ7YuKqX5hOAYalT9Avhip/5WdGSDLK9Q==
X-Received: by 2002:a17:906:a081:b0:78d:f455:b5fa with SMTP id
 q1-20020a170906a08100b0078df455b5famr4435156ejy.58.1670576273960; 
 Fri, 09 Dec 2022 00:57:53 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 gx19-20020a1709068a5300b007c0abe46deasm319180ejc.81.2022.12.09.00.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 00:57:53 -0800 (PST)
Message-ID: <aa5c9f61-a5f2-98f0-68ed-a71f71a3b766@redhat.com>
Date: Fri, 9 Dec 2022 09:57:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] blockdev: add 'media=cdrom' argument to support usb cdrom
 emulated as cdrom
Content-Language: en-US
To: Zhipeng Lu <luzhipeng@cestc.cn>
Cc: Markus Armbruster <armbru@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Fam Zheng <fam@euphon.net>
References: <20221201134227.1983-1-luzhipeng@cestc.cn>
 <871qpjf86a.fsf@pond.sub.org> <1d355249-9ab0-f824-e00d-3135cb2646b5@cestc.cn>
 <4ce0329b-0868-f6b5-63f2-62ae212c76a7@redhat.com>
 <718dbdad-4920-d2c8-b3a6-c0f83fd818f1@cestc.cn>
 <CABgObfb9kL2WCHUNQ4KVRAQWZPGBWmKGyaodX5yMChS+9x9PmA@mail.gmail.com>
 <0e5293ac-1093-224a-4ce0-1b9f3d940749@cestc.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <0e5293ac-1093-224a-4ce0-1b9f3d940749@cestc.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.266, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/9/22 03:28, Zhipeng Lu wrote:
> Thanks.
> 
>   -device usb-bot,id=bot0
>   -device scsi-{cd,hd},bus=bot0.0,drive=drive0
> 
> Qemu implements virtio scsi to emulate scsi controller, but if the 
> virtual machine(for example windows guest os) don't install the virtio 
> scsi driver, it don't work
> i need the function: emulate cdrom in guest, support hotplug and unplug, 
> not  depend on virtio driver

usb-bot *is* a SCSI controller and it does not require drivers in the 
guest.  It is not very high-performance, but as you say it has hotplug 
functionality via USB.

Paolo


