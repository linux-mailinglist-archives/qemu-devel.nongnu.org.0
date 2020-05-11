Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D51CE043
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 18:17:25 +0200 (CEST)
Received: from localhost ([::1]:47506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYB7M-0004K5-Om
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 12:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jYB3X-0007y1-3a
 for qemu-devel@nongnu.org; Mon, 11 May 2020 12:13:27 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jYB3V-00021r-Ra
 for qemu-devel@nongnu.org; Mon, 11 May 2020 12:13:26 -0400
Received: by mail-lj1-x243.google.com with SMTP id f11so10164155ljp.1
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 09:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ysvbdEGH2pK4qDHlVoaPndk5Fxm2OdsZ8jPRfME1rE4=;
 b=lLaSdMzP1XSj0r/R4NjgwMco8RWAeqpidiHkdESkXGkpuAqUON8wD2ziVoIcJolzX6
 qZTc3Ht7Wv4vfgnbH6sFP9H0oOal5hReVfMfTjapZOa7fnDLquK28bj2GssGkcSinDEG
 DB66vSVuOw2acTpci1KyiDSuc/5Cc6N9HdhtDwoYfj44WiS+DpOB3k/8GKEuV80pM5OQ
 g6Y4nS1G1O4veQ4L1i0ve6zYMj7SJhc7Sue4EFpl5zX0MYXkE0jrGyRwqbX8oYZEoFIy
 ofUr8dfm4GoYoD62QGCAgLiEqBiePSG5qxnjQgKcqFXdYKdCkAclwaCRvmybGTP1+v4J
 SekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ysvbdEGH2pK4qDHlVoaPndk5Fxm2OdsZ8jPRfME1rE4=;
 b=GPudxuHhsaPyVoG2Pev4RAdBqrxQ68PruvVHYOGJZHX8l7RvRJRyF7ok+/VDrNDEvu
 wb3CYT1/K8VXgtmK7LpyrluxQ0fR+0MS/DhEbqsD7PHxXIWehmR2jo5KpyZ12vdBl2yW
 Q+xNoOYn2bEQXygBB+eGpelHhylkmcWZx5Xrw6/oR9ASo3Pi6bD3f1a3cK5KoKzl3YZ9
 jTFa4ZIVs8C2hB/LXImSrpNuxxzvWge2kFbahfcaL3sba1ldPzxRlnwIfQVclhzv7KoN
 C9hOpM0p7YXpQ8XkdZThnjGSuNJAvZ1av+tpSE5/MCNgl2ETI6Ks2uPZ871pMHW2Nz8S
 tGYw==
X-Gm-Message-State: AOAM533ThHVvZD2pjz6pyaLXriqdk43qDpR6O4DXVKx+puH+gW6rclVy
 dkwqxxMdF4/22gHW5v0G2Zd1QAMockYGJn3K+nQ94g==
X-Google-Smtp-Source: ABdhPJy+2x5of1+x0GtYleCb1zO5ZSCKrzeHKXHJbKAtGFXlC3otExuqmEnXB34VZqfW8JmtDS8tYq/LlJzsMtIrEFE=
X-Received: by 2002:a2e:b6d3:: with SMTP id m19mr7698075ljo.43.1589213603107; 
 Mon, 11 May 2020 09:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200326193156.4322-1-robert.foley@linaro.org>
 <20200326193156.4322-26-robert.foley@linaro.org> <87wo5ig3ev.fsf@linaro.org>
In-Reply-To: <87wo5ig3ev.fsf@linaro.org>
From: Robert Foley <robert.foley@linaro.org>
Date: Mon, 11 May 2020 12:13:16 -0400
Message-ID: <CAEyhzFv0vWH4nkSMY79RhzON4bFuPCGYqbcouHT9XBxBatwwhw@mail.gmail.com>
Subject: Re: [PATCH v8 25/74] riscv: convert to cpu_halted
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=robert.foley@linaro.org; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Peter Puhov <peter.puhov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 May 2020 at 06:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Robert Foley <robert.foley@linaro.org> writes:
>
> > From: "Emilio G. Cota" <cota@braap.org>
> >
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> > Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> > Cc: Alistair Francis <alistair23@gmail.com>
> > Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
>
> You can drop Cc: lines fron patches once you have an a-b or r-b tag from
> the person in question. They are basically a formalised way of saying "I
> have tried to contact the maintainer/relevant party" and memorialising
> it in the patches. The effect of Cc, r-b and a-b tags in the patch is
> all pretty much the same in that people get Cc'ed anyway - on top of
> what get_maintainers.pl will add as well!

Thanks for explaining, good to know this. :)  Will correct this.

Thanks,
-Rob

