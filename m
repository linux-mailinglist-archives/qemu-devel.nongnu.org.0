Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D40369B67
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:39:32 +0200 (CEST)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2aI-0004Iy-W4
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1la2ZY-0003tb-3T
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:38:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1la2ZV-0007Fq-AT
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619210320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hBE7YEbMu7BjzPi/yUjkHFa63I9LjcV8Dhk7pXUpUnc=;
 b=J+nRGiK+TLkZWs4ltJURGYrki52Y4f/zoxamg7NazAV9zlIlT5z6dXv6GCNjzsIRK6eCKl
 ZFr6o7vKLqfBsGNK3PWa6d2ETFk+zGxYkf96G2AfvpDWw7P7CtnnG4DAeRzv7VgL8UKE7h
 cTc/8r1VcSh+yJ8DDvdcuarMnQAgj8I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-RMK5AChAORCOr6tr8t_UdQ-1; Fri, 23 Apr 2021 16:38:37 -0400
X-MC-Unique: RMK5AChAORCOr6tr8t_UdQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j4-20020adfe5040000b0290102bb319b87so15484379wrm.23
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hBE7YEbMu7BjzPi/yUjkHFa63I9LjcV8Dhk7pXUpUnc=;
 b=DcjeEQ1n4Lel42zFL4YNGF2Rrz848hwJRj5VNYMSdwXApdmidkIXQRT0LJXQ6UJP6k
 xktMjCT/4YxhYSbRJtLpJJldyQXOQ+6FyXvohQjONBIh9/R+L/YJgBBLeK2TUGd4MyyY
 EC+jJN+h4usfAKK0iptORYsQvRayhI1Ppxqiq7AkEnOK605iHoYYIxjBPbxVS4SLRDvg
 baLkQFG2Gkzd7cW2A2MMJjd5Yg+eY7d/U6RxbqDPMUTfPOxkrO19qBFVWhjovwTebLXy
 yAFj8+Fz/QmKzMPvNcEciBjS5c52RdbTzppPD3Exd62Sp6WCUMTyn8NdgzSrEGHZvJg6
 mFyg==
X-Gm-Message-State: AOAM532ydApFDy2ntkMNkXfhjqExDtbzCUKcptS3iR57WuyO0K1QzOqG
 AMEI5ZZWSr00e0nKILlQMep6IBf2mi0ANPnLcaFteBDQoBtSW16kQl7z7SxCcQzKcahSkbTqOhf
 f+/5S9LgLizt1p0U=
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr6751180wrz.201.1619210315881; 
 Fri, 23 Apr 2021 13:38:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4ooSbLO2EMQLg0eqX8GJDj3gLY6+z3sAVUbFRhFR73v1ySt8oeECEyWgnwpgRwop2tdD1RA==
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr6751167wrz.201.1619210315723; 
 Fri, 23 Apr 2021 13:38:35 -0700 (PDT)
Received: from redhat.com (212.116.168.114.static.012.net.il.
 [212.116.168.114])
 by smtp.gmail.com with ESMTPSA id u8sm9592993wrp.66.2021.04.23.13.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 13:38:35 -0700 (PDT)
Date: Fri, 23 Apr 2021 16:38:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/2] pc: last minute bugfixes
Message-ID: <20210423163430-mutt-send-email-mst@kernel.org>
References: <20210422222429.183108-1-mst@redhat.com>
 <CAFEAcA9kKFgO2UAgUVOO0ZX1G2aT1H90mpUamrKdspKCDNgmRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9kKFgO2UAgUVOO0ZX1G2aT1H90mpUamrKdspKCDNgmRw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 09:53:01AM +0100, Peter Maydell wrote:
> On Thu, 22 Apr 2021 at 23:24, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit d83f46d189a26fa32434139954d264326f199a45:
> >
> >   virtio-pci: compat page aligned ATS (2021-04-06 07:11:36 -0400)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 9106db1038bf3db5e4f8007038b3a1962018fa07:
> >
> >   x86: acpi: use offset instead of pointer when using build_header() (2021-04-22 18:22:01 -0400)
> >
> > ----------------------------------------------------------------
> > pc: last minute bugfixes
> >
> > Two bugfixes - both seem pretty obvious and safe ...
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > ----------------------------------------------------------------
> 
> Come on, you should know the rules by now. Any pullrequest at this
> point needs to have a detailed justification in the cover letter of
> why it is such a release critical bug that we need to roll a new
> release candidate and delay the release for it.
> 
> thanks
> -- PMM

Hmm sorry, I was a bit rushed.
acpi one fixes a regression but not one in a recent release.
amd one is not.

Bottom line let's just defer this till after the release.

-- 
MST


