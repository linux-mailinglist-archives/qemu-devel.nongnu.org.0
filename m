Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14574761D5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:36:03 +0100 (CET)
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxa4I-0004YQ-WA
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxZtL-0008CP-2E
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:24:43 -0500
Received: from [2a00:1450:4864:20::334] (port=45046
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxZtJ-0001fb-7u
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:24:42 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so16696984wms.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 11:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2rK6ZbQ5Ybik69tLGQTKihPq8CNE+MX6caTK2nUD87M=;
 b=eSNn8rSR1DzOS4iETZAbtlgrtoZrEoZKH5fyXz6Xd6Wu0tPYRxXkXp5Prv2FffZLzj
 njJyWH7UIpDPTyYLXTxjjgZL7ATcFS5xplx466MUZcUvP7jnggBe1fn5mlTnhNHGQIaY
 6oLC2dX1mmTBmXsdDaIEwJAUK52z45P95D6yPZ4uu64um9vhG8enbposhbaZqiTJuBXN
 aA3ny30Wiuc5vJrMmNFSMGdydW59T5lMaz4pA2JhQy8CZ9q3F/NeKnh+BOJgyigkuYlu
 Uipx7JtEm/be6ig7ma5j3j0irY+JSzivixxZYOCf1ioL4B3OvFwfj92ktExmXNIRRNi1
 coDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2rK6ZbQ5Ybik69tLGQTKihPq8CNE+MX6caTK2nUD87M=;
 b=Fv4jzthAdI1gsXpw2hOqxcigfK/sR5h3XUXod7+T9ILHSCb6Q3h7FlKLeRHj/fJff0
 4sc6H/X+Vl9dCxNvPrczFB3sYeGrUWICl1v29DTMk6+VUO46mTQJ4Iacq+z7mDvga9cj
 vTDodcVZBzYItE0IcRthxfwQr055iqXymvjyNYBJbA9t8HeCauSBYZffXNWELPpAgA4Y
 bYXlNFxv7LuwBUuuls4345FxfnuUPJ1kp8kntaRmUbX6q8OBVPoVf4lRo2fil6pEyMvG
 T6kigs+X3G+1brivEWI7XGs5+LfVQBssbif/us9JZhZ0RAlASCVIZf7dRcfWtevGrhOy
 z6rg==
X-Gm-Message-State: AOAM533gfhdvArKfuxxR4lEOnfzSqjzqPRCA+hCigVjirVZ+cLTxpMwi
 bhnWs7LETC433if0JWYwmjScTPDmXqn+SBtJIvcmVw==
X-Google-Smtp-Source: ABdhPJxNvjtktuoj7ViVu998kWDl6I/5kU+HgcdrRwG6e3WTRVMZJTUZqF9vPHflFKw+VrFrH1HJKsKaZEzOzz/ideA=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr1642754wmq.21.1639596279642; 
 Wed, 15 Dec 2021 11:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20211215170548.20776-1-quintela@redhat.com>
 <CAFEAcA-94WxKObDZQn_XRaJ7SDBKvqgvqwPb3v3Uyg73rZepgQ@mail.gmail.com>
 <87tuf9yeoi.fsf@secure.mitica>
In-Reply-To: <87tuf9yeoi.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Dec 2021 19:24:28 +0000
Message-ID: <CAFEAcA__zOANr4cgpcaXSURtSE9LoTVrcjY6B0NHZT+v6-BXqg@mail.gmail.com>
Subject: Re: [PATCH] hw: Add compat machines for 6.3
To: quintela@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

On Wed, 15 Dec 2021 at 17:13, Juan Quintela <quintela@redhat.com> wrote:
> I got confused with the version number on the tree.

Yeah, the VERSION numbering is a bit odd:
 VERSION   tag
 6.2.0     v6.2.0
 6.2.50    none, development tree before next release
 6.2.90    v7.0.0-rc0
 6.2.91    v7.0.0-rc1
 6.2.92    v7.0.0-rc2
 6.2.93    v7.0.0-rc3
 7.0.0     v7.0.0

It's trying to maintain (a) VERSION strictly increments and
(b) tags look like what users expect and (c) VERSION and tag
line up for the actual release. But it does mean the
open-dev-tree and the rc VERSION values are confusing.
I always have to check the comments in my tagging script
to get it right :-)

-- PMM

