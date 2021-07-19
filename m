Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB83CEE13
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:23:24 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ajS-0003ru-Hw
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5aiC-0002QE-Ts
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:04 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5aiB-0000Iq-Ar
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:04 -0400
Received: by mail-ed1-x529.google.com with SMTP id ee25so25863847edb.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RvEruJHaTbIZvQ65J8mCl8VbXzqPrNjooS9FlnUCmCM=;
 b=J934meXo2hnfP/LbLwR4ZjUHRVslt+YD8//MYBLMWLWDCOMKMqSPGMdpOFMrYc6PMA
 kfkuNykTMlB/Sc07EhS2JOx68lQXRB23pSd+ASjPFnPQTiA9H3BjtdQa8HqrcfdmB883
 PeY/p7rQXpvqIeBbVJLej3zUJD+ajvvt/k6R9+RNODJuOf3xnn5DTp2zmae6wTQzqhIS
 RQGwbV8tDZAYJk36xDELktgs8kUrCNcaf3EVRS5PpZLSWXCuroHjMf6NNUSbG0k2e589
 HsydV181iNOAVj6WpmZYia/OEPqevdHMMQaLj7MotzBPvaR80PQ69psup7i9YX2Wo9dD
 AUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RvEruJHaTbIZvQ65J8mCl8VbXzqPrNjooS9FlnUCmCM=;
 b=n92nraF3//bTAntUmbHzOv9MAPtRTZAN4M2kfgi/OM2OKwZZa5P5tIqjxpFNqb13Bf
 ORfoOTF0RDpKZMabMMU5eGF7hR6eaNDZvpjI+PBbIG5cLivFSo3j1SvTCSnYDhU4G559
 WCzgL18dN/xQjsyf/QSlubTIKSgRRu3sbSL+blUW1xUwHCgE9gCgsFp/IJFxWnc9uR4l
 0D358ntR/IhMuNejHhuQeNJVu2/tVDFFrSRf36Mhq4byRrObg5juQvNYmrqpcGkXhe21
 ZccGTLPE3wQJDnKQhLLuqn9H+0iOcaewD41LMYYQY2FXLK4J5ZtLhpmcKnxReznw5AIE
 uAPw==
X-Gm-Message-State: AOAM530daqOaUr9WEmD1vIgAUcwHEf8Er1slOw8tZRa9tHE9/Ykn5eNw
 Syy8PWCeHjfl9pQThH3LstQNAcs/TgrxTLZYeAZRqQ==
X-Google-Smtp-Source: ABdhPJyVBt5aZynvQuFE+z7DUxcSC5eWAYe4+PiC52+hb0XYMNr/xKeFFF0nEt+e493RF7JGrQjy5CN9B9ZW0yA+rk8=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr36246646edp.251.1626729721356; 
 Mon, 19 Jul 2021 14:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210719195002.6753-1-alex.bennee@linaro.org>
 <20210719195002.6753-2-alex.bennee@linaro.org>
In-Reply-To: <20210719195002.6753-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 22:21:20 +0100
Message-ID: <CAFEAcA8VGYTc2jrdB+ET4xFODDv0SniTjnUAYr+4dgjSZEsmiA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] hw/tricore: fix inclusion of tricore_testboard
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@armsat.org,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 20:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We inadvertently added a symbol clash causing the build not to include
> the testboard needed for check-tcg.
>
> Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  configs/devices/tricore-softmmu/default.mak | 1 +
>  hw/tricore/Kconfig                          | 3 +--
>  hw/tricore/meson.build                      | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
as far as this fix goes (though maybe CONFIG_TRICORE_TESTBOARD would be bet=
ter?)

But I still don't understand and would like to know:
(1) why doesn't CONFIG_TRICORE get set by Kconfig anyway, as
f4063f9c31 claims to be doing?
(2) what are the CONFIG_$ARCH flags for? Apart from this, we
don't seem to be using any of them, as demonstrated by the fact
that nothing else broke :-)

thanks
-- PMM

