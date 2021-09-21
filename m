Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2541383E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 19:24:52 +0200 (CEST)
Received: from localhost ([::1]:37440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSjVj-0000CV-4e
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 13:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSjUQ-0007xx-KB
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 13:23:30 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSjUP-0008Qe-0m
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 13:23:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id d21so41411110wra.12
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=E9TsK4NVrS8uPhiEW9adTNTcH0hPk9faCrL5//+aEt4=;
 b=U/h8IUNWDvryvhiXF2xWYwKBfN+DtMBFIvLH/led+cfBEWom/o10rMo3sY/1GIWMq+
 a7+ATl6X2UbqfnEZLKQy8YyLGpQ0WECirPFoBcxM9R996L1S/a3Q09kIMLXJpXjDNtqD
 NNCF+GRo61zeqA7ZyEmoH79U/CdLzwyLxT/1e2FfG1pmcwaicJm5Klwpf84EVxuNbf9q
 88K4SDkyysPH7wmo+ppKQoWq3kHOwhgp1/ur7LTTaJtrT7DweNlwg/FDbfsKXpfhujBX
 M1bpNVG9wdUwhMGTSC5AiADePoKPlZpQ5aYXPevxOI5nwAarzd9xsfUnjYd0+j+sz7eX
 bX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=E9TsK4NVrS8uPhiEW9adTNTcH0hPk9faCrL5//+aEt4=;
 b=wySbrwF9oVI0SYQyIy1Qp0rs2ivzytlQ5stMB/q9RVjrArhhYSVOZZz//8TGKJ1VyY
 TGYO6kUv7ZuipstYkDjgHmFXoQCW1X0aDZPxlCcAgMY6jJ2l/v6JbCOETErxYYKjDOWI
 HNe/qxiWhSvQ0h/ka307TUui55aMweIN5ol2tDmgulUeri+I7Cgat3cdbpoTZlpf33tJ
 LnHyK56ynnW42c96BJ0fLxlqvhvV2+nI+xD4wPVY9bxSX6WObva/p95WfFUvOIKaFxQY
 pzpj8o+OmLGGM+6n+SHzNc/pB1q4CIhLC+R3B92eI9+qJAUYkxtVS0emfUreNry2IIac
 L9BA==
X-Gm-Message-State: AOAM533h0DULaM9O9ApfFjMUSEHkRGTR9s8O6RMnkkSny5Om5RNoVGY8
 MC58U+/j+JCiQ9Wu8I3kbB8na42ORv3uQywHlK+67D37mYw=
X-Google-Smtp-Source: ABdhPJyosUnfdwwO9pGTHlk3Ag9pmcMLdjTJfvMeA1c9GcZdS3R+pm5etpAOXzprbuhOZknhtWgVPAU4kKxp1vRFndo=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr9804618wrw.376.1632245007375; 
 Tue, 21 Sep 2021 10:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210921153149.10113-1-peter.maydell@linaro.org>
In-Reply-To: <20210921153149.10113-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 18:22:35 +0100
Message-ID: <CAFEAcA9dN+eDh7qFrpjfpQ_03QAsnfMOGsyUkS=U4=R+K7NAtw@mail.gmail.com>
Subject: Re: [PULL v2 00/27] target-arm queuea
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sept 2021 at 16:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: added missing #include to fix osx/x86.
>
> The following changes since commit 7adb961995a3744f51396502b33ad04a56a317c3:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210916' into staging (2021-09-19 18:53:29 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210921
>
> for you to fetch changes up to 4b445c926add3fdec13958736e482e88857bcad8:
>
>   target/arm: Optimize MVE 1op-immediate insns (2021-09-21 16:28:27 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Optimize codegen for MVE when predication not active
>  * hvf: Add Apple Silicon support
>  * hw/intc: Set GIC maintenance interrupt level to only 0 or 1
>  * Fix mishandling of MVE FPSCR.LTPSIZE reset for usermode emulator
>  * elf2dmp: Fix coverity nits


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

