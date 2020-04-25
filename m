Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A381B86AF
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Apr 2020 15:03:15 +0200 (CEST)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSKSf-0008GQ-Kf
	for lists+qemu-devel@lfdr.de; Sat, 25 Apr 2020 09:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jSKRP-0007f2-PA
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 09:01:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jSKRO-0005gm-Le
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 09:01:55 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:44370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jSKRO-0005a4-5K
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 09:01:54 -0400
Received: by mail-oo1-xc44.google.com with SMTP id p67so2740569ooa.11
 for <qemu-devel@nongnu.org>; Sat, 25 Apr 2020 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1m3QMP7xRa7/wgAqoCxYSywfMcc7cKD5pw/BIjY7uSA=;
 b=Ek+9XUZ41Yge2m+lkWmmFCBOrTdD5XNIf/Sx+u8jmqHyr08QHXnsB4JMyFb434+F3x
 6P+a/l4Ov7qmk+MicXAC0tNvT+R/4lJhME/TF93xrknRFyxJ/sTPWrwzABlxb2nqBcdf
 +7EelrycGeLQ/b40RV4flUJXBN817DraBCreHZ9QYg8vQOUYOMcfr2I+Ra7bTOxpwydq
 1GzXYxlJ8ECjZlDT/bNIUznnvGVCBUckjXzcdqRWj8aUJ8wLtpHFvNO5stgWdouq85zC
 mKRBkIh4VpsysvpDyuMTnlpC7untOt5Wxmdx+uE/7nTVZj4CIP4eYvtwr9rH4pXtQsqj
 M88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1m3QMP7xRa7/wgAqoCxYSywfMcc7cKD5pw/BIjY7uSA=;
 b=mI3sPwDB+FAepRLEaR+6iuP0cNFcOm/zP1yGpKuarYUF20mSo4fh3+P977bQcpJGMa
 ZhOGZ6U3KDqbCVZaCPEGZJGoRzAOmAKADBX1ojk6mpTMqb3ArMkEKcJXZiixiMJFle4h
 xPZD3YuzHTPtKU9Rrf8GmgyQQRlBttqpYAxuCVAf7/Rxmt00KCz7ctzaaLLOrlJLaFS3
 qn8R9x2Up8IBsGJEOsejTJI8WKHrTV1RwratSWkfN0zcvpq/S0oenWFrcozqXmoYAAV2
 GQoKRMLOy1y8ZafitlQCroCpYj96dyFN56X2XuajrLGvAP3Hs3yLQNiFrfKPZB3xWdpA
 mGQA==
X-Gm-Message-State: AGi0PubspsB19401UnnUEAXclM/uCQocTzQAo6t02M/4a0ixC81xGsF7
 ndiRk8wxbuZAroakqWtQrCn5wgqo813lV1XV5YTZBA==
X-Google-Smtp-Source: APiQypIXf1NxV1bT3Q45xcBQWY35+VOAhRJDZorouZFSMX/DXisEbhuHAb8GFhr/aSCw1yQOI+cU7qTmvyerNeala5o=
X-Received: by 2002:a4a:8253:: with SMTP id t19mr11870988oog.69.1587819712468; 
 Sat, 25 Apr 2020 06:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200424205755.GA26282@ls3530.fritz.box>
 <56bb3ce2-9b70-7470-d4f4-563b617849d2@redhat.com>
In-Reply-To: <56bb3ce2-9b70-7470-d4f4-563b617849d2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Apr 2020 14:01:41 +0100
Message-ID: <CAFEAcA8nNHGAaD+S50ObX2DBaN90JOQg6HDKmkBv3OZUnt9qxQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Drop unnecessary check in dup3 syscall
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::c44
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
Cc: Helge Deller <deller@gmx.de>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Apr 2020 at 22:33, Eric Blake <eblake@redhat.com> wrote:
> I don't think this is quite correct.  target_to_host_bitmask() silently
> ignores unknown bits, and a user that was relying on bit 0x40000000 to
> cause an EINVAL will not fail with this change (unless bit 0x40000000
> happens to be one of the bits translated by fcntl_flags_tbl).  The
> open() syscall is notorious for ignoring unknown bits rather than
> failing with EINVAL, and it is has come back to haunt kernel developers;
> newer syscalls like dup3() learned from the mistake, and we really do
> want to catch unsupported bits up to make it easier for future kernels
> to define meanings to those bits without them being silently swallowed
> when run on older systems that did not know what those bits meant.

The other reason linux-user sometimes has this sort of manual
check of input values is that it can affect which errno value
is returned if a call has multiple wrong things (eg a bad
address to a pointer parameter and a bad flags value), and some
test suites care about the difference. I'm not sure that's the
case here, though. I didn't write out my reasoning back in
2017 when I made this page and don't remember it now, but my
guess is that it's just that dup3 is only supposed
to permit O_CLOEXEC, not any of the other flags that the
fcntl_flags_tbl permits and translates.

thanks
-- PMM

