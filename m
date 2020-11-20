Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1FC2BB0E6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:47:58 +0100 (CET)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9Zl-0006o1-UD
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9U9-0000HY-EO
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:42:09 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9U7-0001FO-O4
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:42:09 -0500
Received: by mail-ej1-x636.google.com with SMTP id o9so13793500ejg.1
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7nNhzWSN1U2uAcnQgsU0jgORBLK+9mZeCHTcLoPEtAM=;
 b=jYgMeO3FNySe1OEPFg6KaebSpJnLCS8+0tpU9pl9ZHHGBfXwUvrlNmk1vU9pbHGu3F
 A01zFf/Ya0HF2SNfVsqUHNOpr2QrH2ow3Mi2yjTf4IDfPjXvS97qF+wiZqosidJvFRl8
 uw4/9cyxWsr74vsTjgcnrQ32ecPmpnN3OIdblsCVuE7uHamXjzqt+zC4+qkXZnBH5Tev
 gc3+u2h1/CgAMEe+kKQIwd85bvImoq5Mr2ai2ciwwsItokOdrm1Z+zP0quboo79HGgxi
 rQd+aEhZquyDfL8krcz4enRbpq5nTXPTxpDG8leZKWHRMy3BjbPRBlaAyu2sUA6jn1d7
 uUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7nNhzWSN1U2uAcnQgsU0jgORBLK+9mZeCHTcLoPEtAM=;
 b=nZ10z4+Otnpvz76NqfGAl+DiHiCL5Gcodaed/TQ4QOUfOfSj1hdYCrDxGXbDbgYoHb
 fnoHrK2tSogk2/5VQeN2IHZahitdlVEo+YAfl6omoNIiZ9E9m6gT+bl7rYszUIXTKoNG
 pS7boEEQHbbMAa9x97h+ccWOCc+NNvZ7JqmNXmixGVw5CZXN50T2sdNwDtihwQcOMfc9
 5LPRuo+cLBY1S3mT4oTH1Coff5G5OVOraxIUZ0MUq2hDLG5Lu8z1ngEWMzmYHPDfAayO
 yXT+bSydwgTajN0Xch5W+qDhyxhGfLWNjvXuzUSWn3J6h+e/RDFR0EyT8jjx3m1sUDAp
 rSmg==
X-Gm-Message-State: AOAM533GBsexc40Xpw7BaRyXQH6P7rlsG8cxHTj6T0sYP1y5y8XM1Yd+
 nmeaSSHb3EUz3rG/ZEADfsXl1ZBZY1sux1LMiJfe5w==
X-Google-Smtp-Source: ABdhPJy+QbcjDfPSGHvqFP4Yd8VQ+yGpMwQ2qiEFb47CLsjGKrOdWewo8zvXPqDp2js0IuI/UXkZscmyoFvrfVWuwB8=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr22965103ejd.382.1605890526295; 
 Fri, 20 Nov 2020 08:42:06 -0800 (PST)
MIME-Version: 1.0
References: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
 <CAFEAcA_BSYrq87it7UXWJUDvUuA8L8U1Y8mxkyZdwzb3n_sSiA@mail.gmail.com>
In-Reply-To: <CAFEAcA_BSYrq87it7UXWJUDvUuA8L8U1Y8mxkyZdwzb3n_sSiA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:41:55 +0000
Message-ID: <CAFEAcA8Ax3X5EFAgvGR_PVztLx7ShTweX63sd6k4CeqJqXnNRw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2] hw/intc: fix heap-buffer-overflow in
 rxicu_realize()
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 at 13:44, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Wed, 11 Nov 2020 at 14:18, Chen Qun <kuhn.chenqun@huawei.com> wrote:
> >
> > When 'j =3D icu->nr_sense =E2=80=93 1', the 'j < icu->nr_sense' conditi=
on is true,
> > then 'j =3D icu->nr_sense', the'icu->init_sense[j]' has out-of-bounds a=
ccess.

> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll take this via target-arm.next, I guess.

thanks
-- PMM

