Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC6B8A47
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 06:59:16 +0200 (CEST)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBB0l-0000ZZ-G5
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 00:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAw9-0006lj-I1
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 00:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAtj-0001fO-T0
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 00:52:00 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:43914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAti-0001dT-OB; Fri, 20 Sep 2019 00:51:58 -0400
Received: by mail-qt1-x844.google.com with SMTP id c3so7191595qtv.10;
 Thu, 19 Sep 2019 21:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UX9omtw5itv3tNBtOezj1OfJf4tePpoWq8qKz4OVfiI=;
 b=XPqXce5uz/YhNtMnWj9dgmqfJRxioyzMZQyEZOa9qNF50aN/GEeZbtyUKeAEAquJ4x
 C3sOdlpBGpgB6S0jDFctbRaqGawlbwuTNrqES2YrNPWSD/wnCpZrH9fpgbkZLKI4ZXAw
 OjsjvkQLxGLbPjTjTSHYWA8lMynfY9ex2uQDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UX9omtw5itv3tNBtOezj1OfJf4tePpoWq8qKz4OVfiI=;
 b=pXQX/mjvqkUf8TVwGHTPu0sC91FyCxA8SDlFNJKXEDryzBdZmgL/awtjp8D2TUuFZV
 9DOOxyiVSObCtRf+dM7mNp2dle6qnx9rb/pBGYTc8qdQo812/HZVS19tmBPdIaP4YN0r
 3E45wqiUyFxKCV49tbOK7y8bewe3sq+hloWaeZjgugQTbYSaWclt93PIuMxTvCSbraA5
 gOasfiWGQZttzVJqs213FSI+GspmZR7dE7ClDfFlE3UkNHLJl7H29TuerAe30Aj5v1J5
 Td9vpITlJizTkH5ySt+W63TOcofoPjNQIRy0Ct8AxO5pK7zieNKabNfRs4emel3tBMjT
 qxdw==
X-Gm-Message-State: APjAAAWLXVAiOTBqYrvmmsJS1oxbvCajLQtWlFnw8xw7PktCswNmg2SF
 RyhcHCnapOIl1ncT2HzfeKD2tgfU/5Eg2emaqxg=
X-Google-Smtp-Source: APXvYqyqyynPOVdHlmS8GyBLlnzZENZAg0f2p+hybj34uE2FZy4zJ5FazHLnbp5U9c4ruul06NJWlqR0gcBQULEqSy8=
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr11696061qvl.38.1568955118058; 
 Thu, 19 Sep 2019 21:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-9-clg@kaod.org>
In-Reply-To: <20190919055002.6729-9-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:51:46 +0000
Message-ID: <CACPK8XfWdraTOhoFYttoe3jGTCG1vKQB2nvt8sU1SwsF5OO2pg@mail.gmail.com>
Subject: Re: [PATCH 08/21] aspeed/sdmc: Introduce an object class per SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Use class handlers and class constants to differentiate the
> characteristics of the memory controller and remove the 'silicon_rev'
> property.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

