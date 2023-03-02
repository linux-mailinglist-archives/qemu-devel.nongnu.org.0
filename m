Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A06A8318
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:02:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiZR-0003IE-Ky; Thu, 02 Mar 2023 08:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXiZK-00039c-T9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:01:59 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXiZI-0001DI-Sq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:01:58 -0500
Received: by mail-pf1-x42b.google.com with SMTP id n5so10006669pfv.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677762115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M5DfpqGSQitL33LMpcR5wC/EcuSAZDgZS26iYCxyjBM=;
 b=PekDNndZkHy0B9U6hOSngFWDD10Vc0QbwMU03LRI9K+UW3EcWI95Hem7fDLyVJsMIg
 /CWaHaqWPaATKLCXB9ZO90saSy6xWlowaSMNpPDMJ7h23UIxJJdw7arKriEZpZCMBWIT
 PEDHlrnUqbF6UCbX+2zJ3pSZaD2SpTD4csEBVExMsGW9iojJkzNYzXSSLVHgE/M2e3cS
 Lrpnaqb0FZvglcfcC9+4nhQqxzW6gqX9BpM/bHdge/pp5l8Yk7vHM6O8pszS8HlBiOYa
 oHci4t6GA2tamFHxFoqnesCZTgFrRvsKtsceHt8L9C9qc/Tyocj23Sqqwg9QglMqyAcr
 BgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677762115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M5DfpqGSQitL33LMpcR5wC/EcuSAZDgZS26iYCxyjBM=;
 b=4JvLZ3YdqWx4tzctkRfF/7S2ILGlaAkMufUis7wPKeMSontPGkX/fvvh+I0MqB130Q
 P27N/KSetniPv21LnxSMR6Fv6mf72N2R9kwwjRblk+MiqhgATW+5twWdovXBI9rNY5yN
 x9F8l4uFrQFpLT1IrGUe7r5rfQT2WwFVAWb9sJoZvYqaAJZA6TKkoVNmt6JFJE7xeVSJ
 3buk2/dF9yHP669ljXa3b5WxTK4ZMvFvi9FgcmHHt5NK9Q0PL2Z/cldeiZg+rAsU0Wgm
 Hs8Egg1Gkl26qxoBvI+Vc0ow9yrPMN2RkcXTewzrQJhS1qs3vqgfcneG/nDBvALfFFh9
 zDKg==
X-Gm-Message-State: AO0yUKXWJHPtizn9rTpvN6l3aJMAWsLzaWLeM69ORxVbTn9Tjyxq35zZ
 YJcDOHJlGDHCULVNDKMLyTruzsJBO/kN7Uy3R02efA==
X-Google-Smtp-Source: AK7set/JYT7AZvRN0QCrlQ7SHtXqfBbt2Ds39cTWeYQQiCU3/NDzii725Rd1zmXUKbP2EHyETehhzE2YYXN8EQ+W3xs=
X-Received: by 2002:a63:b55a:0:b0:502:fd71:d58c with SMTP id
 u26-20020a63b55a000000b00502fd71d58cmr3445780pgo.9.1677762115425; Thu, 02 Mar
 2023 05:01:55 -0800 (PST)
MIME-Version: 1.0
References: <20230301182353.21559-1-imp@bsdimp.com>
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 13:01:44 +0000
Message-ID: <CAFEAcA-9p+MEy+tSOzQKNLseM6USF017eUjuHaO_PgNvkf_L-w@mail.gmail.com>
Subject: Re: [PULL 00/10] Bsd user 2023q1 patches
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 richard.henderson@linaro.org, f4bug@amsat.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Wed, 1 Mar 2023 at 18:26, Warner Losh <imp@bsdimp.com> wrote:
>
> The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   git@gitlab.com:bsdimp/qemu.git tags/bsd-user-2023q1-pull-request
>
> for you to fetch changes up to 6da777e2121b1eed4d20cc3e892b3c3d303bc252:
>
>   bsd-user: implement sysctlbyname(2) (2023-03-01 11:09:19 -0700)
>
> ----------------------------------------------------------------
> 2023 Q1 bsd-user upstreaming: bugfixes and sysctl
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

