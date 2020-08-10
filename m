Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64524101D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 21:27:59 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5DSg-0004ER-JK
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 15:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5DRF-00032B-IF
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:26:29 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5DRD-0002Gy-ND
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:26:29 -0400
Received: by mail-ot1-x343.google.com with SMTP id v6so8187126ota.13
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 12:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sQ4sJAYPo/XBzPYc2fUBbocujkfG0L1X0zHMeSO2Vak=;
 b=zkZU/unz6B3kihYLCo1ovHVs1ovG8Brem0l6Mgm4Q9vWGgoKw9b6Fa9WiajEoOp6Sf
 j8ra1OnF3CVO5dhnxWJYL8tcTq9L+s3G5wH1iLhGSn2j/XhjeOZTeq+fxQj3fpgANYBl
 yFSwU7njlAPt1GpFVLID0fUreRSgKPww1P1iHZuiOMvbOEn5SKKv5We7K7nAZxyOKB6n
 UChOLhehr4oGAXTQQBiPgFGVuY0lLbz6OFkq2pqvlpwI8SQtViSNzaNW2RnjvIjVLXmN
 dH43Era4fSU5WtjJiNeNjV3aaRNZDxqvjaldtq7/vNwEWtjIRp1iYDcwLehiQsyKY5if
 9zfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sQ4sJAYPo/XBzPYc2fUBbocujkfG0L1X0zHMeSO2Vak=;
 b=gxUYkV02aBkq+I3jgovQRIMUqR04jwsmblEkABsinFjiHwotZszPUuMDUjLUecan1T
 eQYtViyuykx2Eo93H5hql5vTlFWtSw+CY5htEc3g7pY90H0NzrJuZ5c8F+0qH0aVs1LY
 zpWaSOyZveDHV3OpuuY2VPs3/dfSXZri9mYebE0dA+3HbnBc48atkZixWj3b1bkeBPav
 P4O6g1V27wnOc5ArSz9Erogu07Kf8Nn5OKxRvDGT9V7HABk2Bso6iuicvYJEIjRQA6Wd
 DjXMGoBAfDDNGwIFI9Bq8G1Ury50qTh6LQdCSRlkOqfIEuacdjFQxAMRV9o+8sFpz4l6
 pshA==
X-Gm-Message-State: AOAM533mC+MckVW/C9hM0EGECZROwnT0YFOUeczP1gVOUdkp7WVJYtgu
 TV4WXqQvFB+4z2LnnZSzlk01FEffopoDDTa3J3Y4mQ==
X-Google-Smtp-Source: ABdhPJxs8AjgRDPFYggBzlUlojiFlxgFDpDJa1ZHt+emwBsJbXwQ4jZF8BgpIWzs8ZNFkqFNimr1Xinl/AEVp8e65aE=
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr1889980otq.221.1597087586139; 
 Mon, 10 Aug 2020 12:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
 <CAFEAcA_icj94N6eotg9W7FutXTY_6U-Ak6pJMyYH0n9eggunrg@mail.gmail.com>
 <CAFEAcA8smstwpQUD9UJzMuE6Cq2WutQzBPrKLLs=3wvfXUmpUg@mail.gmail.com>
 <b710345e-1644-782a-44a9-537493b85d95@redhat.com>
In-Reply-To: <b710345e-1644-782a-44a9-537493b85d95@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Aug 2020 20:26:15 +0100
Message-ID: <CAFEAcA9v7jv=SYZ0NLeSkjoM3da-apeu4OC5BMmorxMue0-viQ@mail.gmail.com>
Subject: Re: [PATCH 000/147] Meson integration for 5.2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Aug 2020 at 20:22, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 10/08/20 21:16, Peter Maydell wrote:
> > And the remainders:
> >
> > The tests/vm FreeBSD and OpenBSD setups succeed but emit this warning
> > (as well as the the usual ones):
> >
> > WARNING: Gettext not found, all translation targets will be ignored.
>
> This is a real warning.  I'll see if we can add a configure option to
> disable the translations bug it's fairly low priority.

Is there a package that we could install on these VM configs
that would provide gettext in a way that satisfies Meson?

-- PMM

