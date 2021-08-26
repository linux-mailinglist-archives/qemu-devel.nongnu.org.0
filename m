Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9523F8A2B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:35:05 +0200 (CEST)
Received: from localhost ([::1]:52660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGTA-00043j-BI
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGS1-0003Mi-PL
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:33:54 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGS0-00071i-4J
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:33:53 -0400
Received: by mail-ej1-x634.google.com with SMTP id mf2so6725536ejb.9
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZR+r3Hd9RUSYE6RRLgu82tljSYVCTkEZVekQxApExag=;
 b=InIshAK77SBTqju2rK9PrSUUl4L81d2hhXDq/FnGuxTKX8rnrYJvEOgRKrEBYfdzlR
 QoBaP6HjaBftunjsXGYA0lh3iNx3pkERNkXECtCm/BfnR5OvrqVvUL0Gca2A4iCpapZ0
 kluPgrd70/Wsup3NQ/OQD593MPgKFpnj116VvctWclSd7w79lw9qud8ASeyM3RV/3NuD
 lYrplQhBzNqWidIpsmwtxE7lOE17Zu2P1JEd1NAfeobumFgu5HDvFlX8DzZs8ODVStxn
 2n/ksBiUofFrLA1YWrHMNi9FJMrtOC22Mp6e+XsbxHWFOsK5S13YghZbycr68wIyUu1S
 Z8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZR+r3Hd9RUSYE6RRLgu82tljSYVCTkEZVekQxApExag=;
 b=lW0p/omO3lh8uWF04SzDy3+tbAtnWxcQPwxZc2oDfLDrNTGROuaCkACQponDB7vakL
 y3ULN9NenEz1mMy1Kp2KmgApBBZ6ZvPHFsOlEtStZQiPA1xYWMqNZkb7AmWfjFO12oYm
 TwlLND4WlLD1cnWuVCcV6ATB6S31C2T9HfcqGsG5ROytfNtImkrp5ip198R5uQpc/2EI
 HabWjPDL6c4VcjqlC+2VWQUru8nU2u9Y0s2JLT9cYuPTVWvPZcAaQ1bEBtooaD9AQHoW
 4LhG6Z883GQeVSjSUJcr4v8KNIZv5eaVYwXZBwpPrqni12UbY5zLfKwg8nHf6vNMhGbh
 DqXg==
X-Gm-Message-State: AOAM5314/J/OB9puPfxqz4zNehmjnWUDXKnKm9g1vouGComvkykmIzGS
 8HN8IhFxGejmFRqu3so3NoVsiG2p8JkqktS7DRn8/A==
X-Google-Smtp-Source: ABdhPJxZhN9YZJ8PrQC0UTDkT6ICB/QedXVr1Ty+eIen8fbnShZ5+2fG2nKWKKxUxqoG+5Vz2INCKzf8BsxRgL1TJl0=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr4524899ejb.382.1629988430406; 
 Thu, 26 Aug 2021 07:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210727170414.3368-1-peter.maydell@linaro.org>
 <20210730145558.6b3d67e9@redhat.com>
In-Reply-To: <20210730145558.6b3d67e9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 15:33:03 +0100
Message-ID: <CAFEAcA9Pv9Ygb2jSL=p-GigxQqsEP3PLwAfe3PLsdHcNp-oOEA@mail.gmail.com>
Subject: Re: [PATCH 0/5] docs/specs: Convert various ACPI docs to rST
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 at 13:56, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Tue, 27 Jul 2021 18:04:09 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > This patchset does a basic conversion of four ACPI related files in
> > docs/specs from plain text to rST format.  The aim of the conversion
> > is not to produce a maximally pretty result, but simply to do a
> > low-effort conversion that at least results in this documentation
> > appearing in our manuals rather than merely lying around in the
> > source tree.
> >
> > Patch 4 adds the documentation files to MAINTAINERS file
> > blocks; feel free to suggest I've picked the wrong ones.
>
> compiled, and checked end result (html docs) which looks fine to me,
> so
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Thanks; I'll take this via target-arm.next.

-- PMM

