Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241184AC469
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:54:24 +0100 (CET)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6LP-00040Q-8U
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nH6IN-0000Pm-B4
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:51:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nH6II-0004ft-P0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSmiP5YnwVNJzek/axVa4dkWr/8lSyqJn6cxo/n3qKw=;
 b=JAy1lzGnzNF2sVAo5BGYB6CEESPrj+Dh1QPB+Ekdx/we2etIETWMWLlRDbCGnWPWRpv7xr
 kv+I4cJ/kbMrvXTRqq2qa38Ue3ve3b7zjWyZnF/fO79Nl4T8j7VT4nWt/Flgmqy/OB81x4
 kboWIESeGfE59aDEReU5/OzBT0Rr48w=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-pNiTHKOoPtWlvKsvuOu5Gw-1; Mon, 07 Feb 2022 10:50:50 -0500
X-MC-Unique: pNiTHKOoPtWlvKsvuOu5Gw-1
Received: by mail-oo1-f69.google.com with SMTP id
 f8-20020a4aa688000000b002ede70d37dbso9215348oom.16
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 07:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s00mlV7F7r6LO+wn0KJxgijqF39/yETq2VMH3qUDbus=;
 b=FpCRVHbLhTE65eqk6Jn+mD0zA0f9U6XdbLv61/5ztcGcTR8Le+xppoGHY1g4HXCzgM
 wFK/x85QTIU/ZBsrf9LmS2sAQZXNw40+KBmkEjU/n4QZilBpHBWN1ZqLebeGnx1Rx+IY
 hABThS54jUWMREburr6wfg+Ota74TpjIyAUH8Igq9YCZmZ5jUYNWmXvW4/93/DU2wH+7
 gmroWkK8RPb0oT5MlIBMM3OMNOe2yhaJVOPKFtbeXyZuVJq/s3mIY0ByGnaUXbvIP1+I
 j8wjhzIcKgGk0oxo++4n2nQxPd3RfaW00RRa1GutrRXhdEUJOfqoItLeWthdc7LvtSW5
 qlZw==
X-Gm-Message-State: AOAM533KmBtrY30GUD8sVC5GismZ+8zedZ2pvd7xZvZ1ew2Mu3v+gnD0
 gLazKQOEbFeFd7k7+Ig+NV7n6ArS6BBu74OZ3mFZDr+QhSMkXQRpBNFhMwIqya5/BC34r3QXHex
 t5IB7MA0qnkb64+A=
X-Received: by 2002:a05:6870:e495:: with SMTP id
 v21mr4729366oag.102.1644249048306; 
 Mon, 07 Feb 2022 07:50:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9pxSl3q7qAQVIrduS7h0YRXgI1Nh3PVerx0ZP3TM9S/lthy/rlXVYr5hLocY/MjUL6HdTHA==
X-Received: by 2002:a05:6870:e495:: with SMTP id
 v21mr4729361oag.102.1644249048069; 
 Mon, 07 Feb 2022 07:50:48 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id e7sm4260229oow.47.2022.02.07.07.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 07:50:47 -0800 (PST)
Date: Mon, 7 Feb 2022 08:50:45 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
Message-ID: <20220207085045.1de46df1.alex.williamson@redhat.com>
In-Reply-To: <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 5 Feb 2022 10:49:35 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 3 Feb 2022 at 22:38, Alex Williamson <alex.williamson@redhat.com>=
 wrote:
> >
> > The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b=
359f:
> >
> >   Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-=
request' into staging (2022-02-02 19:54:30 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20220203.0
> >
> > for you to fetch changes up to 36fe5d5836c8d5d928ef6d34e999d6991a2f732e=
:
> >
> >   hw/vfio/common: Silence ram device offset alignment error traces (202=
2-02-03 15:05:05 -0700)
> >
> > ----------------------------------------------------------------
> > VFIO fixes 2022-02-03
> >
> >  * Fix alignment warnings when using TPM CRB with vfio-pci devices
> >    (Eric Auger & Philippe Mathieu-Daud=C3=A9) =20
>=20
> Hi; this has a format-string issue that means it doesn't build
> on 32-bit systems:
>=20
> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
>=20
> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
> type 'long long unsigned int', but argument 6 has type 'intptr_t' {aka
> 'int'} [-Werror=3Dformat=3D]
> error_report("%s received unaligned region %s iova=3D0x%"PRIx64
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../hw/vfio/common.c:899:26:
> qemu_real_host_page_mask);
> ~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> For intptr_t you want PRIxPTR.

Darn.  Well, let me use this opportunity to ask, how are folks doing
32-bit cross builds on Fedora?  I used to keep an i686 PAE VM for this
purpose, but I was eventually no longer able to maintain the build
dependencies.  Looks like this failed on a mipsel cross build, but I
don't see such a cross compiler in Fedora.  I do mingw32/64 cross
builds, but they leave a lot to be desired for code coverage.  Thanks,

Alex


