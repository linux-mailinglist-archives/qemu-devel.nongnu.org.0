Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C357244BE9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 17:23:28 +0200 (CEST)
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6bYF-0000TG-5y
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 11:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k6bRO-0005eY-03; Fri, 14 Aug 2020 11:16:22 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:46366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k6bRM-0008PZ-32; Fri, 14 Aug 2020 11:16:21 -0400
Received: by mail-il1-x142.google.com with SMTP id c6so8688535ilo.13;
 Fri, 14 Aug 2020 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xtt73A/X2cf9b6MoJt/wCCC2aLBtUWrgTkG2A7fVThY=;
 b=sEV/yKY5jwRsO9e8gzS+Lr6CCwqhW5gDQV8UyI4edo10Xvmze2YvC9yFxuq+6IxjMw
 c6kRpBXxaWdE6Gi7arExCOWZpPY5ZUCI5SxJ5hsbVbl4h1TlzfzCChvGK+xWaH+xMdtz
 vW0oBRVuUQOUAiCY0QZPwER4sIOM8p55uc/nrsx6166xHedtDna9Nz71d1SsWCic0uVB
 jnBeqycZWrfSwVZYnPc6R+xIWXUFZII72mSA8STPWT7mRvKw7YxUsdf9pHE7G+tgaR1j
 fzj7co7uAYwoqq7jANztHgubXh5zMbXNCeh0KiNiQgBEJUjiYf46k3Tp/Vh8vG6lMCPu
 hHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xtt73A/X2cf9b6MoJt/wCCC2aLBtUWrgTkG2A7fVThY=;
 b=tWmR98Yt6nJIKQmroPfjow2rQJ0dCaiYXiJJlcP9cd8FSS8tvW4/egKx1OazJGCNAj
 T+ZYIsXy8AC+DWMVUp8N9E/zdpAAWBCbFoZkOlqGwLDpe35QVWqrEA5B50kCVmrKBVXT
 vY/W5yyf9ZMYa6k4UOm2WXrtfkePFGeG5RLsMBKcCLwygEEZtvxkd4u9KK4Cjv0/VN83
 jpsvANZsz/LRijCwVE5Bq2Ojla1IhamTXVAYyxRfLLdAwwCZvOd0tCEV2iTqICwJcVSz
 8J3gOIVGBzth9n3v8mkriZHWd9RNgX72ouWGQ6eHue0/Qz/lxys7mzABSbPvMcRTASwM
 DaAQ==
X-Gm-Message-State: AOAM531/kgTckAwRbgDoYnrPRuoFpnKJoriix0h+/3f4lOI/E6Pfa1a5
 ujEj9Hyh2LQAIKb6nIRKF2qSVlPUCaadl1vfRYM=
X-Google-Smtp-Source: ABdhPJwZbYCGfxH5de72bUmxp7hKi84tnBoyvlLeQTOL8qFn2d7gKUaq2i4fMLMBFJVIByyLFUg6jVAD61fbg8eeDD0=
X-Received: by 2002:a05:6e02:ef3:: with SMTP id
 j19mr3067780ilk.227.1597418177525; 
 Fri, 14 Aug 2020 08:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200814133007.16850-1-f4bug@amsat.org>
In-Reply-To: <20200814133007.16850-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Aug 2020 08:05:48 -0700
Message-ID: <CAKmqyKPxRQWNSq9N=5d=VhD7Lt=eKds-Fs=3J=-Gz4rRF=0vdw@mail.gmail.com>
Subject: Re: [PATCH] hw/net/xilinx_axienet: Remove unused code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
 QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 14, 2020 at 6:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Most of the MDIOBus fields are unused.  The ADVERTISE_10HALF
> definition is unused.  Remove unused code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/xilinx_axienet.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 1e48eb70c9..2e89f236b4 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -54,7 +54,6 @@
>       TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
>
>  /* Advertisement control register. */
> -#define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  *=
/
>  #define ADVERTISE_10FULL        0x0040  /* Try for 10mbps full-duplex  *=
/
>  #define ADVERTISE_100HALF       0x0080  /* Try for 100mbps half-duplex *=
/
>  #define ADVERTISE_100FULL       0x0100  /* Try for 100mbps full-duplex *=
/
> @@ -169,28 +168,6 @@ tdk_init(struct PHY *phy)
>  }
>
>  struct MDIOBus {
> -    /* bus.  */
> -    int mdc;
> -    int mdio;
> -
> -    /* decoder.  */
> -    enum {
> -        PREAMBLE,
> -        SOF,
> -        OPC,
> -        ADDR,
> -        REQ,
> -        TURNAROUND,
> -        DATA
> -    } state;
> -    unsigned int drive;
> -
> -    unsigned int cnt;
> -    unsigned int addr;
> -    unsigned int opc;
> -    unsigned int req;
> -    unsigned int data;
> -
>      struct PHY *devs[32];
>  };
>
> --
> 2.21.3
>
>

