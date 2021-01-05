Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE562EA752
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 10:31:41 +0100 (CET)
Received: from localhost ([::1]:39766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwigm-0003OL-QU
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 04:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwid4-0002Ir-1g; Tue, 05 Jan 2021 04:27:51 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwid2-0001ub-EY; Tue, 05 Jan 2021 04:27:49 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id f6so28631487ybq.13;
 Tue, 05 Jan 2021 01:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=byKgXZAveVpGlvN1y8RqU8Pv1Mo+mr9U+5WKhQwPZDo=;
 b=exqvpJ4ZWZtlhHMGufQsm34Nbj3EtqAMfX/YnHuaJI0iPOu+LzpymD7XzKHdOumP0U
 k+Zq9CTPOkshgZBKaJPh8bYN84hymhWcGJEddVrUHF43uNzOlPdDq957blhqkp/HzuVk
 Qo/CcUUx8WQNGVqv5oD3ig6yjO2otHEtawnX22ZVzClORJyXEidcYTMaiNNXQ3Ofc6Ak
 JQd7p1a/Ut3V0PL5cL3N2key0zIpfUOtpjNvjezQc902NhEW8f7PoUL/wnRADaAyBavB
 qFZTiSoWbM7L4FNAqb4i/q0DCm9JyJRUfmSXsIjZmklB0M9zqxasRART3WYcMH2dCoHD
 cFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=byKgXZAveVpGlvN1y8RqU8Pv1Mo+mr9U+5WKhQwPZDo=;
 b=jWoCPoi3oFI6snj/eJ61X+i+fq6cRYkiL3vuMkZscBSjzyKx6Q+BXcuNtP3ySKyDCl
 g12pkhPHPCMgN8oxOyrleZnFBHR6D1yCsLYYIX4azlxTBxImu45/x2P5JXpTk//NLKuL
 z9oAiDpxd7uzNnWCbZehfTq0swkhXYO6MerLZGsVymaNzmu2G4kNr1ChtDrZN0rCAhWY
 CQP0EkppDmuxYQNcMH9nH5TuygK4kWNPD3ct9njOiQoJCJ1ePrD9P9fhTHOrWIgeQx5+
 OItmMGxNsqim/OnOiGS4dWlb+YSyPce+JpoUDfmR974FO/oFJiNUd1gqZh4APqswFd2Y
 fOxg==
X-Gm-Message-State: AOAM5332KnkiHz9PVYMnumNqspAtZu0+cGkQRB+3zufTMb7BZvWXSiBt
 alBWNFs5CNCvJcb1g71JFnEomUzTzd2E624AUuQ=
X-Google-Smtp-Source: ABdhPJypCQEtYsxgj+yQ61ZOb1oC0D/z1+2/ALfbrTbG1TCYRNyxQ0RJWdd5nZiBWEXOlaW+iAR/Akr0sfTnsS9Mang=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr105435222ybi.517.1609838866984; 
 Tue, 05 Jan 2021 01:27:46 -0800 (PST)
MIME-Version: 1.0
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmURMNzT5T_LOVvi+m0658jVZhXrEuP=JhJL+pVCbDFuLg@mail.gmail.com>
 <87lfd73fcr.fsf@linaro.org>
In-Reply-To: <87lfd73fcr.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 17:27:35 +0800
Message-ID: <CAEUhbmUciFPsbQJWQy-72n9cQbPyRMcP6HYaL5imo7=pXhJ=JA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Tue, Jan 5, 2021 at 5:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > On Wed, Dec 23, 2020 at 2:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Bin Meng <bin.meng@windriver.com>
> >>
> <snip>
> >>
> >> (no changes since v1)
> >>
> >>  hw/misc/imx6_ccm.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >
> > Ping?
>
> Looks good to me - Peter should be able to pull it into his tree soon.

Thank you for the review.

Regards,
Bin

