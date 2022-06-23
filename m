Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D0C558B66
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 00:52:06 +0200 (CEST)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4VgC-0005yW-PG
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 18:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankuragr.engg@gmail.com>)
 id 1o4Vf8-00056r-Ct
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 18:50:59 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ankuragr.engg@gmail.com>)
 id 1o4Vf7-0001Jt-3K
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 18:50:58 -0400
Received: by mail-oi1-x22d.google.com with SMTP id e131so1331096oif.13
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=qznljLkEoaNr+gNbKkEg5tIqpIMTLquztAfJDHSbJEc=;
 b=Jus0odWkEZ1PRMeTv7zKNSRYhFmoSal1bKllPx1D4rrV8yvrXkUSjMfGLBDU7voqtc
 vYOMbo9cCrx+5tsGM5PQRKt1JUBpznoHyuo/3WCT0rR2qGIjiij9npriLMtA1eElXprj
 sQ9N+FhiwtTbUD+8LUNf4rEJCtEh23jph7Qs9hIo7O9lk37D1KgGXiTV1wOgrlU5nd8q
 NQXVmfYlkfe0z2ZHnHHCFB3SERm4Gyo0cyQCN3gHV5ImrQD7P9ZMaQFdySEQp+j67jnD
 jfY1Lovy+dPRKoTO7oaKSpbgPpJR7kkLWhb/6Vq5jK50ag5RXjJrrLiWfG6nUu1I8Hqu
 Sjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qznljLkEoaNr+gNbKkEg5tIqpIMTLquztAfJDHSbJEc=;
 b=4Q3MMoJnrFWLqxJFnC+k+muVNoRUlBqqKLouLwoeYDbf4WgxiJVL76CeY1xM05N1uF
 FbolPhwiCsTzox6YUtp80Uu711ostwZ33oh6ntf3A65js75ECMfxmZWVDdq+0GE5MzqA
 Zly6RO6uFJW6MvPtklNzBR5bUKSN8GCzhBYaZ/gOUa+4recn8ZbRRxxdqhvP3mXkxuDr
 Has5mGniLUINLrYxdAzW3ZuVMQ4/AklVArynn9ZdyuVBXgxKSC7fnP4lrvnMymnCwPcP
 aV97d0LI9nFRGKF4Qofl8+lU0K6lgZxn/Re/sIJ1NBWypvm9Y2mJMs+qN6sYBefn6Pd1
 LsWQ==
X-Gm-Message-State: AJIora8233pV1Nf6DuN96siyF0iBYB6UF36+gTpeARXmRjitzXZcxx2G
 F+lUEA912qgHij/qq7wKo0Bw9XfyLFSdrRb3wyLmfCiB
X-Google-Smtp-Source: AGRyM1ua/eYWxVd0p71W7hmh+K1VGLlHUbV8I6gY3ua7i5XX5ijjKHS84tZSXouwFxOacJTu5xOKKD01UyNx3BxaCOM=
X-Received: by 2002:a05:6808:1506:b0:32e:d6c2:3308 with SMTP id
 u6-20020a056808150600b0032ed6c23308mr186670oiw.266.1656024655396; Thu, 23 Jun
 2022 15:50:55 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Agrawal <ankuragr.engg@gmail.com>
Date: Thu, 23 Jun 2022 15:50:43 -0700
Message-ID: <CAEAhZqxLeJ-SU=pxKxOdKPwgNtHQ9ee_24h7f4EDCye2t=y_CA@mail.gmail.com>
Subject: 
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005304e505e22549a1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=ankuragr.engg@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: 35
X-Spam_score: 3.5
X-Spam_bar: +++
X-Spam_report: (3.5 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, EMPTY_MESSAGE=2.32,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, PYZOR_CHECK=1.392,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--0000000000005304e505e22549a1
Content-Type: text/plain; charset="UTF-8"



--0000000000005304e505e22549a1
Content-Type: text/html; charset="UTF-8"



--0000000000005304e505e22549a1--

