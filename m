Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70232DE364
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:45:09 +0100 (CET)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqG4B-0003nf-9q
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kqG0D-0000pJ-1F
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:41:01 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kqG0B-0006ff-EF
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:41:00 -0500
Received: by mail-ed1-x529.google.com with SMTP id b2so2395703edm.3
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9lKZOTHkmFupWYYYFHUBQOyhZJpuf5dkk1CA/XOAfDM=;
 b=l0opcJ7ifJiuADSzbhjre7iGGNHSrbZsDLEwiZ+rPiM9ri1liOPQv4czq3511eChSZ
 WcKB2ChxeIQLRWlliip5k7bq5BzHxRyCj+lfhEz2vQYrBXp3oXSCZ13ugnX6AiXhjCLO
 0z8V1VU6M0IElkTeJfizLihcXD8Gyz4S3/yrkUiT2bDBUwbQDZkzWoa1p0gsf9yYTdkB
 sxddxdvbPAuBKvl999FdKFydemrOQG61e7e9uCwy9K5B2R6aMtnnU0MeoVD2Ehgxsfen
 qdoa2upG+Pfrbit8OE13XSJNpUbFHE7J+70NJ47876MHqMfA5XST528Ci0WpzFiBi6f4
 lYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9lKZOTHkmFupWYYYFHUBQOyhZJpuf5dkk1CA/XOAfDM=;
 b=oYB89++ZcsA0YEDScuK/Wrh3Muc/NsI+aPYbLwt4eBE91verRD0KTXUIa2UgyyD61r
 mjFFvESoIT8WfMz4+0PPkTX44epoBsq3IFoW6rSSILNqzE8OeGwbsqy2m8mGOAJmZkYu
 COkQC/bhnuduZwpzxEpzVPRTft9keR2ru05kjAaFnzBHp7NXsXkx4X27bbvRXgX2SJg+
 yRCWiJIDjhrSGcJ/vhabUpLCXDlxb8xzclewZ+ftbfVrR/CVPHZrQ/xD4PjRELMSNQyU
 GAn6qPnVzEm8dwu4OuTe0UqR9n8Jf7JWNruv0S4fKEkQ0D6k3kKoP4hL+02jAXjAEDm+
 TwhQ==
X-Gm-Message-State: AOAM533UaGJhqTnGIYK5yFLB8FCEdVlNtywmtVQAPz2nKAIw7AHdlYQC
 CrdW08Fp4lr2UtxRLJm4VMMQi6wCcN/UWJ+/0Ykp5w==
X-Google-Smtp-Source: ABdhPJw7ePaGqDPD0v+GvGRBzJLMtsqR17Dw/sal89O62KXyjwXpJ10xLZJMk7HqfqnEcm0PrWUIepy0EtUtQW2cE/U=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr4453966edw.52.1608298857873;
 Fri, 18 Dec 2020 05:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20201217094330.17400-1-alex.bennee@linaro.org>
 <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
 <87v9d0q9rr.fsf@linaro.org>
 <CAFEAcA9dFV5ym=N1XQBJrXHYgu5NNRJC8eB9pPRaK2CokHoHxg@mail.gmail.com>
 <87pn37qqh1.fsf@linaro.org>
In-Reply-To: <87pn37qqh1.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2020 13:40:46 +0000
Message-ID: <CAFEAcA-UmyTw8Sn5yZrZFxumJRPv-oGg4uL++7av0oTh8fEAMw@mail.gmail.com>
Subject: Re: [PULL v2 00/11] testing and configure updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 11:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > No, the 'alldbg' build is the one that does do a 'make clean';
> > the build-not-from-clean build worked (presumably because the
> > old executable was still left in place from the previous build).
>
> Hmm I wonder if it's related to the configure options then. What's your
> configure setup for that build?

'../../configure' '--cc=3Dccache gcc' '--enable-debug' '--python=3Dpython3'

-- PMM

