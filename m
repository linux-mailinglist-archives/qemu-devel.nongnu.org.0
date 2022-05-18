Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4352BFD2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:47:21 +0200 (CEST)
Received: from localhost ([::1]:59916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMpU-0002nD-DM
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrMo8-000202-7r
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:45:56 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:40279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrMo6-0008Qr-K2
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:45:55 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2fedd26615cso30850857b3.7
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 09:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sFU45cZJ8B1f19tFUhoQk27JfVyNyT82r/poQEnsxBM=;
 b=Gn2tx9KFRd89KctVnzyeMWJ3brzqTRtlS0N7G/Gr9kITBl4/aVfSQuOpOzoB4mYKDL
 6xIKpdbrp64fYlwIdhGq5CkI83K8tXa/A6t8XduidEa6HwFQDLTk7cITm069Qy0CI7Xv
 mg0DRSvANsGfYbMl+3INdE3n5xA/YaeHuDqtNtuEtuO+Afybql2fUmes6qPajiXJGGuq
 oNZ11jwCsbQFKLzjy2zGHWQJtojSlsk4OJWmmug3t6rITPHfPe/W5dSyTpxCt9OU24tc
 5KKLqqUeB2Ws/LPLatKEeHOKRE/Z0Lt1lhFMCuYhzQcM4G0mVp7o0ZgpzJes2/DyfRu4
 vgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sFU45cZJ8B1f19tFUhoQk27JfVyNyT82r/poQEnsxBM=;
 b=zhT+R8/zfa2fchC6aDgkaaWFI5w1eS/nOf3PvJV7DD6FUYhtAktUkI+YRoZPo8J3oe
 lSwjq7mq21iv1MFIcutEkVjs608tABp+MSCZEHgvaTkc04B3vrTJ5klC+1TlyW72vcSZ
 Sphb9W4J5onR2uFX/EUxNMbnvj7bsLA4lx1hTPkGqO6tIidNtmNPwwqxAPBVxZNutTuu
 tMXQ8Dht6ffRRP54L5u9QacRBcFk4EaDx3vOgXYifR96gs0cchV82O35/M3c3ROTvVxm
 JUHJOE1Udguk8McX0NGpQjhOxW7XGqCxI7fv4hbUuE4XU+4LX0iPiJlN7Xlu34ppbA7L
 0oWA==
X-Gm-Message-State: AOAM530LjrHoA6uwuI/EEYDeQbbXXHlNmXXiSgo6ig4HQQJMT0m7dYl2
 JvkLwPOwDlgdjPwNaQDflBXbXUm9GbrZwcXODclmPA==
X-Google-Smtp-Source: ABdhPJzvPtHYY8ibCZD3DlG5gEtVaRXM1FQpdUw1qRgpDYhZna/ZGUGwYTf+wfSvkJncd0fjKrwIk6AtJkqcKg9+sVA=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr333447ywd.10.1652892353461; Wed, 18
 May 2022 09:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220513163827.26281-1-peter.maydell@linaro.org>
 <d12b05bd-6bbe-b5a5-1801-540e5d0d63d8@linux.ibm.com>
In-Reply-To: <d12b05bd-6bbe-b5a5-1801-540e5d0d63d8@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 May 2022 17:45:42 +0100
Message-ID: <CAFEAcA8_3VC5P3dMO-i0jm4NCfkLJUBP8y1PX=XUbVGFmwsbig@mail.gmail.com>
Subject: Re: [PATCH] hw/tpm/tpm_tis_common.c: Assert that locty is in range
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 May 2022 at 14:46, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>
>
> On 5/13/22 12:38, Peter Maydell wrote:
> > In tpm_tis_mmio_read(), tpm_tis_mmio_write() and
> > tpm_tis_dump_state(), we calculate a locality index with
> > tpm_tis_locality_from_addr() and then use it as an index into the
> > s->loc[] array.  In all these cases, the array index can't overflow
> > because the MemoryRegion is sized to be TPM_TIS_NUM_LOCALITIES <<
> > TPM_TIS_LOCALITY_SHIFT bytes.  However, Coverity can't see that, and
> > it complains (CID 1487138, 1487180, 1487188, 1487198, 1487240).
>

> All 3 of your fixes below are after the 3 existing calls to
> tpm_tis_locality_from_addr(). Would Coverity be happy if we were to move
> the asserts into that one function? I am fine with this patch, though.

Yes, I think Coverity would be happy either way. There's not
a lot in it, but I picked this way round because in theory one
might want in a hypothetical future situation to have a different
kind of error checking for a callsite that did an address-to-locality
lookup: it's not inherently of itself never possible it can fail.

thanks
-- PMM

