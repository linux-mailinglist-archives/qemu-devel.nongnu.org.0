Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A164938F30B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:33:39 +0200 (CEST)
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFOU-0000WX-Ap
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFMQ-0006Jl-Cl
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:31:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFMO-0001Xc-H3
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621881087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhrFRMOzvqh/LUBrulTZi8NioO+Cxmzrv57UYBVHb1U=;
 b=OvBfHV/afwNgUihMHkPW0RbkMu7xK0NpWaE13uk9oEqORDyFSdFYOrB7VemCe3BhbidcHu
 tcKQXnOQlBslXtKzR8HffcGSU8AZj495G6gtCakR6kGXZVq2FYGVIIUapir26mqxQEcnfP
 7IS5EuKwJRznpLxn46os7EKBgdF5sWs=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-YOfIOV6HNy-4O-XwsbIhsw-1; Mon, 24 May 2021 14:31:26 -0400
X-MC-Unique: YOfIOV6HNy-4O-XwsbIhsw-1
Received: by mail-ua1-f72.google.com with SMTP id
 r4-20020ab070c40000b02902064b454facso12049415ual.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AhrFRMOzvqh/LUBrulTZi8NioO+Cxmzrv57UYBVHb1U=;
 b=G+FN3rWJJRsu9Q5ZRA3y2DN2tcOKcdX8NJAOMjGAUJ/KxjQLYfBgpm/yk+TtZ8kRaG
 BNxLK08ahXOtDnOpEy6I32Jezit2vEOh7tRInG9hCilznfnen5MWUA6kudFP3ll/4njf
 y+9s2wj1nVX2pzQjQ7T84N5Nb0emRGps1liCB05oqvJINTJPXpcj/1bJB6awC5YL22c3
 2HJlHYqnqG+2yH33U1d5pB8ZThO0AKa2GlOV4CGtWv/NPZqDfQcUBolmjVtAcv4D9ypx
 IMRlrQKWg+ONc4oQVqGZYuMFsR3G504jJkz2ZLaai1kL3noKBiaJpxhKg/vJEo7da1Ga
 bf7w==
X-Gm-Message-State: AOAM531dPyAYL7cJ99DGqW/5JdOG7yaTWEeq2Ufc9JPPL/2NCLLeD4Tg
 zKNW4c0PnwIOCdJe/qODRJFRi2dBUF/6rmCHkJqsQQ/4lgmyxUnIn4UkeYKQBpeg142wNL0Ll6x
 81xKMrzH0jhZrwh2j2no/qJRL681mI1Q=
X-Received: by 2002:ab0:6033:: with SMTP id n19mr23979550ual.124.1621881085595; 
 Mon, 24 May 2021 11:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAqBxNUjUsGtfqtTBw+U7PAvvy29H86m9BKEcF/dByA9eWBoOshcsB3MX2pacUPwpB6erBy7bbHMka/S5M/bI=
X-Received: by 2002:ab0:6033:: with SMTP id n19mr23979536ual.124.1621881085455; 
 Mon, 24 May 2021 11:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210503224326.206208-1-wainersm@redhat.com>
 <20210503224326.206208-5-wainersm@redhat.com>
 <0aaa0e83-ea50-8836-20a8-75ef32617731@amsat.org>
In-Reply-To: <0aaa0e83-ea50-8836-20a8-75ef32617731@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 15:30:59 -0300
Message-ID: <CAKJDGDYmABQJ1ykFJkyO-6jJRmDOETPzWvCAip8b3mYXRpVa1g@mail.gmail.com>
Subject: Re: [PATCH 4/7] tests/acceptance: Sun4uMachine: Remove dependency to
 LinuxKernelTest
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 4, 2021 at 1:01 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi Wainer,
>
> On 5/4/21 12:43 AM, Wainer dos Santos Moschetta wrote:
> > The Sun4uMachine class inherit from LinuxKernelTest to effectively only=
 use
> > the KERNEL_COMMON_COMMAND_LINE attribute. This change remove that unnee=
ded
> > dependency, making Sun4uMachine self-content.
>
> It is odd because the test boots a Linux kernel...
>
> Once you added ConsoleMixIn, LinuxKernelTest is left with
> 2 methods related to archive extraction. Not particularly
> specific to Linux kernel. Beside, shouldn't these methods
> be provided by Avocado directly, by avocado.utils.archive
> and avocado.utils.software_manager.backends?

Indeed, it makes a lot of sense to have those two methods inside the
Avocado utilities. I opened an issue on the Avocado side to track
that: https://github.com/avocado-framework/avocado/issues/4610.

>
> > I took the occasion to delint the code: the unused os import was
> > removed, imports were reordered, and the module has a docstring now.
> >
> > Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > ---
> >  tests/acceptance/machine_sparc64_sun4u.py | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
>


