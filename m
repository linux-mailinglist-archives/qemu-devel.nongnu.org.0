Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C3332A41
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:22:06 +0100 (CET)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeBR-0007UP-Fk
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJdNX-0000Lf-El
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:30:33 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:39503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJdNV-00088o-He
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:30:31 -0500
Received: by mail-il1-x12f.google.com with SMTP id d5so12345268iln.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UFiTteGxIWzglXUGobNDEyTTes0z0Yxcm9Sz45fkq5c=;
 b=kd6wxKmGEFltCYg8Rer5UmjKMRbBo6wiWlf7GR5j9zg4xHCtvAE7hFkzi+ZN9st4QG
 qiDdMbXJV1k+AfrJRYYDDNAhij5AJEeb3Iez9a/6bufMej6NMw5YtntxAT8qZfouK/A0
 8aSEGxooigTlr1DriF75dK1zMStE6q+6gVAcMfYD7DuX2JlFbYMDi+lqp8mq75Cc8zEb
 LjTFzTRcifMVeEHXibk/PrQ0VM+swrkJbkIsykm9RH9W4Lk55hvSfxhm6VHuw25Kq4Qc
 2LHoQLQrSTFBZtk4sTNwg02cxkGgBMHbIlR1IquxeCYCVGYU54mFFxlFcvdFbRhJ/vbL
 2Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFiTteGxIWzglXUGobNDEyTTes0z0Yxcm9Sz45fkq5c=;
 b=UeNPJA+dTdJDXFyheH/rntULFeQdhZSiknuOe7BHa02KmMgpp6rODtRgl9tB9F1gPi
 8U70YB/5e3STMeqrn4bU+JKs6ZEC8dxiwXur06jwnZoCQx6DWlEqlN+EVg4KFVMavDXp
 +fZbN+KrSGqssvtbPAk1dfJNo1TiBs48Im3QTViPvvaYAvr4DijkDFkl8RviUMfouMTn
 HhG6kkBFYRrhgD/JoHf+kGZ0+FEPMkMxCjPyWCHHZDNiYGpqNK6hLbeM5uSJsAsxS2+i
 zRte/45vz5BbMnLQW5n+z/8SP9n5Ivjw9L1GtEKWQzMYVynjZB6AP8GxJMx0VyF3pczS
 6l8A==
X-Gm-Message-State: AOAM53079y62jeh++bvgX2bOkV64jP8zlvoFB2H01qizrR1ZPvrGd5Xm
 5kHhHUuIbYvZXfB7jhyDT0Xazz5wZ396RZJRL34=
X-Google-Smtp-Source: ABdhPJxFA/FcItgQYz4H8FEMXdK+kGQBgQspAPwn6xeYaYLMDwGfJ+SUXXv0/tauD1sSE4e4aMPx4OSBPVYkCrG8Bfw=
X-Received: by 2002:a05:6e02:1a0c:: with SMTP id
 s12mr25115995ild.177.1615300228433; 
 Tue, 09 Mar 2021 06:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20210215231528.2718086-1-alexander.wagner@ulal.de>
 <CAKmqyKM4ewocr51Qhx8R1XR=r2rcgyuBLTqhpi-MYVpFko_Rcg@mail.gmail.com>
 <19c50d64-fe9d-8c72-2002-3586abac821c@ulal.de>
In-Reply-To: <19c50d64-fe9d-8c72-2002-3586abac821c@ulal.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 09:29:08 -0500
Message-ID: <CAKmqyKMhDyHkfn7zszhDOiKY5k=JRzmYjz7-QD9j8Ntr=T8Qag@mail.gmail.com>
Subject: Re: [PATCH] hw/char: disable ibex uart receive if the buffer is full
To: Alexander Wagner <alexander.wagner@ulal.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 2:27 AM Alexander Wagner
<alexander.wagner@ulal.de> wrote:
>
>
> On 08.03.21 14:47, Alistair Francis wrote:
> >>   hw/char/ibex_uart.c         | 20 +++++++++++++++-----
> >>   include/hw/char/ibex_uart.h |  4 ++++
> >>   2 files changed, 19 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> >> index 89f1182c9b..dac09d53d6 100644
> >> --- a/hw/char/ibex_uart.c
> >> +++ b/hw/char/ibex_uart.c
> >> @@ -66,7 +66,8 @@ static int ibex_uart_can_receive(void *opaque)
> >>   {
> >>       IbexUartState *s = opaque;
> >>
> >> -    if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
> >> +    if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK)
> >> +           && !(s->uart_status & R_STATUS_RXFULL_MASK)) {
> >>           return 1;
> >>       }
> >>
> >> @@ -83,6 +84,8 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
> >>
> >>       s->uart_status &= ~R_STATUS_RXIDLE_MASK;
> >>       s->uart_status &= ~R_STATUS_RXEMPTY_MASK;
> >> +    s->uart_status |= R_STATUS_RXFULL_MASK;
> > Doesn't this mean we set RXFULL on every receive? Shouldn't this check
> > the rx_level first?
> >
> > Alistair
>
> Thank you for having a look! :)
>
> Yes, this is correct. The RXFULL is currently set on every receive. The
> RXFULL is used to indicate to QEMU that the device cannot receive any
> further bytes.
>
> As the FIFO buffers are currently not yet implemented I thought it would
> make sense to behave like the OT UART could only receive one byte at a time.

Ah, good point.

Can you add a comment where it is set describing that then?

Alistair

>
> Alex
>

