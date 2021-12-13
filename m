Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E7473007
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:04:00 +0100 (CET)
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmrw-000452-1j
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:04:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwmnE-0006nT-07
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:59:11 -0500
Received: from [2a00:1450:4864:20::335] (port=56212
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwmmx-0002BJ-KK
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:58:54 -0500
Received: by mail-wm1-x335.google.com with SMTP id p18so12106798wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p7rRHMOvpQIR92BbfV/TVisIv+c+pimFq+hA8a38uJ4=;
 b=lXgZMQ0DxuWvx70NbaA6owR2UGO4rE9JCAeqwb/7BjzUvu1i+jCLn/i8+QZ/zwVpm3
 kBouABK/BcwFaGjtFAfAi9tNWR3/Gk97Q69VXvmRAKYZ6iR36gVQGFXPkFugmtCUV4fI
 N1h2VxynOsz78ScETGyJNIr93HIVMywzpX7MBGnij/rdNdjUcVSffqwl4gFygP+sjmFQ
 FM+M34Fzpb00WbsSBg/3VRBnpgkL/VOyk+U8hRCuSPVaYI8eNTITVS/CDtBIeq/3keEn
 qXX4mnAoE+W60/MEfRkWr1sC2oR8ijOoCrpiPYUPU5i/FpBQOoSh8/A/7wlDRRwzouKb
 nA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p7rRHMOvpQIR92BbfV/TVisIv+c+pimFq+hA8a38uJ4=;
 b=53J2DKAT/yWbGq0vAPWqBiwpgwDlbGRx0ro4gb65/7Oc1Nmy1JJkXuMcrqctmnNowd
 GQRzn5zvOfpBM2cUL8sS/9PCmn/3WXzy9jz9XR7RZ6XxHl2SGigsYQuEG3pCQwwynfLX
 EDScGF+eUyAHbKy02di0ofZZ6dTPFoSkGvgQeKvlY6nQFLmhjctaVSP3tLJq2Oi+y01u
 m1zZ9ghWOWA/BbiDGrQcxNGYts9Uxcssz6/6Ncrs6SN9XjdATmtcCom6t4JGnaGhUrT7
 g6P5ZRD3hqVZK8IMIBfZrjAFelRE8iSFe6rFXi/XZ4cVkRMDd7X22IiSuQBiarqmisqX
 zCSA==
X-Gm-Message-State: AOAM532hcyzdkLPgcgjGQmZlG3dOymStODDH4EE8sioirN8C2ehodJBo
 bUrLUzxiKlR7t+btukkGD87WvQ==
X-Google-Smtp-Source: ABdhPJys7dSjEESGxwil3re2ux2dPHgDGdNjXpSdNpjjji9AFn3JnPwgWeBN4gpOCENbPaJKp59I0Q==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr38629469wmq.195.1639407529413; 
 Mon, 13 Dec 2021 06:58:49 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id t127sm8255893wma.9.2021.12.13.06.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:58:48 -0800 (PST)
Date: Mon, 13 Dec 2021 14:58:27 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
Message-ID: <Ybdfk7BfqgFKEH5N@myrica>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
 <YbcSOcEy//0DSMtL@myrica>
 <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
 <Ybcmx/TK8F7ayt+X@myrica>
 <CAFEAcA-bqvxsXWZq2q=HrMPbO=cfu5E=tHbkA-AMW_FNX8D+gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-bqvxsXWZq2q=HrMPbO=cfu5E=tHbkA-AMW_FNX8D+gg@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
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

On Mon, Dec 13, 2021 at 11:07:38AM +0000, Peter Maydell wrote:
> On Mon, 13 Dec 2021 at 10:56, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > On Mon, Dec 13, 2021 at 10:04:57AM +0000, Peter Maydell wrote:
> > > On Mon, 13 Dec 2021 at 09:28, Jean-Philippe Brucker
> > > <jean-philippe@linaro.org> wrote:
> > > >
> > > > On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> > > > > On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> > > > > <jean-philippe@linaro.org> wrote:
> > > > > >
> > > > > > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > > > > > a VIOT table. Also add the tests for the ACPI table.
> > > > > >
> > > > > > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > > > > > series [2] only contained the table and x86 support, which have been
> > > > > > merged. Everything has now been reviewed and should be good to go.
> > > > > >
> > > > > > * Patches 1-2 add the VIOT table for the virt machine
> > > > > > * Patches 3-4 are minor fixes
> > > > > > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> > > > > >   q35 as well, which didn't make it last time because they depended on
> > > > > >   another fix that has now been merged.
> > > > >
> > > > > I believe the entire patchset has been reviewed and you are re-sending
> > > > > it so that it gets pulled in after the release?
> > > >
> > > > Yes
> > >
> > > To be clear, do you mean:
> > > (1) The patchset has been reviewed, and I plan to resend it (ie a v8)
> > > to be pulled in after 6.2 releases
> > > or
> > > (2) The patchset has been reviewed already as v6, and this (v7) was just
> > > a resend to be pulled in after 6.2 releases
> >
> > I meant (2), v6 had already been reviewed and I'm resending v7 to be
> > pulled after 6.2 releases, sorry about the confusion.  Just for my
> > understanding, should I have resent this after the 6.2 release, or is this
> > OK and I should just state the intention for a patchset more clearly?
> 
> Sending for-7.0 patchsets before 6.2 officially releases is fine; I just wanted
> to check what you intended. I've queued this patchset to target-arm.next.

Great, thank you!

Jean

