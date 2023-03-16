Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1B6BCE9A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 12:43:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclzf-0005gT-2i; Thu, 16 Mar 2023 07:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pclzS-0005Yc-Bg
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 07:41:51 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pclzP-0000EV-W3
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 07:41:50 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c4so960769pfl.0
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 04:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678966905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Zj39akCcROzUmrFX9bcj8Cao2d39Tn/yjMgtiFgGpM=;
 b=WIljQG9bsr3o+HZAcTZmV9RAMbqlbbnmVsloieiQ9bUnnZjapqP287L3BHbEGqpgzI
 vxezI42O/xJ0ePQPUOcvzENoSTEkAkLWjHjmFCo10DgfFrMLD+Yofop5tRHE877AJhvc
 2z1ewuxYMC6R3fPkwUq4YtlA8uKp96MksBqe/G85EpoOxiyLMhuq37dkOuntF3gCI61s
 dAT8JKmWPnzSY4bkGpJ161PwmasNxC0AWKCSyPmzXaX7+F7UwumxsIaejY6J8A+6kJox
 rNniBlWtZCIp51yN/rWXSItqtdZdjGCAOjBJPJqTS61OZj0ryuUttJss9ho5n741FdQm
 aLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678966905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Zj39akCcROzUmrFX9bcj8Cao2d39Tn/yjMgtiFgGpM=;
 b=LW2iXCo8/psakH485ohYZuzKyj8+S3Qo6+jmNDclD8tUvqZNtsfNB2/kP+UOJgXEG/
 8ioiELrp2FBpdSSyI25Yj7nKF2bghzbiHHpBbELinASad+fqk1S6u0TgEibiYkP14fQL
 aDUnAGYNVNEZKZdUxgjtoZUbGMHGpSuTBvTCa9jEmXClmPAppwde9GOnpGtn8TAP8WxP
 m4mFUwH2qrwvhfSYOP78G/UE+4azFYc9P+6c2GPhg67LVj5xOsH5K3HQNWBLWsGAgnxf
 ol2BvMxvLDHrtrc0IIstMvaVOVAbikMrgFtiUwoEpKg43sHk/t0Sj+cdKfNRg8ebOcHv
 Awog==
X-Gm-Message-State: AO0yUKUBj7e2AuzjRN1un8LwBNwdkgPlOOckdAA6vbxyd8sNeOkJyusy
 /Rg0kZ9+yj4xyrscy/K9jfz//uQGDPQDatp18SIshw==
X-Google-Smtp-Source: AK7set8F+CAkqxeuD+EYBr5cVqAjEkccdTQu1ckVgFfPDGjYuc0ShKR/WGd00LIQTj5318JsJKSdqcITlXMWMM8IBmY=
X-Received: by 2002:a05:6a00:1904:b0:623:129f:6269 with SMTP id
 y4-20020a056a00190400b00623129f6269mr1411466pfi.1.1678966905403; Thu, 16 Mar
 2023 04:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230316105808.1414003-1-peter.maydell@linaro.org>
 <87h6ul0x4m.fsf@redhat.com>
In-Reply-To: <87h6ul0x4m.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 11:41:34 +0000
Message-ID: <CAFEAcA_NiizU4RjRDNFU2==sHSAMZxYJm9dkAXw6M1AZGGyA0w@mail.gmail.com>
Subject: Re: [PATCH for-8.0] docs/system/arm/cpu-features.rst: Fix formatting
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Mar 2023 at 11:11, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Mar 16 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > The markup for the Arm CPU feature documentation is incorrect,
> > and results in the HTML not rendering correctly -- the first
> > line of each description is rendered in boldface as if it
> > were part of the option name.
> >
> > Reformat to match the styling used in cpu-models-x86.rst.inc.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
> >  1 file changed, 30 insertions(+), 38 deletions(-)
>
> (...)
>
> > @@ -217,16 +210,15 @@ TCG VCPU Features
> >  TCG VCPU features are CPU features that are specific to TCG.
> >  Below is the list of TCG VCPU features and their descriptions.
> >
> > -  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
> > -                           *impdef* (Implementation Defined) algorithm
> > -                           is enabled or the *architected* QARMA algorithm
> > -                           is enabled.  By default the impdef algorithm
> > -                           is disabled, and QARMA is enabled.
> > +``pauth-impdef``
> > +  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
> > +  Defined) algorithm is enabled or the *architected* QARMA algorithm
> > +  is enabled.  By default the impdef algorithm is disabled, and QARMA
> > +  is enabled.
> >
> > -                           The architected QARMA algorithm has good
> > -                           cryptographic properties, but can be quite slow
> > -                           to emulate.  The impdef algorithm used by QEMU
> > -                           is non-cryptographic but significantly faster.
> > +  The architected QARMA algorithm has good ryptographic properties,
>
> You dropped a 'c' here ----------------------^

Well spotted...

thanks
-- PMM

