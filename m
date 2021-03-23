Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A453345D15
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:37:58 +0100 (CET)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfMC-0006fl-HA
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOfKy-0005fV-2a
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:36:41 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOfKt-00028l-HV
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:36:39 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ce10so26515546ejb.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sFHsLSqAoUCk0Lkk/3/WJkxqJ6Pe4HAEBRo8EESCje8=;
 b=LvgsptxMt6Y9tPn5NxQI5UrC1bSFQwzKbFzy74aJewZc2m/j8M+JNhJADSjQm/+fgp
 xieA3gHMJkcX70cAXw1BHi3jvm/z5dlHPekrxi8KV7yreRN38kaH5o4i9SKY1Y8RsMrR
 2K/qK+C3ynLpuTxWUQEMJEy/RjbWzkmY7tanucF9Bzsr4lKt/IBYdAEXAfd8DMEgEyBO
 w5AGO4LtYdJwGAa7/IH5WXd4Gf/2YqFmMsVv+orpIaon4X258Hb4xZOEPLJ0uC9JP4BU
 ViF9OWtoDyISBRgkOCw3LoAR1kaaenDVS/xkzge+5Mwa4LGeH2mH2xC7ellvYDwLtSis
 8c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sFHsLSqAoUCk0Lkk/3/WJkxqJ6Pe4HAEBRo8EESCje8=;
 b=CFHQ3AH2wA1wuQz3Y13VrXQsVf/T1IEvRX+L1RTCaJY1MPpu+wmhpKlfQxh9udh6Fv
 k3NLGS/XNvRH33qcncA7BMkNgZNdg1eYZW+0APJ05ENCrnnI2dUZLgcHfCpAglsmex5T
 ULfjKKtKVeOngOsigxTHZdl3QNfwM7bvaD7CXkPTwTUOEt892cJGHlY390B0G5vG5JYX
 DkcTw8Rnn1IgC290+LovLLAqBWBSyjUdTKvNoVZxFucwA6z/DYfqaTX6F+xe2qErKQoV
 gv+RdwAOdImQncVwLncb+Vj5I+cGcPV6dYcyxIUW2xoDIw8dtRTKPlyKDpyGkVtuf7iP
 N66w==
X-Gm-Message-State: AOAM5326m4xSD7sUu1rFTRvaiLw9HGoPTyM8F7pqy+++kpEOh/1Vbkg1
 fObdIbyWQwcgRpWomDzzYgK4RfY9ckeGgFlZwiGsYg==
X-Google-Smtp-Source: ABdhPJyvh9s1tb/Ww4J5bf+M3nEQQfGTpRM//fQfCKCuvuOPlb1mXuF+pYgAHBLjR5OfargX017L7FIdFXQnY1kg1Lk=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr4595457ejc.250.1616499393134; 
 Tue, 23 Mar 2021 04:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
 <YFnCfhiaixbn7lMy@redhat.com>
 <CAFEAcA_f2fMmVS=Pt6Zd7Si5L2YfRMH+dJZ_pZd=E-neKpxUOg@mail.gmail.com>
 <YFnRBwWPAA9TRntZ@redhat.com>
In-Reply-To: <YFnRBwWPAA9TRntZ@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 11:36:04 +0000
Message-ID: <CAFEAcA_BL1myi878cE5V48EeUpvzq5HUMgU5fKP74YRsutjdjQ@mail.gmail.com>
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 at 11:29, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> The theme is pre-packaged for Fedora, Debian, Ubuntu, which gives me
> confidence for Linux distros in general.
>
> BSD / macOS / Windows, who knows ?

Mmm, good point. Marc-Andr=C3=A9's the one who's been doing the work
here, so I'm happy to leave it up to him if he thinks retaining
the fallback is the best approach.

> We could check for rtd theme in meson, and disable the docs build
> if missing.

If you make the docs/conf.py raise an error if the theme is missing,
then the existing docs/meson.build "does sphinx work?" test will
disable the docs build. (You would want to improve the error message
to note that the problem might be missing theme, though.)

thanks
-- PMM

