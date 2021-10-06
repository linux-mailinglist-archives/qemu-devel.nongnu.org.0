Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7F42465B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:57:49 +0200 (CEST)
Received: from localhost ([::1]:60972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYC6u-00087n-8l
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYC55-0006a2-Bj
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYC53-0001yd-I6
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633546551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=28zFu/yFWtHKm/u24A/A5eY+rwOiR7IqZ1tFn97+fus=;
 b=QbMvI8LOI6WmMzPKNG2hYmroPqWs+cs7X+Scwx1+KTwvhGbyMd39Tg9excSH7I23dSM0ah
 8ZxNleFZnN24aGaaN6Ktrss2NNyT6UTqGZJkuKC8XA4hz4S9z4j6CVJPTC/3kvqYTtv3Ho
 RwkIxAUZHqGe/o6eXMMH2y7BjYN4+68=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-eyc940wAMYC-VyMoQNfnfA-1; Wed, 06 Oct 2021 14:55:48 -0400
X-MC-Unique: eyc940wAMYC-VyMoQNfnfA-1
Received: by mail-pj1-f72.google.com with SMTP id
 k1-20020a17090a590100b001971da53970so2287176pji.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 11:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28zFu/yFWtHKm/u24A/A5eY+rwOiR7IqZ1tFn97+fus=;
 b=K07YcNpG3gVzL3FvwB94hJobCdqIlpDw1Rtssnn5G12r691lbOQv7MwmPb/VLWikl1
 pvUB7nUOYn3JpVrTnW7cGnT+5BsWVsI9blfBcn2XA3rbeCAvqypbhW46dSyn3T2RT+Ss
 b33KrKAN/n3jyr62Mqh2hWbsFw1+IPwxfGeiiq9WFyV9PhBBNrv7peauNV3L8p1fkw9u
 XyFwCTfOgPJsN06T19jU4jR1Fv5kiISktqm7p94/YkQ/XaKIHc2FSCD7XhRKyIP9Pmxf
 v7h6C35gTIRvGAnuNjUShJINFiUw0/lnJjvWawoq54qfwqSsp0e24qbw78+jhEz/00Wm
 5aGA==
X-Gm-Message-State: AOAM533kRwW2KkFNpKOm4yEwETbDwyOGBjXfxWV0O3bxRzYYkdFkMVMw
 MxLPo/XWu0PLSFVCByjjAr/7CiCTBTCCRhfjiI1Ln+08WzpdvSCoe6oRJJzYnz4g/9tIK3Xtoe3
 5H+8kAQmZ481uNwwG+Plke5NsVuBuHgo=
X-Received: by 2002:a63:b204:: with SMTP id x4mr299008pge.212.1633546547924;
 Wed, 06 Oct 2021 11:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4h/QlVgmWKHoX629BdcW729Fch3dHDsSMtPQZ+aqmM5BrNL6DPE/LAi5qvJ2SkldKl0/2ELIXPFei1k/jRw8=
X-Received: by 2002:a63:b204:: with SMTP id x4mr298970pge.212.1633546547616;
 Wed, 06 Oct 2021 11:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-12-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-12-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Oct 2021 15:55:21 -0300
Message-ID: <CAKJDGDZjA7r4vxkZxQNr=QfrOL_5awAYyeSB46Jr-ng41GYFnQ@mail.gmail.com>
Subject: Re: [PATCH 11/16] tests/acceptance/boot_xen.py: fetch kernel during
 test setUp()
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 3:59 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The kernel is a common blob used in all tests.  By moving it to the
> setUp() method, the "fetch asset" plugin will recognize the kernel and
> attempt to fetch it and cache it before the tests are started.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_xen.py | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


