Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79216450594
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 14:35:19 +0100 (CET)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmc8k-0000HX-2q
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 08:35:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmc5i-0006Mp-Rv
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:32:12 -0500
Received: from [2a00:1450:4864:20::333] (port=55996
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmc5d-0003Sm-JR
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:32:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id p18so4612306wmq.5
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qAIu1sF2o7DWx63KEZD2x7VcB5cgh9kgZUBmhlZkTUg=;
 b=u7EizrwXb4zEaqRimQxqKbZjOPiWzYI4JGNoEZUMH7XHfgWUg/0DzbEuYbpNYWn/NG
 sZDP+meFEhfIMktgt5oz2O+gYFfNq4Y2F6uoSwVahFCGHxArUy6tMJbkBHuUC8+lEYo0
 wt+XlmzWMd26HtYHLOOvAIo491cZm846wlR4h0AbneydHwcgHhesCoPcI86nG2Vm5aqk
 k+hz9pMEonrl3/pv3vvmLpl5H4OvAbvzpu6ggGjff/vk6r+TkwZmsJAkydC5kb01Qp6k
 iumZ2XqHFWezn1U5oFH2bCxUPJfE4yayQiWHGM+o6zz51wpPClec69vcIPsTcHagcRnG
 bFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qAIu1sF2o7DWx63KEZD2x7VcB5cgh9kgZUBmhlZkTUg=;
 b=fFsotOauNTWtCd/uJ0EG77ac2PMcHw9Q66VrOBLBAOSZGvYRa0ZCP5KEBLbIwLLwR4
 3k5iUvjMyESL2aMct6dGkUnJ+5bzG8BiXThfZqRZPQts8XcxYx/LDyjncA8uZRxuSkjN
 YVcieohQro8ogV5N3QZevR5osqMra41YpwoH7Iyioy2kZ2kxdg4jQ44Qhhtm0VqDYRxd
 C1aHLpUQfowXKRgJ/RdZvGRu9KU/lQILsCJ+08/fa8Hc8dmtFIk/1x4kQ5fxKX9VhcIY
 N/QXyOFI5bTEwBxpJ+Dgm6s/wcSuLKn/MkMNcrSli52E95KFyk02BGqhdaSoTIVOHvBg
 t2XQ==
X-Gm-Message-State: AOAM531M76hK8brw4K4yp0cqFuIuNw+cfoRpTDuv3JVKf5vqm8AW/okd
 bDxRzKDIJScQDESL3PxB+ol+hvfLpWK83MJCWbjsIg==
X-Google-Smtp-Source: ABdhPJwkvFDsMrjOsy+eB3Es7iB2xF0VeUKLOQY3BvwqoJf+D5BoLEDCnbwrJvuKJ827w0B3J44LcqRC1jsHDJNiJbw=
X-Received: by 2002:a1c:96:: with SMTP id 144mr6827596wma.126.1636983123838;
 Mon, 15 Nov 2021 05:32:03 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 <875ysunfwz.fsf@dusky.pond.sub.org> <YZJffhlo7I3sOqFs@redhat.com>
In-Reply-To: <YZJffhlo7I3sOqFs@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 13:31:52 +0000
Message-ID: <CAFEAcA_N6r81-0K6Y-qCdzyx67jzsSZnh-R8vYh2ZGZtAHpAAQ@mail.gmail.com>
Subject: Re: does drive_get_next(IF_NONE) make sense?
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 at 13:24, Kevin Wolf <kwolf@redhat.com> wrote:
> Same question as for Hao Wu's series: Wouldn't the proper solution be to
> add a drive property to the machine type?
>
> If you can't use -blockdev, it's not done right.

Is there an example of "doing it right" for built-in-to-the-machine
devices?

(My experience with the new-style options is that almost
always they're designed for x86 where the device they're attached
to is also created on the command line, and then handling of boards
where the device is builtin is either an afterthought or forgotten.
See also -netdev, where it took forever for built-in-ethernet to
be usable.)

-- PMM

