Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743262C53DB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:19:58 +0100 (CET)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGFh-0000n1-Em
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG5Y-0003CW-Kb
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:09:28 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:33474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG5S-0002nL-Q0
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:09:28 -0500
Received: by mail-ed1-x544.google.com with SMTP id k4so2074572edl.0
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tcy37N3WqundCYjhm6/DFEnU903JxZpjmoYPcvTLayQ=;
 b=xtd5Gqu11kzyabMAg2PB/Z5zVju8LbYjWiBTtz5PuVKlb3WwU+k9IFyf9GRd0GQPEc
 wHIZQcCcbyw+jTwj8y3rflxbX4emUukpV0B8mTRspFSHwu5lAQ6hlTv7oHS9QbDWBmt5
 yyqae+dDyxqHSWlJod+ZvVfXa5lBKJw4sGcQdait8VsMa6ToE281RHvuB6OytkLru5AG
 ZunQiMXFdvvJC7u+JG7rMHuNA+0DaYqRmNiIC1plJvCX/txTukhxuXJWub55WqP98uOk
 FKK1sZBTqaiUXaXiT2R1rOPwDGW3L586YZBCQ8XumLePQYnmbvnZVvrA7kYYd/s67cN+
 LliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tcy37N3WqundCYjhm6/DFEnU903JxZpjmoYPcvTLayQ=;
 b=hWHpVDowCvbORiauYauo4yvHApWKi0Vwz+P6rraXZBmNgbNNJIpy6Ew6iLGaRTjQ1r
 VMdJDWodb6MNOyvnLbCGAfRxYasD+SEnYyOw4MP71M8LIWRF7gFv4xe2Gh9L7h9X8pfN
 MitiFH9au6jVG2otzFa2waYgpELoBbS/3nD4o0OpEp9QAzAGKZ2ejVPKROLlzxvITy3O
 7UuVyQzknLis7IUyxdxtxth1SsYTN7YbUu9jZ0j5Mzg/cWnfoKH8w5nrI7T/4RNKP83e
 UJqkrXZOMBXprqZvIZ0z4/rrDePexjJIZ75NaAcjs9wj11zrBXO7cS5E0ZcGaFQuZYIz
 8JSg==
X-Gm-Message-State: AOAM532Jxfp1rfgT5f94Xk5aFYIIhLDtzE2ytrGvVUqna1pEHONNf5TP
 I2ucvz5hvVPQEBAWZzPOO7inasbeQmAVRH+0Em9xVA==
X-Google-Smtp-Source: ABdhPJzxE4VZqwvD4Za+D569O+I0pJqGNXaNM1c4Veprj/69BGJRsV+ccCYxntpnNomLHwrt5SH7Cqa3Cav0U43+AC4=
X-Received: by 2002:a50:fe88:: with SMTP id d8mr2188287edt.36.1606392559714;
 Thu, 26 Nov 2020 04:09:19 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-12-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-12-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 12:09:08 +0000
Message-ID: <CAFEAcA96h-06YHhugeq5NLg9_yvJ033Sy0GKqU=oKJoXQPnWpQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] xen: remove GNUC check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/hw/xen/interface/io/ring.h | 9 ---------
>  1 file changed, 9 deletions(-)

From QEMU's POV this change is good, but this header seems to have
originally been an import from the Xen public headers -- are we
happy to diverge from that original or do we prefer to stay as
close as possible to the upstream header? Cc'ing the Xen maintainers
for their opinion.

> diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interfac=
e/io/ring.h
> index 5d048b335c..115705f3f4 100644
> --- a/include/hw/xen/interface/io/ring.h
> +++ b/include/hw/xen/interface/io/ring.h
> @@ -206,21 +206,12 @@ typedef struct __name##_back_ring __name##_back_rin=
g_t
>  #define RING_HAS_UNCONSUMED_RESPONSES(_r)                               =
\
>      ((_r)->sring->rsp_prod - (_r)->rsp_cons)
>
> -#ifdef __GNUC__
>  #define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             =
\
>      unsigned int req =3D (_r)->sring->req_prod - (_r)->req_cons;        =
  \
>      unsigned int rsp =3D RING_SIZE(_r) -                                =
  \
>          ((_r)->req_cons - (_r)->rsp_prod_pvt);                          =
\
>      req < rsp ? req : rsp;                                              =
\
>  })
> -#else
> -/* Same as above, but without the nice GCC ({ ... }) syntax. */
> -#define RING_HAS_UNCONSUMED_REQUESTS(_r)                                =
\
> -    ((((_r)->sring->req_prod - (_r)->req_cons) <                        =
\
> -      (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt))) ?        =
\
> -     ((_r)->sring->req_prod - (_r)->req_cons) :                         =
\
> -     (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt)))
> -#endif
>
>  /* Direct access to individual ring elements, by index. */
>  #define RING_GET_REQUEST(_r, _idx)                                      =
\
> --


thanks
-- PMM

