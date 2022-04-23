Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3778D50CA9E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:30:07 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFpu-0001z2-8o
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1niFnS-0000bD-T2
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 09:27:34 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1niFnP-0002YS-BL
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 09:27:34 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id w187so9828847ybe.2
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2E6FZ3gHNS0i/E6LnFya14I15kIvikZL6WYp3C+bNg=;
 b=UZerfh6sBlEDqtZ3NxvS+4956UdvXjA20fKoRwX7bHqX3BFgNqWI8aetjvS53lIwMb
 ENs4HtFsD/RguK+6L09XW6OnE6u78EzllWSPa22WpWX7MQ46X62uCaSvDLzCD4iAFxTB
 6t0c491jXjrRoxA/MBGVVc4Vn/EvSyZK3vV/8/FbE7CHvaeSz4p7gT/eE4KfyBd7s7gm
 kesEpxLiTfglykJSpEOA0kglXLKDlVPXxMS3TtI8g/1gcWXN/bFjhkn/YlUd08Tm3Ynq
 I7y+Z7Go3YbktR7eBLr8Gy+adHNuc+QuW6AKa4LIDyIhHTDFTkcLsWQkESjbhdNjcyPh
 QkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2E6FZ3gHNS0i/E6LnFya14I15kIvikZL6WYp3C+bNg=;
 b=LJL7QC5B+cWgJzE2JwPM0D4r4Yh5aRjyKWOQ1qMg6++3NuUJtYj6hcqcOd1WteaA3J
 kPksP8vfZug1Q3rIGDuILZJmNkmakjEFlQ5f6Z2o1Xw8KQqpW+QM4xa4a/NDMigV2YYp
 pC9FzkeZxBY9V7iucioThiCiavSvLPyqMYiLE+jmh4d3Bp1azmOusQIEsq5KFpvdr86M
 nvD2cDhIQ/dk1k53In/7BCMFc1l7CxJVX1u9bcFHA6+82HkpSYb/NOtoxXkJKWE9uFwe
 f8YTXmWOM3lc2tadB1kDvyGLxBncTC2GixL996zCg+khByL9ph1qxoAqSQpNMUH1I+ej
 Qe3A==
X-Gm-Message-State: AOAM532KzgjIRWiBqgQkWUDUpGVVYOhTUM79jZWDlHooQhy403M/pT1p
 XP3hR3PvPPTcCZjHIaegc2bw1ZhSaMjDEfw0o8zjqw==
X-Google-Smtp-Source: ABdhPJwcWN8KxF03l1SQ+TGv9hhOQfB8TgUwdW0hmZlIHfuYBKPj0BqlYXiTNs7vS9HXxbfBg3qwMgmZMitYD9qDHaU=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr8730881ybq.67.1650720447861; Sat, 23 Apr
 2022 06:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220413172246.73708-1-gautamnagrawal@gmail.com>
 <CAFEAcA8Zs9SStbHYPgprODCav1BkMFqKhizt5Yp_XmZ05bfLLQ@mail.gmail.com>
 <CAG-ETXv8cDEsN5a=raQRTMky6uBh9EpJAhB7pNd3GDOwACX7Aw@mail.gmail.com>
In-Reply-To: <CAG-ETXv8cDEsN5a=raQRTMky6uBh9EpJAhB7pNd3GDOwACX7Aw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 Apr 2022 14:27:16 +0100
Message-ID: <CAFEAcA_ZQVcpiapKFheGZYUL=eW5P4EDGB868caYPWziQf2jQg@mail.gmail.com>
Subject: Re: [PATCH v2] Warn user if the vga flag is passed but no vga device
 is created
To: Gautam Agrawal <gautamnagrawal@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: stefanha@gmail.com, thuth@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Apr 2022 at 11:00, Gautam Agrawal <gautamnagrawal@gmail.com> wrote:
>
> I will make changes in hw/ppc/spapr.c . In hw/hppa/machine.c ,
> vga_interface_type is used inside if condition to check for graphics
> device creation, but I am not able to find any relation with creation
> of vga interface. Could you kindly provide some pointers about it?

It's exactly the same as all the other places that look
at vga_interface_type -- it looks at it and decides
whether to create a graphics device. (Arguably it should
not really be saying "anything except 'none' means create
the 'artist' graphics device", but that's a separate bug;
all you need to care about is "did we create a graphics
device because the user passed a -vga option".)

-- PMM

