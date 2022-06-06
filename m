Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07DA53E413
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 12:29:39 +0200 (CEST)
Received: from localhost ([::1]:39044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny9zO-0006as-Dd
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 06:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ny9q6-0004Sn-GC
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:20:03 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ny9q4-0004wY-TZ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:20:02 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f83983782fso138162617b3.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r30gGWM13TxZGi60P97WSudT+FWPB6VdDMnw1EArf34=;
 b=EKz9bQ+y0zRiPX5uuNuEnjrmdw1Z96Lb0VmvfxUVQedmxoLQg0inE4pkjrpNXig9sS
 qcSBaTMNx9tvERTVJ3pW5dhoD+5KrMK8L4ROk4sVnTLLgMPKV0hKls2uHAX4RvVmx2md
 u5GK9KpBltpd00Uipkz6cMO5FDZlGCtlYdxQ+ei4Xc/p+bBl0yGZ8qwkcZhou1Nc4LPe
 QLl+qhIcdNlKN/tnz2W3RG8HXZuzuF8AqjQQnoEAp2LnUqyoWzjUIrNguHiA0XhAMRDj
 fRq+PBq9WW38aTSGqOFMh4hs1mh7WoZzHkKzHYFw2gwEklZmOLLdM0EMhkibFpcVPCry
 GZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r30gGWM13TxZGi60P97WSudT+FWPB6VdDMnw1EArf34=;
 b=X8Z+FJyBkJQIHNG6FN7gJm/ZcURCZgv6qCijt6/kcvBxLlewwTxtoIdnoi25CQP3eV
 l7RCadh5b6oxxUexyIaXnqLqcBTroxw1MZ0TRP7uKFX4CgRYl0sbbh81AREPmjyAfjDN
 jMFprcWWkNOQOvMFSksyQ4F0qW6xsIT1EPO0TrYGeGT7T/Sp2O+ctFy7el5w1BTc+Qn3
 d44Cx5/7rTgWimwvn5lGgc6f14rXM1F/AYT5uyfhGYWSW62tdadAsBUyk31EHb1lDDWj
 Kt1uBKmL0E0TnQ6iWKdf793ZMD7Q6p9ieF23Uio2KNA+AGRC083pcIICXzrGW2XOuXmg
 u/hA==
X-Gm-Message-State: AOAM530U0szQlReuaci9QX/pWlNcGLMD3wMvgX6mV91LfYYLYstjITGb
 WQrgDriNbiCF/fJNIU6Njpt+AvuDHmFqyYTHfGrSPw==
X-Google-Smtp-Source: ABdhPJyA0RdL5am14hhVTrnRYY3xiQENXyB3AZRfb5+sSr3v4uHeGdjUXCw2DKCvH1vlB4XWOGSfYL9t95+Ph+H+z4c=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr26361516ywd.469.1654510798912; Mon, 06
 Jun 2022 03:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
In-Reply-To: <20220601172353.3220232-1-fkonrad@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 11:19:48 +0100
Message-ID: <CAFEAcA_YB0-RHib7vUt3Mj3Nf5V0Pt0foqwUoMyMfaN-vhpOSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] xlnx-zcu102: fix the display port.
To: frederic.konrad@xilinx.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me, saipava@xilinx.com, edgari@xilinx.com, 
 fkonrad@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Jun 2022 at 18:24, <frederic.konrad@xilinx.com> wrote:
>
> From: Frederic Konrad <fkonrad@amd.com>
>
> Hi,
>
> This patch set fixes some issues with the DisplayPort for the ZCU102:
>
> The first patch fixes the wrong register size and thus the risk of register
> overflow.
>
> The three other one add a vblank interrupt required by the linux driver:
>   - When using the VNC graphic backend and leaving it unconnected, in the best
>     case the gfx_update callback is called once every 3000ms which is
>     insufficient for the driver.  This is fixed by providing a VBLANK interrupt
>     from a ptimer.
>   - This requirement revealed two issues with the IRQ numbers and the
>     interrupt disable logic fixed by the two last patches.
>
> Tested by:
>   - booting Petalinux with the framebuffer enabled.
>   - migrating the running guest and ensure that the vblank timer still fire correctly.

Hi; you forgot to bump the version_id in the vmstate struct when you
added the new field. Since that was the only problem, I've taken the
series into target-arm.next and made that change there. I also added
a note to the commit message that this is a migration break for the
xlnx-zcu102 board.

thanks
-- PMM

