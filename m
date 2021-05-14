Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E0380E68
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:47:43 +0200 (CEST)
Received: from localhost ([::1]:57938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhayU-0006UN-O4
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhan0-0004RY-Q9
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:35:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhamy-0002Lr-8J
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:35:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n2so30655886wrm.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wa0LctnWLaNix2TizHcbAunBy+Cfh5UBxqNmim232nA=;
 b=U5dY1Urg5JOR2cXH0x/0W6T1USHOyRI29swSZ3S8u4r1P1huKn2zDKrCXPlR44L8tw
 RHC2pYOTfIj1cS/MKwcNqbxRi6rpwW92a+RlEG/8QYiRP3joHsQhih0+VOArH1YYmfsF
 s3PdQpKn3QDF+51zM0leGAq3+RJCEkvgx8zLGazTlJCkKDyw8WziEbmRHHH+PpQVye+F
 omguY7zokyAGgjthtpBZ5xzS00amUlEgYLnsfZcq9j3Ab79CHhwSYOJ5KsLfn4Eod+ZK
 Do4KjAI7/Y6PSy+3mYy1djyqpWkTFF8RVbnr6AP9OZhnlx1QiUpPYbOHckHcQHvR9pph
 cphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wa0LctnWLaNix2TizHcbAunBy+Cfh5UBxqNmim232nA=;
 b=K6iYowG0JOlevtaLGJ7OBMI3vbLYddVeoXBEmVcVzhpLzaxuV/7BOX0y/X4L1KNyPH
 vUFcZPjvZ+bTH4cJ5AWsiyq2xm0ONAXEVSAa3zwyfsegXbof+LcURoF8rPhNvuw+4+b+
 GjcXKkPU/vozuCTcKJj0IPHh7gIXJzJCe1vdLWRasK/rMwq+l9QujjXp9dAsJmHOm5df
 SUpVZSmAml9Z8wdr9azaPssdxbtza6U5a+tf7R3qzU2rzc/82uSjrRt4niYde9FeObGY
 tuIlUqaWNV/J53A3F4GqBAZo7SY0RzXUsJwHEHzJBSS5VngOh6udD1ctB9OO4/3qbO2e
 INlA==
X-Gm-Message-State: AOAM530/8slO6qYpGHI0D1M5L6YTTFnO4qGR9oYNyW7T8nBZnANP4Xft
 Zqjk+79GkLB5x5BwmPjMWWqChQ==
X-Google-Smtp-Source: ABdhPJzjah7Jx/6AOgOTFOGzFigWMQmo+lU739ZjXQIFCryPDT9mOjyULgJvPIomvXI2Av0Ljzw8lQ==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr8204442wrn.156.1621010145752; 
 Fri, 14 May 2021 09:35:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm6790432wrx.4.2021.05.14.09.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:35:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 367C01FF7E;
 Fri, 14 May 2021 17:35:44 +0100 (BST)
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: gdb@gnu.org, QEMU Developers <qemu-devel@nongnu.org>, Pavel Dovgalyuk
 <pavel.dovgalyuk@ispras.ru>, Luis Machado <luis.machado@linaro.org>
Subject: Best approach for supporting snapshots for QEMU's gdbstub?
Date: Fri, 14 May 2021 17:06:32 +0100
Message-ID: <87y2chjmsf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I've been playing around with QEMU's reverse debugging support which
I have working with Pavel's latest patches for supporting virtio with
record/replay. Once you get the right command line it works well enough
although currently each step backwards requires replaying the entire
execution history until you get to the right point.

QEMU can quite easily snapshot the entire VM state so I was looking to
see what the best way to integrate this would be. As far as I can tell
there are two interfaces gdb supports: bookmarks and checkpoints.

As far as I can tell bookmarks where added as part of GDB's reverse
debugging support but attempting to use them from the gdbstub reports:

  (gdb) bookmark
  You can't do that when your target is `remote'

so I guess that would need an extension to the stub protocol to support?

The other option I found was checkpoints which seem to predate support
for reverse debugging. However:

  (gdb) checkpoint
  checkpoint: can't find fork function in inferior.

I couldn't tell what feature needs to be negotiated but I suspect it's
something like fork-events if the checkpoint mechanism is designed for
user space with a fork/freeze approach.

We could of course just add a custom monitor command like the
qemu.sstep=3D command which could be used manually. However that would be
a QEMU gdbstub specific approach.

The other thing would be to be more intelligent on QEMU's side and save
snapshots each time we hit an event, for example each time we hit a
given breakpoint. However I do worry that might lead to snapshots
growing quite quickly.

Any thoughts/suggestions?

--=20
Alex Benn=C3=A9e

