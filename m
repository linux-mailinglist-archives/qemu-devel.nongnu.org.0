Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621D3C7DE5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:23:30 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3XMm-0001aT-Pr
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m3XM2-0000uD-Q9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:22:42 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:43793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m3XM1-0008K4-Bj
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:22:42 -0400
Received: by mail-lj1-x22d.google.com with SMTP id bn5so1155685ljb.10
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nm8cNY4RzDr9m47lomPKCIO5cyQCB456mTwOJ1bIX3k=;
 b=ejTRkMZJBLibJcF6ks4Crtx+CzygwpSdiVtJy6OLbKQ6E3yJ1iqpMScgww4vIX2Dz0
 HNalAAIzDjG5AUJny/d7XGgoBf8WL92hhD/e27k85X8yPCL2WQ1l5ZhZlJAvoHPCUFUB
 SMM7b4yt+r8hWCSYWNY/2prs3jHntI4VSg53RNJ49+FBZ3nN5aM7Z1ENGiQQzEL+jdOo
 710apJDwQWHt4qDfdZoexZ613LUBBxR2yUi+N+noKG/RkIK30ni80aGGL5i8C9Zx1c/y
 6nvVBoDNoo8RZe4g9weiPr5MBVTFFG6/qcZm+K65Ese6S/xLGRhUGm6O7ebWGxctgJ7w
 S1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nm8cNY4RzDr9m47lomPKCIO5cyQCB456mTwOJ1bIX3k=;
 b=aDuUg08W1PAxFbpGPNef+dcM+WDKwQ4Ls0mY+GBISUJtGrlKuQvkk82rOznWziJRnK
 /ooY4BYUHwzh1iOwnXs7h+kPNbjU1tbcC1cEtZoEDVMII1USQnGO0JHhjHnsmswrjdE7
 GBg/9yj8DjxOH8tBUw6ncHn18e5zgAOfab7pdUdbzfSurlYL+Ej9Z+xryMET9nbIajNM
 Sm66KUUebBpP4EIXRmqBRiS/CSrPv9nnF0eAArc3zlUJSF2jvmqbJC22cOsukmKgj5lt
 c1xrKgFw9wY5k7jv8HU9Gvshvu17TiKzImrsX4UTghKh0CRNJGtm9tYERe1436xojjs3
 jDpQ==
X-Gm-Message-State: AOAM532Qsv4X1stAvwBEeUcIDrBMV8eRjq9rFpoMMHHq2k+GJxIbAQM/
 QEDMOw2QlVs81j4wg7aq8GyzvqlViwDIbhlNmlM=
X-Google-Smtp-Source: ABdhPJzPF9D0u4w9EYV5W1SHFFcG15UqfAEDTAsWzEVpp0cnJ1/tCpmAahGulINkIwSvoWpS6wlhQ6g5Wvdd1h4LBYA=
X-Received: by 2002:a2e:bc17:: with SMTP id b23mr7486870ljf.209.1626240158647; 
 Tue, 13 Jul 2021 22:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
In-Reply-To: <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
From: harry harry <hiharryharryharry@gmail.com>
Date: Wed, 14 Jul 2021 00:22:37 -0500
Message-ID: <CA+-xGqPh+m2Q3pMoKaMFiJ_sZPPE0XafcT4LqUYT3niJAkxU0g@mail.gmail.com>
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
To: Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=hiharryharryharry@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 mathieu.tarral@protonmail.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear Maxim,

Thanks for your reply!

> For same VM, I don't think it is feasable.
>
> For multiple VMs make some use NPT/EPT and some don't,
> this should be possible to implement.
>
> Why do you need it?
>

I am just curious about it :).


Best,
Harry

