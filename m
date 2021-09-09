Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2988F4043DE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 05:14:34 +0200 (CEST)
Received: from localhost ([::1]:37178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOAWG-0002Ke-Ta
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 23:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOAPl-0005MM-Sh
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOAPh-0007z9-IN
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631156863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hkBuAqvlU4hO8eH9EeEbBUVI9kR/jvwHEqUBY/98nUA=;
 b=SnC3hNlONRp6fGBHydT0s+1kXYArRGX6yvKv9ZNo0SLbmcMrr8pXN8wtoR9bgbf5xPzZwG
 QUDT+VoSz9xPcanzZxOp+4gPJI5+MBDS5kdQNiJS3ppAoXWE/+iqmEG4cPgALl/xanUxwx
 aMunLv2I1A5522oj01eRc/87K+BMgc4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-oprnXuO9M8GWmYtlAJytLg-1; Wed, 08 Sep 2021 23:07:42 -0400
X-MC-Unique: oprnXuO9M8GWmYtlAJytLg-1
Received: by mail-lf1-f71.google.com with SMTP id
 t3-20020a056512208300b003e74909096aso186090lfr.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 20:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hkBuAqvlU4hO8eH9EeEbBUVI9kR/jvwHEqUBY/98nUA=;
 b=QhN8e+VcZmzo78Oo6yOpOfZ4f6to4RRrmP8+5jkaXO3N7W0g5oGwP8yi3mtRPedn38
 I1Nn/Gj65sVxzp02XaW8WRvxiAQlp4XsrUU/1KwAxRo2xOIum0DS7SEoyUH5eNbqGzg+
 AVuXvhEH3csTr+K/lJHEEVxdhE5ptV2SmPp3dZA72fUwrIkCjAufLrCdtJVeStJ+4l8U
 JBiWhmgVaegHylzs4Gb5KSo1bdbrlK+WHORAwiIT/y4ju/vjiu6YhL1tYTt6hZYr7mga
 NFJtm3PizoqBXdTUAYg35XLmOo9pTJm+aposxWrddYASA8YvVbbXYxLEQIWTQP37I+GD
 /ncA==
X-Gm-Message-State: AOAM532WvALndFGTunzl5buiBN5FSRar+TEsXig3dpBVHkcWgm2P29v9
 VRgRRFOT87YBUxxK0Ih+8TR3sPhgVMR71pyUVliQPTfKAHaEVO+Xk7FNpkbRa6xjwdzC7Vuqtai
 VtUGaE1JJVAJPKLhB+kGc8Axsta0pEoY=
X-Received: by 2002:a05:6512:2254:: with SMTP id
 i20mr665039lfu.348.1631156861067; 
 Wed, 08 Sep 2021 20:07:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqWRa9w/GwJoBKr97BMK6SK9zzdp8iIzM3y+jooAaJjHX71kyuwQUVRJslwn8iMw6BLOUYXGx8YYpVcGtDWm8=
X-Received: by 2002:a05:6512:2254:: with SMTP id
 i20mr665021lfu.348.1631156860805; 
 Wed, 08 Sep 2021 20:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210907104512.129103-1-pbonzini@redhat.com>
 <8b500aeb-b4e2-dcee-24f8-825ae6327acf@redhat.com>
 <e6790a9c-f2a3-75f8-623f-51726f4b656d@redhat.com>
In-Reply-To: <e6790a9c-f2a3-75f8-623f-51726f4b656d@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Sep 2021 11:07:29 +0800
Message-ID: <CACGkMEuSNRmKX2ukdDkmhS91-o4Z0mi_TdASCm6aKNkFHum0gQ@mail.gmail.com>
Subject: Re: [PATCH] ebpf: only include in system emulators
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 8, 2021 at 1:46 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 08/09/21 05:08, Jason Wang wrote:
> >
> > =E5=9C=A8 2021/9/7 =E4=B8=8B=E5=8D=886:45, Paolo Bonzini =E5=86=99=E9=
=81=93:
> >> eBPF files are being included in system emulators, which is useless
> >
> >
> > I think it should work since it's an independent feature. The current
> > use case is to offload the RSS from Qemu to kernel TAP.
>
> Sorry, I meant "user emulators".  That should make more sense, they
> don't have TAP at all.
>
> Paolo
>

I see so I've queued this.

Thanks


