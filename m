Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A16BF212
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 21:04:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdGHs-0007ES-Hy; Fri, 17 Mar 2023 16:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pdGHp-0007ED-Kt
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 16:02:49 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pdGHn-0001kO-LA
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 16:02:49 -0400
Received: by mail-io1-xd2f.google.com with SMTP id g6so2789958iov.13
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679083366;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7m5Nl1TLBO2YdThwBhpaNfE1OKnGNkWKV0Wipt/SmVA=;
 b=WYUK5vtwIuIRwEzMLX5imckcs4PIHGXHI6HSbk6n0StU9HdmIjveMmZiLYL3zgYIdn
 hnB1G793afac3XcmFJUAk9qgiTG1NK33l8p9KD1GPk9nxj12vk2lQsfaEFp+VOwWd/Zk
 zAvhcWb3IQOiGFT1qgtTjexAFIq4EYoOLdHHYbiFMUCWiH/5fSpV3Zxqvs7srGRhQl2s
 KpKTnYquiluOX6jfuzSz4sD6MtmuBdI/nhpLiFa5mP+NevyXdO++/2sT7EN7vYIU1qAB
 lCko7pg8syTociG96IqZMIyjrOFwzQ7NMsjpbcz9uzUeQVW0Bo2CyJRmtk8n42KUvPDA
 yZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679083366;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7m5Nl1TLBO2YdThwBhpaNfE1OKnGNkWKV0Wipt/SmVA=;
 b=yB0Of3g7coBubKBkwdGvIknRo4l+zfvJRqF1qNTHFXrcuuHAs9mtIjbBIJfGO3H5Sl
 oa0ZctWMMfymTz48jp2BkpjcxPdrbexjngh8Kku6oj/Qem5Mh3MtcuiUbNoKN8jn34ix
 7AMmpf4b/Wf9G7ywaCbZKsBdfLEC30qrO84chop8o2lEWNC8nUHZvLBeaZLj9uOVevtb
 fE9iWJxb6PFIJ9jUpx32nYQuPn3qoFsMW7f4gHXRoRQX8QIOG5bO0Ntcxlxibn2OSrIA
 CetcNXPHXO3wXwxQ/HPqkTHtXHHwmPMwErfn/baBGVawQtdDP8BEK999ccKpbcToOZGU
 yNmQ==
X-Gm-Message-State: AO0yUKUpcP7SK/AW6x96iAbVMvFRiqCAk+J4k+m3NJYSSvShTFTQue02
 lHQ/brNIKWvYn65EWI70CAte+dFn7VcfCr3Vg1M=
X-Google-Smtp-Source: AK7set8d5oY1f8zW+ESxBRQrk2iLKb8JpQMQNhOx855BHP8y6L9f8C98KNC6ceCAZ0JpRm8LUQi8+tgBX0rZgLg8bno=
X-Received: by 2002:a6b:90e:0:b0:74d:5a9:b55a with SMTP id
 t14-20020a6b090e000000b0074d05a9b55amr326392ioi.0.1679083366071; 
 Fri, 17 Mar 2023 13:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <CALfBBTuELntcARWxvHyGmYvHbEACujhBq8bphHKnUv_C_z33Bg@mail.gmail.com>
 <20230317163720.00005c23@Huawei.com> <20230317181205.0000002d@huawei.com>
In-Reply-To: <20230317181205.0000002d@huawei.com>
From: Maverickk 78 <maverickk1778@gmail.com>
Date: Sat, 18 Mar 2023 01:32:35 +0530
Message-ID: <CALfBBTusFvQJ-dFO-2xZ3e437syvyUC9mgJ4Gi4MT50Cc5iamA@mail.gmail.com>
Subject: Re: Call failed: MCTP Endpoint did not respond: Qemu CXL switch with
 mctp-1.0
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=maverickk1778@gmail.com; helo=mail-io1-xd2f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jonathan,

Thanks for the quick response, this patch works!


Regards
Raghu

