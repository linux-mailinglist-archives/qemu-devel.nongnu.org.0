Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5A4727FE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:07:10 +0100 (CET)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiEe-0004QE-TH
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwiCy-0003V7-1X
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:05:25 -0500
Received: from [2a00:1450:4864:20::430] (port=43894
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwiCk-0001XB-FW
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:05:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id v11so26022500wrw.10
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LUai4RF3uWcr98wEaU7RneH+aH/wmUcT9WxbjbhjsFg=;
 b=jjc9zx9CBJzWhgcgO6dLmBKP7ARGJ2NZNpxLg8CC3tW10KQyozDlni+9aFvQZzN8PE
 UdZVMGdlPa99raaovc46LXU97m+C6/3czOV49GY7W/O4y1cnUCs9UnA4++34fqr0RZm3
 OwrTnixGFhm4TNiTRWQM+LUwdPU8IUqFYU0YzdhR2o7ZtmUsiO4jgtbkRq3k6YjqWTdI
 byaBU3S/liSTXtS94W+TpFxWQLQYmXLhSD4HBO+cXilT5SkNX9tY7dpUaFWKU37JHoUP
 MTaVhI4c1ODNnOy0asUTYE7IMGJdujAqO2TX3lY1SiN39Z3DF4Vj5DOZ4epruxildqiR
 jKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LUai4RF3uWcr98wEaU7RneH+aH/wmUcT9WxbjbhjsFg=;
 b=ts3tqroy7ONHXpb0/WDqGgfrevo1WAKqXGQ2KhjCiUlAfhRVgq/qM8OrbFFv+uXwLj
 iRb0hgBT0oxBEHK8SD8dTw29znA1XFy3cYNXEaowZNSTZ9okhBHMsQytFm/ylMBEAMiz
 2ToHQS9+wbGoCADJtZe1K1FZ6gUoaN6WRNZ6AbGiWPgrjXZ3f5OpiTQtWwPHWcfq3oJ2
 AQecytkxg176h1sIkbJMZ82dRrGslsEsA/n+zZUYIqZbg8S9gwE2ng33/0AH9F26/8vO
 hy0A6kOMwmFlD1LUufo4biYzi/2wI4bHuhpNaWVl2jiBJRPO/7l6oBmXqMI/MHnnQ2zQ
 TNfw==
X-Gm-Message-State: AOAM5339a3Kkh8pinHJeZUEFC8EY8uLJn6qTSBu+EbzrkVG6gTVzVZsv
 6GrYoeNvv0TeQM9TWNwB8C/532YDqiNpJpkxNNGzGw==
X-Google-Smtp-Source: ABdhPJx+Er1OKa8qt6dNrmEABCclG1cKfaBg2xz+CsKFv3z9CJT+zhKb6PeTClN89lsDYHTu8juL+APuedypwefiix4=
X-Received: by 2002:adf:eb42:: with SMTP id u2mr31550863wrn.521.1639389908518; 
 Mon, 13 Dec 2021 02:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
 <YbcSOcEy//0DSMtL@myrica>
In-Reply-To: <YbcSOcEy//0DSMtL@myrica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 10:04:57 +0000
Message-ID: <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eric.auger@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Dec 2021 at 09:28, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> > On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> > <jean-philippe@linaro.org> wrote:
> > >
> > > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > > a VIOT table. Also add the tests for the ACPI table.
> > >
> > > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > > series [2] only contained the table and x86 support, which have been
> > > merged. Everything has now been reviewed and should be good to go.
> > >
> > > * Patches 1-2 add the VIOT table for the virt machine
> > > * Patches 3-4 are minor fixes
> > > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> > >   q35 as well, which didn't make it last time because they depended on
> > >   another fix that has now been merged.
> >
> > I believe the entire patchset has been reviewed and you are re-sending
> > it so that it gets pulled in after the release?
>
> Yes

To be clear, do you mean:
(1) The patchset has been reviewed, and I plan to resend it (ie a v8)
to be pulled in after 6.2 releases
or
(2) The patchset has been reviewed already as v6, and this (v7) was just
a resend to be pulled in after 6.2 releases

?

thanks
-- PMM

