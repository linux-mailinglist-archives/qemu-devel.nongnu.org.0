Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B895B2327
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 18:09:47 +0200 (CEST)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWK64-0007ig-RL
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 12:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oWJxO-0000Lu-4h
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 12:00:48 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oWJxM-0004E6-82
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 12:00:45 -0400
Received: by mail-yb1-xb36.google.com with SMTP id k80so15798571ybk.10
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cmBbnFd8dT/Ts9SGssdmYHMAZwXCbToQwGCzkrDLB7M=;
 b=g8LdONg2XPyHs9u2DnsAROfHbDP/hGr8EY14/HKMPFXTW0jKGPXUAZAwa1278bOExU
 WgYDxTqwAlX4EKyzYQe+N2z0nnDiMqxpzsEFsriOsSBzLCX8HSLs+PCI/jK2r9pKxe/5
 4tBO7VGAfSKDY11irr8bnWC31aCbpMvVEFJ1PApR0w/E+2p/ibSmFO24jDY+HOJDKaql
 CPGOlc549/zLHSQhD/YWyz51sVQlfPxup+Yizixrhzcd6Dq0XeY8JXUjfi6xk6fw7g5e
 vxmuysyoRmmUtpOXQq7KEyh2Id3x7dY6PG1L4Y5+7CqHUmAiyjwi7HvGXvQLxunB/33B
 ml0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cmBbnFd8dT/Ts9SGssdmYHMAZwXCbToQwGCzkrDLB7M=;
 b=M7MKQKXRFuDkfz7FVQlpgobVJrk0v74xIkk/41pXJuebg0Ga4HiBrXHsMhclOrJrtK
 tWz6aetx4OD5XZn4DbVzRq7XWUqtiwW0RIKFQxO4GKcXj7LDCjq11xEd6OwGJldZxCDw
 FUK2ngP/UGlozL7Qbo1vvZklCz4vN47pRhu1jWtKXygGT98SQPSLsRbhFqJS4pbCSy/W
 gpuxDegzGjra5bpo8/+pvK53wn8uwWhYgXR2CMFIAhJ3Ce/Gw0FIP/0OhSAijaMQ2mO5
 CIaYuEe1RLkaGxm7U6kZBaSyY3CHgF2kpEriE5vzhhMIJkAddoToY6M+weG9JGvs1+7j
 wGtg==
X-Gm-Message-State: ACgBeo3NerRSuOLGc4W4XZ7uqWSvWhhU37l/hHQWpP6opjw8cTwr8Mo3
 FJv86r0r0AM3AZPwdofHzSIO+LaVZbSl1eLZ9TA0Z6c8sxtH2Q==
X-Google-Smtp-Source: AA6agR4+pUForCm4lpvqdVKGbSs/VGpQmslxKQJwxnQxDuJ/YBdxF5IbvJLVQZPcf891Wq6dtJHLFaUqRVF8Ou6sK3c=
X-Received: by 2002:a25:23d4:0:b0:6a9:3cce:f811 with SMTP id
 j203-20020a2523d4000000b006a93ccef811mr8580337ybj.193.1662652838556; Thu, 08
 Sep 2022 09:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwARj6d+UygiU4-JBKMJtyOhHmcNFp7C5jwqJReFT-kew@mail.gmail.com>
 <CAFEAcA9brqMEZfyB-c2OjYFWuQPSS28u9_8vFte=zGwePh_Srw@mail.gmail.com>
 <CAO=notxqhKoUS8Mahp=HLGO1XKt07Z7qH3SEe3-Tfo9skk9rBQ@mail.gmail.com>
In-Reply-To: <CAO=notxqhKoUS8Mahp=HLGO1XKt07Z7qH3SEe3-Tfo9skk9rBQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Sep 2022 17:00:26 +0100
Message-ID: <CAFEAcA9mGBjYFNGEVyiUeCMw38zrMCfTyEgpuHO+n3aR-6JjxQ@mail.gmail.com>
Subject: Re: Seeing qtest assertion failure with 7.1
To: Patrick Venture <venture@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Sept 2022 at 16:54, Patrick Venture <venture@google.com> wrote:
> On Wed, Sep 7, 2022 at 10:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> Have a look in the source at what exactly the assertion
>> failure in libqtest.c is checking for -- IIRC it's a pretty
>> basic "did we open a socket fd" one. I think sometimes I
>> used to see something like this if there's an old stale socket
>> lying around in the test directory and the randomly generated
>> socket filename happens to clash with it.

> Thanks for the debugging tip! I can't reproduce it at this point. I
> saw it 2-3 times, and now not at all.  So more than likely it's
> exactly what you're describing.

Mmm. We do clean up the socket after ourselves in the test
harness, but I think what can happen is that if a test case
crashes then the cleanup doesn't happen. Then there's a stale
file left in the build tree, and then you only hit it if you
get unlucky with PID allocation on a future run...

-- PMM