On Fri, 17 Mar 2023 at 23:42, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 17 Mar 2023 16:37:20 +0000
> Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
>
> > On Fri, 17 Mar 2023 00:11:10 +0530
> > Maverickk 78 <maverickk1778@gmail.com> wrote:
> >
> > > Hi
> > >
> > >  I am trying mctp & mctpd with aspeed +buildroot(master) + linux v6.2
> > > with Qemu 7.2.
> > >
> > >
> > > I have added necessary FMAPI related patches into QEMU to support CLX
> > > switch emulation
> > >
> > > RFC-1-2-misc-i2c_mctp_cxl_fmapi-Initial-device-emulation.diff
> > >
> > > RFC-2-3-hw-i2c-add-mctp-core.diff
> > >
> > > RFC-4-4-hw-misc-add-a-toy-i2c-echo-device.diff
> > >
> > > RFC-2-2-arm-virt-Add-aspeed-i2c-controller-and-MCTP-EP-to-enable-MCTP-testing.diff
> > >
> > > RFC-3-3-hw-nvme-add-nvme-management-interface-model.diff
> > >
> > >
> > > Executed following mctp commands to setup the binding,
> > >
> > > mctp link set mctpi2c15 up
> > >
> > > mctp addr add 50 dev mctpi2c15
> > >
> > > mctp link set mctpi2c15 net 11
> > >
> > > systemctl restart mctpd.service
> > >
> > > busctl call xyz.openbmc_project.MCTP /xyz/openbmc_project/mctp
> > > au.com.CodeConstruct.MCTP AssignEndpoint say mctpi2c15 1 0x4d
> > >
> > >
> > >  The above busctl configuration is reaching fmapi patch and sets up
> > > the endpoint id but then mctpd fails with log after timeout.
> > >
> > > Call failed: MCTP Endpoint did not respond
> > >
> > > Any clue what's going on?
> >
> > Hi Raghu,
> >
> > Yikes. Didn't think anyone would still use that series.
> > Not even sure I still have a tree with it on.
> >
> > I'll try and bring up again and get back to you. Might be a little
> > while though.
>
> It is Friday and this was more interesting than what I was planning to do. :)
>
> I think the breakage comes from the async send i2c series that was a month
> or so after the PoC was posted. Issues was it was only entering the _bh once.
>
> Following hack works for me on current mainline (+ CXL patches that shouldn't
> affect this.)
>
>
>
>
> From c8d819835faaec2b2a4755eb891284fe21c0747d Mon Sep 17 00:00:00 2001
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Date: Fri, 17 Mar 2023 18:07:08 +0000
> Subject: [PATCH] misc/i2c_mctp_fmapi: Hack
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/misc/i2c_mctp_cxl_fmapi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/hw/misc/i2c_mctp_cxl_fmapi.c b/hw/misc/i2c_mctp_cxl_fmapi.c
> index 219e30bfd5..2e2da80264 100644
> --- a/hw/misc/i2c_mctp_cxl_fmapi.c
> +++ b/hw/misc/i2c_mctp_cxl_fmapi.c
> @@ -330,7 +330,7 @@ static int i2c_mctp_cxl_switch_event(I2CSlave *i2c, enum i2c_event event)
>      case I2C_FINISH:
>          s->len = 0;
>          s->state = MCTP_I2C_PROCESS_REQUEST;
> -        qemu_bh_schedule(s->bh);
> +        i2c_bus_master(s->bus, s->bh);
>          return 0;
>      case I2C_NACK:
>      default:
> @@ -671,12 +671,11 @@ static void mctp_bh(void *opaque)
>
>      switch (s->state) {
>      case MCTP_I2C_PROCESS_REQUEST:
> -        i2c_bus_master(s->bus, s->bh);
>          s->state = MCTP_I2C_START_SEND;
> -        return;
> -
> +//        return;
> +        //fallthrough
>      case MCTP_I2C_START_SEND:
> -        i2c_start_send(s->bus, s->source_slave_addr);
> +        i2c_start_send_async(s->bus, s->source_slave_addr);
>          s->send_buf[s->len] = s->source_slave_addr << 1;
>          s->len++;
>          s->state = MCTP_I2C_ACK;
> --
> 2.37.2
>
>
> >
> > Jonathan
> >
> >
> > >
> > >
> > > Regards
> > > Raghu
> >
> >
> >
>

