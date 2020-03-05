Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01417AE99
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 19:59:40 +0100 (CET)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9vie-0004w7-00
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 13:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j9vho-0004Hh-4e
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 13:58:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j9vhn-0008SJ-3x
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 13:58:48 -0500
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42]:36722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j9vhn-0008RT-0P; Thu, 05 Mar 2020 13:58:47 -0500
Received: by mail-vk1-xa42.google.com with SMTP id y125so1931271vkc.3;
 Thu, 05 Mar 2020 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ps/gAnOl+2H5dhWF4htQ1STgq0hnL5TSprkqaAKtMds=;
 b=Fn+AXIKa0tyZLvPEsoATtAMmR43aDdTuz9QVr59ZwI96OPkqPJX3Zw0g/njDKEjFOJ
 lpHuyJ3srMZ+o5PRJd8FkWKQnvvm17SlKAVurdec47voVPe2XA9Z7iI7TNhiGkfvxer+
 0rFTx6G0l7DFXLJcSsSB54JhwPqoH/JPULaS3FVMGppT+gIRV/pwzvw1NKrzyHsMuAV1
 yjSsKicYdDBG0H0gjXtC6QdTsrW7wm1Lpiya3Rm1fxbSAx5apkkG0FsmvyL9rROTdOd1
 GdWjykiMsuvm10hTXdYHG2+71KWpoMM4vNmgFvSDxRe4oeHTXfDlEU4hJl2dZWtYBwJF
 nQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ps/gAnOl+2H5dhWF4htQ1STgq0hnL5TSprkqaAKtMds=;
 b=Hv3UBOfEMFssEj9i10MxenuAfHBHsDdbSG5KzhkmLj7e5LxNwTTDAwuhzMM+uek1HJ
 /JiyqTClbmzt0P0ChVsLb3BOCu1S96JdgCKT9FtMOBLQoi8e2hC4k7EyeMkgNHYElMfx
 jDAwuoCZ+7R3YwoHeqMsXDx21g61MkeVG0/bJqnaSCckcyT7hi2ca46bb7ojZDjAX3Ad
 k/WonfRMqTGuChYoZSN31/E/461htNkA4yDgCZW8bWFs90xlQmkrYuURr7Bz7RF3ORS0
 71zHG2i0ZPt/zT5XnNWW6bQmaJ18H5/mzjggIbqlz13pglM0mYV8Y8cpgckO90sRq4Ej
 d/RA==
X-Gm-Message-State: ANhLgQ1xjsIDWzbsz05WH/BCKAKFNth0aNcC0c2qsTvm5anB3MlHcZsD
 8C4y2AnqJb9xkNDRndVhyt/WwRxgcyr7OP15+7U=
X-Google-Smtp-Source: ADFU+vtDeDFkq59RFTwoMXoO+voDOc7hbX9BW787KIz8gR/4fEVUNXh+mlUg04Co14mfmGB1aDkinsy7Fc/ygJtpdYo=
X-Received: by 2002:a1f:284:: with SMTP id 126mr379543vkc.16.1583434726275;
 Thu, 05 Mar 2020 10:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-5-philmd@redhat.com>
In-Reply-To: <20200305175651.4563-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Mar 2020 10:51:04 -0800
Message-ID: <CAKmqyKMO+rJFheewHcHjTOCL_Z1ze=JMjNX8Y4Sq+jWCAN3p9A@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/net/rtl8139: Update coding style to make
 checkpatch.pl happy
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a42
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 5, 2020 at 9:59 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> We will modify this code in the next commit. Clean it up
> first to avoid checkpatch.pl errors.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/rtl8139.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index ef3211537f..be9a0af629 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -799,10 +799,12 @@ static int rtl8139_can_receive(NetClientState *nc)
>      int avail;
>
>      /* Receive (drop) packets if card is disabled.  */
> -    if (!s->clock_enabled)
> -      return 1;
> -    if (!rtl8139_receiver_enabled(s))
> -      return 1;
> +    if (!s->clock_enabled) {
> +        return 1;
> +    }
> +    if (!rtl8139_receiver_enabled(s)) {
> +        return 1;
> +    }
>
>      if (rtl8139_cp_receiver_enabled(s) && rtl8139_cp_rx_valid(s)) {
>          /* ??? Flow control not implemented in c+ mode.
> --
> 2.21.1
>
>

