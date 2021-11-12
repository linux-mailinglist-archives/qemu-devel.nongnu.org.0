Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E644E04F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:31:33 +0100 (CET)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlMLk-0000iE-Bw
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:31:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mlMKn-0008I7-12
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mlMKl-0007XG-Mw
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636684230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6iK1FFnr31H/QOG2fhAifBs2QrZttZfjiRJ6zxPg6Xk=;
 b=Bz0ZuT8wi23DawjCwFxw8RgEquQvZmKFEnZexbQHNkpt3fFuswf07CYpz+8Rweky9zqZE3
 17/7kmPnkiiRRsjfEyMAtDnjD5WQ0Dljk4x9YBbSfnvOMtR3g/sDi4la+iGYhoWREZozh/
 fj1A5GeKqVurd9kTuhNny3rzblso/cU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-DH93dJi7Pe61vlYz-xMRaA-1; Thu, 11 Nov 2021 21:30:28 -0500
X-MC-Unique: DH93dJi7Pe61vlYz-xMRaA-1
Received: by mail-lf1-f70.google.com with SMTP id
 u20-20020a056512129400b0040373ffc60bso3233506lfs.15
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 18:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6iK1FFnr31H/QOG2fhAifBs2QrZttZfjiRJ6zxPg6Xk=;
 b=nEc5EDkFgANdg1djdBC/JMtaSCpSsBuHk/ylLMo9MsJwzfhUZrASf8ZE3a5X7RDvK8
 pjwf1N8sGuOUEPkN3De6NKx5+lFuGP+v09+EvYmwOgKjKjGYKpzcFhSHevoLG0IICk2U
 fwKEQqOlRRjH1W+Q+oV2SpZV/BSAMi+lXbjAk9LkT8l6336u3wVqEiKDlrsPoagTPkAi
 p6FUVP6PifaaOmZLDYJ84rqrOXOcj8D4pW2bJpuKYu918xak7zps253KdLWt9epSnp0T
 5rXSTGGNKWS8Re5wTzil0cMyT0KNfHwE1mfXLw1muKDqdsNk4gLBW8BdDZiEoK2lTcUj
 ntew==
X-Gm-Message-State: AOAM530jweVtH6XBza57jZEjg4IjjQX0ttO8Gyxhz66R0SPxIwOq61TS
 O0aE9QEKhacoqtGvKtnKE+ELzPN6HQOV+lzmElcYW7N9EVQ9Ot3L4CfubixItWxHr5WcvEYKGA+
 334vbqISdV8ta8/Q/3jQfQM/J79JiUH0=
X-Received: by 2002:a05:6512:3990:: with SMTP id
 j16mr7552633lfu.199.1636684227431; 
 Thu, 11 Nov 2021 18:30:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYCRMHkK48gyarWR1tn8Xmq4GGenT2VW7WYfvW1UHT2AgmQJLOagoanWy/raFFDykv+6XgZleaiS88h3QbqtY=
X-Received: by 2002:a05:6512:3990:: with SMTP id
 j16mr7552611lfu.199.1636684227139; 
 Thu, 11 Nov 2021 18:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20211111063854.29060-1-jasowang@redhat.com>
 <20211111063854.29060-2-jasowang@redhat.com>
 <79d3326b-e6ac-86e1-2baa-466666e30af9@redhat.com>
In-Reply-To: <79d3326b-e6ac-86e1-2baa-466666e30af9@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 12 Nov 2021 10:30:16 +0800
Message-ID: <CACGkMEvQn+x4CzmjeOBQ2-wgw=hhjsdLhFnh1i=17g+GB7BYMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio: use virtio accessor to access packed event
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eperezma <eperezma@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 3:51 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 11/11/21 07:38, Jason Wang wrote:
> > We used to access packed descriptor event and off_wrap via
> > address_space_{write|read}_cached(). When we hit the cache, memcpy()
> > is used which is not atomic which may lead a wrong value to be read or
> > wrote.
> >
> > This patch fixes this by switching to use
> > virito_{stw|lduw}_phys_cached() to make sure the access is atomic.
> >
> > Fixes: 683f7665679c1 ("virtio: event suppression support for packed rin=
g")
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/virtio/virtio.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> No cover so asking here, what about vring_packed_desc_read()?

In that function, the vring_packed_desc_read_flags() used for reading
the flags atomically. If the flags told us the buffer is available,
there's no need read the rest of descriptor in atomic operation since
the driver guarantee that the changes of flags are visible after the
rest of the descriptor is setup.

Thanks

>


