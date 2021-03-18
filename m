Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95923340766
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 15:08:37 +0100 (CET)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMtKG-0000gb-6C
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 10:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMtJD-0008Je-Hr
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 10:07:31 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMtJB-000820-Nd
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 10:07:31 -0400
Received: by mail-ed1-x534.google.com with SMTP id y6so6839015eds.1
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F3Ruesj0hY7C1tC8Jf9jAy6wQ2PV4YAvQiES420IyuQ=;
 b=kXm8e2b3enpvEPH1AOqwHYeCwGasDJKRCh6jYF3Uzi0ilzcQchZuVMEyW3RkjJ/TKA
 9/TJ86y+8zLeAL1kittDftIYpUjqCAdOH3vZbN0F81vdE+EWqMdtVImxDLUk/3GHkdRQ
 BnH+D7fImUnaY2ol+izSiRDJ7aBzqJQCz9xnMtv4IV+RXFZyBFv9h3+SZf4v6bGSPnAL
 RC6zyDme8QgEqdiiOzeEymXxY9IMIE2Brd2E37IJk++ReKthIH70BMw01hv9A9ckck4d
 yBeqE4abUdvnHv6R6t/3/PHJjw2KX6E+bUWhKA6GCdMiZrAnAGVaHh6u1v6Va05AEwqM
 6VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F3Ruesj0hY7C1tC8Jf9jAy6wQ2PV4YAvQiES420IyuQ=;
 b=HIF2zLnaNZQUL1Ko0i+uIpD2gX8yJSMoG2oXfjVeVp8szZqDWP7/81j9FSpksk+TWy
 c44+LWovOpNelYsd46pPjb85MXR0KCMGXN3/mPkX30VVTHj5PNdWBpiBLGq/c4OXM/nA
 59sEcDnXw2muxoSw3eQvnHCZOeIBh3/DQVpd0lO2CBEzFXj4hnzxjYhwY4WgUIO9oztj
 3WMq87vpFCOKnxqatA1V1PUSOZbiSySpx/r5gTFKzVXHPXAhdfr4GtQjwZi/biwpaVG3
 C+0axHdLAUhf3Jb7Mk8Tx7dk41RZiQvCKgZFhZPFjzB+76FkjNtBY80Tf8hAQul4livk
 jKhA==
X-Gm-Message-State: AOAM530p/vTKz7MDr1rxwu8Dfdq1Qxj15HthYKv2miDrxioRom3XNVVi
 F/e4YWtkeFfnUuF1JGdUJ0j4hH5f3Tv2oL5CyK3r7w==
X-Google-Smtp-Source: ABdhPJyhy1J1m7s9Ou7gu9OVB70TPLvCMJoANo8pmzsWuQ6uzDYjWd4JsReAnAMBoC73UnRi0fpqbfIu3o7n5hsn/jI=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr3818294edu.100.1616076447600; 
 Thu, 18 Mar 2021 07:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210317032217.1460684-1-michael.roth@amd.com>
In-Reply-To: <20210317032217.1460684-1-michael.roth@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 14:07:03 +0000
Message-ID: <CAFEAcA_8ND0OcsuXTXYoFVehqdKB5LKW6nbSxTNr2F=UCu12sQ@mail.gmail.com>
Subject: Re: [PULL for-6.0 0/6] qemu-ga patch queue for soft-freeze
To: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 03:22, Michael Roth <michael.roth@amd.com> wrote:
>
> The following changes since commit 5b7f5586d182b0cafb1f8d558992a14763e2953e:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210315-pull-request' into staging (2021-03-16 13:17:54 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:mdroth/qemu.git tags/qga-pull-2021-03-16-tag
>
> for you to fetch changes up to c98939daeca3beb21c85560acede8d3529e363d9:
>
>   qga: return a more explicit error on why a command is disabled (2021-03-16 20:21:47 -0500)
>
> ----------------------------------------------------------------
> qemu-ga patch queue for soft-freeze
>
> * fix guest-get-vcpus reporting after vcpu unplug
> * coding style fix-ups
> * report a reason for disabled commands
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

