Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F0C48DD4B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:57:39 +0100 (CET)
Received: from localhost ([::1]:38204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84Lu-0005IJ-W9
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:57:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83ov-0000Oj-8h
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:23:32 -0500
Received: from [2a00:1450:4864:20::334] (port=50788
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83on-0000sq-Dp
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:23:22 -0500
Received: by mail-wm1-x334.google.com with SMTP id w26so4416655wmi.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mG+9qLAW74OQkW+nLWv+bOW2rU0HVU2FCvmnMh7J1P8=;
 b=FdiQrEhuegiswATrCszFIxFpFSSnmT7WRUC0EaJd+qPoRbWtYytyr76PYJFkTL7g4N
 DdE9cvNBC96YfOUh+JQL6fqmf+hLyAUD5VpNHv1vpUwCmZ3WvnXALf4XXPgh9e3S6Knf
 ZrkH2xakB9iN+WR/8tBK2gl4dI0HYdtyPOtZMQCokZde2x2FaQmmfj5Hh0iKzO0+KTUc
 QFS46L96qDe+XlC7xGFaJouJCsSssRPoqc7bLRw+1K4Mkg5xOFcKQCTUL+NYvmLWoJSB
 7vuG91dTwOFgfXINMsaQlTJSxr1KfNwjkjcpSsdWoxbKfqUNdRdcR60lmbWgv/c/Hj9Q
 drJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mG+9qLAW74OQkW+nLWv+bOW2rU0HVU2FCvmnMh7J1P8=;
 b=w0Wjw2nL0z7jTjGphABrk+grDYqGNJW8bGaTFisUshJFWQDIiXVABPakBu9Wo052zY
 iMi4uSbZKzm3vwvIR6Dx7s15fo8dW0qnuek82eN2ujCHXEH/xx7fTFPx5oD2hXmwzl81
 bQek9jhmn66xgEHpuod5B/rwVoduhkOJEXpskQ/axY9a8mqWkTnUwQCP7juHVhvpBFKp
 4T0cIeAMZtR9VlMm+B+4cE0+455IsIlj6hkzizrqy1Uzye4vpWugUThPI1VoufLCVeYJ
 N9D31TOs/XULoKrrZcYMFM/Q2+BGmrkTsKeH05EN4Q5xgJDWqI2In9IJcX+lDKSGUyau
 mWLg==
X-Gm-Message-State: AOAM533KjmZg63jlaU1bBUkQz4P8I7AqrYvdM2DzvbKQSVMaEGl2BEl2
 eKJnMFN87RZT2SALD9BSTOHmJjn4fRvKLjJ3Wu7quw==
X-Google-Smtp-Source: ABdhPJzP4eOJJk4g96TyD4PrtZWKRyK/hJXVL41ZZvlT1CWjiwB/z0c/ziPMGTut+yCxK0YEIP1aemNmfqWw2L8G95U=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr4826181wms.32.1642094599950; 
 Thu, 13 Jan 2022 09:23:19 -0800 (PST)
MIME-Version: 1.0
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
 <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
 <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
 <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
In-Reply-To: <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 17:23:08 +0000
Message-ID: <CAFEAcA_qkUPjSz2PQTxtkTFuho=HusONxN56e9z89B8jHrOJag@mail.gmail.com>
Subject: Re: /usr/shared/qemu binaries
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Liviu Ionescu <ilg@livius.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 17:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 1/12/22 14:56, Peter Maydell wrote:
> > Those are UEFI firmware images which are suitable for using with
> > the arm/aarch64 "virt" board. They're only used if the user specifically
> > asks to use them on the command line (eg with
> > "-drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd" or
> > similar).
>
> There must be lots of zeros in there. Maybe we should tell QEMU to
> unpack firmware .gz or .lzo files?

Not hugely keen on adding more "do what I mean" behaviour...

-- PMM

