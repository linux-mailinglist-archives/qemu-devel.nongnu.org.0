Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5319C647
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 23:32:25 +0200 (CEST)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i207c-0007dL-N9
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 17:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57043)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i205Q-0006zg-A5
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i205P-00059X-Ap
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:30:08 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i205P-00058b-5Z
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:30:07 -0400
Received: by mail-ot1-x344.google.com with SMTP id k18so13445312otr.3
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 14:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcbXfVPDRvMruywUePiDxdyMGKE+qItIEXNxFhjrMTQ=;
 b=R6tM3LlikQl74iYiweMFCwEuXyy8f3DDKcA/5Vmbx+z/NpNdzN6DKwlfFTPj+Ar9gh
 dTlES2KdWhMqgZGOHpNoCym5b8w8S0QxdsERBH1JXu00hJUHDzjZ6T2PHS2ObEvjVzxU
 LNRnV1nqciKHJt8K1KnyRyEwxYkghHqOoiGgxTdaowA4BCGaL+3F1mejMsAf//xIH0LU
 ewnPcm/yKS3N27+qO789ZNlma+vIIy1dMLjzHgHtyt9zB6hTlpHEgVqnvr+rbsFoEKnd
 VdtFyrb7s0e+0YP2qKkJYB/nkKqIMKQnSSt3i8C6XAE+yJaVMtmQ4jpzcC8xO+2FYwwP
 knsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcbXfVPDRvMruywUePiDxdyMGKE+qItIEXNxFhjrMTQ=;
 b=tXsou+LYJUEgf5doias7MGnKg02utZPuG676Bbfg6FZ4MYoEx4HYu+E5u6DNJ52lmm
 ZpNJLkx5y2RIlSil5cclxLV16TSZaDwGge+2bl+lYhi4OQbdLV4+LNcBzg1m6EcsRWA5
 wJ+C4GOGDBBO1XNlh8zHF++HOYHbhXCIqvPh/vuW/i9ABVqCjjMHOP6KVVRfnCHL6A7Z
 N9fp3XayNOqovZ8K3eLOFIrWVkj7E32huLJon/hiYrhVUPIbXh4wBYJnKNdxoxzHExaY
 fTRi2703waqwhvf7NJ/DbpuJC/DijxFPdV8iNwbmQTABzCxnC8SA7mCwZC8F42hk4mCU
 eugA==
X-Gm-Message-State: APjAAAXVqmoSePFEZzm4UCScpR5bffTSep4g7LR3ZfvlWMOHJEQniXyr
 BGjNs240RtaRC9x/MbCwbicsdANtAfFBcz23+iYRIQ==
X-Google-Smtp-Source: APXvYqwirg+pxEG55OYiSjYUDgGSBWarieqotvDAJc3+yFAgbywCgrjABBaAR1n55HyBihdhxUVZEYJXC89+w1OLR7w=
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr13254810otp.232.1566768606273; 
 Sun, 25 Aug 2019 14:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-50-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:29:55 +0100
Message-ID: <CAFEAcA-FKwBM0LQ62NxK04hJAxSqHcNY=Dkhfr5uHr7LP0ooow@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v2 49/68] target/arm: Convert T16
 load/store multiple
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 48 ++++++++----------------------------------
>  target/arm/t16.decode  |  8 +++++++
>  2 files changed, 17 insertions(+), 39 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

