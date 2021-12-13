Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F8472AEC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:09:53 +0100 (CET)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjDM-0005gR-B5
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwjBQ-0004mW-SM
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:07:52 -0500
Received: from [2a00:1450:4864:20::429] (port=38794
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwjBO-0004bX-LA
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:07:52 -0500
Received: by mail-wr1-x429.google.com with SMTP id q3so26349892wru.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G8jRryDH3W+y71PQHQ+cCIBIuzuAfhbuiiQtPNOo9yk=;
 b=W0w6AWWUtYBmn8UorE1Nro+8Jy9AuzkLRCOH5+AUXiU84HsULjDN4Sxdn6CkFvngeP
 xNbt5QxUljnsreOLLymRPLU2QjITbeynTz9tYO5YGhdr3zbZ3ptkJ5Omb4CKUpANiRZF
 rpgtq6UuVVSDYhVlDea47LhiyqjpaEFBferyU7obNbaaBpxyEnuZPDyMpQvVwxN4ha6T
 YSdBztTWasc+aXT6Lg3sxRVHB5/7+6B6FpwDWBQAgNw2HqCw9t9OdT4NS1BSKTxd8zQD
 IWxBd3+KH+ZacBN/G86lc4S4jWuTKWRRcjwlx5F6Sj0XRIEAz0e8oVBztr6n3GPeK6j7
 UnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G8jRryDH3W+y71PQHQ+cCIBIuzuAfhbuiiQtPNOo9yk=;
 b=rMO07OYEeSvqGzLbPfyivgcQnNh+SIXBIf8BckPsnWxUUoQgdF6NDmDWJ3AVfPGJpO
 kEvdlOUHz6A89HuUA8LLEu+Ladf4bRXUcBvvRFG8P6dzJE3il9iJE/jKySimZFqfFFK4
 3zUmLHXIHigxouSvUobJbYvMPBgOT1Wo89DSHAsE01fJH2pbhokKYr83o96mESOo9NeC
 WsttdStfgpY9NczA1f0kNf9PFkWKTQUCQY9KjjwZIlMT/BUxaKso7bpcUK2iH7WCdKHg
 vE0CIkTcnqi6MbXtQRcAq6DAc1aUI4+69yEVPZ6UGT9dTAcRVU6iFpklgixlvdot0jvB
 O9lA==
X-Gm-Message-State: AOAM531mO9QTXyH5F0DidzOYA3XYq+paSHvzSgY9IIb+DZVE12GSizSH
 2oQkpS9ipriEFfJHzE5VSZadJ9iPdmqDycJY1lIfdA==
X-Google-Smtp-Source: ABdhPJy+m4MQZlvYtJN8aXl7uuuDoEELlZihs3EFI4q5bPNQvlBrm/zL06/uPDvNzspsz4EPng87rIl6RBW56OeAgaU=
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr31307590wrw.319.1639393669033; 
 Mon, 13 Dec 2021 03:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
 <YbcSOcEy//0DSMtL@myrica>
 <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
 <Ybcmx/TK8F7ayt+X@myrica>
In-Reply-To: <Ybcmx/TK8F7ayt+X@myrica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 11:07:38 +0000
Message-ID: <CAFEAcA-bqvxsXWZq2q=HrMPbO=cfu5E=tHbkA-AMW_FNX8D+gg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

On Mon, 13 Dec 2021 at 10:56, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Mon, Dec 13, 2021 at 10:04:57AM +0000, Peter Maydell wrote:
> > On Mon, 13 Dec 2021 at 09:28, Jean-Philippe Brucker
> > <jean-philippe@linaro.org> wrote:
> > >
> > > On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> > > > On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> > > > <jean-philippe@linaro.org> wrote:
> > > > >
> > > > > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > > > > a VIOT table. Also add the tests for the ACPI table.
> > > > >
> > > > > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > > > > series [2] only contained the table and x86 support, which have been
> > > > > merged. Everything has now been reviewed and should be good to go.
> > > > >
> > > > > * Patches 1-2 add the VIOT table for the virt machine
> > > > > * Patches 3-4 are minor fixes
> > > > > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> > > > >   q35 as well, which didn't make it last time because they depended on
> > > > >   another fix that has now been merged.
> > > >
> > > > I believe the entire patchset has been reviewed and you are re-sending
> > > > it so that it gets pulled in after the release?
> > >
> > > Yes
> >
> > To be clear, do you mean:
> > (1) The patchset has been reviewed, and I plan to resend it (ie a v8)
> > to be pulled in after 6.2 releases
> > or
> > (2) The patchset has been reviewed already as v6, and this (v7) was just
> > a resend to be pulled in after 6.2 releases
>
> I meant (2), v6 had already been reviewed and I'm resending v7 to be
> pulled after 6.2 releases, sorry about the confusion.  Just for my
> understanding, should I have resent this after the 6.2 release, or is this
> OK and I should just state the intention for a patchset more clearly?

Sending for-7.0 patchsets before 6.2 officially releases is fine; I just wanted
to check what you intended. I've queued this patchset to target-arm.next.

thanks
-- PMM

