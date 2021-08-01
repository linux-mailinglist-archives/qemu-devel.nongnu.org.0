Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4813DCB8A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Aug 2021 14:11:45 +0200 (CEST)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAAJj-000582-N9
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 08:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAAIu-0004R6-Ta
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 08:10:52 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAAIt-0002Kp-FI
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 08:10:52 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hw6so12255156ejc.10
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 05:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E4ggiRGF0aoDsfJcNABpDg2WG2JCLxbsd2f2c0D47bo=;
 b=asJZ4xpGV0nCVjy4mIEtNST7f+5lcHieu2Khg/JbAzYOa6Dk1VlCpb7Eby9eVkD75j
 CtYCWXYFUuML0NpEakAyFiNsNhTiIvTVx+At+MQVa9ZZTL3qHZlVYJo7GMRGWT/irFEI
 PZQgcaxprQluK57jlHFSWB0gGCcn4wAKqJ6ZU1QX0VmTbgy6V2dggJz6QstbsynW/9WJ
 zDJ1VZmP1guyHcV+rppyZ2F8V+sI20I9xMBMSGI2PElEQ9sBwtJc2dEtWEzUP1fj6mDY
 n9vNkb+IXCeOhOFl1HE2NMiavS0j6x3sAyq+LjUihQ/FxKYE+U0Zh8c/+tTAIm9SfJJU
 um8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E4ggiRGF0aoDsfJcNABpDg2WG2JCLxbsd2f2c0D47bo=;
 b=O1dvB/hzVjMP5+fWZRPN3B4FLRm9L0e8RyaogDX9X/1ZOhJaLDtTtEGRdRl9FlAFWp
 pMVs3D78jYJHQSbBdcXfhI6hUN89yy+AZZ9e6uAeUoRYEeuntBqCFVtBJ8FRWTZxS+Tn
 PVcdmqxQuu9v5uKY2XvOjULOIB4GMS8XsrhZfQ+5ozHEllt6rBpBJ9/t7efegJjHglTb
 aDD5rxol7U1adC9qQzqWRq4ftTskXo41Jvq/82sefbm8dXpBQO+w6s6T28uka1WhiRhv
 P6RjQyw2EHoeVSLDHBZn6G4X/oimvEVl8JDKWzUlJZhMA27ul7xlngbmH437TRg8S1dT
 NkPw==
X-Gm-Message-State: AOAM532vY5ZpMjYUrrGHnyn8D9W/ifnASZO5O9yWbo/PXrilLxQWCs2I
 RYMHs/NNhSFvODmzXlZIj0VfapT1jq6nifdT4ur51Q==
X-Google-Smtp-Source: ABdhPJzTa2PuH4mM71t48GBWfF0f91jBCMnKvnhD6azA/DedWiAjjZGWbxgR2KAQ67tUfUe3L0HcHt4e2BHcZbt6i/o=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr11180871ejc.4.1627819835306; 
 Sun, 01 Aug 2021 05:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 1 Aug 2021 13:09:52 +0100
Message-ID: <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Jul 2021 at 16:47, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> I wish my previous pull request with the submodule change would
> receive more help or attention, as I either couldn't reproduce the
> failure (neither CI) or it was just some one-time warnings due to the
> transition...

Well, I reported the failures back to you. I can't do a lot more,
because libslirp development is now much more opaque to me because
it doesn't happen in-tree. So instead of "some small change happens and
we pick up issues with it early", you have to deal with all of
the accumulated problems at once when you update the submodule :-(

rc2 is on Tuesday, so we're starting to run short on time to
get an updated slirp in for 6.1.

-- PMM

