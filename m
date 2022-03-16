Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30F4DAE4C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:33:34 +0100 (CET)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQyD-0001WF-Cr
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:33:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nUQOD-0003uZ-EO
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nUQOA-0008Hn-LY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8gfOJPBMdn5aVKRsDQiIEUMI7ZZ3LrW25gO3tb6x07Q=;
 b=TQls3rdC03HkrdBJtP94YubPyx2nbGjYe6n+FkTwlrpktuPPRGz8ymx2VTFlxivWcZFg0h
 aKO0cSiHdBcO1UJyR1/TGAajJWwYjXQC4qMVOB0iBuZG5uczAT0KUdKxleVfXqY9CCKv4J
 VsIYZ0Si9HUtXtV/BdcNjOGGASc0Rjw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-kCh63EMGMFSus6g2em76EA-1; Wed, 16 Mar 2022 05:56:16 -0400
X-MC-Unique: kCh63EMGMFSus6g2em76EA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so365813wrg.19
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 02:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8gfOJPBMdn5aVKRsDQiIEUMI7ZZ3LrW25gO3tb6x07Q=;
 b=mrQWr9RU3ZiVWbSDTuEH8q9tRtEpQsU3tsjc+VbxoPNOV4SvLMX0TRWOjRoUCif8/y
 LWEsksRs53vG0egCweDBr4iw2FUP4TgpXFG0tSg+eR1vLTcY6NatfcAFsI5D0pYcbc9S
 uq+NxS5MYmcyOGe/0LWPB5TKd0HGkTJs5LflvCOwoWEpI+gKXww6pDJIPMHsLoJjPWYS
 j/DDHYcLVZuGYW/+WQblFXAzaUzn8+56laGWv3S95QPekq0GUVd2NO+OdGU/Abjf9jj/
 xrWyPpWUQjBw7s6cDIJNrVzLsanxz3+zQsraWWklDGMjF86nne7eVXNCbe9hFB4PD2mM
 Q05A==
X-Gm-Message-State: AOAM531QQau6BJG/vqMbC2RPHVsXZqiSxqVCSrp7jq3GU+04AvaP+PpP
 60g8vNaF3RkIH/5bwP/eVgW0JjHcOpuQjePu8wosYJ5juMjPRIHLKEOGKp55YoLyRh6dnzapq3K
 Qo9nvzDVOzDwwvwI=
X-Received: by 2002:adf:df01:0:b0:203:d6f0:794b with SMTP id
 y1-20020adfdf01000000b00203d6f0794bmr5042682wrl.394.1647424575722; 
 Wed, 16 Mar 2022 02:56:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuJ/NQx+ZV6UwXmJ9H2H0g0ol9oQfOGUZP0Yk+IZ3tjm0OXRPniE8Hh8CnhZOLbPCMbkeJpA==
X-Received: by 2002:adf:df01:0:b0:203:d6f0:794b with SMTP id
 y1-20020adfdf01000000b00203d6f0794bmr5042662wrl.394.1647424575492; 
 Wed, 16 Mar 2022 02:56:15 -0700 (PDT)
Received: from redhat.com ([2.53.2.35]) by smtp.gmail.com with ESMTPSA id
 o12-20020adfa10c000000b001efb97fae48sm1260431wro.80.2022.03.16.02.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 02:56:14 -0700 (PDT)
Date: Wed, 16 Mar 2022 05:56:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/4] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <20220316055333-mutt-send-email-mst@kernel.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
 <20220316100425.2758afc3@redhat.com>
 <d374107ebd48432b6c2b13c13c407a48fdb2d755.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <d374107ebd48432b6c2b13c13c407a48fdb2d755.camel@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 09:37:07AM +0000, David Woodhouse wrote:
> On Wed, 2022-03-16 at 10:04 +0100, Igor Mammedov wrote:
> > Well, I retested with the latest upstream kernel (both guest and host),
> > and adding kvm_enable_x2apic() is not sufficient as guest according
> > to your patches in kernel caps max APICID at 255 unless kvm-msi-ext-dest-id
> > is enabled. And attempt in enabling kvm-msi-ext-dest-id with kernel-irqchip
> > fails.
> 
> Correctly so. We need the split irqchip to support kvm-msi-ext-dest-id
> which is why there's an explicity check for it.
> 
> > So number of usable CPUs in guest stays at legacy level, leaving the rest
> > of CPUs in limbo.
> 
> Yep, that's the guest operating system's choice. Not a qemu problem.
> 
> Even if you have the split IRQ chip, if you boot a guest without kvm-
> msi-ext-dest-id support, it'll refuse to use higher CPUs.
> 
> Or if you boot a guest without X2APIC support, it'll refuse to use
> higher CPUs. 
> 
> That doesn't mean a user should be *forbidden* from launching qemu in
> that configuration.

Well the issue with all these configs which kind of work but not
the way they were specified is that down the road someone
creates a VM with this config and then expects us to maintain it
indefinitely.

So yes, if we are not sure we can support something properly it is
better to validate and exit than create a VM guests don't know how
to treat.

-- 
MST


