Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C76DCB15
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:47:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plwX4-0003fD-7d; Mon, 10 Apr 2023 14:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plwWt-0003dN-0y
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:46:15 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plwWo-0007gS-V7
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:46:12 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94a35b0ec77so139428466b.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681152367; x=1683744367;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JFAfDI3Mfp4JViHFomvRXYGGlrDVNBTeb/E8ognbEdA=;
 b=zEPIgx2XSlLBvxTuFhBd8ZjAwi/WJKMXlLaSDpKipf5iSkc9MOpVaNbKPr6PxWm+js
 R9k1AL2ngYIgICjdQZE1cS9otNA+zIcmhtp6A5iH6Y3vDi74nwgKdF+ZKj67x5n8YFj/
 LPSoz0lf3GgO84aXmgLP2PXQ237aPk+Ha2xgnJvypL2qmJUdlTKqGKYfWljmspm9cM4h
 L9Yh7pTyccCf6elXPcw4iZLQkEOWD16OcFkbAuiFxNiyCWz5M+jOSbtvGEPnQlhtUBFY
 Ea2kmYIDLe8vN4tWDNK6otxc/5bz17Po82PA9OxuxNsoz6bT66VMO5HucIr8ISentHYE
 5Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681152367; x=1683744367;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JFAfDI3Mfp4JViHFomvRXYGGlrDVNBTeb/E8ognbEdA=;
 b=ECQh0Dk8sWdgNGJoQgEeZfBFe92gJ84CKSJJ8Luy2Wv+EuFba+LDL7eSSiI1IGOzM6
 ytfoyXD7yauMHsSTBqhJZgbe2e6eYEXEJAtR9ORFNEbkxSFEXxD7zQc9gQtpitArOvNT
 Ys/WkhAdweLnfaSGVhN/jLv0lVU+8NRJHOen9F/vPRuvPKvNsP8x0hRDL9D+UkOZ8UjP
 /kgalqRQoku2xxZQ29o77LXONaeF+lPkFFycCpRJ0d0naQVwzDcBArgk1QTlQaW3AL6j
 tcwpH4ZNggqFEAWifeaHbJfPeLL6suGQ71cVIE+ePbvsyQdOVOO3q111sYa46dTg8/ao
 QYsg==
X-Gm-Message-State: AAQBX9eWhUE2vwNRHRVNdRwK86764OWCR1zN2lx9a/z+IftN2XkZSSkj
 vbJwc5loOfOT54CXcHkROsTVlE2qQ+otOzbVMwFJDIN0ZoXeWCEy
X-Google-Smtp-Source: AKy350bhQPbmuu5yZQiSgXbW22pb9DnaaNjQzG/UKDBXmS1qSQai8FQ+qjYzRbPPkpCR3rFjnfDPj+KQ9uRj1s3Du/8=
X-Received: by 2002:a50:9ecd:0:b0:504:6ff7:658b with SMTP id
 a71-20020a509ecd000000b005046ff7658bmr5408423edf.6.1681152367258; Mon, 10 Apr
 2023 11:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230410141408.3564269-1-peter.maydell@linaro.org>
In-Reply-To: <20230410141408.3564269-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Apr 2023 19:45:56 +0100
Message-ID: <CAFEAcA_ZXOiVNy5MJ3-zmJxB2kOhq60z3ajC_wmkkg5JDFx=qA@mail.gmail.com>
Subject: Re: [PULL 0/2] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Mon, 10 Apr 2023 at 15:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This bug seemed worth fixing for 8.0 since we need an rc4 anyway:
> we were using uninitialized data for the guarded bit when
> combining stage 1 and stage 2 attrs.
>
> thanks
> -- PMM
>
> The following changes since commit 08dede07030973c1053868bc64de7e10bfa02ad6:
>
>   Merge tag 'pull-ppc-20230409' of https://github.com/legoater/qemu into staging (2023-04-10 11:47:52 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230410
>
> for you to fetch changes up to 8539dc00552e8ea60420856fc1262c8299bc6308:
>
>   target/arm: Copy guarded bit in combine_cacheattrs (2023-04-10 14:31:40 +0100)
>
> ----------------------------------------------------------------
> target-arm: Fix bug where we weren't initializing
>             guarded bit state when combining S1/S2 attrs
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

