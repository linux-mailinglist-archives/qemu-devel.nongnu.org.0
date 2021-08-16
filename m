Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424613ED8B0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:07:49 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdHI-00086n-AC
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFdDT-0003gm-5h
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:03:51 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFdDR-0007im-Nq
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:03:50 -0400
Received: by mail-ed1-x530.google.com with SMTP id cq23so9286272edb.12
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gv8sVbwuA31Tjin49tTDTWSCaVZCbIG5xvrtwq0PAQg=;
 b=GBlM7gSKnwpd1fk3RoXzQrbt8bCPm40HtzL9SkPVo3E7LBNfLsifp8rRh5XHWK7xTa
 7TCOBr3DNdnwDEkVUkDDQHk12hWag2dQ6SkI/bwES9j7GIi3cxfQeJ0vR1UHwt7IxnXk
 i/SrbwLLqDkR9p9evNFQ3FCW1bt9611bqSGdENZe0YRy+gaiKPbglHZl9wbsFKiL55sF
 aG68WqWFzQC5bFwMhM7XEO5EIuMZcGkX5DHj9QW6WHRI/m6282XQMaKfXxSdqxB1ms6g
 ySm405LSRmIyeQeMTVQ+U1vYCJFMCBd5XFIkqWLRthDVI8vBFyG65DM6mnBbB+p4oUDW
 ZK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gv8sVbwuA31Tjin49tTDTWSCaVZCbIG5xvrtwq0PAQg=;
 b=a0osS+r+ziYlo+3Ghf1rNANkpISU/2RY4dK4tGI/Yn3mAObdiXxDDq/+oxU4qBhWJh
 BLdvBHOYfGGTaNL5EjN1hTM7Kd02T1xxxZa1aj1P3YE46i4bKcHnIJpuCPeORTCpQizy
 pu/isbEcAIbmaLeqepaxx8G5U5v4JaCSseOjT8t9i5ZHoxcq4/J2e0NC6vPQrA6T8DI4
 csiURSv7DlO+13LEiwpLtVgathgEsIIcMnGpF7ai0zYRxGrMuFAcXRmh25CPW7BHrZUt
 72ko5zqTzzAFS8X351FNI3zm24XPGqyYlMu4y5Bfi0TzLvorr6/9wBhSuc3tvwAXYzfV
 InCQ==
X-Gm-Message-State: AOAM532S/6KyAE0aMhRARlqnJ4q0MyNCSVGiL1h5PNDAVWtWSmsJ5xl+
 jjmfXtI6+N4rZI8x/jXfFraQXgJQ9GnWKR8r+gflAw==
X-Google-Smtp-Source: ABdhPJwp+Gngo9WmVtdS8KEbF3hTkv3y27dsstY7zqq5XGRIaVRYWf6W2N6MOVxl194T09OUX2jaq40mq5YdMXz013A=
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr20191318edr.251.1629122628175; 
 Mon, 16 Aug 2021 07:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
 <6b0a3a08-a57b-fbb6-71d8-3760d76fd265@roeck-us.net>
In-Reply-To: <6b0a3a08-a57b-fbb6-71d8-3760d76fd265@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 15:03:02 +0100
Message-ID: <CAFEAcA_CJXseGT6A36h86Tt7rrgy0T14kXAMGLmR=AgO5W78ww@mail.gmail.com>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 at 15:00, Guenter Roeck <linux@roeck-us.net> wrote:
> The controllers are instantiated (it looks like the Linux driver doesn't
> really check during probe if the hardware is present but relies on DT),
> but when trying to access them there is a PHY error. If a different Ethernet
> device is explicitly specified and instantiated, it either ends up as eth2
> or as eth0, depending on the driver load order. That makes it difficult
> to test those other Ethernet devices (and with it the PCI controller).

I thought that code wasn't supposed to rely on the naming/ordering of
ethX anyway these days?

thanks
-- PMM

