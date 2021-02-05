Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F853108AC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:06:38 +0100 (CET)
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7y0b-0002In-3k
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7xyF-00016t-5J
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:04:11 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7xy9-00037v-H1
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:04:10 -0500
Received: by mail-ed1-x529.google.com with SMTP id df22so8177972edb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 02:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QkRraTuG9I3+RUzT5etVSoU/LORb9JRlwCxVj6PexCU=;
 b=Bomdp42eh4lVeXpgpduSUl9xuTWk1AnIq3e5LYDgJ4/U83wVG756NFvUNanCdqn/zV
 0ZLZ2cEbhAQIYCJCIwJonZk7gDKBQkoAauwqU1BjhP8eDRjCBp5cXVzHBIo/xGhonHNU
 P3dXyRNmnaWRKCfmXISZrG8ak//RxlOjqAbK4TzW5KvWpxhn5eQYbKnld6WcYZFfye6u
 Do6dbuxR8x1LAkXlg8KyYNEUTByjEhEtfaeUby4R9BYlXb/7HxAvQz1L+NELX1aeQcid
 +MAD5urynzw8z4FeEdkV5GpgbPqAfqlINnZNirCaTJEPwVfufd/wluq07fQ0g5UOmFSX
 7SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QkRraTuG9I3+RUzT5etVSoU/LORb9JRlwCxVj6PexCU=;
 b=Hd3FnFagcUc6y1aUzKSQ4ZzFeXKP21OI+9C+dyNnrryvHT97/NptToTRlaUGXrzhqK
 rg0TMHM4f+64RbblaW7+DArYVyUB0N88lVsPm+m9RDcR5v/vPhh1CDccSUpZ6W+o5IJX
 fzu7eqLHZFJAXf0gtvYKmG1AkU4o2nCHTp6niLb9GRLKMuNvo+TeYPVXqix8Elp2NWLA
 yZDGsnrjrXwUb/eaRBjMZeZL4p9CuqRqvnaSpTwEZZSfibhNFVS7ARpROlWVfUxm9VNI
 EsdWTfcaa3cMZdLIRbn9YAvrITW1vOtCdMGsdiNxejh+z2bLwVhlepJEav4kEhTaWiV+
 IOVw==
X-Gm-Message-State: AOAM532fESZdbV0k+z3qOKEFK39jFwqU0amYWTGcF7QKDj39AKEJbNIC
 lTUb6wqqBI9sCLiBmfxE5hcC877qGh4iudSaF00RjQ==
X-Google-Smtp-Source: ABdhPJzm1DrlbNbX6Cp/zLRQlJpKpYvo+qGK9qugjmWB1YoLSFiSnlOSSfJ80/efLyIjxFw75oghBMiAaSUV55tLS7I=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr1332075ede.44.1612519443895;
 Fri, 05 Feb 2021 02:04:03 -0800 (PST)
MIME-Version: 1.0
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
In-Reply-To: <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 10:03:52 +0000
Message-ID: <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, schspa <schspa@gmail.com>,
 Kevin Zhao <kevin.zhao@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 07:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Indeed, you found a design issue IMO:
>
> Versal creates the "mr-ps-switch" to be explicitly different from
> the main sysbus memory. TYPE_VIRTIO_MMIO is a SYSBUS device, thus
> can not be created without being plugged on sysbus.
> We want TYPE_VIRTIO_MMIO to be TYPE_USER_CREATABLE so we can create
> it on the command line (like your usage). TYPE_SYSBUS allows such
> automatic plug it on the main bus, but also maps to main memory.

That was never the design intent for the virtio mmio transport.
The idea was that the board creates a bunch of transports
(unconditionally). The user then uses command line options
to create virtio backends (blk, net, etc) which get plugged
into the virtio-bus buses that each transport has.

virtio-mmio is not user-creatable for the same reason that
all devices with MMIO memory regions and IRQ lines are not
user-creatable -- there's no good command line syntax for
the user to wire them up, and we don't want the user to have
to know "on this board address 0x50003000 is a good place to
put a device, and irq 43 is free".

thanks
-- PMM

