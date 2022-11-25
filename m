Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D14638865
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:13:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyWcv-00049i-NG; Fri, 25 Nov 2022 06:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWcu-00049V-2M
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:12:12 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWcs-0004pS-IB
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:12:11 -0500
Received: by mail-qk1-x736.google.com with SMTP id d8so2416232qki.13
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gw2rdvOeLSFTyu5coE/6tpknqSj5qiYpDYuyLrc4EOo=;
 b=fStoFE+vvs+i4WdtyIa4i6fBZDiQuijcsgKS1TQ3vQTtzn3K2jDfnD641BtIUVyZCm
 /YQevEHi04qUg4bxBUIr/9xyMMYUl5cAnsfmck9gWoaMzE6Hj7MY8lLqnLTz2VuWbgtj
 2as6BfNHgxNGOJ098VjIhQnOd/imiMEduhf1Va5ND9TPvv8kFueNbWE3Ay7o/lwUoON6
 y9xV/JTKdq977TDyB8P5/6qKjqzX6o0kCVIsjEKvKgu2OFCzUn0OzepIhEODQHUc/R8E
 4HC7CQ0PlNyIimvAUai2Mrkoe7oSeNIGySniwlfKYLSVFKEw+8+RezPgtv97kSk/ZHQd
 JjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gw2rdvOeLSFTyu5coE/6tpknqSj5qiYpDYuyLrc4EOo=;
 b=LmJ1Stg+8ZtDp2Fal7/bPu1eqQG8J3G6EncQgzFuB8Jn7Rp5rMtryshMbUq11EfdT0
 LE4u24M3roEeiDZqFQhckwTadUcKc7gQVRrH30YbLhN+COqIONLQyfETcmwL0iOcv9tD
 No3PZ1BYqQITxPoJH5v1ajDZWPlX6qy904MxKCwt00rDxLxgoe+vkqq9lOz6+B/nf9yj
 3bZX4ejAYljBkNUY/q2wxZPmFmmphYeY4iQ80yXGsSdjo+fUUWP2b5H1Vgk4btapPvMJ
 ymJn/q2PBQTxLNWUVK3CufkBkGe3n+5f6aL5EI0zkeGO4KiR+zitIvekDcnW+WWTCYy5
 2Rig==
X-Gm-Message-State: ANoB5pleu6kjPNagg9gTo79M8RdXum21/wKVQZYvC7OPfdfmRR7TN6xG
 iIotqsGU3cUBuBeLTS6CMl3n+4YDBNMAR7oMRIuSYOuwvrg=
X-Google-Smtp-Source: AA0mqf7IhypdvVlyxpG/JtAnoK5ZXjv9FhOLu2DRIcl5K5TA+WgqqEBYzgIoXozRKPgnKzVYeRHXxQADDXx22agPN0I=
X-Received: by 2002:ae9:e901:0:b0:6fa:165:131c with SMTP id
 x1-20020ae9e901000000b006fa0165131cmr17914556qkf.389.1669374729427; Fri, 25
 Nov 2022 03:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20221125104951.3169611-1-bmeng.cn@gmail.com>
 <20221125104951.3169611-2-bmeng.cn@gmail.com>
 <3a193197-5991-ef9c-55b3-d9e56cac90e1@redhat.com>
In-Reply-To: <3a193197-5991-ef9c-55b3-d9e56cac90e1@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Nov 2022 19:11:58 +0800
Message-ID: <CAEUhbmWh1Gr_eugE_f_5M7rN7dYGfOhm4sdJw6cX51kUNZ_f-A@mail.gmail.com>
Subject: Re: [PATCH 2/4] .gitlab-ci.d/windows.yml: Keep 64-bit and 32-bit
 build scripts consistent
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Nov 25, 2022 at 6:56 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 25/11/2022 11.49, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present the build scripts of 32-bit and 64-bit are inconsistent.
> > Let's keep them consistent for easier maintenance.
> >
> > While we are here, add some comments to explain that for the 64-bit
> > job, "--without-default-devices" is a must have, at least for now.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   .gitlab-ci.d/windows.yml | 20 ++++++++++++++------
> >   1 file changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> > index 99d78c2213..c6de65c784 100644
> > --- a/.gitlab-ci.d/windows.yml
> > +++ b/.gitlab-ci.d/windows.yml
> > @@ -61,12 +61,19 @@ msys2-64bit:
> >         mingw-w64-x86_64-usbredir
> >         mingw-w64-x86_64-zstd "
> >     - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
> > -  - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
> > +  - $env:MSYSTEM = 'MINGW64'     # Start a 64-bit MinGW environment
> >     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
> > -  - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
> > +  - mkdir output
> > +  - cd output
> > +  # Note: do not remove "--without-default-devices"!
> > +  # commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
> > +  # changed to compile QEMU with the --without-default-devices switch
> > +  # for the msys2 64-bit job, due to the build could not complete within
> > +  # the project timeout.
> > +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
> >         --enable-capstone --without-default-devices'
> > -  - .\msys64\usr\bin\bash -lc 'make'
> > -  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
> > +  - ..\msys64\usr\bin\bash -lc 'make'
> > +  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
> >
> >   msys2-32bit:
> >     extends: .shared_msys2_builder
> > @@ -100,10 +107,11 @@ msys2-32bit:
> >         mingw-w64-i686-usbredir
> >         mingw-w64-i686-zstd "
> >     - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
> > -  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
> > +  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinGW environment
> >     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
> >     - mkdir output
> >     - cd output
> > -  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
> > +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
> > +      --enable-capstone'
>
> Capstone should automatically be detected if it is installed, so the
> --enable-capstone seems redundant here ... does it not work without it?
>

--enable-capstone is redundant. Will remove in v2.

Regards,
Bin

