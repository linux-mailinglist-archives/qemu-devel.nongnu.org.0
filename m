Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CADC444D64
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 03:49:39 +0100 (CET)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miSos-0002s3-N4
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 22:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSne-0001VV-3m
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSnX-0000CH-Th
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635994095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L/gRWfnemaE7g478XybknckXJswNG15PdBMjs/z9Yyc=;
 b=D3KyJ1C5Z9QtYPGW6ShnOou7knCJxBObXV0H+kAqaE/QJUnUkkW0G0ypT8yzkvagZOqrW9
 QmiQHpkDi9kSpRYCP6tiQUdaqSZzhlWb9umC6QVyno0ow8obH8471CKQzY9j8W+qEZPbMn
 qLSlzfzzIpz4I4aZw9CAZiLYr1NWlLU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-85WEKr3pMhO880ZSZ47lGA-1; Wed, 03 Nov 2021 22:48:12 -0400
X-MC-Unique: 85WEKr3pMhO880ZSZ47lGA-1
Received: by mail-lf1-f70.google.com with SMTP id
 c13-20020a05651200cd00b004001aab328aso1364901lfp.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 19:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/gRWfnemaE7g478XybknckXJswNG15PdBMjs/z9Yyc=;
 b=UWoGAmMFc6cGQf2Fo6n6uvHd5kO2D0J2moO+eT+Nk4XVKzvYHK1BhFLemECZCi4p8c
 bJHt7rjg7wTjtdMYS6jVldNsXbyqQZ+wPHt+hgThu9XJrUuAX15D7lQc/e0u/SOpLdnF
 8M8vZHXg7yh+7kRHo96sd/cRkN+QCNmBZRwQNBYdYnsIIM+hNTW7JwL22nYNAcAI9j5Y
 i6QhFjv+J0f/r6LeXlgswqYJUgF5aGfjB8y5qllTbYvhqT4TkMd0E7HeBD4vFuRHvgjM
 GxFqvr+Gzhxt/i9YCzq2H2v8TR3VodLBjpKilrJyEDL0LTjPsUOK1qEJq2Cd5dXBOAHv
 lGjA==
X-Gm-Message-State: AOAM530vHU4vB1xGr03bHhgHosWshLK30uUex+9+EsPNRs3Qhu1RNISn
 umBxlwHHDtVyt1IW+g3REmq21WFbpJWHKyHwmQ5HvuLZjBNFmvPDpi6bIrkfJNJCpIkM/lcBCPs
 viFWRQ57HKlmY86NQSzvHMTc6Gd7FeaQ=
X-Received: by 2002:a2e:8846:: with SMTP id z6mr50613809ljj.277.1635994090457; 
 Wed, 03 Nov 2021 19:48:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziufQs8PNF+WP1cAemSGbPXY4WldpKsStNjj7Z3yrAW3e1gNe2CxajLj63etuMyYViYr96tcK8szvB/1RxN2M=
X-Received: by 2002:a2e:8846:: with SMTP id z6mr50613794ljj.277.1635994090290; 
 Wed, 03 Nov 2021 19:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211103113830.22283-1-jean-louis@dupond.be>
In-Reply-To: <20211103113830.22283-1-jean-louis@dupond.be>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Nov 2021 10:47:59 +0800
Message-ID: <CACGkMEvWMi8=R7Ft1vbhRFnagUE8DiOpP7CU+fDbNEBCWY5BBw@mail.gmail.com>
Subject: Re: [PATCH v2] Fix virtio-net-pci* "vectors" compat
To: Jean-Louis Dupond <jean-louis@dupond.be>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, ehabkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 7:39 PM Jean-Louis Dupond <jean-louis@dupond.be> wrote:
>
> From: Eduardo Habkost <ehabkost@redhat.com>
>
> hw_compat_5_2 has an issue: it affects only "virtio-net-pci"
> but not "virtio-net-pci-transitional" and
> "virtio-net-pci-non-transitional".  The solution is to use the
> "virtio-net-pci-base" type in compat_props.
>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1999141
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Acked-by: Jean-Louis Dupond <jean-louis@dupond.be>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Applied, and queue for -stable.

Thanks

> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e24e3e27db..b17a15508c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
>      { "ICH9-LPC", "smm-compat", "on"},
>      { "PIIX4_PM", "smm-compat", "on"},
>      { "virtio-blk-device", "report-discard-granularity", "off" },
> -    { "virtio-net-pci", "vectors", "3"},
> +    { "virtio-net-pci-base", "vectors", "3"},
>  };
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>
> --
> 2.33.1
>


