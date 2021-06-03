Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094939A918
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:24:46 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor5J-0007he-AE
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lor3O-0004Rf-Ip
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:22:46 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lor3M-0003Yb-MF
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:22:46 -0400
Received: by mail-ej1-x62f.google.com with SMTP id g8so10433514ejx.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Em2+Rud4fjo+KjI5Oe92Lv0fR80tZA+23VCQKg8lVA=;
 b=Ntf78IWHxgtDeF0Cg3ZM0GLSEuYf0SCNjl6SxHxZ84r53SIq83nwkkltq0kMGll4BL
 cq8+Yzsiv1DgkF5grMUuW0g0VAavOxIjeagNWheY2T6BcLvI5f1lj6lTXKONhVBjaa67
 7LDB7VGNO126oSkx0i2bBKqH55AkEYXEv3X5S5sF+OWp6lWetSWBPHR5QhyzZG8OJrCZ
 h6GVWjiL4YRXkGpsvKkq4hojrDyBivwq2wxUWHI5GHhCltWKI+D1guMK2cMD2z1X8lGp
 H326JxeUz7nlm7ei6V/JC2hNWAQ/t9kedYw7/jvDW10TfV2P6icZPrc3r/ORi7X3lmvJ
 ZWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Em2+Rud4fjo+KjI5Oe92Lv0fR80tZA+23VCQKg8lVA=;
 b=s8s7LHTDjbBf+2e11c49L4wUB4Yqr3l1yfSPfYAZNfivPKiQ4QVMk6xpajht9iLmsX
 xkCC/puYwYwtfyGI0nE1wmPmPiLCGujAzQ1rJV4WBRIzxDTayhIJNdzcowyDoHRvniwf
 egB69Qz2b9nB7iL8+TY3h2ENSE8/El1viyvkGRXpL7SmLTzkL40fm6YY9j5/Kfa6CoP9
 rUWX2aEwd/k6+HN8oD6ixoViCX5v8aZo9NDpl8VLmHeSrg5o9/cwQ28VACXiCDR95Sew
 N7Ufg7077nw1Y8w5rOZx35VwYLe2eMY1ZXwOSmq8MkqsbNuERZzzvxmkHsMBr8f2+HGv
 ibSA==
X-Gm-Message-State: AOAM533xTkIhq+HIbJd2qp6YNfQEMsdk459ybHhCBNwL0LO4ng62NsW0
 sA5ad1iClryteytOmyBOGtFnZJSkJtfBt0noPGrRxBwY8CRumQ==
X-Google-Smtp-Source: ABdhPJz4PyLP8xcQJeZ6UKpdiK8DclOZsTDtilTxFjNj5NoTHmwHbZ4vmLrXjSjW9hH7xynv8qwgE9PbvkZg5RO9Zuk=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr463337ejb.56.1622740963197; 
 Thu, 03 Jun 2021 10:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
In-Reply-To: <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 18:22:10 +0100
Message-ID: <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 May 2021 at 20:41, Swetha Joshi <swethajoshi139@gmail.com> wrote:
>
> I apologize for the delay, here are the repro steps:
> 1. Remove CONFIG_ARM_VIRT=y from arm-softmmu.mak
> 2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include, in all the places where we disable kvm using -disable-kvm, replace this with -enable-kvm
> 3. Build

Thanks; I reproduced the link errors and have sent a patchset
that I hope fixes this:
https://patchew.org/QEMU/20210603171259.27962-1-peter.maydell@linaro.org/

If you could test that it works for you that would be great.

-- PMM

