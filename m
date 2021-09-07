Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470BE402628
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:26:44 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXNL-0005XG-5T
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNXKR-0002Yj-1e
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:23:43 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNXKP-0004Ey-99
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:23:42 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1638353wmi.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SE627XlXLXndMsOdH+ISWqi6DzwzuPZVXAfT50t0jKQ=;
 b=ophg3k1kbMyeC9fpX46s4QWdPUPFs0tnj44/1kInO22kTn1Gx+C4XeH1DlBTV0EJIl
 b/gSKEfqc4bPmUoa3LrA3TirEheAQQjhbyoy3U697d4SzUvitHUROYWGdXvv46KC5vfT
 wcnK0fQNd3HDSIcXsqCxUuj8L1qvrfYplMNbE/YifIf9O6t63fu/8NvF4g2Tj/H5tFfJ
 UeXzVVMcv+o6dWouJM59Oe+8LfkWosp1/V2pSUQ3sD9sqTPSSH/KMzXl8O5M2jUwiIH6
 DqxYmaEL24JxOgDabplxUssZf9+AUYXcBuvd2aAnHB5iAfvcLjOS9mIoSOZhzKwFJgko
 U6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SE627XlXLXndMsOdH+ISWqi6DzwzuPZVXAfT50t0jKQ=;
 b=l2bQYrOMtV3pf6I78qJwJaiInQ4u8vLyN2TXkvRi581s2ydbxYyJ9OEYGq2OOkuURz
 CqD5TERYxBA6BaaTuWfG08BoR8wHVzAzm/LnDNL4ta4XUX8z8WT5IC1iaCnJMjfIbL6J
 R+TpE6zaBrtSBsWU8aYi5dT1V2WntTtsJ+35r41Vq7AX77jJm1Ke+IbSGQd4D/JbzjGo
 e6VIonxISwoa8rOHtw6/TKZPT/o3YVNdU7u8+Q9hMco1cLEV1/xHCjiq1bhJnB9d9Ryh
 EB7E4FPlU8TDCQBiWXXYUG5NkJgIO+ucXJ4C+AfYfreBfngzbpMclYe1+RPGtSZs1vhH
 ivpQ==
X-Gm-Message-State: AOAM530IVzYZGVLLJjuxyuXMUcV7BK6kNTpLa3ldbpySeyl4KRQlHach
 Aiam9Fzzmqxe4ijZIMmlk0l0wTldpGeByjQaVpd8eA==
X-Google-Smtp-Source: ABdhPJywAm+Q6F4dKZjc6BFjWgZURY10H90pNHsDM8/5TzDxbYbBA2vnkoAuXjasa/OFqksJmVfZUu1dG5zWYio2Kk8=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr3005997wmj.126.1631006618195; 
 Tue, 07 Sep 2021 02:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630941575.git.mjt@msgid.tls.msk.ru>
 <CAFEAcA_gnDs61BMPgwwBKoGgJDKZGeTSBAs=JAiqQQarE3DiNA@mail.gmail.com>
 <d296e760-99bd-58e9-27b5-f63ecc555900@msgid.tls.msk.ru>
In-Reply-To: <d296e760-99bd-58e9-27b5-f63ecc555900@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 10:22:49 +0100
Message-ID: <CAFEAcA-Ue9rYeKe9MMazobBCfRHO3F8nQYJW2vEgSn7vkdyEow@mail.gmail.com>
Subject: Re: [PULL] qemu-socket unix socket bugfix 2021-09-06
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Sept 2021 at 20:06, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 06.09.2021 21:41, Peter Maydell wrote:
> ..
> > Hi. gpg says the key you signed this with has expired:
> >
> > gpg: Signature made Mon 06 Sep 2021 16:19:32 BST
> > gpg:                using RSA key 7B73BAD68BE7A2C289314B22701B4F6B1A693E59
> > gpg:                issuer "mjt@tls.msk.ru"
> > gpg: Good signature from "Michael Tokarev <mjt@tls.msk.ru>" [expired]
> > gpg:                 aka "Michael Tokarev <mjt@corpit.ru>" [expired]
> > gpg:                 aka "Michael Tokarev <mjt@debian.org>" [expired]
> > gpg: Note: This key has expired!
> > Primary key fingerprint: 6EE1 95D1 886E 8FFB 810D  4324 457C E0A0 8044 65C5
> >       Subkey fingerprint: 7B73 BAD6 8BE7 A2C2 8931  4B22 701B 4F6B 1A69 3E59
>
> Um.
>
> > Assuming you've renewed the key,  can you give me a keyserver I can
> > download the updated version from, please?
>
> Sure.  I thought I uploaded it long ago.

Yeah, you probably did; I just don't notice that I need to grab
an updated version until the old key actually expires. And these
days with the demise of the sks keyserver pool I generally find
that I have to ask which keyserver I need to get a new one from.
(For instance yours isn't on keyserver.ubuntu.com or keys.openpgp.org,
and pgp.mit.edu seemed not to be responding when I just tried it.)
The keyring.debian.org server worked, though.

thanks
-- PMM

