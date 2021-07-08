Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048A3C16DE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:09:06 +0200 (CEST)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WaH-0003DF-CJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1W1M-000657-Bq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1W1K-0004Fh-B4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625758376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KCEDkU84XU2y5APZI7CvMD3pjvU8aXxgDRaBysdLQ7w=;
 b=dJB86lPUVXlX21WPIpe4DsOpGNJ9WHM7+vBepSq2rIMSCHvdp2y0ESTs12lbskRqCtz6rD
 OYT9LCrUgJRPpoONNStwKdo8MLJRNMG5Tg/n9anL5rTpFV26m7imCf3OMmi5I9qdm5z/lb
 4eKGyZtA6pI3tyowOFl1/YtICnOB0lM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-ovKKalB7PTS6evk5Ni1thQ-1; Thu, 08 Jul 2021 11:32:55 -0400
X-MC-Unique: ovKKalB7PTS6evk5Ni1thQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 k16-20020a0565123310b029034860ed2566so3819613lfe.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCEDkU84XU2y5APZI7CvMD3pjvU8aXxgDRaBysdLQ7w=;
 b=OENjhfHJe/5C3+AqTshdodw1otbaZI+sGWV2cKBF7omcPtWi+uVVH7AU04JB68Xmu3
 0YMmEQLcmgGUO56LnZPe59gL3ysGnyRcpFR1eZUNvj3N1dropPtIPRUrNuHfSCam5Csc
 NvEFL6I1EbpqRJ2To0YJY7JgZoDAer/GK+JcqbfWZVltrncF236bi9D79fd4bV4DLaGu
 8V1UwOiXomTgSaUxHvLjVuiDC6AEDlYu6E5cIdQD6FcCRYa8sLjP5xFONI69Q7kTfCGC
 4YuVsC+3c2gubzXSJIggdkF9lTstfOWCntuIVynXf7IASRi7dRa1+N0KTfmWqb36i3al
 dIeg==
X-Gm-Message-State: AOAM531GbbugZx31zE9R8/uMdbMgjOfRxOW590av/ep4/U3IyEIYBNC7
 sB86n7UbRG+a4LrtDtpOON/rqkomFYdlf3jl83COZsuK3YFfDuvLufvCt3wD7oqDEORralVblL8
 eWGdgNSkh/8acP7/ADBpbWFpZDadY8l8=
X-Received: by 2002:a05:6512:102e:: with SMTP id
 r14mr23441741lfr.34.1625758373810; 
 Thu, 08 Jul 2021 08:32:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFAm7RhEW4VxPaHimJd+ltALeyjLl9kvg33j8EFV0BRb35ttv1CuvceQANhTiETunpJ7TjtxBlLtp3ZfQLUbg=
X-Received: by 2002:a05:6512:102e:: with SMTP id
 r14mr23441720lfr.34.1625758373483; 
 Thu, 08 Jul 2021 08:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210707193241.2659335-1-ehabkost@redhat.com>
 <CAFEAcA_UybrCmOffY6HD7eiE=Ubks1LGhKYmXgQ_hYYsKMYfhQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_UybrCmOffY6HD7eiE=Ubks1LGhKYmXgQ_hYYsKMYfhQ@mail.gmail.com>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 8 Jul 2021 11:32:37 -0400
Message-ID: <CAOpTY_oTm=30KGMof+SSUebR_S7ndgCjR0zLVGoEFQ=ceg0Lgw@mail.gmail.com>
Subject: Re: [PULL 00/15] Machine queue, 2021-07-07
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 8, 2021 at 5:53 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 7 Jul 2021 at 20:32, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
> >
> >   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
> >
> > for you to fetch changes up to 4dc87143b9dbc0ae5719b67b4e533c824b239f00:
> >
> >   vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus (2021-07-06 18:05:26 -0400)
> >
> > ----------------------------------------------------------------
> > Machine queue, 2021-07-07
> >
> > Deprecation:
> > * Deprecate pmem=on with non-DAX capable backend file
> >   (Igor Mammedov)
> >
> > Feature:
> > * virtio-mem: vfio support (David Hildenbrand)
> >
> > Cleanup:
> > * vmbus: Don't make QOM property registration conditional
> >   (Eduardo Habkost)
> >
>
> Hi; this generates warnings in the docs build:
>
> /home/pm/qemu/docs/../include/exec/memory.h:2286: warning: Function
> parameter or member 'rdm' not described in
> 'memory_region_set_ram_discard_manager'
> /home/pm/qemu/docs/../include/exec/memory.h:2286: warning: Excess
> function parameter 'urn' description in
> 'memory_region_set_ram_discard_manager'
>
> This seems to be because the function prototype for this
> function says it takes parameters 'mr' and 'rdm', but the
> doc comment documents 'mr' and 'urn'.

Sorry, I will apply David's fixup and resubmit.

It worries me that this is not being detected by our GitLab CI jobs.
Is anybody working to fix that?

--
Eduardo


