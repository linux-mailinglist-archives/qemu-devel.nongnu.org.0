Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED61320A18
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 12:53:55 +0100 (CET)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDnJC-0003TB-7T
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 06:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lDnEN-0001qd-2P
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 06:48:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lDnEL-0000Un-Ek
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 06:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613908130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rJVpzugB6MU7ENYdVpcqL9VP1vrYAnSDnNn47VbCb4A=;
 b=dINLUB8UEFn+sMhQGuBd7EWfOdE9Xp/ycY++bZm99XRbK6MK3ndGhMToLqUnS+cTtv5oPh
 Vpg//RHM31i36WTiLDwVbxxVBaA4bncSNWTjKJCESJaUYqhhB1YRoRkcE88JkysYWdUfM6
 XyoSRjsR7zAbvFMdKZDAZ4JhuP48mPQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-JlzPhUR4M_aHabMUKockRw-1; Sun, 21 Feb 2021 06:48:46 -0500
X-MC-Unique: JlzPhUR4M_aHabMUKockRw-1
Received: by mail-ed1-f69.google.com with SMTP id dk21so5434984edb.10
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 03:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rJVpzugB6MU7ENYdVpcqL9VP1vrYAnSDnNn47VbCb4A=;
 b=nC72cic557uG9b58A0NoOJwlfqnsgT1F0CBzUBVJzQYlosXbfM0MxpaxL6Br7J2fGU
 2rzaogx6OMtH4UUoPu0/dOVGWpb2Xp4XNOnOivKQq27pBNHm1X3r9lc0Z3DyAPiYxmEx
 LPCcSdu7Z8O6AN1g8E+M24xzzGZcwb5x79YndmJ/N0CddNSNWjq4o9L/aCM3FxHRR+jG
 u8W9F+SEhioNrLr/X7LHcSdKwRb2fmp0dAiW9PSn9dVpFlTU1gkxKAENNCoMVbMwnsXn
 sXzVrc3R1Mu0YemPSrdUb639cp+jKDmMEI+XP3q0GpV8o++KuS/yFY+9EEyEmo7pIW59
 UKkw==
X-Gm-Message-State: AOAM530ltVp7gpk+HXCyfKTtrFOSDowKxxzJlL3ulfglIvLvfr5nYYB3
 CiHIKcy2LvRQkU7u0LPkgKSYTvj0sG3Lj0CFwbkCxuLRwyTpVCsS6IldGODd5jILeUMFjhVYK0N
 03vsny7s5DJ7hYtc=
X-Received: by 2002:a50:aac8:: with SMTP id r8mr17468569edc.9.1613908125622;
 Sun, 21 Feb 2021 03:48:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuh0K5J3Y45aeXcYH1JjrCEAZ2Off8IuP361sHPx4QeW2MajuU3KCxYAw8ylVKyjE9ltsgVA==
X-Received: by 2002:a50:aac8:: with SMTP id r8mr17468565edc.9.1613908125515;
 Sun, 21 Feb 2021 03:48:45 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id k4sm6066288ejv.73.2021.02.21.03.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 03:48:45 -0800 (PST)
Date: Sun, 21 Feb 2021 06:48:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210221064835-mutt-send-email-mst@kernel.org>
References: <20210216111830.1087847-1-cohuck@redhat.com>
 <20210219122136.5d97e0bf.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210219122136.5d97e0bf.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 12:21:36PM +0100, Cornelia Huck wrote:
> On Tue, 16 Feb 2021 12:18:30 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > The virtio standard specifies that any non-transitional device must
> > reject commands prior to revision setting (which we do) and else
> > assume revision 0 (legacy) if the driver sends a non-revision-setting
> > command first. We neglected to do the latter.
> > 
> > Fortunately, nearly everything worked as intended anyway; the only
> > problem was not properly rejecting revision setting after some other
> > command had been issued. Easy to fix by setting revision to 0 if
> > we see a non-revision command on a legacy-capable revision-less
> > device.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  hw/s390x/virtio-ccw.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> I now have:
> 
> Author: Cornelia Huck <cohuck@redhat.com>
> Date:   Tue Feb 16 12:18:30 2021 +0100
> 
>     virtio-ccw: commands on revision-less devices
>     
>     The virtio standard specifies that any non-transitional device must
>     reject commands prior to revision setting (which we do). Devices
>     that are transitional need to assume revision 0 (legacy) if the
>     driver sends a non-revision-setting command first in order to
>     support legacy drivers. We neglected to do the latter.
>     
>     Fortunately, nearly everything worked as intended anyway; the only
>     problem was not properly rejecting revision setting after some other
>     command had been issued. Easy to fix by setting revision to 0 if
>     we see a non-revision command on a legacy-capable revision-less
>     device.
>     
>     Found by code inspection, not observed in the wild.
>     
>     Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>     Reviewed-by: Thomas Huth <thuth@redhat.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Acked-by: Halil Pasic <pasic@linux.ibm.com>
>     Message-Id: <20210216111830.1087847-1-cohuck@redhat.com>
> 
> Any objections?

Acked-by: Michael S. Tsirkin <mst@redhat.com>


