Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D03E0999
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:47:23 +0200 (CEST)
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNnO-0001u1-Tx
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBNly-0001At-C5
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:45:54 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBNlw-0005sR-Vs
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:45:54 -0400
Received: by mail-ej1-x632.google.com with SMTP id e19so5634440ejs.9
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 13:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vzzbuHNk5SRa9I0ugC33cEaaAMh+BrooBEpWHzfv1CM=;
 b=PLlLmBlc4bc+NwgOUSmaiddEi3OzM7FRbJDePpJUMZ4FR/x1iPTYhQXrTUuO0P6iS6
 84T4anjKRZUhmPHSJhZWv2orF7rg9yLHOPLBzIJlfTm4WC94b+fRHVTLBYz6eOLfRoe2
 PgqaeCVIkFqxfefdGFr4NAOC+X00QwbKQn2DR8+I53qGxewQpSNAnvrJoRuSU66fvq8D
 rtDXEI/qEXKXNB6mTSwGRtYvIYovfp7H4CVW1MZhHaShrAn/k6jzqtQ/it8Y9GgqALek
 2lbD5z5pDQQAggDmuUDAsDsTy1efk9kAo92WLJ+QfrTR0fNs7w7w/ECRDGcnWrAg6oOH
 kq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzzbuHNk5SRa9I0ugC33cEaaAMh+BrooBEpWHzfv1CM=;
 b=HkwCenze0bjmvvDJsMb94W10IC7d3Hx7XAs/bOH6i10UgEErsVtgbKEVyZxj4+aApg
 mUJZD4MOXv2FeoK1RLujlBEiY94qAVLpMKuULmgY1eJbJPd7YeZzyhGad49SCBuZUa9y
 A/zBOoAQZ/XLNVabkitIsP1UISplb5z0O+aIyIlLz8IGmODa7cAerpNq1kn2fT5MPIuj
 9pSwI6XD/z77mlS9DMhSlU70xrUQIjsa00bERqFJ5utSrpuI2ogPAnCtvAVh+Z2D4ZOq
 ZNYP7nqdhOqvhkVGa7C2SOejABEpaCk+Wwq5RR7Z8CIdoAIugTf7UhZjT2QTm5F7dk1y
 HL+A==
X-Gm-Message-State: AOAM532IXi//rhI8boFi2KwDnYuHDgyIbCSlT+jOaIlicZhfiZ4WYE5c
 rLx4xtc8Hsc9K76AMopM719OVlCDq8g4L8fdIadYjg==
X-Google-Smtp-Source: ABdhPJzYB8bW19yqPCIAuDOXHYLiMSOo+NTSRa3hkAeYgcYs+PHpdJwhsOF2ATbXYcr0EeSoxfGr5dWPQp8tNUULrVU=
X-Received: by 2002:a17:907:2667:: with SMTP id
 ci7mr1053369ejc.4.1628109951311; 
 Wed, 04 Aug 2021 13:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-7-ehabkost@redhat.com>
 <CAFEAcA9=ZSawKJ8ZAuirNFD=EfmuHs9Oxyr_uDch8ZD6q6Ao2w@mail.gmail.com>
 <20210804204029.5am76o3rh6uhrwgh@habkost.net>
In-Reply-To: <20210804204029.5am76o3rh6uhrwgh@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 21:45:07 +0100
Message-ID: <CAFEAcA88WZC8WUaOcUYpCEkH4jx3ds3C4FXM_WytbPeaC0zhgA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 06/10] docs: qom: Remove unnecessary class
 typedefs from example
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Aug 2021 at 21:40, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Mon, Aug 02, 2021 at 01:19:14PM +0100, Peter Maydell wrote:
> > On Thu, 29 Jul 2021 at 19:01, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > >
> > > When there's no specific class struct used for a QOM type, we
> > > normally don't define a typedef for it.  Remove the typedef from
> > > the minimal example, as it is unnecessary.

> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > though I agree with Daniel that in the long-term we should reverse
> > the structure of the documents so the recommended macros go first
> > and the behind-the-scenes boilerplate last.
>
> I agree 100%, and maybe I will give it a try later.
>
> My immediate goal was to just remove the examples in the docs
> where type checking macros were defined manually.  Since we
> introduced the new QOM helper macros, the number of OBJECT_CHECK
> macros in the QEMU tree almost doubled (from 40 in commit
> 8110fa1d94f2 to 75 in commit bccabb3a5d60).

Yeah, to be clear, I'm all in favour of changes like this patchset
and don't think we should hold them up because we have a theoretical
larger restructuring of the documentation we might one day (or never)
get round to.

-- PMM

