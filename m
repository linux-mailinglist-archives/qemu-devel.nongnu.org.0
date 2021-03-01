Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E90328724
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:21:07 +0100 (CET)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmEF-0002dl-0t
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGmC3-0001A7-8e
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:18:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGmBs-0008KO-F8
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614619117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNNa4+QHlCa2am0SKvzb7fSrWsTS+ftZd7p0Rzz9XMM=;
 b=Th8aHlKuQ9Grc4A0yxUTfpApC8HekRGUKlNiLrD5ts4otnilm3OLH0GRsHyZEvsSlbStPR
 cLSarEutqwmnEtZJa/4mtyZPv0vjXmV/G+UjHXaQonruA80+HkrcMQdNRrZXwDxbaWSwnu
 ykuTot7C1tiosncQ6fM1YEQ4n2KYUBg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-dU8R3r93NCynTnxttOmcWw-1; Mon, 01 Mar 2021 12:18:30 -0500
X-MC-Unique: dU8R3r93NCynTnxttOmcWw-1
Received: by mail-ed1-f70.google.com with SMTP id o15so3785040edv.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 09:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xNNa4+QHlCa2am0SKvzb7fSrWsTS+ftZd7p0Rzz9XMM=;
 b=DCriR0wrTMP9fLJ4NV6TwmHbVbH7363XWc9GFAtjguAAugle+gNqT6wsQafu4YDd44
 84oNXKaoSzKKGU5LsIbh5iZQtibVI2r9YvYczCEjiHBtJ68aPYv6ZFYx0k3gf6TOdbeT
 NDZr1t+fGDWuW6IZ34QQFDsYGgv1AvBNhMdPbG4tQw9ofjEJ+1Pk+5NSnKqSTbCmYs5F
 gnezxVWZTZ6TJYOcvbY5100gFODFqXMgb4Owg6br0Y2u+pKyGZ+xWrRG8Vp8PlCQEUfd
 24x+KYmwRGOL5ZnM+JE1aMJZZ8B4OlM+vdO7AP/CIIBb8Wm8D0q9cNvTgca+hgvo6CBL
 t1Ag==
X-Gm-Message-State: AOAM533WTc3zrsOWcjQEGIkTVxRw7CrGLSMDvvhAPX9strhAl1hPNNHf
 JMsl7ffxtSwnZvacFZ0Wkz/rCe/CSoN1OJKRMKkzag9qSqldhWnFUEqAuHEj/4ocQSJu2+vNIB7
 bghVCWEaZrk3/Y8Q=
X-Received: by 2002:a17:906:f891:: with SMTP id
 lg17mr17050032ejb.69.1614619109689; 
 Mon, 01 Mar 2021 09:18:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrNgMUtLOS3yiaM/MwUKaO4wo4hVtfVem6DSd3yF+cnUv7yCcgeweYQGMSUpSUfDFVL8d2GQ==
X-Received: by 2002:a17:906:f891:: with SMTP id
 lg17mr17050015ejb.69.1614619109488; 
 Mon, 01 Mar 2021 09:18:29 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id t11sm15855470edd.1.2021.03.01.09.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 09:18:29 -0800 (PST)
Date: Mon, 1 Mar 2021 12:18:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-dev] [VHOST USER SPEC PATCH] vhost-user.rst: add
 clarifying language about protocol negotiation
Message-ID: <20210301121623-mutt-send-email-mst@kernel.org>
References: <20210226111619.21178-1-alex.bennee@linaro.org>
 <YDzKhnQa+LS01yTN@stefanha-x1.localdomain>
 <87czwjjdf7.fsf@linaro.org>
 <YD0X58hj+al5uPWk@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YD0X58hj+al5uPWk@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: virtio-dev@lists.oasis-open.org, viresh.kumar@linaro.org,
 qemu-devel@nongnu.org, rust-vmm@lists.opendev.org,
 Jiang Liu <gerry@linux.alibaba.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 04:35:51PM +0000, Stefan Hajnoczi wrote:
