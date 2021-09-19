Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBCF410CDA
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:24:36 +0200 (CEST)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1UR-0006G8-Bc
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mS1Qf-00028S-FC
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:20:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mS1Qa-0002CJ-9N
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:20:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso10456069wmd.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hifYYtUqmlTsOxWi24+GtirEuKw3iowy6+D9gW7/IGQ=;
 b=XCpUgMS13IVA0Nlk+TA1+IrAGYiiLIqnr71IIUQUKJdei33snzBCtQW7r1mM8NGa6+
 l3+fzvvXRkSIrKNm3WzQVpSHnCVsCnC3J7VNMIbRVKmFxNHZICRHae1KvG8FSz+UdCoH
 0P37MbuQOMihv2GH/Y+f7UHfjdvHF47adIuUG8Jcd/7h+mPnQZd1W3rTmAJDd0FsmnUh
 h+zxw/TPefricZEhYOr9Te4UqXDRXPlcG3raazqr1oXjcietUjBT5Q0z4djq7yeUpmiU
 o7gcoKDLAah4+BeBCUMybVr0aInfVXgCrSZTTZ5qQXJRxFYgdkBYz98cVmZJtgOlOWHC
 k8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hifYYtUqmlTsOxWi24+GtirEuKw3iowy6+D9gW7/IGQ=;
 b=bVx2R0BDxrGVfCinHjP23LDG3D2JDChQ9PCrStuy/DaNQzOP6Kg7VJrcbjzgDKMZCZ
 g+BPVwBdHQ9GMdUTS9GHry8ED1jm1Ax2soLI8oz2AtOrnSH9qQMiAvRiRucqfnyZ7D9T
 6V+W4P2bsD1NWs/MU01AfdmdTCCZcpKV8MXNNO7DpwtVIkkqJCSoXqgXjVM3N90krSvp
 IvSLNu7e1LvcbqqUQpUQiah0EjLDDsoEXGzSaHzpbcWg8sKZ9Ue7jnuCjh6POuN13k2R
 XIUjifXH5j1qPd5OUJ3on1TFLZoEjKwTFGfv4MItk0W4XNSVRntsegRalbEjHqIAEafd
 EDxA==
X-Gm-Message-State: AOAM532/SF9UPPYuGkyUCc+844OcBNvIkkn8ecsiLLSGEU05JJdPahMB
 aJKXmvpHdubySIbTti24rGyFoX0VjNLRP5tE67CFlg==
X-Google-Smtp-Source: ABdhPJwqME3a2edAUstMm6roqbJJJiNElHNrHX6+/wiqfxWnC9CMkq/yfr3v9moHekjauvL3lOqnMkHb2+7IZ2nVDn4=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr25768612wmo.21.1632075634196; 
 Sun, 19 Sep 2021 11:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTY_-tms4RjWXDzZJb2+fpentTO3J6TB3n4tHwTu9huNmA@mail.gmail.com>
In-Reply-To: <CALUzjTY_-tms4RjWXDzZJb2+fpentTO3J6TB3n4tHwTu9huNmA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 19 Sep 2021 19:19:42 +0100
Message-ID: <CAFEAcA_p-x37xM8mTudF+ZK3pMtaAeRJ7mnQsx0nwMx9m_NxCg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_to_fill_a_memory_region_with_specific_bytes?=
 =?UTF-8?Q?=EF=BC=9F?=
To: Duo jia <jiaduo19920301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

On Sat, 18 Sept 2021 at 03:55, Duo jia <jiaduo19920301@gmail.com> wrote:
>
> Many SOCs have unique id, which is a fixed string of bytes.
> I use "memory_region_init_ram" and "memory_region_add_subregion" to simulate this region, how can I initialize specific bytes to fill?

Mostly we just model that kind of thing as a register
in an IO MemoryRegion. Often it's not a single thing
on its own, but is part of a larger device or other
block of registers anyway, so modeling it as part of that
other device is simpler.

-- PMM

