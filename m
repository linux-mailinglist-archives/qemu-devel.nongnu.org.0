Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A69476149
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:00:57 +0100 (CET)
Received: from localhost ([::1]:32858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZWK-0008VM-NB
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:00:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxXmH-0004kj-5q
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:09:17 -0500
Received: from [2a00:1450:4864:20::32b] (port=53883
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxXmE-0005lk-IF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:09:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id y196so17078042wmc.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MbZ995HH6h+XNE8SuFHfoy0WgztGZQ4Rc3McDP1f+fA=;
 b=M1lcfZdZ4qBu5clYaaPQkmbYMldU3t8cj1bond67Kx5aOVFj1H6V7WKonkoQjz4hPO
 KTwxRLHBRx0rdip1yiBzVbP3CZPrgV8vB9FYC4/DNeeX7mQ/8HG5I8SDpReBd3Ng02VY
 vW8w9knoorU/lPeJLl2hI7UWfzlRdOI49ojH90b1hPqyI9XndOV0vpaR++2zQ2XnzcHw
 zLxlBGxggEZlNfO4aMmv6v9pLA6bQ7TV1s/n6RQ2Uwc9dB4h+kC6e2zFwA3isTf3RV6k
 CtgrAndTEimF0qMMRxxgDIwU/voJ4VJuF/D5fkEhbWIgkzOqoMZ9/AYeJCe78BcSDlVG
 s4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MbZ995HH6h+XNE8SuFHfoy0WgztGZQ4Rc3McDP1f+fA=;
 b=VBg9sLLeLjmeL7n8/4bbZNDxDn61fcYvfkKprxmpMKCwTb/1A6d67x5xoTbWRA+6ZK
 n1hKKXFJWGfBvW9XvX+IhSfPAQK7yIZRKv7uqTUWBLTmmfiAzF9TAriCbbzwXyF43fxm
 yAqNyKMLGDucImnhDLRebg4BTR4ZXdyp2ZeuWm5yGKpMIALtBDLzZQyWoqOeTBMCjkad
 MxvRvO7XOnqWYz0joTQ/jnikxbwOnoef0fiJcGLIlcYiJnR1hRxzS2cCWBBMeiVgiHE9
 VlN6uNzvu/VCXdAhGgWML+ZoPwr03P2vKsbC6wEzIY+2q9xPPXE3fXuv38VElEn/MvFK
 9WFg==
X-Gm-Message-State: AOAM530sY1ByzdodtD6hEjUlc5nsaReUNTkxEWinf0TBgsdKET0ntHeA
 oAQH7f3FUOaeSfJG0crky9mzZkXwPEbOdllEzRsuuA==
X-Google-Smtp-Source: ABdhPJzpSGRMH+kZGl6GrA/rlqWimGx0po//gzerKmtuFzwmCtSNyudO+nj1QMKFQCdBLTDPHVqournVAIly63dgsb0=
X-Received: by 2002:a7b:c054:: with SMTP id u20mr833545wmc.133.1639588152298; 
 Wed, 15 Dec 2021 09:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20211215170548.20776-1-quintela@redhat.com>
In-Reply-To: <20211215170548.20776-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Dec 2021 17:09:01 +0000
Message-ID: <CAFEAcA-94WxKObDZQn_XRaJ7SDBKvqgvqwPb3v3Uyg73rZepgQ@mail.gmail.com>
Subject: Re: [PATCH] hw: Add compat machines for 6.3
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Dec 2021 at 17:06, Juan Quintela <quintela@redhat.com> wrote:
>
> Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.
>
> Shameless copy of commit
>         52e64f5b1f2c81472b57dbad255ab9b00302f10d
> from
>         Yanan Wang <wangyanan55@huawei.com>

> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 3)

There is no 6.3 -- the next release (being next year) will be 7.0.
Cornelia's posted an update-machine-types patch:
https://patchew.org/QEMU/20211208170241.110551-1-cohuck@redhat.com/

-- PMM