> On Mon, Mar 01, 2021 at 11:38:47AM +0000, Alex Bennée wrote:
> > Stefan Hajnoczi <stefanha@redhat.com> writes:
> > > On Fri, Feb 26, 2021 at 11:16:19AM +0000, Alex Bennée wrote:
> > >> +However as the protocol negotiation something that only occurs between
> > >
> > > Missing "is". Shortening the sentence fixes that without losing clarity:
> > > s/something that/negotiation/
> > >
> > >> +parts of the backend implementation it is permissible to for the master
> > >
> > > "vhost-user device backend" is often used to refer to the slave (to
> > > avoid saying the word "slave") but "backend" is being used in a
> > > different sense here. That is confusing.
> > >
> > >> +to mask the feature bit from the guest.
> > >
> > > I think this sentence effectively says "the master MAY mask the
> > > VHOST_USER_F_PROTOCOL_FEATURES bit from the VIRTIO feature bits". That
> > > is not really accurate since VIRTIO devices do not advertise this
> > > feature bit and so it can never be negotiated through the VIRTIO feature
> > > negotiation process.
> > >
> > > How about referring to the details from the VIRTIO 1.1 specification
> > > instead. Something like this:
> > >
> > >   Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
> > >   bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
> > >   <https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-4130003>`_.
> > >   VIRTIO devices do not advertise this feature bit and therefore VIRTIO
> > >   drivers cannot negotiate it.
> > >
> > >   This reserved feature bit was reused by the vhost-user protocol to add
> > >   vhost-user protocol feature negotiation in a backwards compatible
> > >   fashion. Old vhost-user master and slave implementations continue to
> > >   work even though they are not aware of vhost-user protocol feature
> > >   negotiation.
> > 
> > OK - so does that mean that feature bit will remain UNUSED for ever
> > more?
> 
> It's unlikely to be repurposed in VIRTIO. It can never be used by VIRTIO
> in a situation that overlaps with vhost-user. That leaves cases that
> don't overlap with vhost-user but that is unlikely too since the bit had
> a previous meaning (before vhost-user) and repurposing it would cause
> confusion for very old drivers or devices.

Yes, it's easier to just use higher bits.
If it ever is reused we will just send that bit separately.

> > What about other feature bits? Is it permissible for the
> > master/requester/vhost-user front-end/QEMU to filter any other feature
> > bits the slave/vhost-user backend/daemon may offer from being read by
> > the guest driver when it reads the feature bits?
> 
> Yes, the vhost-user frontend can decide how it wants to expose
> VHOST_USER_GET_FEATURES feature bits on the VIRTIO device:
> 
> 1. Pass-through. Allow the vhost-user device backend to control the
>    feature bit.
> 2. Disabling. Clear a feature bit because it cannot be supported for
>    some reason (e.g. VIRTIO 1.1 packed vrings are not implemented and
>    therefore enabling them would prevent live migration).
> 3. Enabling. Enable a feature bit that does not rely on vhost-user
>    device backend support. For example, message-signalled interrupts
>    for virtio-mmio.
> 
> > 
> > >
> > >> As noted for the
> > >> +``VHOST_USER_GET_PROTOCOL_FEATURES`` and
> > >> +``VHOST_USER_SET_PROTOCOL_FEATURES`` messages this occurs before a
> > >> +final ``VHOST_USER_SET_FEATURES`` comes from the guest.
> > >
> > > I couldn't find any place where vhost-user.rst states that
> > > VHOST_USER_SET_PROTOCOL_FEATURES has to come before
> > > VHOST_USER_SET_FEATURES?
> > >
> > > The only order I found was:
> > >
> > > 1. VHOST_USER_GET_FEATURES to determine whether protocol features are
> > >    supported.
> > > 2. VHOST_USER_GET_PROTOCOL_FEATURES to fetch available protocol feature bits.
> > > 3. VHOST_USER_SET_PROTOCOL_FEATURES to set protocol feature bits.
> > > 4. Using functionality that depends on enabled protocol feature bits.
> > >
> > > Is the purpose of this sentence to add a new requirement to the spec
> > > that "VHOST_USER_SET_PROTOCOL_FEATURES MUST be sent before
> > > VHOST_USER_SET_FEATURES"?
> > 
> > No I don't want to add a new sequence requirement. But if SET_FEATURES
> > doesn't acknowledge the VHOST_USER_F_PROTOCOL_FEATURES bit should that
> > stop the processing of
> > VHOST_USER_GET_PROTOCOL_FEATURES/VHOST_USER_SET_PROTOCOL_FEATURES
> > messages? AFAICT SET_FEATURES should be irrelevant to the negotiation of
> > the PROTOCOL_FEATURES right?
> 
> I agree, the value of VHOST_USER_F_PROTOCOL_FEATURES in
> VHOST_USER_SET_FEATURES does not matter according to the spec:
> 
>   Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is
>   present in ``VHOST_USER_GET_FEATURES``.
> 
> Since it does not mention "set in VHOST_USER_SET_FEATURES" we have to
> assume existing vhost-user device backends do not care whether the
> vhost-user frontend includes the bit in VHOST_USER_SET_FEATURES or not.
> 
> Stefan



