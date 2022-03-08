Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36C84D10AA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:04:05 +0100 (CET)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRTt7-0006yD-1n
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:04:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRTrg-00065K-DV
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRTrd-0003Zw-Vf
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646722953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vft3D1+l6i1HwiZoG48E4NqfRUGhXZIOIjYr78h7NqU=;
 b=Tw+XbmNofytyqJhPp4dCFdxCJ7LHcI4QcffVl43duZ5OhFMHgmKTgtT7kEae46jkOoYSsI
 k0992FD2freSH0r7KtREcbA9WZKoeISjAp6jkUg/0nPPp9xiu3zVl9DGvvk/SFDQRcGgCR
 EFCnHZdHbLbCz8OGIbNoFk+3yyHuWvs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-_vguv2cONi6Y6PLk-oQcIA-1; Tue, 08 Mar 2022 02:02:31 -0500
X-MC-Unique: _vguv2cONi6Y6PLk-oQcIA-1
Received: by mail-lj1-f198.google.com with SMTP id
 185-20020a2e05c2000000b002463aff775aso7450441ljf.17
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vft3D1+l6i1HwiZoG48E4NqfRUGhXZIOIjYr78h7NqU=;
 b=xEe/KwEOmx8ApMh9z3dMH93N0M/+LqGdlBiHdouQV59qiQgfk/E5dSIzUWp2y/183P
 T0i1w6nL+Sa4OHn16DsANtMS62acNOucIPPurudZVbc3IjsgZ6+oBwOxo3GNCWbT+vNB
 sifLr3xHJhKZjdRBf/eNC+qMO1gfizDS1B3xZDGeGjAzSZl10GA2diMUyBMsrWoxHFow
 PdZztdnykhjaBYuq1bXr3AV/OiO2kglV/xJSjXM3etJb3CbiKN8fD/5CAOOM6l4jt839
 kcSSYjnWWlkXtTVvXtyK4f+E5Bx8D+3h80IIv0OunGK8yUcmFaGqAp/0n79qLA5lQCzZ
 6seA==
X-Gm-Message-State: AOAM531G2VpjulZWLOdrIFkstQA8Dfy9EvYfxsoiO4HIpbcmcJYRzqwf
 z47UZIcnb+PIdy2i2RQQOGkoqAQoqMucXP91WoemXwVFkTAcpbo9JKTsHcRRRjUUrkg26QaW+Qp
 xpxpPwO8dLYfFDjwJktIuiulLLazF9EY=
X-Received: by 2002:ac2:4c4f:0:b0:448:21cd:596f with SMTP id
 o15-20020ac24c4f000000b0044821cd596fmr10032805lfk.257.1646722950189; 
 Mon, 07 Mar 2022 23:02:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyME8hqebSSa++RvDpIlp+KS1EXarvbdTpFLgV+8qmVwa1KGGG5587x5ftQgB9VrQ8xFveXaIk+NaaQPY/KkVA=
X-Received: by 2002:ac2:4c4f:0:b0:448:21cd:596f with SMTP id
 o15-20020ac24c4f000000b0044821cd596fmr10032791lfk.257.1646722949847; Mon, 07
 Mar 2022 23:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20220308055642.20961-1-jasowang@redhat.com>
 <20220308015601-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308015601-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Mar 2022 15:02:18 +0800
Message-ID: <CACGkMEtL6+OrCayPGr1b1DP3PvyCf420xHs15nTfpAPiHBvHKA@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: fix map leaking on error during receive
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: Victor Tom <vv474172261@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 2:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 08, 2022 at 01:56:42PM +0800, Jason Wang wrote:
> > Commit bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
> > tries to fix the use after free of the sg by caching the virtqueue
> > elements in an array and unmap them at once after receiving the
> > packets, But it forgot to unmap the cached elements on error which
> > will lead to leaking of mapping and other unexpected results.
> >
> > Fixing this by detaching the cached elements on error. This addresses
> > CVE-2022-26353.
>
>
> Pls use a tag:
>
> Fixes: CVE-2022-26353

Will do.

>
>
> Besides that
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> Feel free to merge.

Ok.

Thanks

>
> > Reported-by: Victor Tom <vv474172261@gmail.com>
> > Cc: qemu-stable@nongnu.org
> > Fixes: bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
>
> > ---
> >  hw/net/virtio-net.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index cf8ab0f8af..65b61c836c 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -1867,6 +1867,7 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
> >
> >  err:
> >      for (j = 0; j < i; j++) {
> > +        virtqueue_detach_element(q->rx_vq, elems[j], lens[j]);
> >          g_free(elems[j]);
> >      }
> >
> > --
> > 2.25.1
>


