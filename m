Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C4675CAC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 19:24:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIw3e-0003nB-NF; Fri, 20 Jan 2023 13:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw3c-0003hf-JS
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:24:08 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw3b-0000OW-1q
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:24:08 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 207so4603306pfv.5
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 10:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D7bALTMYgNEGBS8wjE/dTHtRUX/M3c8l4lbp1rmnMJQ=;
 b=xOjePwUOg7dKyD2ewwqPB5X1Pj9eWAvHIshBXBWeyI5lC8yvhtyRgvJL64ZMrGcsGv
 iDpztlSK7ZuPIBg4dVWoCSDSY9y0ze6Pwbb0wNF1qsZDVmmQABTkcsURb7dB/NTJO8Vl
 CuRJP0A5Mj6oXw400a3mGn3DMvMLcsKvrsyOiOn7vewhY76RXKp3H4gwGB6vxxTiMiJp
 xgPf5XbTGxtlc2jIQKTD9n0oXx59kUD0Tmcy2k2Vtpea2lnGA5nuoSJhm9NrmGlUJAhP
 ZU3O4yCUzAeLROpJ99EHnYh8EV34myhgVjh3O1bIFije+L/aTxHgYJnrrP2PbYfj4E5M
 A5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D7bALTMYgNEGBS8wjE/dTHtRUX/M3c8l4lbp1rmnMJQ=;
 b=ieymJtiEnZOzNdB398Y4OGDLrzAc3BhB4y7YqYWDHSVb1+9gqkbrZBeWIBKqIsR3Or
 klClTF7rXUgT06wzXsd3/UNJfYCgII41j0JiwITpzc5HpcQIjKFMEnygghZuNBVi2+0H
 5tjeX/eKKMaRc+4NmS4BloVh0inGQtk2KXHD9wPuiJ7FoQs9S1TohoFFIZZuVFP7Jp6R
 p/Te82er0x2Ffb6ThhOVpQ6hhkGnlYOmq6by0VarrV7302FGylESGM+Y1zb4OwcjTSrP
 5Wg+JtnWUdpvydMuLv7w9Ra1/bEsy6Iq7BCpwV5NZdz8yYAgAw2KzMAF+9+DwY42vS7x
 sZ+Q==
X-Gm-Message-State: AFqh2kr7j4ZYi3q7MjvrTYfKW2XvpJ3OirISqZiNe93OywdUHAdybHnQ
 oHwbVGCg5h1I5MeA2bOthC4f6/TkCXWDQ7zywqrW1Q==
X-Google-Smtp-Source: AMrXdXsXqdETUnjn04cc5DHDVeUSYiuLwlbbEx41rFXf2HVsia7M9z1I1/EDqKUTRBp0LRdWkZZ384LFrhi9qRkTHGM=
X-Received: by 2002:aa7:8d1a:0:b0:58b:c7ef:25ca with SMTP id
 j26-20020aa78d1a000000b0058bc7ef25camr1693938pfe.51.1674239045639; Fri, 20
 Jan 2023 10:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-5-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230120155447.31702-5-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 18:23:54 +0000
Message-ID: <CAFEAcA855_cH9RnGBCaUTEL5kOycAkCp8AmTRrub48yjVmfQhg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/char/pl011: better handling of FIFO flags on
 LCR reset
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 20 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Current FIFO handling code does not reset RXFE/RXFF flags when guest
> resets FIFO by writing to UARTLCR register, although internal FIFO state
> is reset to 0 read count. Actual guest-visible flag update will happen
> only on next data read or write attempt. As a result of that any guest
> that expects RXFE flag to be set (and RXFF to be cleared) after resetting
> FIFO will never see that happen.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

