Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FA41D101
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 03:37:23 +0200 (CEST)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVl0j-0002K7-Qx
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 21:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVkzS-0000yN-O0
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 21:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.151.124]:23786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVkzP-0007Io-RR
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 21:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632965758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z6CdZQot7e/jv3+B8tEHsn/M6uEaMYq7urNvl4MElY4=;
 b=LW4HYmnK3aykg8BXaqEdzgPQuTL7JwwPe07+oYzYx6J6gkp2tjBH3SAEl7RxN1O/qZDj+e
 4lVJHyPAXmaI+JuNbrCHBvU4KZ/bCOaN4NAoETlwMMRBc/IDOgfhSry+xZcZel43EEOItE
 mTJ+kDiI0vPgdBgyw3zGwS1hjONDRSM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-EsNaNnH4OwG_HM8G0GL9eA-1; Wed, 29 Sep 2021 21:35:54 -0400
X-MC-Unique: EsNaNnH4OwG_HM8G0GL9eA-1
Received: by mail-ed1-f72.google.com with SMTP id
 j26-20020a508a9a000000b003da84aaa5c5so4439941edj.11
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 18:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z6CdZQot7e/jv3+B8tEHsn/M6uEaMYq7urNvl4MElY4=;
 b=QdsKZRF0tf4qMWKxdhTckLgXAmCvdanbfre+dQtJ5pMXANZST9/AhWW/vylm5LLTsu
 UAEikDbDxXBKN1ue9qNbr+GSNFfVkaSTyVafC2dGaX+Q05JhOv9mE0imLuJTfGrc4gFL
 59kKBNtR+hSQEnrU7LHZC/OpOnQ67CPJoWtGlS7Ix7LbW+hGhPoGmSG5t6jXpvT5vhiO
 rs/4yAs4os/RisY1f9Jp+WJ7/w1lL4zs/DF+szlyItkoGjjFHz3Qw+FTOPmrLuBiS/Bi
 aN7sVvRZ7guiEHvxr83Wz8by0cmUZmAF155IH7W7MCHe8ueEOtcMPGRHJ+4X+gDNUgOj
 p2bw==
X-Gm-Message-State: AOAM533b1Sj/l6hMemtb5tO08/g7fudzGFcblE5s4ySeF4fwTVxdY89U
 Tu0riDaYwDJ6N5dq36mBfUaWEuRjNXIMTmCTt6EBx3e0QfwvAQsbhOYM2w/0iwITv4DiNBXX1I0
 zssZPaEzpcJtt5FETFQnNyuJzEW7+JF4=
X-Received: by 2002:a17:906:318b:: with SMTP id
 11mr3750257ejy.493.1632965753452; 
 Wed, 29 Sep 2021 18:35:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZZiP8A83jxNXNTPKzh8/cYK3ghUOF8QFtK84yGgZ90k6k19hQmpOGbCZ3gwXGQchLfkm6rNrOFedVYV8vx6A=
X-Received: by 2002:a17:906:318b:: with SMTP id
 11mr3750242ejy.493.1632965753232; 
 Wed, 29 Sep 2021 18:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210929065215.21549-1-lulu@redhat.com>
 <8566c96d-5a61-fec7-f898-e5ac0937fd06@msgid.tls.msk.ru>
 <CACLfguUZ-JrcGenNecUZkaXf7upRiih73QPkhxN+fPKFaEpL8A@mail.gmail.com>
 <20210929093513-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210929093513-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 30 Sep 2021 09:35:15 +0800
Message-ID: <CACLfguVsjZbDo0JXMHJeNSusOyimajOABBG66T6tm32QN=ihEw@mail.gmail.com>
Subject: Re: [PATCH] virtio-net : Add check for VIRTIO_NET_F_MAC
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.151.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jason Wang <jasowang@redhat.com>, mjt@tls.msk.ru,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 9:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 29, 2021 at 08:08:40PM +0800, Cindy Lu wrote:
> > On Wed, Sep 29, 2021 at 6:07 PM Michael Tokarev <mjt@tls.msk.ru> wrote:
> > >
> > > 29.09.2021 09:52, Cindy Lu wrote:
> > > > For vdpa device, if the host support VIRTIO_NET_F_MAC
> > > > we need to read the mac address from hardware, so need
> > > > to check this bit, the logic is
> > > > 1 if the host support VIRTIO_NET_F_MAC and the mac address
> > > >     is correct, qemu will use the mac address in hardware
> > > > 2.if the host not support , qemu will use the mac from cmdline
> > >
> > > So if hw supports NET_F_MAC, cmdline-provided parameter will
> > > silently be ignored?
> > >
> > yes, this is based on the virtio spec, you can check this document in
> > 5.1.5 Device Initialization
> > https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html
>
> Maybe use the hw mac if mac is not provided? If provided
> make sure the command line matches the hardware, and fail
> otherwise?
>

so here come to the final question. which mac address has the higher priority?
I think the NET_F_MAC bit means the hw mac address > command-line address.
if the hw drivers want to change this. they can simply remove this bit.


> > Also, this check it only working for vdpa device
> > > s/host not support/host does not support this feature/
> > Thanks , will fix this
> > >
> > > > 3.if the cmdline not provide mac address, qemu will use radam mac
> > > > address
> > >
> > > s/not/does not/
> > > s/radam/random/
> > >
> > thanks, will fix this
> > > Thanks,
> > >
> > > /mjt
> > >
>


