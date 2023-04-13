Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FD6E0D35
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 14:07:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmvhi-0001WU-5q; Thu, 13 Apr 2023 08:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmvhf-0001WB-3U
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:05:27 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmvhd-0000mZ-Ki
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:05:26 -0400
Received: by mail-ej1-x632.google.com with SMTP id qb20so36397885ejc.6
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681387524; x=1683979524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z8wgehgkXoTPZoAZxqxGn9f/iOFpy5uhF0Liuxr79B8=;
 b=zIwvRkejrUho2JD5WYMe+6HG3QlLlc1JzOy1zuwQ6qoCIt1FtTEn6Am3kmCQegRRa1
 34FZ7aenx1OYwUfQia6q6IX2NujwN+s2A5f/6j4Fy/ZGi/aVCi8Q8D6e2G72entbl5AQ
 j14zdNPmrOCwY4CBRJe6i8IguwVHWLhiyYT/DqvnXl3UHvWUlL3PIHG1MkyBW8XTTE13
 lHQt+WxharwrhG6ZutxrjM4e2c9WuiCkh6Ocmpd/DPvGcc3EMUXHEu+Z4VDZobDvrg3o
 lQ+jYofXnOmtcw3KSbMdIGFbZgmmW/5i9kp0Jl8yJJ+YGLWl41LPcnB5DSDqNQLwJrIe
 74PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681387524; x=1683979524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z8wgehgkXoTPZoAZxqxGn9f/iOFpy5uhF0Liuxr79B8=;
 b=W/v0YnE7Dw41odunMLSnuXF/5NutbXZtAS8qBM9Nu9Di/0Ra6SlOockgcsSviNyJLQ
 gXmkgFTHoKELxRMyW/6AQgu5MnuNL/Za7B8vveGEIwwitAvg+jyLnbQvsvtgvm0M2sW/
 wKPm6wXTbjH7tePST8c0SsaawU2VxYSbKTMLmRKtoLI5D2XAHipztvyYMUfa8WDNOLtK
 5fLDnGQXvIUKJ5+9sMxCD9H0Hbv7GoCUwMAv123jCFancS5+/815QHbYn9IN13r2zP8u
 PdwPNzQgoMTvBmPNq93q6hFuUqZyFOTTBk6z93vMF5K9pP7e9sOK8E9m7onkELoDxwTT
 /OuA==
X-Gm-Message-State: AAQBX9d0EnHSHKLsZFFeVqcU8QFlP915QnNVjhqliadfOuz7gf+oRQdB
 Byfgbw7Sm4/iSIuTTdT4xzSSXPh5hlSuIkYyI28mLQWjNG5pTQO0
X-Google-Smtp-Source: AKy350aTeUytSYfIQwkQzIh9mnb8cNCoNA1DF5ddORLtf2dW8geLi4z/VMkscvtKxLm/i395Jb3l568RCZsWTvJ+Oso=
X-Received: by 2002:a17:906:d970:b0:94a:972c:c28d with SMTP id
 rp16-20020a170906d97000b0094a972cc28dmr1220374ejb.6.1681387524013; Thu, 13
 Apr 2023 05:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8gecpvfUj9uz+HBRspskZsxJTdD2Yz3M3uOKcFJbpv-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8gecpvfUj9uz+HBRspskZsxJTdD2Yz3M3uOKcFJbpv-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 13:05:12 +0100
Message-ID: <CAFEAcA-PMX4M9BkaDp9Kd2N_3ffMAW8iM8Ub2e9EtkVteth1hQ@mail.gmail.com>
Subject: Re: netdev-socket test hang (s390 host, mips64el guest, backtrace)
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Thu, 13 Apr 2023 at 11:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> I just found a hung netdev-socket test on our s390 CI runner.
> Looks like a deadlock, no processes using CPU.
> Here's the backtrace; looks like both QEMU processes are sat
> idle but the test process is sat waiting forever for something
> in test_stream_inet_reconnect(). Any ideas?

May well not be related, but I think there's a race condition
in this test's inet_get_free_port() code. The code tries
to find a free port number by creating a socket, looking
at what port it is bound to, and then closing the socket.
If there are several copies of this test running at once
(as is plausible in a 'make -j8' setup), then you can
get an interleaving:

 test 1                       test 2
   find a port number
   close the socket
                              find a port number
                              (get the same number as test 1)
                              close the socket
   use port number for test
                              use port number for test
                              (fail because of test 1)


thanks
-- PMM

