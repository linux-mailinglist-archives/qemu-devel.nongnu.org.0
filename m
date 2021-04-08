Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C4335802E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:03:49 +0200 (CEST)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURVr-0000Gu-3s
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lURSP-0007uu-89
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:00:13 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lURSN-0000We-Q5
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:00:12 -0400
Received: by mail-ed1-x52c.google.com with SMTP id g17so896218edm.6
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=faZu2MOOl146W7I28vHn7vREeB7KrBm0hgMt4wtEg4Q=;
 b=WghywQgsxc9x7Cq2YBFWCgrAA0D6teES5xOxaI2ebEL2VBLnzYO6Oz2khDtYK/Oh4W
 gl5kosl5LSCDsLLgUrlayeXxj/Sr2FrbNkIg/U46HjQwO1qtNBTeKzhkRO/xAMOur6sB
 ZpFlGYTYurumIgSCNayst0POgjfB+rk9Yjf1AvGqUvkl1PQNKv9mCvDFgHb4j43GUx9J
 bNTz0Wmaqpti6ZQESQtxmiGQl1yGiMPsKetHdnyhOT+65AQtv0/pLq8lQXLm7XSeqUHw
 +05F+QopfgKIOKqKi7NbkKQHsQy32Y8eh13yRGpGcR8yZvia3WzFLhZL7AvbjN4V09+J
 h4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=faZu2MOOl146W7I28vHn7vREeB7KrBm0hgMt4wtEg4Q=;
 b=sylNWGPXTPE4nnznu0bwsprsun5XObkIFQMyESav50WyD01dyFJrVvFeeJ3qE1Vu1h
 e69E0iGXkmBM/BQBRG0m6oYL8FMMo2dV2rerpkEas7FVEAYoRkopDkl0rM+jfs1Kp2vr
 +57u+JPzFV3q0zgMKowiOObZ3gOuZZK9/b/d9UjLw/w3Lbe9qlTEPxuSKWiNSjthkyOs
 Q9HSFlu+Qw+wlROI+k1J87v0FRyGk4ejIlw80Gupxw4WF0B0sE3zGUwAYZfHXILaAimt
 DfV83xOFlmIIp/hRtYVCSTcXbhyOs0Kyylo3QhAENqm0PLi4eilSLxojvDVPf/SPo8GG
 JT/g==
X-Gm-Message-State: AOAM531VgXLDnkX2XL7WreWfWyw7UTywzPjlvsl1oqkHxsuq62tdBXML
 RdqFQ28kj96Q98IKLyOQC2VfsPMiNOm0OPohDPEm+A==
X-Google-Smtp-Source: ABdhPJxz8qeXW26z9aH07frZh7JNsbvzVdId7/DyENBKQ6qd4hJtOtbnwxvtsGWDa5ARWoXvV+nT60Da/xSYTbrjqBw=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr10058791edv.44.1617876007290; 
 Thu, 08 Apr 2021 03:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210408095028.382751-1-its@irrelevant.dk>
 <YG7S0bU7x0EFGEeE@apples.localdomain>
In-Reply-To: <YG7S0bU7x0EFGEeE@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 09:59:27 +0000
Message-ID: <CAFEAcA87FFbEBgR1E=syO3qyU4po4v_SDpS_ejOkdwkjxc=dLw@mail.gmail.com>
Subject: Re: [PATCH] docs: add nvme emulation documentation
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 at 10:54, Klaus Jensen <its@irrelevant.dk> wrote:
>
> Hi Peter,
>
> Are documentation updates acceptable for -rc3?

Yes; they're safe changes, generally.

thanks
-- PMM

