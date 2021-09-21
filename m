Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53056413382
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 14:44:13 +0200 (CEST)
Received: from localhost ([::1]:58396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSf87-0001XB-WF
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 08:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSf5h-0000Cx-Ab
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 08:41:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSf5W-00088L-Ug
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 08:41:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id q26so38716002wrc.7
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TgVCMqttYjBLFjBkXWwh5RvmoR4Gp/bH35/ocszkT6A=;
 b=W8Nz5KmqaWOjLZ3ekflFDCFboN+jWcwumGRDLcX4IWb1VGhkVMQ/jjGI9jNmNInn4m
 vjBVJk6WYuUCWIxDmC6GaUlDDpynY0zRKc+zR4ZIqexZC1qnaYT/EP4yTP7alEXIw3i9
 099nST/qV71SzQWd6p3bUMU7RoJUSUrM9cmp3j3EOUjM693mODeO7m7/Cb8CDsgiFAtG
 WeBUwGqqC/f9GkPJDQBPZl5St3RL1rGIJIQTW9GVSFQBVtsjfuFoN7IpD9+VtobB4oAS
 cJFPSCGCeTogo5fvREwuKHY4VOb9hayadc92VszRVL/TSFZIm9r7BESOSYRjQO/5TIS3
 eiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TgVCMqttYjBLFjBkXWwh5RvmoR4Gp/bH35/ocszkT6A=;
 b=kmjehkrwFUrxgX5XII5TfU519o7K80lEUjaKLOL3DXIboE9txf+zowHs/Z+xB889ao
 wsLeum1kWkJBd4dhrGHmscq9tHj1IGHHTmby66NjGXUhOlR0yFd1GrxTHw1K7sqoPTrD
 fOc1s+0RZzNvB0AxGU2S5CSZgujsQ/lGyus+6uEbzsrJwodLM2xR+l2qcWxpjRZU4Ozj
 ZBFE3YBo76sTCtEGrcXSggLRsDd2ssAnVI+8vGrBnP8ccLLSOnYssedKJ2csi7JytM8H
 BIgFUeVxYJGU8GoIsYn1G74nRJe/fmLxQgLM4FGhvsg7lRZjW6Jyc+W/3p6+RX52AHVg
 s45A==
X-Gm-Message-State: AOAM530/DO9F2WxfpFcfbOKg6cjeNAVlE+5L8TjlVPmu2iQWTFenIFaf
 0YiP5ekmr2DLlS76kfXF3Y73aAFjbUHIu57eC/L71Q==
X-Google-Smtp-Source: ABdhPJxXtbBujmZE11ibSStIK64NBnvM1Tmy4qXaMwd79drCgjzL7ZCK/BQJsYHQcB7+NzF0llRtK939RoQeQeq15N8=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4443678wmm.133.1632228088906; 
 Tue, 21 Sep 2021 05:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210918093140.5797-1-pbonzini@redhat.com>
In-Reply-To: <20210918093140.5797-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 13:40:36 +0100
Message-ID: <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
Subject: Re: [PULL 0/3] Update meson version
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sat, 18 Sept 2021 at 10:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to ccc3f971c37bd2202a21abc9f0be093f10426364:
>
>   hexagon: use env keyword argument to pass PYTHONPATH (2021-09-15 09:12:55 +0200)
>
> ----------------------------------------------------------------
> * Update Meson to 0.58.2
>
> ----------------------------------------------------------------
> Paolo Bonzini (3):
>       meson: bump submodule to 0.58.2
>       meson: switch minimum meson version to 0.58.2
>       hexagon: use env keyword argument to pass PYTHONPATH

So, I tried merging this, ran into some "is this an issue with this
pullreq or is it just an intermittent or infrastructure" issues,
and decided to postpone the merge for a bit and retry it later.

It has made an absolute mess of my incremental build setups.
They now all fail with errors like this, even after having blown
away the build directory and re-created it:

Darwin manooth.archaic.org.uk 19.6.0 x86_64
make: Entering directory '/Users/pm215/src/qemu-for-merges/build/all'
/usr/local/bin/ninja  build.ninja && touch build.ninja.stamp
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
[0/1] Regenerating build files.
Traceback (most recent call last):
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonmain.py",
line 140, in run
    return options.run_func(options)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
line 245, in run
    app.generate()
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
line 154, in generate
    env = environment.Environment(self.source_dir, self.build_dir, self.options)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/environment.py",
line 523, in __init__
    self.coredata = coredata.load(self.get_build_dir())
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/coredata.py",
line 1016, in load
    obj = pickle.load(f)
ModuleNotFoundError: No module named 'mesonbuild.mesonlib.universal';
'mesonbuild.mesonlib' is not a package
FAILED: build.ninja

Is there anything that can be done to make meson version bumps
not a horrific pain to back out ? This seems to go wrong pretty
much every time.

thanks
-- PMM

