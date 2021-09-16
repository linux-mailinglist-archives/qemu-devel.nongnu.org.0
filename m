Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F640DC8D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:15:44 +0200 (CEST)
Received: from localhost ([::1]:33546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsAx-0006Bl-JV
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQs3d-0004eB-NE
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:08:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQs3Z-0003ds-70
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:08:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w29so9694070wra.8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 07:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9OcG9R46gWROcs84De+kGo7pBwcho3/LbxQ2XLKdnIc=;
 b=Iy9+8W9ypaW9PnroEXdrcgexwbA6VJxtTTkdPvB21LCv1rdn5jLH1eLdDYhBZ8Lcmx
 fG54wwmJGi0NoOiMO1oNzr2ticjZYrSSz7IUuhC39KOfaumcuvWKjOOHiF4CkbMx4Ovc
 8hfJYgXIAEA6gW8Jut03JYKcNdphCi1XaymaEVrdR+qKBr09KrWsnV7Kbg/exnClN2Og
 pZdYrLTLzU52QNwMP6NKBsu34j6UNNrlJNASL0VCZPfOq0gz5nMExGHrxqBcbj0MvD1T
 uuj7d2wZl9ByhYtieFDx7G56FhESYTeiXw57B43LqZr/HPm+aBfglq5d0uKK1FMOCNvi
 eO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9OcG9R46gWROcs84De+kGo7pBwcho3/LbxQ2XLKdnIc=;
 b=LC46osCZaRdHjvJN1tXFx2Of05bzNkPbAiRA6iBnurEVl06DcTXC5NykLEW7AP3BuL
 YiblXT3S+3DnH3I3jtTpxWHtZohn+AsKqfi7vFGdQOpblL7VCzKUWicy/dVCgYMu0uo2
 uUEHXPgS619ysGQxzV00YyTZ0Jy+fUgnkgNCwpXuGx/Cwqn0pk1qOfQmzQHye3jNUis/
 EBba+Ni75eDCgEjYdnSyGR0j8HqqW4ensMjcHmIGJ3M8B7nH7+sSTlb4NfrCd8tnI6BF
 40Xo3ZsvP3rgx8c9HptwjrzuMw77Xdx6E+/1MyV+NxespqHSjngzO/O5bNMsRfwqBtev
 hHtQ==
X-Gm-Message-State: AOAM531PX9GPuWY65Rx/+q6PcXOkr+ynXefkCUVUGeK1H/My8UV/24hW
 Apfu6j7E5g9iLQz1GtBur8dDRZpt7usPrTlorbfgJw==
X-Google-Smtp-Source: ABdhPJxn9ifbAAN4VNXIcXwO4lbMBCEhxXoN/55nzepz8N4dR2qw/kIAY3F9OBGqa2KL8hXl0n3ZjiolnvSDkjEAHY4=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr6175060wrr.376.1631801283779; 
 Thu, 16 Sep 2021 07:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
 <d00d7eeb-a50c-c039-046c-7749fde25af8@kaod.org>
 <1d6fb312-ab21-ca9c-d7ec-1043ccc65b10@amsat.org>
 <7ae560b5-e719-0b6d-1fdc-b231af9d6a81@kaod.org>
In-Reply-To: <7ae560b5-e719-0b6d-1fdc-b231af9d6a81@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 15:07:12 +0100
Message-ID: <CAFEAcA__dFt-WjNdazA7eVK88uLnXzkQ+mKp1Jq6dM0va+uyLQ@mail.gmail.com>
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 15:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> OK. The patch I had prepared was a bit more explicit :
>
>      /* On 32-bit hosts, lower RAM to 1G because of 2047 MB limit */
>      mc->default_ram_size =3D (HOST_LONG_BITS =3D=3D 32 ? 1 : 2) * GiB;
>
> I even have a version with a warn_report() since 32-bit hosts are
> not that common these days.

Using warn_report is likely to get the patch bounced because
it adds a new warning to the 'make check' output on 32-bit hosts,
unless you take special care to suppress it when running in qtest...

-- PMM

