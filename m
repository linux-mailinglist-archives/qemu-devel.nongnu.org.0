Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B1C3A82DA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:29:27 +0200 (CEST)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltA4E-0007ZC-6p
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt9t3-0007HL-RM
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:17:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt9t1-0000s5-Uf
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:17:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dj8so51355346edb.6
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hXW/ltLCcutNk4vWviqoJ/1sXlAvfO21Kt6d9R9a0fw=;
 b=LIi7eC+7iSyQg3NoSUUBHmHnaHu6X9W4XSz9l1gedZszmWXchc73yYhw/sIbPKcaWi
 lxM8GGMOsIU5RDIZsg1G4yTqSy8YbJoeTfdlsaK7l+kNQmM7w66oEg/kFWZl//HCMwML
 YquAJGcVrJL3K7xd4kUeiRmDJv/jTfkYhduVKYX/Kbg3xyoTh0xBOqN7VlPslltWdS7E
 0wvAclBjjWI9ZLclljyuIL6N1zodBtim+MaaHgtiDmGck9NgmG5LAXzmcUEuhkcQPg4f
 kx0fBoWLJ3SdwLicK0IjiXLl83qNVxtCIh8j9D+BI1GqYgw98T7N0A75K2NNCr+qhKVc
 8kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXW/ltLCcutNk4vWviqoJ/1sXlAvfO21Kt6d9R9a0fw=;
 b=PoNVzXeSBNYm4hMw1DP318gnkWFd9i6YrCJBVxj5cnMwUP2dmYUE5UuihU+zhhElYv
 4Iw3GloVQfZAMWojTxQhIAEUhy+gyuNcr2AYAfaF10j8nre7+eLGZKSbO+25lQ4Szc5M
 m2yKvaforKORWkooaHGra2CVJ2mPsYm84mtcFaSLojDUPL1eZfULbPOJQBsvsPSvhwJa
 nmbENl8Ik67UMZb4ChFpFTpRGV1AypgDmOmkXxtisoH/UM9bZCTBG4hklAwXccoQA876
 LlzE9N2h2NKYjVLHCXHkxh0iA/T+iiubiCEwbzn8XW0pXznL7rIHb2Xl4kTSlHH6MfMX
 B/cg==
X-Gm-Message-State: AOAM533TOsTKUAYXdeNh8c1CGHgnMP8fPqk24TyRrdwrHLqVt86rfaZI
 yCZq7Ol2ipIzcfijMLh0erTTR6l2tV7tQUFBj9/j6w==
X-Google-Smtp-Source: ABdhPJzO2uFqJzReimKtcrpVVPR6fTIrgL9DeHJYigj0Hp1VNl6UrQXAqjZKufKB34tDrronLd3u8pV9P/d44DDUmp0=
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr15374414edb.52.1623766670337; 
 Tue, 15 Jun 2021 07:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210615133855.775687-1-pbonzini@redhat.com>
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 15:17:15 +0100
Message-ID: <CAFEAcA_LNDqvLS7g7RqPHB54nrphjkuF3w=K2x-wX9D_oJfhKA@mail.gmail.com>
Subject: Re: [PULL 00/33] Misc patches for 2021-06-15
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Tue, 15 Jun 2021 at 14:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 429f60abe15cca9046e6aeaffd81e991e34c9bf6:
>
>   configure: map x32 to cpu_family x86_64 for meson (2021-06-14 20:17:55 +0200)
>
> ----------------------------------------------------------------
> * avoid deprecation warnings for SASL on macOS 10.11 or newer
> * fix -readconfig when config blocks have an id (like [chardev "qmp"])
> * Error* initialization fixes
> * Improvements to ESP emulation (Mark)
> * Allow creating noreserve memory backends (David)
> * Improvements to query-memdev (David)

Fails to build on all the BSDs and OSX:

../src/softmmu/physmem.c:3572:55: error: use of undeclared identifier
'MADV_REMOVE'
                ret = madvise(host_startaddr, length, MADV_REMOVE);
                                                      ^

-- PMM

