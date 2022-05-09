Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B065751F866
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 11:50:57 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no02a-0005Xy-RS
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 05:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnzpz-0002N5-Hi
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:37:55 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:39012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnzpx-0002dz-JV
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:37:55 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f83983782fso137638177b3.6
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCibWj6O4aoviIBGfNa6DZL8ycJAmj+Z3C4Rpw1cAOI=;
 b=fshy/w9oC/GWsaNkVf/+YKVJCe61hKhOJq+XmU9U2kKE1LmOlOg+11mqTVoD5sCnaZ
 7B27QoqdbfiORmWU+bbyGP+s39wkj72es+Tp8xXBxFK2RpiiMeaxIP3SPQiZA7QYj56A
 XvepCE2c2+HKGx740Hbn8YrXRNr0BzzCsxyc2nyo9/iFXGICHFyhjfpQGSpSC/azsXnt
 WrgIF7Wll5lbxDFaKgdSekmFg/3cyJARu/SS5HxXzv59UtdpCxTFOCjuIIzn6ypZ9mo1
 A7RjIpz7Sct+/G5oGPI7hj3Kd2xKylfLOHir2bTyTe1c4wz/Ve7SxAc9D9xgN7o/Pwga
 5Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCibWj6O4aoviIBGfNa6DZL8ycJAmj+Z3C4Rpw1cAOI=;
 b=dyejyhkg5xRI4MJVfP9oDZs24xS1niY4qtpic9E4yDHx9my9Cwda8Bp0F3WFYXqiRK
 easm8mUdlruz/0LGzioA+ThLxnh6ANflza7tQV5q9sfVv2JRMsw/2kpAY+oInItUuwAQ
 nJq86IDh6xOzKdXaW+3lqlZO7E6L2bxQE7mLZJjjcK/lgNzWB0YBZyj/wL0eKTb9wnE5
 Klmhgw49W+NOgjzVkEmlPd1WlDtD1oWRRkEIKIJQwX/l8iAHlwDhc8oUefjr9YTWHmiC
 G1DWPan+3eyvcYQihpN4jwrF/7YUaQstJ6If8tCkv1k2u1nKkJ28teMoOxeSwo83Sf4Z
 S/YA==
X-Gm-Message-State: AOAM533ceiiGYUm6/klV73yGywKqreW8IskzVRd8IvBxk+H0zlqACAWT
 4JbGiusppsqNK35K7yyPkfVA/puX/CoJqCH4ObZdRQ==
X-Google-Smtp-Source: ABdhPJxoFiYk3xYU5aJ+ubQJ0Y2prdwt+EVdi/xGGY8kHauw89TOwJ0wS1mzIFvunXmTh3SeN7IoSyKvNRD3aSLqhYw=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr14197969ywb.469.1652089072635; Mon, 09
 May 2022 02:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220505113947.75714-1-quic_llindhol@quicinc.com>
In-Reply-To: <20220505113947.75714-1-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2022 10:37:41 +0100
Message-ID: <CAFEAcA-Y2akoDzzUxyMpVP7N238t3Kg42G66Zkq2+0EN=_aatQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: add versioning to sbsa-ref machine DT
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 May 2022 at 12:39, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> The sbsa-ref machine is continuously evolving. Some of the changes we
> want to make in the near future, to align with real components (e.g.
> the GIC-700), will break compatibility for existing firmware.
>
> Introduce two new properties to the DT generated on machine generation:
> - machine-version-major
>   To be incremented when a platform change makes the machine
>   incompatible with existing firmware.
> - machine-version-minor
>   To be incremented when functionality is added to the machine
>   without causing incompatibility with existing firmware.
>   to be reset to 0 when machine-version-major is incremented.
>
> This versioning scheme is *neither*:
> - A QEMU versioned machine type; a given version of QEMU will emulate
>   a given version of the platform.
> - A reflection of level of SBSA (now SystemReady SR) support provided.
>
> The version will increment on guest-visible functional changes only,
> akin to a revision ID register found on a physical platform.
>
> These properties are both introduced with the value 0.
> (Hence, a machine where the DT is lacking these nodes is equivalent
> to version 0.0.)
>



Applied to target-arm.next, thanks.

-- PMM

