Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10F3E340C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 10:18:27 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCHXG-000207-HJ
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 04:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCHWF-0001Fz-Nm
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 04:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCHWE-0000YA-18
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 04:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628324241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JnO11yHz0gOXBZHq9pGEXrLe/X02k7FZeJTNv7tw8So=;
 b=FiZf+tzKrvrQtDCwEfXfMLYev07oeXW73RZ2y+eLCHacxu2rj2VS/4i/a+7aVwNm1TQATr
 8F+nJitfVqZoaoifYzN1vVhDUGs2NUs8HA+Oy/kzL2goq0/taYBvbZAo1iaXMWCB7YmRqF
 ViF5TdbAE4rnXaNf5ko4bD1RNpy34ro=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-W8EZKVWKPhWHEOerefpQ5w-1; Sat, 07 Aug 2021 04:17:20 -0400
X-MC-Unique: W8EZKVWKPhWHEOerefpQ5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so344308wmd.7
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 01:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JnO11yHz0gOXBZHq9pGEXrLe/X02k7FZeJTNv7tw8So=;
 b=ZTJpMr1priZr/znv9qvyOvOQTwKroUrRCv/24wQTcf8wNe9Pj7FW8rPzpnY1VYxNLm
 GGLY9UVNZDst5jjVfA2JgUMdTEJpH//LoFPlSwtsRnSeTzuKjLfnn4WI+KYP2lkNZ8sE
 Pn+R5mXhc3lGbXi7rghSSobBUIwdMe1CmCjtfie+Xr76z7v3WbQb7k38V1Ek8G5zlzmT
 E2yp8bayzc0QzwGq64yKecBQRwgrbdt5j8MnDR7ZOU5jo7b8hIzAC+ywf4JbHcyf0rct
 yjAP5HR+qZEoqfQIGRZQVEgMT7PFDpwMNPfg3O0gnbnMRpXRDA4xLiIROic0Or2IQS5B
 m1Eg==
X-Gm-Message-State: AOAM531G0Vt2clseQ150Dzwg9LGuPxnf8ji8TmKPd3ksoL8a+p5pKSpD
 5q8cD/P/6Hvh8MBrm9Q+Go1JjyJAHIB6hqV+0QlnXPaHpLoKRpkDM6PJpqj6Vjs6A3y0/qwzJ+n
 ixF+hJFr8/egw6Wc=
X-Received: by 2002:a05:6000:1366:: with SMTP id
 q6mr14618772wrz.60.1628324238895; 
 Sat, 07 Aug 2021 01:17:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNyUwnO1414uqZYlAG/LrLZ2awOtZwYDg+SHpHhKR1lpnO9NlS9t296IIoA74CF9Da4t69Jw==
X-Received: by 2002:a05:6000:1366:: with SMTP id
 q6mr14618749wrz.60.1628324238723; 
 Sat, 07 Aug 2021 01:17:18 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n11sm14485459wrs.81.2021.08.07.01.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:17:18 -0700 (PDT)
Subject: Re: [PATCH for-6.2 02/12] qom: Use DEVICE_*CLASS instead of
 OBJECT_*CLASS
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-3-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <27c84b6f-cb25-b92a-c7c3-aa166b0a33c4@redhat.com>
Date: Sat, 7 Aug 2021 10:17:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211127.646908-3-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> There are multiple functions where OBJECT_GET_CLASS or
> OBJECT_CLASS_CHECK are being used directly for
> DeviceClass/TYPE_DEVICE, instead of the DEVICE_GET_CLASS or
> DEVICE_CLASS wrappers.  There's no reason to not use the
> wrappers, so use them.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/pci/pci.c           | 3 +--
>  hw/usb/hcd-ehci-pci.c  | 2 +-
>  migration/savevm.c     | 3 +--
>  monitor/misc.c         | 3 +--
>  softmmu/qdev-monitor.c | 3 +--
>  5 files changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


