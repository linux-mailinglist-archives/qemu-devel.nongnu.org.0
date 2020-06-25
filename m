Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BDA209C6A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 12:02:15 +0200 (CEST)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joOhy-00050C-By
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 06:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1joOgU-0004Jw-K8
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:00:42 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1joOgS-0000qj-D0
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:00:42 -0400
Received: by mail-wm1-x342.google.com with SMTP id o2so5288837wmh.2
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 03:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GiW8MOsGRNut9fJSNUv2/cq23MoqooqAEgOogX+JdCs=;
 b=HAx6NEPqeyL8XoTcEzhCjIzIyDEsdLifWMzG4ogHRNiFpVY35BfkXBtqkWzmuB6Gq/
 1TN3xcNgcaO9jIWsv3KYYPokpidEUmdxg1I/KHt+JbE6a0poYlfQGT0hLlAiLCRDM01N
 xHTI4WLqIghyZ24fBSArDFeQYK7jfi+2we4ffvaQ0Ww9kxV2ZYMt3GaMybD5O8QsJuOc
 hW0wC0LRagxdtaXx7rjpziV2L7oIDUdUcVDVs7U7WpgXDc6q16nJlK7fJJm4cm5pfsmU
 U91MqTAzkpOeR6Uv7NyLLlNCmQEvKMYln6rLLYdxxgp9MKS0EUhKWjKG38i0TQUopvGJ
 7Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GiW8MOsGRNut9fJSNUv2/cq23MoqooqAEgOogX+JdCs=;
 b=Ju/0SAAEyJgoz032w7PtbfHXod/KIknP4NG0HfIIgB6pBCW+dO2GMDVuCVUTkt7fkw
 a+vk6oRRbBVr+6odgKE/+MI0ht+7YERIXXZB+btnYLU2P9CGtrh2/rhaAmjbhWhaLRuu
 QVz47H+z8JqcVTd00keXObA2dIR2Mbma0OfPQXY5LTVB9BHzrxIW62CzTHjPtAmnENsO
 03WvXOiYsBXDCi1Vp1wivgUq/eumtVEprVIm3JB1DyWRlQ/YLCSKCm0C6D2D0HjVBPhC
 GlB+1qi7tWFeVojg6yiWcgMEJf52Jp9tQ5FJelPcNFpHhzKxf2+/mDFfPFh9MSwWZ8EE
 Altw==
X-Gm-Message-State: AOAM532PVhzmXgwCpwT+kIZiIvBEqB8nLvLfQtRectjBFsLzeZPhRiAY
 Xon9GcYk0GykwR8Sq/0xMlNIqfv3U5YkF/nmyxU=
X-Google-Smtp-Source: ABdhPJwA1nykDsTefegqHSbsPCryA7nRw79L6J+hIJKR0sqLH2Ou8WrTwp1aGe04Pr2lvdKvEbXowNDOuoA3q9ERvo8=
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr2693157wmb.168.1593079238923; 
 Thu, 25 Jun 2020 03:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200624153142.13247-1-ahmedkhaledkaraman@gmail.com>
 <20200624153142.13247-4-ahmedkhaledkaraman@gmail.com>
In-Reply-To: <20200624153142.13247-4-ahmedkhaledkaraman@gmail.com>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Thu, 25 Jun 2020 12:00:26 +0200
Message-ID: <CAHiYmc7z+mbp51xcg4WCH1KS9TQThMuLVQ9F45j-+eGW_W8gNg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Add 'Performance Tools and Tests'
 subsection
To: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=D1=81=D1=80=D0=B5, 24. =D1=98=D1=83=D0=BD 2020. =D1=83 17:32 Ahmed Karaman
<ahmedkhaledkaraman@gmail.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> This commit creates a new 'Miscellaneous' section which hosts a new
> 'Performance Tools and Tests' subsection.
> The subsection will contain the the performance scripts and benchmarks

Remove 'the the'.

> written as a part of the 'TCG Continuous Benchmarking' project.
>
> Signed-off-by: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
> ---

Alex already gave you "Reviewed-by:". When this happens, you are
supposed to add that line in the bottom part of the commit message,
for all future versions of the patch.

The reason for this is that you indicate to Alex and others that he
already agreed, and he doesn't need to look at it again.

So, please add that line in v4. See other series on the list for
examples how other people usually do the same thing.

Thanks,
Aleksandar

>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 955cc8dd5c..ee4bfc5fb1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2974,3 +2974,10 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  S: Maintained
>  F: docs/conf.py
>  F: docs/*/conf.py
> +
> +Miscellaneous
> +-------------
> +Performance Tools and Tests
> +M: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
> +S: Maintained
> +F: scripts/performance/
> --
> 2.17.1
>

