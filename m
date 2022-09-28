Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABAC5ED49A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 08:18:28 +0200 (CEST)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odQOp-00045Q-Mn
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 02:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1odQDq-0008TP-FB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:07:09 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1odQDo-00067P-Ce
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:07:06 -0400
Received: by mail-io1-xd2b.google.com with SMTP id 64so835670iov.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 23:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8/8UONBq53DkTqvqnEd+gic+615eXkTFta08flwq48k=;
 b=X1HA5Ukwrt3F0n56cspUsusr5lEM0oYIh8N3LOQZH5r6kRck5qVzmDhxSEH5uVq5Zs
 NqsIMAKzY4o1D7h4xpA5fJaRvNr4mUSnhMwBlY42OhCucV2+/sCPq6S7pJMXf0Mzd2RU
 rd0oPqcgHyfb033awS0JAD/IDwgm4NIGDku1q23oK/XBqhFTmmeCnf44fv6JYF7QAKAU
 wzdx0C6jpurlLw4dXYe7/9QPbot12Ap7zsZ8ECRhpztBdcEDfIi5UUd+mZvPeYjMjFvE
 hahhxRLrRXF07XgY17ypHQlOg52taxI32zH4B4q15Mwen31rDfxNZZFEjJefFvqHWn5L
 ROow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8/8UONBq53DkTqvqnEd+gic+615eXkTFta08flwq48k=;
 b=Acwlx9JslyVNrV/InROkLUue2/F6CtuH3o3B33H9LwD232VeAYFK0fwaBYi1bBoIaH
 kDrMOV0G2yIt+Rl1FtXXYtSYjQXV5MehqkHkhP8h41DSJqk+KAlihoU3CX4ybE2MXyNg
 HiXQ7pbpgxBcX48IjFtslHrQUB37V5VHlfY64dykN6PBhYv1Y14T35fc8KLdhutzhuFm
 Gstn/q+q/vENSXAr8Z9lFvcvRdfvoS5KvwfMEIZYu52aYBtfW5TeslkcimYNw1btRSzp
 YmPnoGTG1/gha6n+LMh3ybnEP8Xm7aRGIt3/JRif9+OzknwRd1sSDDznDu2aD1x4SGw2
 ZF9A==
X-Gm-Message-State: ACrzQf22wa7L6aVqXblX8cqHh29KJEiZlrJfvxIpTSbaEJdmP7GQlTY2
 cSH6Bdee11Dtiz/hqRanxXXInx6EhUku6rjMdXunoQ==
X-Google-Smtp-Source: AMsMyM4/WF7CbKNMv8Oiis7NhwRWBvMjaUZNkOp7ooBlDjwwjfcwpMfrNBMMNNGrnIl2fDkZo4AJOKHgVQWIxRnKd/k=
X-Received: by 2002:a05:6638:12d6:b0:35a:801c:2136 with SMTP id
 v22-20020a05663812d600b0035a801c2136mr16685906jas.309.1664345222198; Tue, 27
 Sep 2022 23:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com> <20220927171601-mutt-send-email-mst@kernel.org>
 <CAARzgwx=514Q8hMMLP4OpczRH4U2iiMnHqhJ6p3vg-8O3_aK=w@mail.gmail.com>
 <20220927233925-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220927233925-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 28 Sep 2022 11:36:51 +0530
Message-ID: <CAARzgwwBBheVucSwRYBkKfEcifmFY20AWK14nxS4NdpgKqcQyw@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 imammedo@redhat.com, jsnow@redhat.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, qemu-devel@nongnu.org, thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 28, 2022 at 9:28 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 28, 2022 at 08:38:54AM +0530, Ani Sinha wrote:
> > > I don't really care where we upload them but only having the
> > > latest version is just going to break anything expecting
> > > the old binary.
> >
> > In fairness, I am not entirely certain if there is a tight coupling
> > between the qemu tests and the bits binaries. I have written the test
> > framework in a way such that test modifications and new tests can be
> > pushed into the bits binaries and the iso gets regenerated with the
> > new tests from QEMU itself before running the tests. Only when we need
> > bits bugfixes or say upgrade to new acpica that we would need to
> > regenerate the bits binaries.
>
> Theoretically, that's correct. But if we did not have bugs we would
> not need tests.

Hmm, you might have a point. Curious, do we keep versioned binaries of
edk for example? If so, why we can't do the same for bits?

