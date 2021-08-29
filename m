Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC083FAB47
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 14:19:48 +0200 (CEST)
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKJmt-0007m1-1O
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 08:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKJlg-00073G-VQ
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 08:18:33 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKJlc-0000Fs-T0
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 08:18:31 -0400
Received: by mail-ed1-x535.google.com with SMTP id i6so17215780edu.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KT+54Niio8kCYWXGMV8Q8WC9hb8+OL6moVEK6el2Dl0=;
 b=VNntiunTI6CXlwe3lJ7KTRuBUvhe+GFFVxQqzpZbmlqjMeGmmXmm4d93W+GqGOU8Pd
 YoUnJuw8KjZBzL557zY7VreXdhJpmV1J3G/PLMH6TrQ0nDUazCPhvVRPuHXaUly6Mpfu
 4FANe2aY6QkIBAfq7qrC1FGXpPpkxrW/4j3Y7thSfCOyD3fdaSBqJkz8xPqHwjXQXlUF
 G1nbtXnnniEmFTXFVS591rGYaxahroh6poFDzPwzjNQ68zrQyftHRjj+XGr7UaKfxUhZ
 Z9YQFgxKy4gxhA2S7GTsCDj9VOENa1HlKFqt7mektyXwIRKvBKuIOfUapI5EwC0WxnTy
 W4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KT+54Niio8kCYWXGMV8Q8WC9hb8+OL6moVEK6el2Dl0=;
 b=OU7gwimDC02qWvsvZvvZyybzQmpwuMYoeOydRBFKS1vhUcJoCUdn2UjtO2Q0I4nZwX
 kp9Gq533KuL8V5PZklxTZtf+gwlQ3fFbDWOQj9iJmXGUtW+25bHZR71C0/BVLC3o4L4s
 Rr73BI2E7NH3JkYHnSxun18cvR1zxME4C/7O7TsP3/yr71pl0h9I3L/w66QhF5+jwABm
 ddOr5yGJmYxn+3aCtNKPjm6cp7Mo9J7pDjTn1hcIKqzRC8gnBEzwVtfg7NrGyKH0xblh
 bSDk+o4y244IVvcSLtm8XBbxSeaDFA/tM0Q4mKFlJnAqzmwXFesvrUc9SkE2JWF1mKlb
 9EEQ==
X-Gm-Message-State: AOAM533GzbcVtCuYcu4X8vn3hCPWRH51cTYYPKFsGDWsfFETWVfScptB
 76fBMYf1RnV+WL6EF6oBEGU+payufnB7Fz+y1lN7Ag==
X-Google-Smtp-Source: ABdhPJwjOGGQR5scVPs3T9BwzwMhCPDeBdn77kqxSjOZXNcdLfdw2vlqreA2SCJrvZSpxs53gNbYlPF90c4OOkfVU58=
X-Received: by 2002:a05:6402:4404:: with SMTP id
 y4mr19129458eda.52.1630239501395; 
 Sun, 29 Aug 2021 05:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
In-Reply-To: <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Aug 2021 13:17:33 +0100
Message-ID: <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 John Arbuckle <programmingkidx@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Aug 2021 at 11:18, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> What I don't understand is that the binary is installed by default in QEMU's sharedir
> so everything works out of the box with "make install". Do you have some kind of
> custom installer which is doing something different?

John has had problems before with the QEMU binary not being able to find
files at runtime (the previous example was the QEMU logo file). I suspect
we have a common underlying bug there. John -- do you run QEMU from
the build directory, or by installing it first and running the installed
binary, or in some other way ?

thanks
-- PMM

