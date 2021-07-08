Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518513C1A11
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:46:57 +0200 (CEST)
Received: from localhost ([::1]:36276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zz6-0003Mh-Ay
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1ZYE-0006Dh-QF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:19:12 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1ZYC-00080T-0s
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:19:10 -0400
Received: by mail-ej1-x62f.google.com with SMTP id i20so11577277ejw.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7am0bs9g6tOPvmL12PRNu7w/5jD+5m4YSe1iR5Npesg=;
 b=zM4IMOtw/41rKvhrhFw0J0mgUIhEWtdh7HbDD0ekd0njvw/VMYudwfJ1HlHfsnCQz9
 FRy735gSG07Rhne1ePXAZtqVIE2PblxTBP2JVyMoh0j52yycKUGDvnEli1ZN/c9XqPjE
 RbUIo0pmhqR2q+M/ciyletgFgaRW8egTdgEjAFKoI5jt21B+zoh0364laMKNR9kzC7p8
 MXuANS40lexP+mdeL2sC9n9SFJoF0YX6b+8OtpPVrRpEpB9TXRY84vvsJs28pXPBxmK6
 iKgsVzzraaOQ41MNDmM7J/MFTk1aKIPONT2Pwqp4JTb3sQX7wcg6bR/UKqwTaoLIFKe4
 RJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7am0bs9g6tOPvmL12PRNu7w/5jD+5m4YSe1iR5Npesg=;
 b=Mv7KaoC2tuoohgv1zU8ZVJneeVxcIjHfOSzjoICu8m9zXi3XvmbNQevCTu6sf5OmJw
 DTmMdynbdPemUe8Ta9m9qir+ZZQfonqTRt/vwt+Suo8aqFhCJ/kaXD0QXdMH5UZD8LFQ
 riHOR6iF37F4tRbnl1TVrLXTtAXfEVM9uCTzsJjO9V6kS+FweROROosMIeS+rRn9wjSM
 7dCjFactvhqs7lNC8rsZHDQpZ8Wr37LseRjN/KgDGVeBDcASCaiSXM7/TAvX80W4OR2O
 SedURk0heCUn5wYNjVYbNmM2dbvMS5zPsDN8s7PpYA7OslMUyDhY9aB9tWSXkQ7jHqpj
 32gQ==
X-Gm-Message-State: AOAM532ICpvIZgTiUlCOHeGnHMZr0VCcRrvdFGGiSCF3AuqqrSXntDwj
 3gzKaneZci+5URqc7mELM0w1TyEhEZsQbq5YzWmxbQ==
X-Google-Smtp-Source: ABdhPJx6V/sLUW0hgGj0cuMnee4DIaCB8tEETyhsCqPYBC1zc7q+DkZFZr8YCnKU8kMwu+/Ittx7azKn6wLHO3lr1ec=
X-Received: by 2002:a17:907:9701:: with SMTP id
 jg1mr21546373ejc.56.1625771946658; 
 Thu, 08 Jul 2021 12:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <d1a1e265dd846de6ca40406300d91cecfba69ef8.1625769570.git.crobinso@redhat.com>
 <YOdHyyEGzWzMWC0H@redhat.com>
In-Reply-To: <YOdHyyEGzWzMWC0H@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 20:18:27 +0100
Message-ID: <CAFEAcA-NER3jDVoTnZN4T=gtzOTOmWvUMNOcPikjcj6Ay3NQJg@mail.gmail.com>
Subject: Re: [PATCH] Move qemu.sasl to contrib/
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 20:14, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Jul 08, 2021 at 02:39:57PM -0400, Cole Robinson wrote:
> > It's not installed in any way, so seems like contrib/ material
>
> Not really.
>
> Contrib is stuff that is included on an ad-hoc basis with no
> commitment to support and no guarantee that it is working at
> all.  Yes, there is some stuff in contrib/ that doesn't
> belong there based on this definition, and should be moved
> out.

More generally, I would like to see us get rid of contrib/
entirely. We should either support stuff (and have it in
sensible places in the source tree) or kick it out.

thanks
-- PMM

