Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F83B0DC8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 21:46:25 +0200 (CEST)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvmLo-0003ma-BM
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 15:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvmKd-0002h2-6N
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvmKa-0006s0-Qh
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624391107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B0cUv1AJRDTWQxv0hMn+k7dP8+ev62MueRWILz4rVPU=;
 b=Tx6gyXGIrmObIQ6wzVpmJtyyYXRgLzHjvAVLA3FTnR7fD1ZpaFZxj8zZZE4cLp9LYZtIH1
 f1rTzx0OJkw5yv19wB5MazpWsXllk7mcrz8yFK9KRqRQZZjltwauwq8J7Xewd7rNAQYQ3S
 Snz+LPmitfu/1ZcpWS4vtOlAttUjqTE=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-ipXT7DmpMaWNrYbWmZmDCw-1; Tue, 22 Jun 2021 15:45:05 -0400
X-MC-Unique: ipXT7DmpMaWNrYbWmZmDCw-1
Received: by mail-ua1-f70.google.com with SMTP id
 a15-20020ab0684f0000b0290275ca73402eso6797157uas.12
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B0cUv1AJRDTWQxv0hMn+k7dP8+ev62MueRWILz4rVPU=;
 b=SLh2mTIazmJtxVsa1dfmsollQk8M+IIGWzl1h0LCXFKOhcAl467NP7h/KJR+hQWwsR
 BY1alt3qcmpS9wHq2RDvq7FRtTriTxA8kBUaf5wTz/YcI8CukqUFNaL9I0yigtXxK/CW
 qol/W8St74o+zN13iK4YHFTfU4Wn7fer7RrspTNA8CJTmekhzPz2hKSayIZa6Z3FdbfZ
 ceGmsrr/A9ZyqEh26KjtYrIcAwkRBWvP4rEBwK5QMDOayawnudAbNCR717O1k3m5SmJB
 TkMPvgN9BEiR1sLbMEo4zW8Z3nyR+D52dgn2FzJbJjof/Gf58cqt7jIi3z1kfq8U9ySJ
 8JpQ==
X-Gm-Message-State: AOAM5332N4tfi1XOQ2NYGi1XAVsdN04MB+VlnwqKqJuqNU+Y3Hq+FPg4
 BfxvsfyaVyq2IxaswmnnGoDpQmrQ41jOuK7n3Iyd66FTvAF6VADlAkLMDDvNOFa7ceFoE78bDPn
 vlm9Q8AYK7HPpgQa5oyRgWVYqpf3Mo8I=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr688995uam.110.1624391105408;
 Tue, 22 Jun 2021 12:45:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOHuDy3xnT5E5Kq39XddxWVcRb/qtZu729IltvX3CBN3DneDkpDMXqEXLG84sh8RdeRwZ3zY0eSR/mdAJoFaY=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr688970uam.110.1624391105206;
 Tue, 22 Jun 2021 12:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
 <162332431069.194926.15194726341679308238.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162332431069.194926.15194726341679308238.stgit@pasha-ThinkPad-X280>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 22 Jun 2021 16:44:39 -0300
Message-ID: <CAKJDGDYeYXo7u867GQgPezeBkbfHPqh8FmW9q+SXixdMGz63Kw@mail.gmail.com>
Subject: Re: [PATCH 5/6] tests/acceptance: add replay kernel test for alpha
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 8:25 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> This patch adds record/replay test which boots Linux
> kernel on alpha platform. The test uses kernel binaries
> taken from boot_linux_console test.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/acceptance/replay_kernel.py |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


