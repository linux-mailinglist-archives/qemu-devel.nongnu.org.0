Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFCC3164EE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:17:53 +0100 (CET)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nVI-0000OF-OH
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9nTB-0007dy-Dd; Wed, 10 Feb 2021 06:15:41 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:36181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9nT9-0005OD-VC; Wed, 10 Feb 2021 06:15:41 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id v5so1620227ybi.3;
 Wed, 10 Feb 2021 03:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JzHTM5yvudPq6N8ljlEQ8oHaROtUA9tgVsJKQTZaWYo=;
 b=GdEenzliZI+z4fw+bq9PXTksfJquDfyMrKktdSyfM0ToMUG7jiBPIBzSZf1D7lbwgV
 Ry+fCTyBYa6pLY/E92tjKhgBySW5PCzRjhW7N8PGUwMyzmTsMlvmqrXcRuSJxtn3n5jO
 jh1iQqAwU0sxYyVlNoD1mjtLyTK8B5E77Yvo+D1A0h++3kTJCNoLYN1szeQtxouLyENa
 3bpiduTO96NyJSGK79/Wkg04ZQrqGlBTnOevxswNdK88SphhQW+R7yGqO1AA272lyLlY
 uVsFv9vD5KQ0Oyq8CdwODOPBtODDXr8ap+04ht0HrlyAJiVgSgcJ0jK29ayUhw3vUjvK
 IoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JzHTM5yvudPq6N8ljlEQ8oHaROtUA9tgVsJKQTZaWYo=;
 b=sGBKSvn7l86ZpoqArjgeI1i/V1A3EQB7oUcNPFoD0Up4z5FsN5ANpw7s8jSijR8kbA
 rEOZe2n/KKmIRRDqxuYrPo43ffGldAowUqw6JenMNHwd8VGOEdwULjunwmDOQ3yjbPuN
 ayZWdKCkkCY8y6GJiDmNir92LgzoyTxmpSySWbw3NhLPYbQ9aVIfEq/WqM1riluGgK5O
 tld62B1Xc1O+NSySBXI3Jz4NKh5hnnvOADTwt6Nw6ysoTui/NzSHLg2RpWktVyGM5qhU
 pW/BqBZTdhhn6J21ktpvJ4C+k0OrfrQzKjP1GdwCYN06QGaa6zVISdYumUClxoYrpoGn
 xAmg==
X-Gm-Message-State: AOAM532k+/P6WgNEg5l6wDHeZn36VLst5ZiIHJudSqSzqOwUUjX9Yyhn
 qeE5WtfVfvLImE7j+rCdVq/uyYACk4DKwns4Fwo=
X-Google-Smtp-Source: ABdhPJyd+o2ARDDQ82mPP+TD1NkQt0e/w9CoIWcsgs/q/9h6D41OWqVE+cDhJjaP1oGBiBSzM9l7tqV9Bm3TP1miXkc=
X-Received: by 2002:a25:8712:: with SMTP id a18mr3487647ybl.306.1612955738403; 
 Wed, 10 Feb 2021 03:15:38 -0800 (PST)
MIME-Version: 1.0
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
 <299d3bdc-268c-eccc-66be-6605b23a2c92@redhat.com>
In-Reply-To: <299d3bdc-268c-eccc-66be-6605b23a2c92@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 19:15:26 +0800
Message-ID: <CAEUhbmXaSDauxVaEdBt2yvbAq3_LC6bsHiwF+T6Qgf9mSmcy-w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Wed, Feb 10, 2021 at 7:12 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Bin,
>
> On 2/10/21 11:23 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Current QEMU HEAD nvme.c does not compile:
> >
> >   hw/block/nvme.c:3242:9: error: =E2=80=98result=E2=80=99 may be used u=
ninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled"=
);
> >          ^
> >   hw/block/nvme.c:3150:14: note: =E2=80=98result=E2=80=99 was declared =
here
> >      uint32_t result;
> >               ^
>
> Why isn't this catched by our CI? What is your host OS? Fedora 33?
>

I am using GCC 5.4 on Ubuntu 16.04. Please see some initial analysis
from Peter about why newer version GCC does not report it.

Regards,
Bin

