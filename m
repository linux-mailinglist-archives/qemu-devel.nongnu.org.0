Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3735E026
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:34:29 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJBU-0006kD-Kq
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWJ9u-0005k9-Me
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:32:50 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWJ9q-0001Tp-Lc
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:32:50 -0400
Received: by mail-ed1-x52b.google.com with SMTP id m3so19420797edv.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JQMi5apjq4+ZxeLlhEC2Qn0085wWlJdEy0w0zBLJE1A=;
 b=ljDSzTSe6A8KdiqH8gakuHR8OphpveLijNMU9900sm8F29QWIJIn9uehYnEHqtXyGt
 sz5ejt+WyDnbnQZ5JPwlQTcd57uFEND7sEy/MIor56b9GfJ2+DsnSUPOFQvF7LGHe7Jt
 jjGZUGFFEE/rM/OOV4pGRutD67U3V66qfVTQJIZugYPYUMbJY21F6VBDHeOxPC5L9q01
 OI0If+DJ20CRqG9kUlNe8fCnqmzU6O+2CuWlfoBProGj8V4PPy2TUSBhurKI/6mbuHnx
 5ld83yO9AdqxzbmpU8ao5+jwDzqO8P184dW5/U14cMcvCTdKVreDXjsxrNmNeJzxrCcV
 psiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JQMi5apjq4+ZxeLlhEC2Qn0085wWlJdEy0w0zBLJE1A=;
 b=eEw31a/Q7K5QNRpcuAOKBblssIBOhmtD0GCibOLnAmvIEJuCjTuQM2Gk3t7UmXbIar
 wyw+Df3At5Ksxojdk39gIwy+VyC1RHiZUJ2EV1lCj6oGeE1/uh/hRAtuuEvqKvDm+Qv0
 HVSlrYpuRLoJC35wKpiN4iOkTM0qkeB+IN672ZUbpSbBW3rjH0uO0y6YpKsWBVJRye1c
 ecjNbKoFTtHGGVJg4iD2dEbbIilawXp1Q1N5hVlHbmpar5qkzTSlg9RkVYWuojPGI+gi
 iGcfX4sJVqcXZyR+9Z+htX6Jww/xGXFIVH+8Ae7ug92Eib9zU9I23x/JuMzxTrAdFURI
 K6Vw==
X-Gm-Message-State: AOAM531ZkH389IygR++9qs7zM0ilkzAzT5/SrPFmAWd7ImIE+YT1TNrh
 oxUOFXZVnpBTpN9GglE65Jj/lv9x8qDotciCYV170g==
X-Google-Smtp-Source: ABdhPJzTtqbjtmecNimQa/6vymhMvnDN0Jd4wlKD0KFiBT/AYNISuoPA7MB2kOiO6CGe+oP0exIVLyGfE20vWbotwwU=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr34690376edb.204.1618320764385; 
 Tue, 13 Apr 2021 06:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210413002648.8281-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210413002648.8281-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 14:31:59 +0100
Message-ID: <CAFEAcA_2bqGVntsq35ZOPEJGUGKLNf-uJGixCF2MzxShZuSmTg@mail.gmail.com>
Subject: Re: [PULL 0/2] ppc-for-6.0 queue 20210412
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 at 01:26, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210412
>
> for you to fetch changes up to 2b18fc794f312a91482998bae5ea6c8724200e06:
>
>   spapr.c: always pulse guest IRQ in spapr_core_unplug_request() (2021-04-12 12:27:14 +1000)
>
>
> Ugh, sorry Peter.  I meant to sent this yesterday, but apparently
> forgot to execute the last step to actuall send it out.
>
> ----------------------------------------------------------------
> ppc patch queue for 2021-04-21
>
> Here's what I hope is the last ppc related pull request for qemu-6.0.
>
> The 2 patches here revert a behavioural change that after further
> discussion we concluded was a bad idea (adding a timeout for
> possibly-failed hot unplug requests).  Instead it implements a
> different approach to the original problem: we again let unplug
> requests the guest doesn't respond to remain pending indefinitely, but
> no longer allow those to block attempts to retry the same unplug
> again.
>
> The change is a bit more complex than I'd like for this late in the
> freeze.  Nonetheless, I think it's important to merge this for 6.0, so
> we don't allow a release which has the probably-a-bad-idea timeout
> behaviour.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

