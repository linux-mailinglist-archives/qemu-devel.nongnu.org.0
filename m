Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEFF5E6AE7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:29:23 +0200 (CEST)
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQws-0006RE-9w
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obPNz-0000VX-Q9
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obPNx-0007a5-FT
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663865352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V3WpuN4eo2LH9P3K7gbAjYoj/oAkp3bsU3soi+9jEOs=;
 b=ZU2Hj3zpnZfADzJPaeAHP8EdAGayjJVh+Axip7drrjuCdzFMDM630aNxjW4flZR1swoXlS
 Xjb3e26dB96mHOuyJf349gbIpgndoLuMj9la/O3IJV4+dEzIGGmQ1AYps41FPku1XSCZd+
 /jAxfEmCxqk7ZO+GmdEYvVx+E5WNeps=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-LGTwrZ6WPoCyvNHFnpPMYQ-1; Thu, 22 Sep 2022 12:49:11 -0400
X-MC-Unique: LGTwrZ6WPoCyvNHFnpPMYQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 c1-20020a0cfb01000000b00495ad218c74so6866690qvp.20
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=V3WpuN4eo2LH9P3K7gbAjYoj/oAkp3bsU3soi+9jEOs=;
 b=UFpWcMpJFHGNCY11085raxCNWm5ntlrIif8+GDqkau7VlkvTrq6ynf7vQX4qSx/h95
 3BovSMIYNIma2abhQlqZz6Z4w9QCi+IdV+EXXUIXMBN6f9OqBnO62xr4xT/mODd7u9ba
 mzT0QrG4YX3+v8kQ+MeZ6xfy4vDB8s6+WYOtaVnmJc2CJYidDikIy49k7r29/TOKe4J/
 pGgolQOdpf69Y7T2xBOqetTc4LVPxRg/TiesC3iyzNWMV8nckS2kVzzuJDFhDJzgMBHZ
 MR8J0utDTDBUO5eEKtziOwWxdIOxU8/xHVa+ZQ0/MewK1QwWqxF1DvweAtrXqM7sdgiN
 XruA==
X-Gm-Message-State: ACrzQf2XxRnNZmsehptAZ3+A1EY1JpOl7X9ZJ0UbJ3lwpy2QYTHQoNXf
 N9Je/OcKJqB3e5Hc5pBCvSxLlEHwIXsLSQY2+UHA4duhkIBuNoROhIE0mxMUvzHryqiONh4KK13
 cmubqE5aK42FnFsA=
X-Received: by 2002:a37:f701:0:b0:6ce:f09b:9065 with SMTP id
 q1-20020a37f701000000b006cef09b9065mr2823034qkj.268.1663865350593; 
 Thu, 22 Sep 2022 09:49:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Q9cWpJ2yE6ck4TnPcy9jqOVLCi3QyD1DpxeU3I/5avoC7aPaFUjnbiZOR3Kyk3m6ZEkssCg==
X-Received: by 2002:a37:f701:0:b0:6ce:f09b:9065 with SMTP id
 q1-20020a37f701000000b006cef09b9065mr2823016qkj.268.1663865350369; 
 Thu, 22 Sep 2022 09:49:10 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 bw17-20020a05622a099100b0033a5048464fsm3721793qtb.11.2022.09.22.09.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:49:09 -0700 (PDT)
Date: Thu, 22 Sep 2022 12:49:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <YyySBD4Iv7CMKGkS@xz-m1.local>
References: <20220921161227.57259-1-peterx@redhat.com>
 <CACGkMEux0zSD01s+vVceEkEmvsQ7dZpU8wnPVXjLNxNMFJKEJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEux0zSD01s+vVceEkEmvsQ7dZpU8wnPVXjLNxNMFJKEJg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 09:32:54AM +0800, Jason Wang wrote:
> > +        if (!kvm_enable_x2apic()) {
> > +            error_setg(errp, "eim=on requires support on the KVM side"
> > +                             "(X2APIC_API, first shipped in v4.7)");
> > +            return false;
> > +        }
> 
> I wonder if we need some work on the migration compatibility here
> (though it could be tricky).

Right, as I replied to Igor, it's just challenging and debateable whether
keeping the old behavior helps in any cases..  Thanks,

-- 
Peter Xu


