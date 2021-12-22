Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854147D867
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:54:54 +0100 (CET)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n08dR-0000Rs-2F
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:54:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n08be-0007lv-6I
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:53:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n08bY-0008Ab-O0
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640206375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxDcgBx1DGIz7ckZHeRcQdu2w8P7rpwablRgAEBjDtk=;
 b=IPbiwi+YQUygjj5D0GBhRym2uUxaj7yAZCdy3xMdNgRnjQEpVUvJwFAZmkvM70Ka25F0Yl
 dXFHRcUnN9bOwS3sOe8mSZbXr9OYNoEUgegAbodTcBhHanNk3zY9PjuH8M/TQVX6zZl8+K
 UHjVjkEcYVYg+y7jIRrgY/2wrFekGn8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-d8BID_0UOJGK6Q8s37doqw-1; Wed, 22 Dec 2021 15:52:52 -0500
X-MC-Unique: d8BID_0UOJGK6Q8s37doqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v190-20020a1cacc7000000b003456d598510so3560634wme.6
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 12:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MxDcgBx1DGIz7ckZHeRcQdu2w8P7rpwablRgAEBjDtk=;
 b=POnYZJvl1HVLFgi+bn4Fj5mr7qAzqr9iqCyhK2WgvZ1RG2D7Wheiv0hm7C6Zd9mLGv
 9hD993bkpjFymzlX4Ewo6EZ7KI+ws2MfOG2pjUT2Ysbi0b+keDJywlUJSMVei1+Vs0f6
 lE3x2GpvXuGTXpJC1B46kVlES/tOWWVjnA924J61xKsUVlB/bVUIpW/D/ZL+PvdjLSXf
 cKpMz1/+cjln4n/r1q5x97d7FJPaKFrfa3XXP8NF8qS9xtbP7ruLoARx+vJ8rnoDMYPA
 MopOYVH8zOIB8cLVAl3nXtzCGlIicDkWhBCpysOxAkgmbRy932EG6mcrBiVbPXCiUZOL
 EIMw==
X-Gm-Message-State: AOAM531qk7dV1LnAK5Lxxlof1u5FmDC0H/U6aBPd4f0fL+iqNn1xXnVh
 U8QOuUodGIdQ8uWjnaft66gcNTdAwkVLsEvQaT30z0haa2Iow7Sc9TJ6vV2kixdmy+bDYN6z8wY
 1VGwa0CXckAStOxk=
X-Received: by 2002:a1c:9d55:: with SMTP id g82mr2016270wme.58.1640206371223; 
 Wed, 22 Dec 2021 12:52:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyb9VVrmOHd3YSQNen37l+UjJMvHJBktAZEyFZ1aHNcLO0oYYKBbFU1sB6nAA3qhfikIAr8Bw==
X-Received: by 2002:a1c:9d55:: with SMTP id g82mr2016259wme.58.1640206371048; 
 Wed, 22 Dec 2021 12:52:51 -0800 (PST)
Received: from redhat.com ([2.55.1.37])
 by smtp.gmail.com with ESMTPSA id g9sm1438276wmq.22.2021.12.22.12.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 12:52:50 -0800 (PST)
Date: Wed, 22 Dec 2021 15:52:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] acpi: validate hotplug selector on access
Message-ID: <20211222154841-mutt-send-email-mst@kernel.org>
References: <20211221144852.589983-1-mst@redhat.com>
 <ad22de10-a52c-ff34-0790-3be8e7d62630@redhat.com>
 <20211222151922-mutt-send-email-mst@kernel.org>
 <CAP+75-VaN5SD22ABqKNTC=dHhN4yaN-22Ucfdp=6aeYa+q+83A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP+75-VaN5SD22ABqKNTC=dHhN4yaN-22Ucfdp=6aeYa+q+83A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 09:27:51PM +0100, Philippe Mathieu-Daudé wrote:
> On Wed, Dec 22, 2021 at 9:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Wed, Dec 22, 2021 at 08:19:41PM +0100, Philippe Mathieu-Daudé wrote:
> > > +Mauro & Alex
> > >
> > > On 12/21/21 15:48, Michael S. Tsirkin wrote:
> > > > When bus is looked up on a pci write, we didn't
> > > > validate that the lookup succeeded.
> > > > Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> > > > bus pointer.
> > > >
> > > > Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
> > > > Cc: "Igor Mammedov" <imammedo@redhat.com>
> > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > It seems this problem is important enough to get a CVE assigned.
> >
> > Guest root can crash guest.
> > I don't see why we would assign a CVE.
> 
> Well thinking about downstream distributions, if there is a CVE assigned,
> it helps them to have it written in the commit. Maybe I am mistaken.
> 
> Unrelated but it seems there is a coordination problem with the
> qemu-security@ list,
> if this isn't a security issue, why was a CVE requested?

Right.  I don't think a priveleged user crashing VM warrants a CVE,
it can just halt a CPU or whatever. Just cancel the CVE request pls.

> > > Mauro, please update us when you get the CVE number.
> > > Michael, please amend the CVE number before committing the fix.
> > >
> > > FWIW Paolo asked every fuzzed bug reproducer to be committed
> > > as qtest, see tests/qtest/fuzz*c. Alex has a way to generate
> > > reproducer in plain C.
> > >
> > > Regards,
> > >
> > > Phil.
> >


