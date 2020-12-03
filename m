Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17652CD428
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:03:47 +0100 (CET)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmOo-0004wk-Ru
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkmMB-0003D4-B4
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkmM9-0004DQ-LC
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wPhwNchUQ6lDjEFBF5sJStl/DpZ552Bn+yX+yozBHro=;
 b=HTSYO+Pu6Kimxvlr4szD3Q8tVMNsD/bcbFCTM9HDi0eudZd9hf0+3MfyVMoC8U8cNSKE8b
 lxCPwYoRVIRuL3j9627MuQQ4C5F9MOi1VJRQtD0PbjHrZYWberfSeOvAZkY4Q4DgM99eUV
 yWOirixpjj5C2ZWVho8WubAeCl7Um0c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-fj-7TtRqM1m3tp73MzsuUA-1; Thu, 03 Dec 2020 06:00:59 -0500
X-MC-Unique: fj-7TtRqM1m3tp73MzsuUA-1
Received: by mail-wm1-f70.google.com with SMTP id v5so1372133wmj.0
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wPhwNchUQ6lDjEFBF5sJStl/DpZ552Bn+yX+yozBHro=;
 b=faMd/MgM0q0qUiP2qOKTtTWSGC/YJjA9xKmAGWCLfYKGQIQoRdpAa3XbSkezcN2yAE
 S/KlEECxLA4/k6gWk7P5fFZi432f0yw8okqfAj4bixgVczYtRAn79eOWJ8IkmnJR4PC9
 GuJ4U90yrvqGOSOYdnPBVy/Wo8zPmUGfmLe3MxYLFNUPcdPwZNeQ4R3KNcZqKtF0e1jh
 y3Ao37xVF4fIluOFhLWh9kpf13HV6agOzwXln6G6IOncsW55n9ML60ZKJkZEXYyTlyNN
 0nIyL7iCJm/DZ1IZ97tK572YEbCcrJlCBRobVRvzHqV64VZ4R9hpRxcQEXsmqvCRf6xm
 ynxw==
X-Gm-Message-State: AOAM531ShIz+fytPscMYLQ5koFmUMbEx+PoJBzvBRLo5Laf+thPG/CPe
 IiklnQlrSFLZn7ljrhzL5HK2wLUBptWKLKfd+DEloS/yd6uaGLMPlhgXDSwk4nzQ3TXauYneXbi
 d2XkICiOf+EmqZ78=
X-Received: by 2002:a5d:428b:: with SMTP id k11mr3095611wrq.166.1606993257756; 
 Thu, 03 Dec 2020 03:00:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQm0t7wV3IPRkNUP08+j9R1Abh/dUsO2OjbPUPFmxIncKZkuh3WLpTGmhpJvvR/imtClMcoA==
X-Received: by 2002:a5d:428b:: with SMTP id k11mr3095595wrq.166.1606993257611; 
 Thu, 03 Dec 2020 03:00:57 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a12sm1412753wrq.58.2020.12.03.03.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 03:00:56 -0800 (PST)
Date: Thu, 3 Dec 2020 06:00:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 01/12] [testing] disable xhci msix
Message-ID: <20201203060034-mutt-send-email-mst@kernel.org>
References: <20201203105423.10431-1-kraxel@redhat.com>
 <20201203105423.10431-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203105423.10431-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 11:54:12AM +0100, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

A bit more context on why you are doing this?

> ---
>  hw/usb/hcd-xhci-pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
> index bba628d3d230..5def3ea55ff3 100644
> --- a/hw/usb/hcd-xhci-pci.c
> +++ b/hw/usb/hcd-xhci-pci.c
> @@ -239,7 +239,7 @@ static void qemu_xhci_instance_init(Object *obj)
>      XHCIState *xhci = &s->xhci;
>  
>      s->msi      = ON_OFF_AUTO_OFF;
> -    s->msix     = ON_OFF_AUTO_AUTO;
> +    s->msix     = ON_OFF_AUTO_OFF;
>      xhci->numintrs = XHCI_MAXINTRS;
>      xhci->numslots = XHCI_MAXSLOTS;
>      xhci_set_flag(xhci, XHCI_FLAG_SS_FIRST);
> -- 
> 2.27.0


