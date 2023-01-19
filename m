Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE7E6735A6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISGv-0005C2-F7; Thu, 19 Jan 2023 05:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pISGU-00050h-Qi
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:35:26 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pISGT-0003Hk-3M
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:35:26 -0500
Received: by mail-pf1-x432.google.com with SMTP id z3so1144750pfb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fQ96p0dBVQA/G18m2ezDd4as0ywpHwNy6NBGWRmwj7I=;
 b=T/mXKQWaXaA/ANeRZX7kXcN/R5n7whgS4Q939roH6SWCIdnRShzuVlRFSPlMdGE9kw
 3hcPsZeQ8hj4Axtno6e9/fk+eyxbODRdh5r3aUPpou3xMv6R0GVJdLJWMF+4Bn7fvaNH
 yr6418GVRBCKU73CufE3ps53PfAPk4gHk3VRAFUkKycjCxO/oB3hTsQjgxpQ0ABgk6EH
 H08O541zFp3GXShf8s2ejv0HZZsRtw2gu9eT3zk8A+QICN+tN+ZJ+gHmd7R5zWzIsRZ/
 +9Zmiozd0YYkFIigOhbVKIlSh/QCHmtXirrxpduoROK/9Q9UG4yuyn4sUfKWVQCrN8r9
 735w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQ96p0dBVQA/G18m2ezDd4as0ywpHwNy6NBGWRmwj7I=;
 b=m1XNYNAwAJ0FbyZHs//ffle6gwwcSZ1fvPGi2K35lqllSVyEU4drNsKTwxBK19QXD1
 jmH3qeWlPGdEMVNeQKlndph1XGnMlcLrf8qvdC1JndKBd0P7N4hZiZxXmBubYVkvGMef
 FAv8+vAqTXChD8dU4P7Hrsd3t/6cHWFHghKkNa2Bbx4NGRKLiDKtVtatXnynbOGgJhKo
 ppSSCQmd42lUFLYXCryHU7umjBJcp8LO8nMYgicfGLsEQm/cMg8uNRO1JNq80KyH+TZu
 OuZ3JvOPGfjwTpYfithkl1y968lyX7HkUMrdlXptNLwTNJ6fLQNcqtVQEIZ6Enb0HLEv
 ZkWQ==
X-Gm-Message-State: AFqh2krOfvVgkcXIOI+MSLeiP4FHApZz4iDUVttQCHSHbZLPI5ai5Zw1
 jg5Io1o9stUq9ISeviG1TcIeoGtxqXrhFxGmGxo3cQ==
X-Google-Smtp-Source: AMrXdXvcwbQeLzsDuN3Qzfoh21hfeuv3ksx7pR9Z4HNKckU+frp0+CHzvtYt7ll/5JIXTZYz8c0Ye1nrfsbnf0mUP6I=
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr1022704pfb.26.1674124523131; Thu, 19
 Jan 2023 02:35:23 -0800 (PST)
MIME-Version: 1.0
References: <Y8Yq5faCjAKzMa9O@kbusch-mbp>
 <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp> <Y8h7aOuVfCb+RsAP@kbusch-mbp>
 <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
 <Y8iulgdgOdVCjuKE@kbusch-mbp>
 <CAKmqyKMveR=RD6fgnzY0SV39tofD+Ws_AbrSZXE_o4m=M6GZHg@mail.gmail.com>
 <Y8jBG/j8w2R43kYd@kbusch-mbp>
In-Reply-To: <Y8jBG/j8w2R43kYd@kbusch-mbp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 10:35:11 +0000
Message-ID: <CAFEAcA-wC=5v2Kq=CnbeFq+YNxrkLskChAW_OkK_qbK7RVZfQg@mail.gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
To: Keith Busch <kbusch@kernel.org>
Cc: Alistair Francis <alistair23@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <its@irrelevant.dk>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 19 Jan 2023 at 04:03, Keith Busch <kbusch@kernel.org> wrote:
>
> On Thu, Jan 19, 2023 at 01:10:57PM +1000, Alistair Francis wrote:
> > On Thu, Jan 19, 2023 at 12:44 PM Keith Busch <kbusch@kernel.org> wrote:
> > >
> > > Further up, it says the "interrupt gateway" is responsible for
> > > forwarding new interrupt requests while the level remains asserted, but
> > > it doesn't look like anything is handling that, which essentially turns
> > > this into an edge interrupt. Am I missing something, or is this really
> > > not being handled?
> >
> > Yeah, that wouldn't be handled. In QEMU the PLIC relies on QEMUs
> > internal GPIO lines to trigger an interrupt. So with the current setup
> > we only support edge triggered interrupts.
>
> Thanks for confirming!
>
> Klaus,
> I think we can justify introducing a work-around in the emulated device
> now. My previous proposal with pci_irq_pulse() is no good since it does
> assert+deassert, but it needs to be the other way around, so please
> don't considert that one.

No, please don't. The bug is in the risc-v interrupt controller,
so fix the risc-v interrupt controller. It shouldn't be too difficult
(you probably have to do something like what the Arm GIC implementation
does, where when the guest dismisses the interrupt you look at the level
to see if it needs to be re-pended.)

Once "workarounds" go into QEMU device emulation that make it
deviate from hardware behaviour, it's hard to get rid of them
again, because nobody knows whether deployed guests now accidentally
rely on the wrong behaviour. So the correct thing is to never
put in the workaround in the first place.

thanks
-- PMM

