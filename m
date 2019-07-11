Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493CB65964
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 16:52:54 +0200 (CEST)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlaRJ-0006VQ-Fs
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 10:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41051)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaQB-0005UG-Lv
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 10:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaQ9-0005IM-IU
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 10:51:43 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:38289)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlaQ7-00056h-HX
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 10:51:39 -0400
Received: by mail-oi1-x233.google.com with SMTP id v186so4700272oie.5
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yJLyqKsaxzbXx+G9z3/vVff1sRqmJq0mDAb3qNapNyk=;
 b=jCZBPtkh6AhVo3eWl23zPlnhDDKn6/IfiyC/JFfAdfuKw1qjps8/F/4mwieMIsJta0
 QsMGUS+pQHWZMW2UyJxFUi8rMDEEs5jnCq+7FDQ6AB7TVZmxuPLbc/i3yMX1m7NGH0b+
 X4hePJEHqyWlFCOZuAPX3ay2FztIdP3GN3kMDq861tYJTBbVbDsvQOxFPUG8Xq4iakm2
 n774GqmDktzexV8+xa4NLT8N1tLe6lJ5Wqc0D8TcaTK4SYq6Ofv+DVsGLrS+3YKso4wC
 2DN3gFZPsiz9R3wTC7pas/UvC/mnK/mZDm9tY5CaQLDJq3WACbsYxqhVWx91514QfkbB
 4NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yJLyqKsaxzbXx+G9z3/vVff1sRqmJq0mDAb3qNapNyk=;
 b=kc+4HhBnFtgoXYXGKVvfOIMO5ARFZn1BWC+pVibHuGFRy49zxzeV7S/PNMktFPqYu7
 Bar6fnickOsYVAhXyWaS2izJpAEIXG3aXhEotGk0/KFsrRl0eGkGC3yN65lFt6XJE5bC
 vOS5qrTVGV1DRxWeQYP9NrSFEJW1jiJUTTeiPfpacPJt50KCqrMYHB80jg3Kv3gmpb8y
 k/FGxEWUObJqiK70nxCDYytv0jP7VNwzZLPkPbxoo/K8Sf+3FYWNyVzNNJ2xLEO99bbu
 Glubk9CpD8QEfLMUE1GlxAEaExJINGPTw9rKlXRoXfem+2ulh3Wc8dpd1ezGyes4eePJ
 EQvg==
X-Gm-Message-State: APjAAAUVeIJPzvEBhplbv3F5ffwF3L7CfAy9yBWL4PZl6K+M/lfUB8by
 YQ5lrecSf+zasSAI3hEIR+ajPlrIJIZfKwK1XU09Jw==
X-Google-Smtp-Source: APXvYqz2mAxpjSL1ovzjkgLHdDSmuLi4mb/lkJo5To0+qWjZoYqRKXeL26CG6F4adiq9uB6NYXjhHymgkRxt9fehJlg=
X-Received: by 2002:aca:6185:: with SMTP id v127mr2734021oib.163.1562856692614; 
 Thu, 11 Jul 2019 07:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190709113715.7761-1-philmd@redhat.com>
In-Reply-To: <20190709113715.7761-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 15:51:21 +0100
Message-ID: <CAFEAcA9adoeYeJCnrRU=i=WiYzAuJh2vQupYgL_KRAoomvU4Wg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
Subject: Re: [Qemu-devel] [PATCH-for-4.1 0/3] hw: Avoid crash when reading
 empty RX FIFO
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Jul 2019 at 12:37, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Fix a pair of crashes, one is an audit of first one.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/ssi/mss-spi: Convert debug printf()s to trace events
>   hw/ssi/mss-spi: Avoid crash when reading empty RX FIFO
>   hw/display/xlnx_dp: Avoid crash when reading empty RX FIFO
>

Applied patches 2 and 3 to target-arm.next, thanks.
For future series, could you avoid including both
for-4.1 and not-for-4.1 patches in the same series, please?
It's a bit of a pain to have to separate them out again,
and there's always the risk that I don't notice.

(You'll probably want to hold onto patch 1 and send it
out again after we reopen for 4.2, or I'll forget about its
existence :-))

thanks
-- PMM

