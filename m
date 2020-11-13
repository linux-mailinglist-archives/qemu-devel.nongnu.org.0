Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD52B2402
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 19:47:37 +0100 (CET)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kde6i-0000J2-3I
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 13:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kde4p-0007U5-6I
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 13:45:39 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kde4n-0000LU-Bs
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 13:45:38 -0500
Received: by mail-ej1-x630.google.com with SMTP id o9so15013444ejg.1
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 10:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iwdzo2y5MyzCQR9VPo9/0VDz7Gv7q4SgNuIjEu2Dtuk=;
 b=pf3rhmJnuEUX8RNSEoRNvDoSs/UNmU41qTdFfnmdjW3uJlEhh0KPEWgNzyZyqcqeYB
 ydD5NA8VvIoxpJglzxcMH2iTOHO9NAODAlvb+OoIOvR4gnHAMWdN59scppXHGZ4cX5V7
 FVqXZ9DI6a6dOs/A2Bse7EbaZxfdo7dDMrlEM+EIlhksjwdEew4vq+paHti+h5K4lN1S
 ZZCkPWU9f/JxDR157I1LK25c45g0umrK5qFnxMDQEyUsxjomBEpxN/lHm3EYHp7XEhD7
 rSRTK8+HEddWtgLIAH5kNEl/Ina9vKq98kEeJX5H2A/cK5Rw9ApqFJY28g4AZNygLe03
 T23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iwdzo2y5MyzCQR9VPo9/0VDz7Gv7q4SgNuIjEu2Dtuk=;
 b=fgQqzvoUOX+j16ASPO1kn5Es5/1DfgiowuUqI/kMmiQZObbM/4WcKBbo44tzhi08jF
 lUwhCZkxi4qyig94O+vxi4QkoaUPShUBLArcClY1G5JxieJcOfsDh9OQ50+tyHC3DErl
 G8Qs9wB4zPePbnlYncuT6+oPIpqCDLHBUnqocwaTUFqt+kYPjhcZPBTFsoz5o1loSvpK
 d2aL/1RuBxLVJBVY2yfGUo+Pqyyhd8RTY3naqBF5Nc6mNkRaHJ2UsvjM2LxPMs6eyKOY
 cggDrLY2A9StALPmR1GtUvW/SNNIQGXiHP/YHLuOPag68FGfFFq2DeNUZN1+Zb+0/Y9k
 jtww==
X-Gm-Message-State: AOAM530pZptaO9czCtUl4d2PRLgxP8BPrvWP5ZmpRZDrxhhpojHh5nRf
 eiZQUNaA80DG8lTueLlzAsWeONakpOqZe/9Uhb8bGg==
X-Google-Smtp-Source: ABdhPJxDdwNxIdOkktMlXvKPOLoomV7NPBiip7+11zur0aJTdZgWvoptZZMVTkzCau6e+bMlI/drb7ENCmUF2GgH1+Y=
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr3256064ejd.250.1605293135007; 
 Fri, 13 Nov 2020 10:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20201113130548.127093-1-dgilbert@redhat.com>
In-Reply-To: <20201113130548.127093-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 18:45:23 +0000
Message-ID: <CAFEAcA_dLpHZjJcbHnGjE4ejMV1PNpAPEuTKhH6VR3HyOSrZeQ@mail.gmail.com>
Subject: Re: [PULL 0/3] hmp queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, lichun <lichun@ruijie.com.cn>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Nov 2020 at 13:11, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit be2df2ac6f6b9eeee21cc057de0a119ac30fbc60:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20201112' into staging (2020-11-13 11:36:30 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-hmp-20201113
>
> for you to fetch changes up to e7cff9c68d4a46343861fbc3cc6b2a0b63b2dbb8:
>
>   hmp: Pass monitor to mon_get_cpu_env() (2020-11-13 12:45:51 +0000)
>
> ----------------------------------------------------------------
> HMP fixes
>
> Kevin's HMP fixes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

