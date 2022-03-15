Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181354D9FB6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 17:14:32 +0100 (CET)
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9oc-0000nk-N0
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 12:14:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU9nE-0008Ut-Ro
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:13:04 -0400
Received: from [2607:f8b0:4864:20::b34] (port=33421
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU9nD-0007jn-3w
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:13:04 -0400
Received: by mail-yb1-xb34.google.com with SMTP id j2so38407105ybu.0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wEjdZk0RCXOagr7kW4kb/2mLReegxPtMjo1O2+2p9bU=;
 b=QNc1j2aE36hKVkXbix6RCFfHMWkPam7BUR55RVge0ZZrNoh0yiAVF+HpsCK+zfPEUU
 MChg/zYAQWsX9Stt5rxLFImdhrY56SckWTRwYwGERJO/sT089Zy8/Ld5Nb14xI8zP24S
 7JX9ipbQ30ZE6wqpdc2zdkKhBFWP9cfeMeaZjS844bIRJTQYakfrgOzwYaDGb7JXYsPL
 3q4TYviPteedEro8pyJKJBF4Oz6Pk0NZh4edHduwJTZ1GCEzjP2UMmBUiDEAKLDTztTi
 PWBiUdsCtCjmNswj3ts5tvDslICw7hScFuN5NZkFkgGglxiQZeHrJSAaBJ5BkbsakGfB
 p4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wEjdZk0RCXOagr7kW4kb/2mLReegxPtMjo1O2+2p9bU=;
 b=z1yO/se1II3bZs7VrlDbm44dweEC2F+kSwEc9cOja1K8l3gPeceVlufLdPx+nGfsgm
 SjvinFkweb4yBiH/W/6R+PZ8Mg/XDAkuZoG2CcO4XEgSEtlOQFSBOFRyDrJjNKkfexT9
 OxEtr1YjNrdrzOy5C0JGGyv2sl+mq9H0/hVkCbpeknddmsIaPq/iFd6SSxOJOXwIlEgH
 SEcPtuID+Ao+0ftqMUw1v0rnQw/5+xtL8CUo6WEJHQnEo4/eIN5ZjAlx9gFDA0V3YviD
 C/JAyln3o4G1jx32RGsZipXfFWCg32ycWU8f+sweVhixRjKxQT3ON1f+SF7qT6Q+e8d6
 0+9w==
X-Gm-Message-State: AOAM533fC3oDkNJ2DUODVdceCoFuC8DXtSEAetHySESBquwsK2n0bhKc
 rf4CCKnJDZJ67i1I9n8mxzQbd5TxvxGo6uAq+HXfFg==
X-Google-Smtp-Source: ABdhPJwTjCzUDiNf/MjEGgtc8VI7JNKk91pEkPMU1YGEOV4Qpt4mcPNioDey7isk68J8ce/DaJi282Y1IfQUuSAhbT0=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr24296587ybq.479.1647360781804; Tue, 15
 Mar 2022 09:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-3-kchamart@redhat.com>
 <31ae45f5-e9ce-f905-ea4f-c5d869ecc72b@redhat.com> <YjC4Bmr3s96TzYTv@paraplu>
In-Reply-To: <YjC4Bmr3s96TzYTv@paraplu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 16:12:50 +0000
Message-ID: <CAFEAcA9vqS+2Tou1iK7hqmFXnvsXxABmYW9EQRjGnKKAp=k_xQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] docs: rSTify MailingLists wiki; move it to QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, Thomas Huth <thuth@redhat.com>, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 16:00, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> On Tue, Mar 15, 2022 at 02:25:05PM +0100, Thomas Huth wrote:
> > On 14/03/2022 11.49, Kashyap Chamarthy wrote:
>
> [...]
>
> > At least the "users" mailing list is not related to development, so maybe
> > this should rather go into docs/about/ instead?
>
> Yeah, makes sense.  I wonder if should create a new doc in docs/about/
> for user-lists, as none of the existing docs fit the bill:
>
>     build-platforms.rst  deprecated.rst  index.rst license.rst
>     removed-features.rst

Yes, I think that about/ should have a document something like
"Contacting the project" or "Support", which could tell users about not just
the user-facing mailing lists but also where to file bugs, and so on.

In fact, it should probably look rather like the
https://www.qemu.org/support/ page...

-- PMM

