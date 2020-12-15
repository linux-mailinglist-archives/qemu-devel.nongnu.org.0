Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E72DAC6E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:57:39 +0100 (CET)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8xW-00017Q-LU
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8pq-0000Wq-MI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:49:42 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8pp-0001Pv-2m
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:49:42 -0500
Received: by mail-wm1-x341.google.com with SMTP id q75so18209191wme.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/9QQtjKAJGy//+MTZlPDZ6IKf2rSvh+1DJ3vCYIdDTI=;
 b=gl8+BAhekKeLNRD6oy/XGkse7JAVU6AGOpP2P4L4GNlA4UeKS+77NIRu2D836YHRxq
 oUr6kBf7ymGAxTjqvoqggszIB38lQ5o04vsue/YyLFXXt/moVNSKgEAolBRqCp0ce6Rp
 07rEiQ89odcDS3HMhmaqaAE16SgH2MeHRxILeYuUOlxyyxKZjhCr5eq5fDd4TIFLhH/w
 OkgyavbFrxMfzAA2SoJL+YUma0O1FAcrQUjtBuvaGgqvzKexWLAODiWuADvQX0uggBlc
 TbItV8leLWFCrm4VO+P1t9kqb/LXMaxH9S5P815o0BfPGDZqiWtJ5LInaTHoFvjr47yc
 6zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/9QQtjKAJGy//+MTZlPDZ6IKf2rSvh+1DJ3vCYIdDTI=;
 b=ngRDbFPAxKN6B+Povo7Qc+gWowz7BYcK/+7Rz4NU44x32Yrn8lts44t4NKYf5KyRg+
 SQoNqosA+aD4Wj4MqpevZlNeW6MBjcbkw2k/3+FJhoH7psKhPM+vZvCyHVczpUlVhbkr
 fhT92YqXTjPH9Hee4/AsNnamAxxi6JkWeOwBnDMFzVN/8ZpRbzkfUVc+ngV2QMP7J+l6
 iTCg2CF+kPaSMMmEYf/W97ath2agquE4kht4ehgzCyaBEGXdRf6A7HBWbAQmEzK8TbHE
 KmZqv8Utbqz2dzqk2eNKPyCGFDQmYtXfuX+QmeP07Ud78lucNumSV1/TgDXyiHpKoSKV
 CFGQ==
X-Gm-Message-State: AOAM5308bZDIuOA5Fu090X7PreEYY4aghTBMob0lyH4WllkIv90ocjJc
 tidxT7ml+aNwQusiHyTNw2TpCw==
X-Google-Smtp-Source: ABdhPJwuiqhjU/4KMZ/O6yGRyiuo+mT+0pVgKCFLz+rc2ojdghHSQlKbZncQX/9qV5j29NxunGEfYQ==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr31927455wme.40.1608032979528;
 Tue, 15 Dec 2020 03:49:39 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id g184sm38507050wma.16.2020.12.15.03.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:49:39 -0800 (PST)
Date: Tue, 15 Dec 2020 11:49:37 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
Message-ID: <20201215114937.GV1664@vanye>
References: <20201214123553.2515-1-leif@nuviainc.com>
 <CAFEAcA-X-JV9TXgnuoqw0ZDH8W9ZyiHAEiBW=epsYyb3fJ7FkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-X-JV9TXgnuoqw0ZDH8W9ZyiHAEiBW=epsYyb3fJ7FkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 13:36:51 +0000, Peter Maydell wrote:
> On Mon, 14 Dec 2020 at 12:36, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> > v1->v2:
> > - Correct CCSIDR_EL1 field sizes.
> 
> Hi -- could you resend the whole series for a v2, please?
> The tools (and people) that handle patches get a bit confused
> by partial series.

Of course :)
Done, and noted for future.

/
    Leif

