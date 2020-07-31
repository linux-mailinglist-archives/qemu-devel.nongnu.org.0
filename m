Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BEC234413
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 12:29:24 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1SHz-0006Oi-91
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 06:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1SGF-0004XD-6Q
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 06:27:35 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:33272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1SGB-0002Nq-6L
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 06:27:34 -0400
Received: by mail-ot1-x32f.google.com with SMTP id t7so8468619otp.0
 for <qemu-devel@nongnu.org>; Fri, 31 Jul 2020 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bg8xNQQua92ftdzkAlZyQ8pvrQiUHnyqPwfYkL8ltoo=;
 b=lp8PAgq59EeOKnK+UuTk0TuEtkOLqMcg3i5T/IrhB7fhHxWDY7sBHYUEyDZ3Xo43r1
 Z9syUH/EU8z3BDkSdYocUWGZH/7j+luSTI+BxN5dX+osp6w6o8Z7ZmE5GN+v/5FAdTDi
 DJadn60mUDMMrE3QDK4m99cPDK5XBZQynL+339Ha0v55WBfYutqk5AHLj7SHfKFh73jl
 32+2gqpGdPR2BHhVitSGgrj3WkCtpoq90cetQBbzUzdkt/HTDB5jlqhin9bwjHeaxBDU
 OTXzjbhXwQSktpVlquXlFy3RUTcFXnCA4hPc4Q7VJPlPK+xXo0sMXK7cPzHzhE7TZGtb
 maDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bg8xNQQua92ftdzkAlZyQ8pvrQiUHnyqPwfYkL8ltoo=;
 b=a2xcYZkrUHo1D2KUhvqEA3LFEIYJ24k/ixInS4cqfQCpgNwXNbV6K5aPohICA/oa7X
 8YudVvar/ODreyv5Kesgat6RLrAp6Hp9vbjvYQkzxcPhQKpcwdfMD6oS82gQD1d0pzxT
 MlzPEvcPz5P/vfnCtBkTUTLI6D9XT+TeMjxQdHrQ2UoMvk8BADoX+0UvsxE9Ir8KQfLq
 fXP8UQcerX8fr1Ufoxee6Z1Ju8Aa751T2e2cwyWMCwGcB0SabcUciz4LZEhccJ60tNt+
 ypDkN/XbW/BLxHxQOTLEKFEId/bCrY0u8V+6+zIWcoUGWt4bNUGX8rCA2l7BLpoTBvf+
 DkWw==
X-Gm-Message-State: AOAM530CbUDz4hBl15OVH1kIusgz7XQCbFhzpQReTXRRr3gl025pEbjt
 +Cbic+SBwvUW2te9r1BZCSIYEBIs3t7B9x2m2obBPw==
X-Google-Smtp-Source: ABdhPJxctwV33VlFvB6MqPx6kIBUMU09hPkuMuENYGSv7fBKoxVD/YeqKAPiLlS8iwjKdH6/1Dk5lIKjBwcbp451I/4=
X-Received: by 2002:a9d:3b61:: with SMTP id z88mr2455488otb.135.1596191249908; 
 Fri, 31 Jul 2020 03:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200731085503.9008-1-cohuck@redhat.com>
In-Reply-To: <20200731085503.9008-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2020 11:27:18 +0100
Message-ID: <CAFEAcA8zkz5t-bLOPB_t86NMWc=y1aqdQ+bMgwK3UdggQ=9p-Q@mail.gmail.com>
Subject: Re: [PULL 0/1] another s390x fix
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 31 Jul 2020 at 09:55, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 5772f2b1fc5d00e7e04e01fa28e9081d6550440a:
>
>   Update version for v5.1.0-rc2 release (2020-07-28 21:51:03 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20200731
>
> for you to fetch changes up to 148d25e0f6ad1dc3bd6aace092d65262d4217ec6:
>
>   s390x/s390-virtio-ccw: fix off-by-one in loadparm getter (2020-07-30 16:53:34 +0200)
>
> ----------------------------------------------------------------
> Fix a problem introduced in a recent fix.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

