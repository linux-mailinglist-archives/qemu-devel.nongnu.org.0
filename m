Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A715B5E6757
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:42:19 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOLA-0001DA-6A
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNq0-0004zK-91
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:10:04 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNpy-0005MZ-LQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:10:04 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y3so21781515ejc.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=L1qwjJUgC4tmrmpbKzQpk5UW5yrSYzDz/EtHRzwrhGg=;
 b=BqAJIN+IRm8E347crlXH4I24yCTReJW670jJDKgpUe6AoSPAQoBRhCO3kPcKUCdzYl
 0ZbmM4DtjtMjQBtHq19KmC8Y+HkUuG+kqU/pXkxi2QUDtlAD1dI+mNdQTbygIVixjen3
 15tq5wB5A17Vga3hHNCUqF9d4RzkfQk8Xm4zMtwhWIi8Sfks1uWa+ZUD1BOwXTuAfgrj
 yoaK9RjF/c3odq/D+WY4PQfE22u1o6nHEM2o1cecvBpWOtEjfCcbIe8M8dTCkXau+jsg
 3+bMaJD6oG6At1rgT0vRPMmQ1O0Dzy5JCA69gQx/IPxC3gS0HDA48zFCo9v6yezHmea1
 ozJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=L1qwjJUgC4tmrmpbKzQpk5UW5yrSYzDz/EtHRzwrhGg=;
 b=olTEKFqqNE6P07Cjon1BE7DoGGyi7UyT4kvadrTaJn4lz9mJskZFTp1HHpnbOMuOI8
 CjCioOxrB+dfB+bsXXmdFTTWwltImdScH+BwbzW+fPlLHsItrTZfkfOGnFUfSYIbGVEX
 USknVunw0t41983Lc3Jh/ZF9Es65DvgC51ZRJT8SEAirjWgpuvIEzrOTix07PgFpOC+L
 MkGrj2+YtUHfgXugweIMK8un60BPh4eoRK2NAweYNmoflJLf/CzDUhQZiiwaPfCO4g0T
 lALnaSSY9if6t0Pun5lPTwazCYVf3tD6t8w1tHKXJInstDE/GpvLp4Di4gYnzrUASDUr
 HOPQ==
X-Gm-Message-State: ACrzQf2l4HC7+2FQGlgAksgqU/5m//aCMoBPmfzMGfEwr8qztiIjgd2c
 PCMDK1HaaeT4bFxL3Y6tKWzO/FM0sEAs8cqOeLGFKg==
X-Google-Smtp-Source: AMsMyM7G7/SqN7xE2E4Xhg19zGoJYTMn4zLIkDpDhGFAEtmprqzNZ9G12yK6DQ+cJcDWQoacI9fL8PLMLngLsnubwcg=
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr3242913ejc.555.1663859400513; Thu, 22
 Sep 2022 08:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220913182149.1468366-1-titusr@google.com>
In-Reply-To: <20220913182149.1468366-1-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 16:09:49 +0100
Message-ID: <CAFEAcA-onpK8H0rPkjGWyAriVciPgbCYWy8oVaDfKW9op6NUvA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Initial PECI bus support
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter@pjd.dev, 
 patrick@stwcx.xyz, iwona.winiarska@intel.com, tmaimon77@gmail.com, 
 quic_jaehyoo@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Sept 2022 at 19:26, Titus Rwantare <titusr@google.com> wrote:
> A lot of the registers are hard coded, see hw/peci/peci-client.c. I'd like to
> gauge interest in what potential users would like to be adjustable at runtime.
> I've not written QEMU models that read config files at runtime, something I'd
> appreciate guidance on.

From upstream's point of view: please don't do that... Ad-hoc
config-file-reading code inside device models sounds like it
would be very confusing, and wouldn't work if the system is being
run inside a sandbox.

-- PMM

