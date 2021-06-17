Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6DC3AB4A7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:26:03 +0200 (CEST)
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lts1y-00031O-Un
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lts02-00008x-Gw
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:24:03 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltrzx-0006bi-GE
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:24:02 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ji1so3740122ejc.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRQcjT2cwM0/VPiO9P1eTnmzyIZVCOPyKu/hBcTXmJU=;
 b=qGwxCSdIIaemwdsFO8YCNrJ4kfsG6ZSPoSajdjQmlVGubygUGEtvuUOdFs9AYrhKs0
 aEWI3hcoztG7OF50SzgKi4GhnO3HQS3KHSE5MIw+kmO7BdamzwfFarzRKQRVj0iZQTVk
 ATF1sxuznbS9mRknphFPh+8tXmM2xFgpnOcox2+qri5k6NhpuLMtGyFxu5HKwyepsvGA
 ZxFmT4leBIhIQpclV5Y61O/WraO/nBDj2CmIT3Jn7DcAsJXY5Ifz+GngsXyFZmH1YT7k
 Jx0JR0pZBY3LenKPvUnuWbR1yNm13OI4oJgaZ2b9tdY/Idqsc5T5+fHCGmJoYJmWLFFn
 v3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRQcjT2cwM0/VPiO9P1eTnmzyIZVCOPyKu/hBcTXmJU=;
 b=tUJDe51S7mb4TROeNRp9JgpOujSXJhMT8cr1ZvE6ZoMo2FNtG/J8yT5va9IxAYzP/N
 kp3nCqtJjTow2DtRZ4si9+VHHhoTNHrmEZsZAy5J+VLj6T/bVgohpJtVw13NCWtqC9BC
 gmsZLB8v+MF+4GHuMGoUOK6juryScD6GMjhks/vt9Nb1lo8wOzh3okO/bgbdxgKIcD6Y
 5drMiNj+Y148t9GDAEyVAbenOiJ1JEwMjFOeXYiM9+fuPFdgl+6c2+3TJF4cLQtQeVtN
 QC8XpN71loQ4eNk+k1G1kW4AsjekF6a4A/UGzGtojkHM6zFjxvtQ0DVdPSDOqdd+ZvNr
 XZTg==
X-Gm-Message-State: AOAM531rwZZmTyiwBvT/iDTpAam9FOC8ItmwDKqjL/SyRaEIj6MPHcyW
 nVT2xvJRWyruwvsG7c2nBkqccp3M8J2nT9/lCI7a9g==
X-Google-Smtp-Source: ABdhPJwC+pqzE0wo7g5lkGF5Jiq0BbSwC9knslkY9t5l8eropLbSTtOhqnZB4IFM7MvoM9mFDBI4BEWHHFZwUtuq67U=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr5224849ejc.4.1623936235491; 
 Thu, 17 Jun 2021 06:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-36-peter.maydell@linaro.org>
 <54fdcf6b-2498-feaa-f977-f86c567c8dd1@suse.de>
In-Reply-To: <54fdcf6b-2498-feaa-f977-f86c567c8dd1@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 14:23:20 +0100
Message-ID: <CAFEAcA8h+p7=Dy5uQEs0O_9vJge6hbNeGwv-rJV0AxGdq=biKg@mail.gmail.com>
Subject: Re: [PATCH v3 35/44] target/arm: Implmement MVE VRSHL
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 at 14:20, Claudio Fontana <cfontana@suse.de> wrote:
>
> Hi, typo in the Subject: "Implmement MVE VRSHL"

Oops, thanks. (I have a feeling I caught that in a previous
version but it then slipped back in again.)

-- PMM

