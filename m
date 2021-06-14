Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F203A68B7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:08:35 +0200 (CEST)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnGT-00039z-RI
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lsnFA-0001uC-R5
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lsnF5-0003BQ-9Z
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623679625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bgsB+wXbfI7NyDpENxed2rREGJKEqLRhFJYXRxzaCOE=;
 b=R1v4aQk3n5keMIQDc/54p5zv7PTVuTAK/QFBmXmdHgAN//EOCuTRghePMVrk0iDodE9oUs
 ElyCujn8AeRY1KsYVlG3bReG3BklnlgJMQZrBo2R4c/S9ChUR40ukvc+/9N7AQrwSdu6D6
 M5G7vCLrOR3bELIzI+GpLiNKt4tKRyU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-bkCIded1Mfyh5ZK0NMlKbg-1; Mon, 14 Jun 2021 10:07:03 -0400
X-MC-Unique: bkCIded1Mfyh5ZK0NMlKbg-1
Received: by mail-oo1-f69.google.com with SMTP id
 c25-20020a4a28590000b029024a664285fdso6976342oof.23
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 07:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgsB+wXbfI7NyDpENxed2rREGJKEqLRhFJYXRxzaCOE=;
 b=GJAB9WNxA+BYPnHEjn+uBA32zxVqWkXbm0ih2Fn0msKW6kUalAHbGu8fZ+tbxWTW5q
 O1QedqsqlxkV31pA4dpEKYAorY5z1q8T7zcqr7dnQNTsh5Sx4UdxOlZnBF0IDeymrAlI
 OmgN2mh373OwzPKryMhOdjemCa0xXPC6+jrlx3nlz4G1bQcCpedms6xlxu2/FLee1qB5
 blxA4re02ib6B8gTCoFuaaRdcJA4PF/QFfE62Ef6tIBLHEkK/GA79+UgYFOg5fVqRxoD
 je7O2YMhyLZZqOjWvarzXx3PKE9vXQXnKSC6I0KwiiWl4IfDc6TFVMM0bOsyxhKw/9/6
 bBew==
X-Gm-Message-State: AOAM533B5UyJCo4MJL8NeVVgMpXIPBpFYVdGHRbBCWrxrABzLrba/dZZ
 3VWirrxaN/O5zxufGKgxXfV0Bk0NEiiFl9DXvcrr8PWhf/A6sC+OCQQccugDI+7Eqcyr640nk4j
 KOECFBFf1l437VIRHuia3mVD1yHG4mAM=
X-Received: by 2002:a05:6808:d4a:: with SMTP id
 w10mr9711195oik.118.1623679623121; 
 Mon, 14 Jun 2021 07:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLpZKr6vQL5SL1OlgRse0GXGrmep4CfvZa0vs7phKnN2yo9xEs5RuuDLl4iiudCinXnuHYlDNkqqJbb4dx+yk=
X-Received: by 2002:a05:6808:d4a:: with SMTP id
 w10mr9711186oik.118.1623679622938; 
 Mon, 14 Jun 2021 07:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyFf4F9S6+rW2j+YPQyV3PECifq1_4S6mQ+8V2hREsKA@mail.gmail.com>
 <20210614135622.inrlsivqccgcwawi@redhat.com>
In-Reply-To: <20210614135622.inrlsivqccgcwawi@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Mon, 14 Jun 2021 17:06:46 +0300
Message-ID: <CAMRbyyun=GtyNOjPNzurpWXWJGkxt-mgwNQPWzMBb7UXrw-UdQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 4:56 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Sat, Jun 12, 2021 at 02:39:44AM +0300, Nir Soffer wrote:
> > Since this change is not simple, and the chance that we also get the dirty
> > bitmap included in the result seems to be very low, I decided to check the
> > direction of merging multiple extents.
> >
> > I started with merging "base:allocation" and "qemu:dirty-bitmap:xxx" since
> > we already have both. It was not hard to do, although it is not completely
> > tested yet.
> >
> > Here is the merging code:
> > https://gerrit.ovirt.org/c/ovirt-imageio/+/115216/1/daemon/ovirt_imageio/_internal/nbdutil.py
> >
> > To make merging easy and safe, we map the NBD_STATE_DIRTY bit to a private bit
> > so it cannot clash with the NBD_STATE_HOLE bit:
> > https://gerrit.ovirt.org/c/ovirt-imageio/+/115215/1/daemon/ovirt_imageio/_internal/nbd.py
> >
> > Here is a functional test using qemu-nbd showing that it works:
> > https://gerrit.ovirt.org/c/ovirt-imageio/+/115216/1/daemon/test/client_test.py
> >
> > I'll try to use "qemu:allocation-depth" in a similar way next week, probably
> > mapping depth > 0 to EXTENT_EXISTS, to use when reporting holes in
> > single qcow2 images.
> >
> > If this is successful, we can start using this in the next ovirt release, and we
> > don't need "qemu:joint-allocation".
>
> That's nice to know.  So at this point, we'll drop the patch on
> qemu:joint-allocation, and instead focus on teh patch that improves
> qemu-img map output to make it easier to use in the same way that
> qemu:allocation-depth is.

I can update that everything looks good on our side so far, thanks!


