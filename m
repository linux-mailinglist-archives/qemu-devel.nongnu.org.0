Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C623525ED9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:04:36 +0200 (CEST)
Received: from localhost ([::1]:60762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npS9z-0004HL-MP
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npRvq-0002QN-Uq
 for qemu-devel@nongnu.org; Fri, 13 May 2022 05:50:00 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:36617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npRvp-0005Jq-4Y
 for qemu-devel@nongnu.org; Fri, 13 May 2022 05:49:58 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2feb8eac315so6895457b3.3
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 02:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eqZcfCkv76jvG+LQSN0Yp5vcypqLHJU8MTRzvoexoI0=;
 b=Pw7SVsL/RMWOl67Fl6jCkHcQmTE23F76PH1n/mKG6aHK/+U02vofXihR9JRu45UAzN
 79CGvmywKrteYAlYS2WGL3jbN8oxPVpEPGEfDZph/xxzRUeal2HfJ+UUdNfzL/I8dc+A
 /8pOkfrHMbbcM0+zSplK3Daa4kpZBGTQ1YLNd10HEQZuMnpwB6Co2ZWLconWllNGWvV4
 BM2fgogtrcbiLLY0iXs0KQacGNRrq6dHzQshmC+E8Jo+p2uK28mE9FuwEYn7uM6IlsSw
 TIUhXRz1/haUNp8VX6KiMbjOgYX3tfIBfHe46bkPbg8CBaW6027iiW0n5sDOZgSEILNb
 l5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqZcfCkv76jvG+LQSN0Yp5vcypqLHJU8MTRzvoexoI0=;
 b=CAdwVLjmNnCCWPPU8wWrTX10IHB92riuuZerB/KHZxC5aa4dVT6FQn36l9P7YInvwv
 ZIERYxwWaojaReg42vCqzUoZJMSmPQgulZO1bbSgNl+D2MjI4rCijTMWCmgTQVv6ZTi1
 xhYt2avSXEgdiwCrhL83GEq7f8B5T0i9ecyckIKERsHrfTKQazTEZ8aXj1ehXhlTX5x+
 tl7w+M69Yiu0hX9EjxZhJnYpolaxRE/KCYkWmfiiR+t+SuDRgQPJLhBySGosXgKbT+rr
 dwVf0hNs9mI3CeERYBOLjhpFr205gVoz9JMS92aLC3e0lcv6rmtSUxOAHtFlB91JhLtm
 3MYA==
X-Gm-Message-State: AOAM533KmTFZAAz8uIG1cdyHEKQUAsXW/nIQAeOqxSCkpdtBU8hqn+8r
 9wzIASzJaFtxPdQG27TUsNIDC1eAlceMPS3cztJvBRDERvA=
X-Google-Smtp-Source: ABdhPJySgGsxmacX8g9H1m33buOnIGcTOSZjoSjyDJAuGDTqlu0ts50GuZzQri+jVX3REG0Qesa/KcL92yFvJxVES1U=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4606918ywj.329.1652435396073; Fri, 13
 May 2022 02:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <4127D8CA-D54A-47C7-A039-0DB7361E30C0@web.de>
In-Reply-To: <4127D8CA-D54A-47C7-A039-0DB7361E30C0@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 10:49:44 +0100
Message-ID: <CAFEAcA9np5Ss0EzPP64YSP0QxTK4qY8tTpX3K8y10fFHkUKP9w@mail.gmail.com>
Subject: Re: [PATCH] Fix aarch64 debug register names.
To: Chris Howard <cvz185@web.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Thu, 12 May 2022 at 10:42, Chris Howard <cvz185@web.de> wrote:
>
> From 5de17d5aacb9cf21de4c9736b227b0498c607709 Mon Sep 17 00:00:00 2001
> From: CHRIS HOWARD <cvz185@web.de>
> Date: Thu, 12 May 2022 11:35:17 +0200
> Subject: [PATCH] Fix aarch64 debug register names.
>
> Signed-off-by: CHRIS HOWARD <cvz185@web.de>

Thanks for sending the patch -- I've applied it
to target-arm.next.

-- PMM

