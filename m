Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E3D4922BA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:31:32 +0100 (CET)
Received: from localhost ([::1]:52420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kpu-0003eI-ML
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:31:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9knX-0002Ln-Uq
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:29:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9knR-0006ii-9m
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642498133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qyjeb9+zyWi0+rAKZU492ATjYDzOlj0hdkBpKgOiAhA=;
 b=JvXhUYOwV+xCtkiCjYOXg0tj4ODKjeZf5VFhXHFkeJv9s7VRClWKDM5q4xHM02OKAuBTAn
 dLG0UVdav7YHamXzX2XmZLlhGxdho/gWYZD3v6SiUcrLNSv+FR+RI0O4xMTHaret47Xc9A
 ++qWdje5cHeUBxmFudhd5HiEkjNysWo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-7l3VFEmZNnyq-poo1Ip7tg-1; Tue, 18 Jan 2022 04:28:52 -0500
X-MC-Unique: 7l3VFEmZNnyq-poo1Ip7tg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n13-20020a05600c3b8d00b0034979b7e200so6566823wms.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 01:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qyjeb9+zyWi0+rAKZU492ATjYDzOlj0hdkBpKgOiAhA=;
 b=MVip6wlhUKKoYAtss6VObkKNV7df7obmwQOe3dX7yIyw6sh27+NGN79BWXD7k2s6tf
 XSMeKHN0Vyi7ToH7U9bYcjpJbO58qC6c/jGbjw1rncFsdxA/PeYzqb2JFkTxGr8zvf+4
 1iHyCv74AW36wR/DN6OzGJR1RlPaEpDL57M969DpZkBobpYJP3vZZQSseZmhCVClxfBr
 beZTbZdXsJtbSbdX2AgvwW09zluARBRxRBniZrJBIjSV/tGKrC/RXchXzIs+lJvHq/wF
 FA+nQJ6luXvUAYLhfRC8SLEOAUyzi+WA5z3u+RyPpOYYzYspYa4iq0kwJdYwqa/MkavK
 AUwA==
X-Gm-Message-State: AOAM531k0B5PEuqJ5ZYH3d5mc+x8JMlg0I7ks/CPZ5ryuekRKbjBRRVk
 m2GEPr/ZjLss8BFT8Pmqt2ujAYrh3QnjnMfkQtpuThkPkjB8djhE8qL5BtuPgrx8fz3sjr8bv+N
 0LS4abvArmi2NnSs=
X-Received: by 2002:a5d:6f0a:: with SMTP id
 ay10mr23202995wrb.191.1642498131026; 
 Tue, 18 Jan 2022 01:28:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypFg+/da1wQb2sm4fYS/Cz20pnz7Xt8qzqE7J+rl4XhLOwyAPii/s/hcPQjnGmfFSjQlOU0w==
X-Received: by 2002:a5d:6f0a:: with SMTP id
 ay10mr23202980wrb.191.1642498130861; 
 Tue, 18 Jan 2022 01:28:50 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o1sm1590476wmh.7.2022.01.18.01.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:28:50 -0800 (PST)
Message-ID: <9d866ab9-ccfc-5bbd-004e-9ffbf8f14836@redhat.com>
Date: Tue, 18 Jan 2022 10:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 5/6] docs/system/devices/usb: Add CanoKey to USB
 devices examples
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>, qemu-devel@nongnu.org
References: <YeBqg2AmIVYkrJcD@Sun> <YeBrbOLSDL1xJAj6@Sun>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YeBrbOLSDL1xJAj6@Sun>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/2022 19.11, Hongren (Zenithal) Zheng wrote:
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> ---
>   docs/system/devices/usb.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
> index afb7d6c226..341694403a 100644
> --- a/docs/system/devices/usb.rst
> +++ b/docs/system/devices/usb.rst
> @@ -199,6 +199,9 @@ option or the ``device_add`` monitor command. Available devices are:
>   ``u2f-{emulated,passthru}``
>      Universal Second Factor device
>   
> +``canokey``
> +   An Open-source Secure Key implementing FIDO2, OpenPGP, PIV and more.

Reviewed-by: Thomas Huth <thuth@redhat.com>

Just an additional idea: It might be helpful for the users if you put a link 
to the separate documentation from the previous patch here?

  Thomas


