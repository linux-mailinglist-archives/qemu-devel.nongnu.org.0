Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A268E2D838B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:44:37 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knt1Y-0002xz-EJ
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knseT-0006NS-01
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:20:45 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knseH-0007Cy-42
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:20:39 -0500
Received: by mail-ej1-x62a.google.com with SMTP id b9so14766084ejy.0
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXA5hLQtczfl6NhjPvIbbQRr3oa+dv4YgrfbDilytzs=;
 b=UEwk+YdLjAtwYzpcCbgA6WMs42p+D1v/8ZFIXXLNfbe80vmPzoujZXdZV+OSizMYET
 XXIj0xIn7zZDsSQJ/J82YRiHuFPdBm7Kqq2FtV4aTEcQcnQhD+VNXLdy10JWKMYHWmdO
 vzukrlDBDEjtBfdRiPHLUVU4F+HN194Lm8TfNxZvh/3j9bTVxsM/uM3cMNFjYM8eZH/O
 hVC3FaY5e1N3hPRS+WoPiZgOwpOUf1n1HprwutDmfTEaa9fD/gofGcBBRnlQM//pO360
 HTnCA76Bf6RC5Jnye6Q1zWsHuP8U2IRhmA29k7vR0SyXA5PIIEbeJn/9kzpZKNLzuf18
 I31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXA5hLQtczfl6NhjPvIbbQRr3oa+dv4YgrfbDilytzs=;
 b=oRJmzyGmDaH2ygwiS51Ybwloga4/1jY0BLHx9cC2TyDMHf2sY9pnzPs5sXf4M3S79v
 GZncUp1PmkzDvZ+WncChR6S6wirw4KUT/2/FH/BStUYI142KwjsILO2dSS5jDrd/d2ux
 FVmJ8HHsB9ka4vDqfZoiU7NAZqwqbhaNgfRB9bY0dXsC6QkYRo/sgH1jLkJWr7W8iGEX
 4LqP/c014qaLqPfPl8suOWMrGKk9LTg8aiRHDwCJPMeKw2F3q4G4ycA7fULmY973z21J
 DbVUFwm3CSh40hShAKzknlpCZKZeSOdGwurbu/bmd0cCBr/mVHXVQBXT1Lqyjuws4VaN
 Aaog==
X-Gm-Message-State: AOAM5307Smp9ZBt/3+qxMXrgpEGxaAs9n28Wuc9/ERWvN6D8auyM46pT
 eMGWvCiRPaKzicI7ANvszChGYq7GayPSf57We2/olQ==
X-Google-Smtp-Source: ABdhPJwJjqTc9fnS2FIGTTIe8bLhhRPMiELOa11QnobL6fXveTL3m8RpPFyGfIDec5zneLSdZjHir49533zwJX0cgPc=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr13400783ejb.56.1607732431474; 
 Fri, 11 Dec 2020 16:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20201211122658.24481-1-cohuck@redhat.com>
In-Reply-To: <20201211122658.24481-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 00:20:20 +0000
Message-ID: <CAFEAcA894ypxZqk1Htr_Jjx+KE617MKrqp4r+NNE9j+eP5DMhg@mail.gmail.com>
Subject: Re: [PULL 0/6] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 12:27, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' into staging (2020-12-10 17:01:05 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20201211
>
> for you to fetch changes up to c7454f05171405b8013a9d6b57045cd614ccc386:
>
>   s390x/cpu: Use timer_free() in the finalize function to avoid memleaks (2020-12-11 11:38:10 +0100)
>
> ----------------------------------------------------------------
> First set of 6.0 patches for s390x:
> - acceptance test for device detection
> - bugfixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

