Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15941C459
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 14:12:29 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVYRo-0001t2-Ky
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 08:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVYOr-0007yv-GH
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVYOo-0006Vo-VX
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632917362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KQxnKdKVDWcBWYwFHukvwAFdw4XvkkfSECfosD6c+w=;
 b=fA2RIwl2/ySt+1MeFUOV16/a8msG4iLZVnJ/TD7c2XGbNSE4MYa4sSiLFrT6kCC2lz4i3E
 8kCYRPvGd35Qejv8egGQLbXkp7w/BGBujkTaW2eFWfkQmtshOk5Mpl5kEfHLFKS9txqc7n
 x7224CTiDgm0dvnZdMdNxTyPKk5SvS8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-MI8GjN3kP9qqhNO1_Rn29w-1; Wed, 29 Sep 2021 08:09:19 -0400
X-MC-Unique: MI8GjN3kP9qqhNO1_Rn29w-1
Received: by mail-ed1-f72.google.com with SMTP id
 j26-20020a508a9a000000b003da84aaa5c5so2161425edj.11
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 05:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0KQxnKdKVDWcBWYwFHukvwAFdw4XvkkfSECfosD6c+w=;
 b=L5JIMhChndPqcOtG+lik63jq+yyb4c6tU8kGKVw3KrTTczUXYhaCQMBDGxwceYl+E/
 vpWmDXAshPbKqr6oNv0/pFpK0lgtM1pN8FnOvT5qEDZo0kDbr7wN4JKXOMBKTRldutsF
 oKgYeCJaA52krnjxxwWLaUZ/R/qcq+wrTnFt8gwrJIbvS7d1OfaJ52Wkeg6pbzqXztsV
 f1K9wrdA7XnEYzaK3MJvK5A1XNxosBctUeWXiv9mxUVeQ0dRW9Dgzr+QvkCWyXobJov2
 ifpFzNa7RnEnjLSljPIVTotGPnK85/kcrTNCv+DR9etEHOh7rfcZoG4HwVhDRT99Izw8
 jcwA==
X-Gm-Message-State: AOAM5338gvs38S+HrPFUcft26CPhMYJn/x0jXJRbQNTUaPB+Q+fND3GW
 f7AtGjgo6QwVC5/4/boA4PQGws71UsMxiGybCqzc3Doej5NPcZt5AYImyqRLjRJ4XqiaecSYguI
 fMiZNq2QyIYzp/ABwG+04V3WnsCLkTXU=
X-Received: by 2002:a17:906:640f:: with SMTP id
 d15mr13817397ejm.419.1632917358373; 
 Wed, 29 Sep 2021 05:09:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/7LKB3kBkQMRbfJf6XfGPvnSmnPtP5AxnK6WgEPf729bbMtKCCMUXELE9EckE/+IMlIjkdduWYg0hlX7rhzc=
X-Received: by 2002:a17:906:640f:: with SMTP id
 d15mr13817379ejm.419.1632917358145; 
 Wed, 29 Sep 2021 05:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210929065215.21549-1-lulu@redhat.com>
 <8566c96d-5a61-fec7-f898-e5ac0937fd06@msgid.tls.msk.ru>
In-Reply-To: <8566c96d-5a61-fec7-f898-e5ac0937fd06@msgid.tls.msk.ru>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 29 Sep 2021 20:08:40 +0800
Message-ID: <CACLfguUZ-JrcGenNecUZkaXf7upRiih73QPkhxN+fPKFaEpL8A@mail.gmail.com>
Subject: Re: [PATCH] virtio-net : Add check for VIRTIO_NET_F_MAC
To: mjt@tls.msk.ru
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 6:07 PM Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 29.09.2021 09:52, Cindy Lu wrote:
> > For vdpa device, if the host support VIRTIO_NET_F_MAC
> > we need to read the mac address from hardware, so need
> > to check this bit, the logic is
> > 1 if the host support VIRTIO_NET_F_MAC and the mac address
> >     is correct, qemu will use the mac address in hardware
> > 2.if the host not support , qemu will use the mac from cmdline
>
> So if hw supports NET_F_MAC, cmdline-provided parameter will
> silently be ignored?
>
yes, this is based on the virtio spec, you can check this document in
5.1.5 Device Initialization
https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html

Also, this check it only working for vdpa device
> s/host not support/host does not support this feature/
Thanks , will fix this
>
> > 3.if the cmdline not provide mac address, qemu will use radam mac
> > address
>
> s/not/does not/
> s/radam/random/
>
thanks, will fix this
> Thanks,
>
> /mjt
>


