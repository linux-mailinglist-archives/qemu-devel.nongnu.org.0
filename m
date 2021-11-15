Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCF7450BC8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 18:27:01 +0100 (CET)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfkx-0002bt-6E
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 12:26:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmfjp-0001lW-BD
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 12:25:49 -0500
Received: from [2a00:1450:4864:20::432] (port=42578
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmfjn-00040D-06
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 12:25:48 -0500
Received: by mail-wr1-x432.google.com with SMTP id c4so32119871wrd.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 09:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VRszg9AmCD+ZTcNzNKGPTNFBHIr6MQ+7dyhq2wHglto=;
 b=ftq/MpGJAsNDdBtiKxYMNHrkI4Dzc3ddjhOCufskWbd20Ir4euVXzBsNyOxWRb6Kzm
 GPcoZHJILmSM1HzyuDASd8Kb99zdnmHMyxbNKWbfoMxJGVZp78/2z57WWkutHG6nUzZc
 wsQ/asK5mT6iJZnpS/m0gDlxJh1cV2uW+dGBt8Kovl+1lGuFChksZ6jcD72S4RE66jpY
 pm7403i7ieCFEAGYJ0EU7D4lF3iG0zdyFvQxtC1nY+STLBna2stQZg/MIKBK3aOXRGPC
 7kBzCfVBh0xHQn7zfzJ2QtBb9XFQS1kf3Vz+K1bM3lU/+XY4m33Ak7qHdOma448HHCNz
 7KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VRszg9AmCD+ZTcNzNKGPTNFBHIr6MQ+7dyhq2wHglto=;
 b=LOYQCl0sOrVbONtYp8YWMPlQcR6m9ryGD+vTnfWmm8X6womCQnyI3pY8+xabqwraO5
 4aNqyb7E0m8wcL9QsHigNDpxOaNclOtHE+Z5J9jq83DMU5R4MQK9L5NXT249ub4EHfVx
 irmyYkuNnTCD8L/T3aWOL0RLOMBYP3EAgf5FQnLakSrCiz/RGJpRnnVF8Q29vELnfnEa
 +jdMUH3qVrY2F90B5mzdW3SzpN1MvLaKwwoVdCHEyxzKRSC0GxJZVwojkYwCuP57YvVc
 ekIaZTH/GkR81o3H6FEvvjit4XjhIWBXDNE5/bPu9/ZF8xqFMRb6ACj7iT8Jm+4mDn2o
 UYaQ==
X-Gm-Message-State: AOAM530UtTtYtfhAECLX39NyvBLBjpLuhnh43gTmZ5J/Arki/HoajuCM
 Wtfy1myBC0g9l2b2qE9MiuGhZPuWrSFTXYF9jzZjRg==
X-Google-Smtp-Source: ABdhPJzZ8qRgFiqp3B7ZiIltB+JNZUtP9o0M+rjflrQR37drkgkcDVMO/bMqhzUC/n9skkoHE7SIytWQyndJdTCCJ3M=
X-Received: by 2002:adf:e984:: with SMTP id h4mr810866wrm.149.1636997144880;
 Mon, 15 Nov 2021 09:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20211014162938.430211-1-pbonzini@redhat.com>
 <20211014162938.430211-16-pbonzini@redhat.com>
 <YZKVuz5VJN6e9zjo@redhat.com>
In-Reply-To: <YZKVuz5VJN6e9zjo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 17:25:34 +0000
Message-ID: <CAFEAcA9Qz03E5aRG3S=LuUEXaMhmndtbxok6FK0+tN8CV2DfQw@mail.gmail.com>
Subject: Re: [PULL 15/26] configure,
 meson: move pthread_setname_np checks to Meson
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 at 17:16, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Oct 14, 2021 at 06:29:27PM +0200, Paolo Bonzini wrote:
> > This makes the pthreads check dead in configure, so remove it
> > as well.
>
> This change appears broken
>
> On v6.1.0
>
> $ grep SETNAME_NP build/config-host.h
> #define CONFIG_PTHREAD_SETNAME_NP_W_TID 1
>
> While on git master
>
> $ grep SETNAME_NP build/config-host.h
> #define CONFIG_PTHREAD_SETNAME_NP_WO_TID
> #define CONFIG_PTHREAD_SETNAME_NP_W_TID
>
>
> it shoudn't be possible to have both these configs
> satisfied as they're 2 completely different impls.
>
> In the meson-log.txt we can see both tests passing, but with
> warnings
>
>   /home/berrange/src/virt/qemu/build/meson-private/tmpt191k3q1/testfile.c=
:9:5: warning: implicit declaration of function 'pthread_setname_np'; did y=
ou mean 'pthread_setcanceltype'? [-Wimplicit-function-declaration]
>
> So it isn't actually validating the function parameter
> signature, and then link is succeeding because the linker
> doesn't care about the incompatible function signatures.
>
> Peter meanwhile reports that he gets no pthread_Setname_np
> at all, and his meson-build.log shows -Werror set. This
> causes the missing fnuction signature to cause tests to
> fail in both cases.

More specifically, these tests get run with
"-Werror=3Dimplicit-function-declaration" (and this is not
because I've passed any kind of -Werror option in --extra-cflags;
I have passed --enable-werror but that is supposed to be the
default anyway...)

-- PMM

