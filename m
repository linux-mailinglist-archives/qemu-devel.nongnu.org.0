Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C877B4D46C7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:25:05 +0100 (CET)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHqq-00069t-Qi
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHbZ-00040M-4q
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:09:17 -0500
Received: from [2607:f8b0:4864:20::1134] (port=37759
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHbX-0006VR-BS
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:09:16 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2dc28791ecbso55240857b3.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7Xt8YbpivuC5kIwaCC5D/597LUMjgmkTZGA2P5kzR/k=;
 b=I2VyjLAqMHfWxAyGnwOdJsPkgy9PWdo1OhW7GYgMK4ze85VZFPI9sDpD0drH7yzlpT
 A/YAfKGIw8nqpdhOnR2frDtoooYFDkaSTNuLlpN2LLFEqv93WAsoZp69249Jk8RTWHuX
 pg/2uxYGmQ7RjAUmhtLwq2kwSEuyJmoQweYS85K+z5pxDPU93BYobk0YMyKmDKpmCqr1
 22piIzpzKYfRh8zFz3Q0G0ugSX2K+g7sv2YOT9kA+RXnKFBOP87ZJHNDb/rvcQyQuwh9
 S3IDp4vBXCLxwviUXa8LYrCLBFnO+qLODqA94MUdqLFncV5dcmjTJO4m0QWzGTmBoKaj
 V7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7Xt8YbpivuC5kIwaCC5D/597LUMjgmkTZGA2P5kzR/k=;
 b=DlP3hTg3DVWOnYjwDVxad0CAMvjtd3zluyPe4Kb7b3n4VQ5dDss/JWg4suzB7lLiVN
 fKOtg2zXdRXulBJZFlRjmP/uypk2vQcMZpPcBxkK4tp6InXYXX71jmQYCXOWLwICtnQF
 6c09pJhP72fAu/6j2Trofj/hkeJY7OOR5kN/mtxUmlhaJWVcrz5W+UZa3iLJoyKpEyIR
 xulR15nhQVayZTplZj9Wm/Ge89uNSelTCiLqD7JKAGBT2ADXaJVQkJWIDWR3sCeq9mFj
 yZrrZuXaEE8wxHnvpVlTLnNUpNroSH0jz6ZYqGTVk5QD1M7436sqMCq7tdpFN7KAM/Gy
 APYA==
X-Gm-Message-State: AOAM531knOoxfItXuiUqDkET/2A7MvuuO4GG+3Z0sxhfD3FCtrUUjI8N
 pNkCjfjBTiHnZZAOOaagaiMbAvN7j9VVhwylnm99fg==
X-Google-Smtp-Source: ABdhPJy8lTa9oJAfzSZ+By7pTDx0JivtGSqDuxLd0LG2scoiy4CBQIRzkKtMH9HC3obXk+4mkn0v9oy4BwJL7J78n4Y=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr3525570ywh.329.1646914154229; Thu, 10
 Mar 2022 04:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20220308113445.859669-1-pbonzini@redhat.com>
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 12:09:02 +0000
Message-ID: <CAFEAcA_f1Bbegex8Agqz-9c7GtaxC_ABLMSD_zi26LSrc-jcQg@mail.gmail.com>
Subject: Re: [PULL v2 00/22] QEMU changes for 7.0 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 11:38, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 99c53410bc9d50e556f565b0960673cccb5664=
52:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-20=
22-02-28' into staging (2022-03-01 13:25:54 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to d722beb6ac1d457bfa3d7dd5bce7bcea5ea45540:
>
>   gitlab-ci: do not run tests with address sanitizer (2022-03-08 12:34:12=
 +0100)
>
> ----------------------------------------------------------------
> * whpx fixes in preparation for GDB support (Ivan)
> * VSS header fixes (Marc-Andr=C3=A9)
> * 5-level EPT support (Vitaly)
> * AMX support (Jing Liu & Yang Zhong)
> * Bundle changes to MSI routes (Longpeng)
> * More precise emulation of #SS (Gareth)
> * Disable ASAN testing
>

This seems to fail on the jobs that run check-acceptance:
https://gitlab.com/qemu-project/qemu/-/jobs/2186949883
https://gitlab.com/qemu-project/qemu/-/jobs/2186949881
https://gitlab.com/qemu-project/qemu/-/jobs/2186949890

because the TCG boot tests for i440fx and q35 hang:

(001/183) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'001-tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg',
'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2022-03-10T11.=
02-cc7d226/t...
(900.76 s)

(003/183) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'003-tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg',
'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2022-03-10T11.=
02-cc7d226/test...
(901.26 s)


-- PMM

