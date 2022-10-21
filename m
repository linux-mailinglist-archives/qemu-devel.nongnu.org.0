Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F00B607087
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:53:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollu3-0004WQ-4p
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:53:14 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollrs-0001Wd-30
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ollrN-0001Md-Jv
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ollrM-0006AU-5S
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666335023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XOzz6RqxEFeDgZOvB1fTWZ3fuSCGIDuMSc6tKtrk8+s=;
 b=Bkkj7l4BIpFCpVB6sMFEyxFoGYa6Kd8PUk3ArKECFUVvolQgoy45DR+EyUG0XW3vkisIWC
 QZbFOF6N9AsCJHUH8X/5uXvJTORlTkIfAeGI3MTyiKgLO8uT8H73SuKoQjMlQiNT62OcZW
 C7suPINtRkVCjBrIGV9C2uySYI5voME=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-PHNoVHPfO-ibSuIDlURNQg-1; Fri, 21 Oct 2022 02:50:21 -0400
X-MC-Unique: PHNoVHPfO-ibSuIDlURNQg-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-13193fb45b9so1265393fac.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 23:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOzz6RqxEFeDgZOvB1fTWZ3fuSCGIDuMSc6tKtrk8+s=;
 b=hreD/WgKEUJW/o3pduGoeQqgsmjhW8dAH9mkIafRegkImoEYVEgDKh/HQVoalaH58U
 lQ58V34udnbZ/1WUA89TWBZcb5+cN2bdrz5zNrDu0/5ksYUkKrJS5qiATkBNgxVwal3I
 iET4TnmVCmPeNLI+p09Euzk+suZINyXSUPYFfIlsWMg+/cqqUTwz+/fsBZa+mQTnaBk+
 xVVFzGcUdBfatgupK4XZO+xD1aie5DhieQc1shW41MR2ThdOwW0gTqG4QM6rR2u/qq/E
 ybSkQpdqcFZLiVns0xq9hzizHwsAsrcttzUXwhRRa9zIurWsN5pq95sFxT1S7uipxqfx
 OVHg==
X-Gm-Message-State: ACrzQf1C2cuD7/cD0TVMSVO2dhb9G46VctmktDvGMvltC3Mn5/Z2PpuJ
 dJSqjBKLssC0Gk1n0NnPJmt/hm+0A8ROzoKwjJjO5whfNNPDA9xhRyJG7D85nc4mnN140N/ETm9
 SIsshy0wmer/JyC9I8Be5TlgndpOJZqw=
X-Received: by 2002:a05:6808:1985:b0:354:d7cf:9acb with SMTP id
 bj5-20020a056808198500b00354d7cf9acbmr9563862oib.280.1666335021208; 
 Thu, 20 Oct 2022 23:50:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4MsrSkczxgyL5VrPWYzqqA1GHmIu6vGijSgB1rVxOImIbAyk3VP+uSlEbR8x7X/fkgKZMWn8pgX5+JVE+IwmU=
X-Received: by 2002:a05:6808:1985:b0:354:d7cf:9acb with SMTP id
 bj5-20020a056808198500b00354d7cf9acbmr9563848oib.280.1666335020995; Thu, 20
 Oct 2022 23:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221020162558.123284-1-lvivier@redhat.com>
 <CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
 <87h6zx4qsk.fsf@pond.sub.org>
In-Reply-To: <87h6zx4qsk.fsf@pond.sub.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 14:50:09 +0800
Message-ID: <CACGkMEsnq2pFaLwBpzpCSiD8jZrx77SUTn_6JhGG9jKe1PJkwA@mail.gmail.com>
Subject: Re: [PATCH v13 00/17] qapi: net: add unix socket type support to
 netdev backend
To: Markus Armbruster <armbru@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 Paul Durrant <paul@xen.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Eric Blake <eblake@redhat.com>, xen-devel@lists.xenproject.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 21, 2022 at 2:46 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Jason Wang <jasowang@redhat.com> writes:
>
> > I've queued this version and will send pull requests shortly.
> >
> > Any future comment we can do patches on top.
>
> Please give Laurent and me a few hours to try to improve PATCH 17's
> commit message.  Which you could then integrate without a respin.

Ok.

Thanks

>


