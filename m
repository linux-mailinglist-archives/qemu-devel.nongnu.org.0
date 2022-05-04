Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E0B51A461
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 17:45:37 +0200 (CEST)
Received: from localhost ([::1]:43880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmHC3-00029p-Kn
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 11:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmHA0-0000DK-LY
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:43:28 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmH9z-0001XA-3u
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:43:28 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f7bb893309so19729867b3.12
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OnRe9N9lGAra62wv4dwxntYvcl6x7jmx2uSKmZ+uNt8=;
 b=olCpXQX2ALBPO6eqxvzIeVOJh6RG0WPtLuur9N88uue2p+A6j+S5oimJuBtd9dzzoE
 dyrIJpCIrIWNrdJ7gtxLXZ//UA4HKPZHKs6mwUVFwYYkJ0UrrHDntbcOypYP0gTWecDl
 +fulXbyaJqKKnQh40thw/K6k8CU5Qnjv6OdxOP+5aBsrpR+f3qQkTKVxfFhBJhV4tXS0
 4BdzX8rtLLDZ4IOMatCDkw64jVHyWDrooXN3s9DwD/myLFh8HGF/Sy2DPNvTzQZ2yKiT
 ieNM13Aoe0ZSh3WYSCweOeuIU4ZAvsRILAzn8iEVbktxoZ2bZ9fhiL/IQwEvgcr2lR/D
 BFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OnRe9N9lGAra62wv4dwxntYvcl6x7jmx2uSKmZ+uNt8=;
 b=nXF2jQAGtbhnrTh2Oe7+h6z5K0lgU4IoCjTqf/hqNnKx2eCB8dqV9pM+hF5CI6FL82
 dm5UB7Zc9v4AWdhtVTrf1IhOVTbl2qIbp5Z/lmycG7gfhXiDYspmc0uTN5PuyCuwVbI5
 AyfUL1YMY4uQbSD3gWeSft7f+wWtK/J7rvmgcKsL/fiaB3sY0Tz0vcpocdMdk6uUnym5
 AJkQHKHO3Lj4eBJ/Q+kSvJ/QoaUOSt8ECMeb/FdDpmoGax4pXrlbCtrvu9F8ZzMLDAD0
 McBrhAKhXHVaWeoA4aUZXad87ST8vBjWf6gk8sThyam+V/CLVJ7oZI5UfU2R20k/HfcZ
 0BCg==
X-Gm-Message-State: AOAM532Fg/n/o4q/naPePszIAvKkBeRzRTQf3uAamMg1rZn4urvdMfRN
 suvAtSLPwO7p3HrpvpgKwrGanunTy7dIn1tSaYk67g==
X-Google-Smtp-Source: ABdhPJzALdmJzUtuiUDqwhwpvw4QzO7/UdTwdFA9fHIDkhzFXNKDnvjzd00zgNy0WeENH4Fz/P00m86UuWFUM5LrcdU=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr20278396ywf.347.1651679005768; Wed, 04
 May 2022 08:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk>
 <20220504153708.10352-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220504153708.10352-2-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2022 16:43:14 +0100
Message-ID: <CAFEAcA_MXejoxfyiHZYhkJB--E+w3-osKXYONw4UgSfs9RkhGQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] artist: checkpatch and newline style fixes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: deller@gmx.de, svens@stackframe.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 4 May 2022 at 16:39, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Ensure that subsequent patches do not cause checkpatch to fail and also tidy up
> extra/missing newlines.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

