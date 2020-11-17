Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18712B635A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:38:28 +0100 (CET)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1Bj-0006Bh-RN
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf19p-0005iP-GG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:36:29 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf19n-00068C-O9
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:36:29 -0500
Received: by mail-ej1-x641.google.com with SMTP id s25so29423591ejy.6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UW34GktULFsdJzBbzxgsgzr2UwuZPgvMW2z2PQ3CxYk=;
 b=jK5c5NOeOF1eRpLOOLedoVLRdH/7jFXGA2Rrmnrl+jgWHOc0IQsx5oDVszRCZg2TjY
 Rd/MEi7dnF6N9eWAQb2LA2kGGigLxiQLw6lb8icDtboirVgPgTI7UWE7nXK0G9mpD9gY
 WW0H5ExBtLGxw++lnA954w/v2jNSHldJ5pang9LThK/kXGcRl5oaAmF5/HF6pEWU4VfT
 nsVoyEFKKSKO9Rev/WxgJa+3TiFQ7TNCPWtZzndAH7cApkSRhISr5AV7PAtxd+VFHPL2
 6R3eI471NrThcAym4KJ6SI5dkChQ833DThncUpZqkbZDqlesra0Waoyj8FfS1OPQAwYk
 rzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UW34GktULFsdJzBbzxgsgzr2UwuZPgvMW2z2PQ3CxYk=;
 b=OIUI4weEIZ9687sh8bTcWMfeRXsZS1eLvInfLFTZR8YZzSjRDDUNY+YiBQ0Mq7NC0V
 GUcV+FUkFyBuyiD5fw3jxYbHmE8R+GNJI1d8tuGXpPfz82XLxeSemx0t0TAUVEBHI8Ke
 BByJG6IhIE38ajmztUvdG2ltFhz1ZveKSqtYwPvfm85YaeYDUPrLuoiGkAxsTTuN1jag
 50xqT/KeOY9umPH+54eYiMtlridVUdT6n98d6QILixNGB4mLopdqacyMpiFg52yPTuoC
 w2KLpZKw87G3FVa+0ioZZY96JYrRy+lEGCXr878jJKu/ml/f7NSw4MUZQdWk0ksG/Xa6
 rXLw==
X-Gm-Message-State: AOAM533MhyMpjKq5e4bazsY5LOtQnlyNcye7P7fZjsBCrXRg+md4UZIb
 4IO0pNkC4xHN9zKcMMLQXRgprlKJNiDt0pN4ZwwV+A==
X-Google-Smtp-Source: ABdhPJwy2lKHj+XWKR/KLRTops6lYgnXkwG7W8i6k56R960xisf/w6qHkXz7lwDWQdhyXxbXvcYt3ChRECdZlc6bzQo=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr19228113ejb.85.1605620185903; 
 Tue, 17 Nov 2020 05:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20201117120115.1234994-1-philmd@redhat.com>
 <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
 <d945234d-4725-9928-11cb-f34606c8524c@linux.ibm.com>
In-Reply-To: <d945234d-4725-9928-11cb-f34606c8524c@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 13:36:14 +0000
Message-ID: <CAFEAcA_-i1K6dqtYqVVDvaiP9j_ask8_dW07iTbnS3Kwvr=KnA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
To: Pierre Morel <pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 13:24, Pierre Morel <pmorel@linux.ibm.com> wrote:
>
>
>
> On 11/17/20 2:00 PM, Peter Maydell wrote:
> > On Tue, 17 Nov 2020 at 12:03, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> >>
> >> Fix an endianness issue reported by Cornelia:
> >>
> >>> s390x tcg guest on x86, virtio-pci devices are not detected. The
> >>> relevant feature bits are visible to the guest. Same breakage with
> >>> different guest kernels.
> >>> KVM guests and s390x tcg guests on s390x are fine.
> >>
> >> Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
> >> Reported-by: Cornelia Huck <cohuck@redhat.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >> RFC because review-only patch, untested
> >> ---
> >>   hw/s390x/s390-pci-inst.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> >> index 58cd041d17f..cfb54b4d8ec 100644
> >> --- a/hw/s390x/s390-pci-inst.c
> >> +++ b/hw/s390x/s390-pci-inst.c
> >> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uin=
tptr_t ra)
> >>           ClpReqQueryPciGrp *reqgrp =3D (ClpReqQueryPciGrp *)reqh;
> >>           S390PCIGroup *group;
> >>
> >> -        group =3D s390_group_find(reqgrp->g);
> >> +        group =3D s390_group_find(ldl_p(&reqgrp->g));
> >
> > 'g' in the ClpReqQueryPciGrp struct is a uint32_t, so
> > adding the ldl_p() will have no effect unless (a) the
> > structure is not 4-aligned and (b) the host will fault on
> > unaligned accesses, which isn't the case for x86 hosts.
> >
> > Q: is this struct really in host order, or should we
> > be using ldl_le_p() or ldl_be_p() and friends here and
> > elsewhere?
> >
> > thanks
> > -- PMM
> >
>
> Hi, I think we better modify the structure here, g should be a byte.
>
> Connie, can you please try this if it resolves the issue?
>
> diff --git a/hw/s390x/s390-pci-inst.h b/hw/s390x/s390-pci-inst.h
> index fa3bf8b5aa..641d19c815 100644
> --- a/hw/s390x/s390-pci-inst.h
> +++ b/hw/s390x/s390-pci-inst.h
> @@ -146,7 +146,8 @@ typedef struct ClpReqQueryPciGrp {
>       uint32_t fmt;
>       uint64_t reserved1;
>   #define CLP_REQ_QPCIG_MASK_PFGID 0xff
> -    uint32_t g;
> +    uint32_t g0 :24;
> +    uint32_t g  :8;
>       uint32_t reserved2;

Bitfields in a struct intending to be a representation of
a guest in-memory structure? Almost certainly the wrong thing
because the order of g and g0 will differ depending on host
endianness...

>       uint64_t reserved3;
>   } QEMU_PACKED ClpReqQueryPciGrp;

thanks
-- PMM

