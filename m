Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AE548EDB9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 17:11:57 +0100 (CET)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8PBE-0000Ei-39
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 11:11:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Os4-0007Xe-CM
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:52:08 -0500
Received: from [2a00:1450:4864:20::32c] (port=37478
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Os0-0002fR-9Z
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:52:07 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso8250215wmj.2
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TjLUmGtwtIzIVe3RZRw7Y0DamNqRtxuMQ2vDIypV8IE=;
 b=almRLdGToC7pVkLbOrlJyYFGVG2g0B+oAvV/7oizbLgACFGRxAur5mxTC4qpr2Di0N
 kOu7ph0lvN20jbSLiW2CErr3+ar+dIkWY0kIMk6Qme9ExDL0IvCI+uUs7z+v2N3MkGhU
 gBPNJN2V6/RY3WIZuKyxQLZubdUuQzVaJ3qX0E0mtn2FbK2/DY4PvMAzg5MFNhdPwmLn
 IyS4LIpcK4rHyI5HagniUfRNMb7mCZgiw0LoXkNLJFkE4EIwJtSMqOPS+IFhsNr7oY3X
 dTSYNMbY2uSiJkoTVtk80i4TR+6Yu4Av3pGkMKT3EH0xMhtCRNkqqsoqNzomAUXb0peD
 O1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TjLUmGtwtIzIVe3RZRw7Y0DamNqRtxuMQ2vDIypV8IE=;
 b=QuUJ03i7932vnpJTpJizUnsrtPGCMi8F392lESiwUkkjCSmLwq7qR6N+6OK/tz4OOp
 rCGpXYooqI5XElwvtFNIoJp09FpR+8g569MTGJEO1BUSWb6U/sN4PPcVKOFjYXkMLm2C
 D0DyPmJMeiW0F93gRWMg0MmYLkYtl45iuw7btvhkHTRTZMWkefKnAEgVvnBo4NKKxRh6
 pDaGQbcD3gmtZFPlL9eBEVEwQFsA/X/smkoQD2MvWFTSMe1D9ryElOfJ1JVxKPXPOoog
 iSSTEo/lZkt7Enhh9hqNanEvp1BPh8SnZFQhJ43It/WbfHYpJ6IbZuNG5pWI+4gAxlGf
 4FxQ==
X-Gm-Message-State: AOAM5310vaI0uPY0nwzbcwDJ0ircOdsq2XexjX5GoYT2t3DQ7gV6SVr6
 lWrJp1u23RsR/AtZKWHzqYU+gaLDQ2z4VTIVojaKxyHcf9w=
X-Google-Smtp-Source: ABdhPJwKuNNtcGADmAGVHIB4VUISl7AleVoWQpPScBmFd0uFSiEgLAimRioqyzaPtOz8Xoq5OdqvBrOXAg2e7aycgLA=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr8885213wms.32.1642175505738; 
 Fri, 14 Jan 2022 07:51:45 -0800 (PST)
MIME-Version: 1.0
References: <20220114155015.3767671-1-peter.maydell@linaro.org>
In-Reply-To: <20220114155015.3767671-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 15:51:34 +0000
Message-ID: <CAFEAcA9fgdktM7fwDHDectPC5uvivCER8abcB9r3ookwf2yi2g@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Remove stale "not threadsafe" comments
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 15:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In linux-user/signal.c we have two FIXME comments claiming that
> parts of the signal-handling code are not threadsafe. These are
> very old, as they were first introduced in commit 624f7979058
> in 2008. Since then we've radically overhauled the signal-handling
> logic, while carefully preserving these FIXME comments.

Oops, I meant to send this as RFC, not PATCH -- I hit ^C
on the send but obviously not quite in time to stop it getting
out of the door. Ignore this one, I've sent it again with
the right tag.

thanks
-- PMM

