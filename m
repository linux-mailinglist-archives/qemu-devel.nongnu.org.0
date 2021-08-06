Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA93E286B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 12:17:14 +0200 (CEST)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwuf-0005pn-Bx
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 06:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBwtr-0005A5-5r
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:16:23 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBwtn-0004d3-QU
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:16:22 -0400
Received: by mail-ed1-x52e.google.com with SMTP id x90so12326340ede.8
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WlA9C9k+WQv8hjuIO+QbwygD3P6PW/4dYPNKgQIyDfo=;
 b=pF9j4eQO8im0epzJ5B7O2ntWUTyYNy5HrDs8cOSagSX0bxjK+UBQpA3OaqYSYCzNSZ
 qYDnO3RAhzTU4UHBMT1YQ9pWuL0CrDkDZ9ibfQR6sck3B1lag8PGqVdd8679lALvaGHa
 pSlOWXeEeSNVH9boJxgoRcLabcxGvf22Prj2MeayY9WlRZlbKNK0kPMYcUanUf2jhnBb
 7mSthlR5S6fkbAp+7oBN/ZUN/lf7tCVJIz7lTwpJO0Nhmvom+g92r5M70EmmWKmn1zXo
 5oD4GiePWG49wOACoxfCG2lwkUI+6E8Ou3jGJKHLsUWvFgSfyG003hBqtbu4SEg/tG6m
 69dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlA9C9k+WQv8hjuIO+QbwygD3P6PW/4dYPNKgQIyDfo=;
 b=LrjQioWGf2XhP+27dzaATMzA5HfXpL3rxNER7OIUw1Pykp8v/GlY+MTQIRTTq0ANAt
 RPkbeOzMrfqG33x9TmkTce0YekZQwI02ZhnXcWC8ENxzBImlGbSHJUaTwDLjNi58zmGp
 vV3PDqzEvg5UgMfttqM1yzT4+HNuhVTq3LOpOvix3WTlxl0tm6uiQq2/3MPJDoTs0mzg
 t+KNqHPORByciRBwSKDiJTyR44IEVo5ATSgO1xKWQtZZplUaWuOIL9npWxMePMqN1Y3x
 Nx/xWwBgmmE6DnI09h8nY8IUXHiJF5r6Jc4105r9e0/UUaXXdPFN1eVjeC0vuRWXiO3v
 Ssxw==
X-Gm-Message-State: AOAM531pWqhz9eti4Oh0EKQJo5dSOJCCJle02yN46kD6uxjWg5kt/24E
 Zsrt3hHK51ahjtESASR8XE5J0APtW7gma8bj28aJmA==
X-Google-Smtp-Source: ABdhPJwyP4a+VxZiMH6zWWGhuB78hcK2Q2pL8RSwZMZTxnQb+vVAOqO5gC23zXNSvNfpWzfQVV4YXdOu/TgKpqcZy2o=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr11703002eds.251.1628244978437; 
 Fri, 06 Aug 2021 03:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
In-Reply-To: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Aug 2021 11:15:34 +0100
Message-ID: <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Duo jia <jiaduo19920301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Fri, 6 Aug 2021 at 07:24, Duo jia <jiaduo19920301@gmail.com> wrote:
> I am simulating a device. When an interrupt occurs, another interrupt
> comes, and the second interrupt will not be triggered because the
> first interrupt has not yet finished.
>
> I want to know whether qemu can detect whether the interrupt has been
> executed, will there be a callback here?
> Or how can I deal with this situation?

End of interrupt handling is entirely dependent on what the
guest hardware being emulated is. Usually the guest software
will indicate "interrupt handled" back to the interrupt
controller (perhaps by writing a register; depends on the
interrupt controller), and the interrupt controller will
then look at what the next highest priority pending interrupt
is and signal that back to the CPU, or do nothing if there's
no new interrupt. So the second interrupt will automatically
be taken and handled once the first one has finished,
as a result of this interrupt controller and guest OS
interaction.

The original device usually doesn't get told when this
happens, and it doesn't need to know. For example, one common
form of device interrupt is level-triggered. Here the device
has some condition (perhaps "FIFO full") that causes an
interrupt. So it raises its outbound IRQ line when the FIFO
is full, and it doesn't lower it again until whatever the
device specification says is the condition (eg when the
guest reads from the FIFO, or if the guest writes to some
'clear interrupt' register on the device). It's the job of
the guest software to make sure that when it gets an interrupt
from the device that it handles it such that the device has
been satisfied and lowered the interrupt.

More rarely, some devices are specified to pulse their interrupt
line when a condition occurs.

In summary, you need to look at the specification of the device
you're emulating to find out when and how it is supposed to
raise or lower its interrupt line. ("I didn't get a second
interrupt" bugs might also be caused by bugs in the interrupt
controller or in the guest software device driver -- if you're
just using an existing known-to-work QEMU interrupt controller
model and a known-to-work device driver and OS, then the
bug is very likely in your device model. If you're also
writing the OS device driver at the same time then the bug
could be there instead.)

-- PMM

