Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B330B0F3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:58:03 +0100 (CET)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fKk-0000nv-4q
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fJ3-0007lZ-E4; Mon, 01 Feb 2021 14:56:17 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:35802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fJ1-0005FE-4e; Mon, 01 Feb 2021 14:56:17 -0500
Received: by mail-io1-xd2e.google.com with SMTP id y19so18759666iov.2;
 Mon, 01 Feb 2021 11:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OP2EWmjCbiDpjWViceOA9fmZyxGs7V0VIVK1IMMwVh8=;
 b=Umbl2I+s1X8Nvo7Ss6IBVgTzI3MBCSVs/IUeVU0dpptSNlnHz7E1MHnIiMJU39kjau
 /ZOePKVGckuyRigSWhGzd5ZniRsOOXIGa+olSg3mzvvqqtqefvve6S97DxA46G8VnTFn
 4mQySrRTF4SnX534MVAYcDXsCmxKuz0iG542uIlyV2Wpaj4RbNDwEbzosj4hGO7nlGoQ
 CNcD/4EHZuOz3JtvYifDg5DNRw7INMN2MC+Sw60I4jxsAh0DppanAYKbipQfRCTi5nO7
 u+eOToMpyl/HBhR8zS80pkOvSFbs2ZaHdzuznsf8Bzc/6gvYu0JDZiP8TAWQP8h/6FYT
 NGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OP2EWmjCbiDpjWViceOA9fmZyxGs7V0VIVK1IMMwVh8=;
 b=H7UzoOAlPkwH3DPY0qK5/JeGvKZqWWapApfdA9YOJwzLKmdFgnOulqehO5XdnX4OR0
 McQpffc2ViRDLmHdfIb54W5cQDf8KoPONdoyFVBpDuakd2D2eGlcwgEfsmPASiU+ZMFQ
 4kHd93TxLqD6LHUtU7BvyYXvR+0RntCr9O9oBscGwzTWRP3AEn5YVLrSu/WWIYpfnRlq
 TBy8FXfei5kmKHwjc+ChoGH0iOXKNZY8pG7XMuuMcd84J7aOKiJuJi5cnDAZlAgMycYo
 yopGXoT3o6UMVilYp5mSQo4QyLOI7oeLhRv9yUybHV2PVZJ9C7FLTPcI1+jpXuwdtN0B
 D8dw==
X-Gm-Message-State: AOAM533zY58ENyeQ1bMenPbIbrxOv7gvCPrCo6JVZVriAxh6Czex7Fl7
 gwtYw6Sle8K7E+LLVm4V5Q6NjC5+6HY/RhmDUG8=
X-Google-Smtp-Source: ABdhPJyjWS+f4Qy5YmrKkG3VKMRGzDoy/3ZMjta6Ql14JwwSfEJAAPe85RiU1+mUTspQnmoXc3nJNZLIv0MS9Z2sdkI=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr14198447ioq.176.1612209372988; 
 Mon, 01 Feb 2021 11:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20210131184449.382425-1-f4bug@amsat.org>
 <20210131184449.382425-6-f4bug@amsat.org>
In-Reply-To: <20210131184449.382425-6-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:55:45 -0800
Message-ID: <CAKmqyKMbC0KhwFhc1dAWRX2ismR7uR1KJeFnqHqP07VUsGAPVg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] hw/net/can: ZynqMP CAN device requires PTIMER
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 31, 2021 at 10:49 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Add a dependency XLNX_ZYNQMP -> PTIMER to fix:
>
>   /usr/bin/ld:
>   libcommon.fa.p/hw_net_can_xlnx-zynqmp-can.c.o: in function `xlnx_zynqmp=
_can_realize':
>   hw/net/can/xlnx-zynqmp-can.c:1082: undefined reference to `ptimer_init'
>   hw/net/can/xlnx-zynqmp-can.c:1085: undefined reference to `ptimer_trans=
action_begin'
>   hw/net/can/xlnx-zynqmp-can.c:1087: undefined reference to `ptimer_set_f=
req'
>   hw/net/can/xlnx-zynqmp-can.c:1088: undefined reference to `ptimer_set_l=
imit'
>   hw/net/can/xlnx-zynqmp-can.c:1089: undefined reference to `ptimer_run'
>   hw/net/can/xlnx-zynqmp-can.c:1090: undefined reference to `ptimer_trans=
action_commit'
>   libcommon.fa.p/hw_net_can_xlnx-zynqmp-can.c.o:(.data.rel+0x2c8): undefi=
ned reference to `vmstate_ptimer'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 5ad3c6b5a4b..d4cec9e476c 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -81,3 +81,4 @@ config XLNX_ZYNQMP
>      bool
>      select REGISTER
>      select CAN_BUS
> +    select PTIMER
> --
> 2.26.2
>
>

