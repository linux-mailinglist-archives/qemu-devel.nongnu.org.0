Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3348A967
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 09:33:43 +0100 (CET)
Received: from localhost ([::1]:35840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Cb7-0002gj-Vj
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 03:33:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7CZd-0001Kp-J5
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:32:09 -0500
Received: from [2a00:1450:4864:20::331] (port=43735
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7CZP-00034o-TD
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:31:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so1326744wme.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 00:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wRXJsVJk6aYul0dRcFrqW3gFfLFaoRi6FSzVaV+6uwo=;
 b=vfDpB339gjKVh0a2wvLqW36aL+qgVJQl0IZ9IqazP7ONVp4ITQoOO6F5c09rvv1/XY
 fWIUcECIwLDV/KKldWmm7DWG5UfZTmyH2CwmFBdmCPXyLWwgi6ZAxdV5sFMU3w92l0S7
 FPOFcj4mP1iXYLCcQG0ouadcN+4zF2fhnDDfrlHTJIcLLN3PU101rwsIGAAam4RCppBK
 eyPwhWUxd3gFrryFcLZoMXTU+47gfB1Mo72yGn7CzGt/AuNIapmT5Uhub3F+ZsKn6HFs
 89pVBvRYhxQUr4VaXfZbDjzRoO/m/ALzRzYkgk0ajX4V3cBbJ8h92qBGAZ9w9aJ5Iduq
 eQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wRXJsVJk6aYul0dRcFrqW3gFfLFaoRi6FSzVaV+6uwo=;
 b=PM94MW5XkXkyTl4AfmeYpfyo07C4/Xgw+WWhcG+8klAaZYIDvFiFEmb8QhSlkciaos
 9t60k0m5H5/AezepBFvoRJfxhDHlV+NmRjQyD7+oqO/V9KNUEwwTIVBM2cBo9yiQoROA
 T1o8Ussor+7yd2KU7DrUQmfxzqxKtSSxGtxJzlJ4uPu28yXmuvFH055acy7yHQmIJ5jt
 QTNrsbpGZqBiLwF4YlfPZ6o1BEHYZ08lYY7Us9YX1HVufzVvi0ZL4PlYH6uFXD3/Uk8s
 fWj2er97MlydRDwH6l/E+vaycnkMj1XMH7D1FCdab0fBFET8sVfyPjgH2NJ4jGk53fC0
 0CgQ==
X-Gm-Message-State: AOAM532fES3QQf6CsR3EdyouZ1PpDPWrmJRZyD9Xh0QVBOUN79AeYQpu
 YAoekr6DUgyWlqt3U3tJo+4ulqasy4hTSVfF76tuiSxuCpw=
X-Google-Smtp-Source: ABdhPJyAvYKLxijbgyXv6nnTWXbvWlEBfQoTbVQN7rbs+y3YH7uChnXFz8Sb6O9Cd25n6zocBri+UpR7W99w5CAsKgs=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr1090425wmd.37.1641889914216; 
 Tue, 11 Jan 2022 00:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20220111070258.2983-1-tgfbeta@me.com>
In-Reply-To: <20220111070258.2983-1-tgfbeta@me.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 08:31:43 +0000
Message-ID: <CAFEAcA_zFwoCSXhqSbEmT=sKTZUvHu+vBzxDwF-6ECbeeUXeMQ@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: capture screencast with AVAssetWriter
To: Zhang Chen <tgfbeta@me.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 07:09, Zhang Chen <tgfbeta@me.com> wrote:
>
> To record screencast, AVAssetWriter APIs were called for each
> cocoa_update call.
>
> Commands for start/stop recording were added to View menu.

This seems a bit of an odd feature -- why doesn't the OS just
permit screen recording of any application without the app
having to have code for it specifically ?

-- PMM

