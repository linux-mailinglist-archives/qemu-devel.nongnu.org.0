Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CB3E329F
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 03:56:18 +0200 (CEST)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCBZR-0001YC-5j
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 21:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mCBYR-0000fC-I1
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 21:55:15 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mCBYN-00065Q-QC
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 21:55:15 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 e13-20020a9d63cd0000b02904fa42f9d275so138513otl.1
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 18:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=4cXqB+FTxI5aRyhujQz2ebQvHuahgfa7ioOP30DeqwU=;
 b=WcyU2x+Ku4mDuuHInrWlXMpkp9mYBxHIgqPZSRe+sQhG4xpFuGt2hgiqoFtkER70fO
 fzJ3eEoDjnq33rQH8jL+dhyBMYWC9wq7aPcpYZdb8P/yL063exTvlfzi0aNGnVIV0ccW
 6jPmZiC8dm19wxEDr7pjO6dZ16j8T/yE+pc7ACuVPCShBYm78or+zHQZfMgXhckZfkLK
 uxCYnd9X/Hu8nJqH3HQea+VhpBOJd2ev9ptJkv/HFucabaIXu0T8X05nKhv/MJHRF9M6
 LIapqeMyHK8VWpVyUs+7VYQVjbN6BnWkBO5zFcxXXTuJ0eMZXKLseZl/fGByW77LNUPZ
 GrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=4cXqB+FTxI5aRyhujQz2ebQvHuahgfa7ioOP30DeqwU=;
 b=pVTHxlfLck5FXgjwlmOtovaMFDACw2xRnTwOGLdYXpy5fgZoaxEmqpQvO5gQg+P8qH
 mtrjqmuaOANXarpuAqqNzV9sMm0/4YMZdsZI2Y0i4cRG4bs7igqZWTU1VPE7D31mQmqi
 D7TdNjOgbqFtHw6GoJEbUO6J2Vgv5gX1W+FVGt/uwBNySMOZqe11AfaOtv46gCFxTOob
 9uOsQknDSKVGme2zw4MsbtRR5Z8FnGhM9mQP19zVVpzvjCPE5qk1abpcvN5rGMd21XHO
 qwJxssX3+BjmByLL7Ski5bSe/MMvGp8s39Gf5GKYVDZ0lMaDZoVaCrpoupSp+9zcMklS
 1QVA==
X-Gm-Message-State: AOAM532UL3llx/CsVfq18/80EHpq+qi6VoaB+mmjDckddft94w1m9Vhw
 87fKj2mIxeZIlWbimM3IXwofsw==
X-Google-Smtp-Source: ABdhPJwLZ/Kw0F21HFOT/sIflyTS7Ol/GSxnw47pCug071ISsGYRWlY631Ep8xPApYxBbzW1S7wl+A==
X-Received: by 2002:a05:6830:1dd0:: with SMTP id
 a16mr9271770otj.22.1628301309614; 
 Fri, 06 Aug 2021 18:55:09 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:54cf:2a6b:50cd:9862])
 by smtp.gmail.com with ESMTPSA id s7sm360548ooj.45.2021.08.06.18.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 18:55:09 -0700 (PDT)
Date: Fri, 6 Aug 2021 20:55:07 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Shengtan Mao <stmao@google.com>
Subject: Re: [PATCH v4 0/2] Add remote I2C device to support external I2C
 device
Message-ID: <20210807015507.GE3431@minyard.net>
References: <20210806234918.122457-1-stmao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806234918.122457-1-stmao@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: venture@google.com, qemu-devel@nongnu.org, wuhaotsh@google.com,
 qemu-arm@nongnu.org, maoshengtan2011@gmail.com, crauer@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 06, 2021 at 11:49:16PM +0000, Shengtan Mao wrote:
> This patch implements the remote I2C device.  The remote I2C device allows an
> external I2C device to communicate with the I2C controller in QEMU through the
> remote I2C protocol.  Users no longer have to directly modify QEMU to add new
> I2C devices and can instead implement the emulated device externally and
> connect it to the remote I2C device.

I got to spend some time on this today, and I like the concept, but
there is one major issue.  When you do a read, you are blocking the
entire qemu I/O system until the read returns, which may result in
issues.  At least that's may understanding of how the qemu I/O system
works, which may be dated or wrong.

If you look at the IPMI code, it as an external BMC that can handle
async I/O from the chardev.  But the IPMI subsystem is designed to
handle this sort of thing.

Unfortunately, the I2C code really isn't set up to handle async
operations.  I'm not sure how hard it would be to modify the I2C core to
handle this, but it doesn't look trivial.  Well, the changes to the core
wouldn't be terrible, but all the host devices are set up for
synchronous operation.  You could add a separate asynchronous interface,
and only host devices that were modified could use it, and your device
would only work on those host devices.

Another issue is that you aren't handling errors from the chr read/write
calls.  If the remote connection dies, this isn't going to be good.  You
have to do error handling.

There is also no way for the remote end to return a NACK.  That's pretty
important, I think.  It will, unfortunately, complicate your nice simple
protocol.

Sorry to be the bearer of bad news.  Maybe I'm wrong about the blocking
thing, I'd be happy to be wrong.

-corey

> 
> Previous work by Wolfram Sang
> (https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough)
> was referenced.  It shares the similar idea of redirecting the actual I2C device
> functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
> The work by Sang mainly utilizes file descriptors while ours utilizes character
> devices, which offers better support for emulated devices. The work by Sang is
> not meant to offer full I2C device support; it only implements the receive
> functionality.  Our work implements full support for I2C devices: send, recv,
> and event (match_and_add is not applicable for external devices).
> 
> v1 -> v2
>     fixed terminology errors in the description comments.
> v2 -> v3
>     corrected patch set emailing errors.
> v3 -> v4
>     added remote I2C protocol description in docs/specs
> 
> Shengtan Mao (2):
>   hw/i2c: add remote I2C device
>   docs/specs: add remote i2c docs
> 
>  docs/specs/index.rst          |   1 +
>  docs/specs/remote-i2c.rst     |  51 ++++++++
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/Kconfig                |   4 +
>  hw/i2c/meson.build            |   1 +
>  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
>  8 files changed, 392 insertions(+)
>  create mode 100644 docs/specs/remote-i2c.rst
>  create mode 100644 hw/i2c/remote-i2c.c
>  create mode 100644 tests/qtest/remote-i2c-test.c
> 
> -- 
> 2.32.0.605.g8dce9f2422-goog
> 

