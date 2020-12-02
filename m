Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C32CCA51
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:11:07 +0100 (CET)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbH7-0004k8-VQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkbFt-00049H-Q3; Wed, 02 Dec 2020 18:09:49 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:40225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkbFr-00038E-EM; Wed, 02 Dec 2020 18:09:49 -0500
Received: by mail-yb1-xb42.google.com with SMTP id o144so251148ybg.7;
 Wed, 02 Dec 2020 15:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rSZMDtHcjbRpJTILxI+UZec+ogwAKsGuZKbVwlIQtYQ=;
 b=fDqGp4IUxfp1UA26DKqmGpf5PYjMnvO74AwHr0y0vVuGEDZMQBxEkb3BL8ljPRtZHK
 Aj8UuHqGJMlR8yM5xDsAZhfJyag/1WpM/YXqXiAe+J+e0dxEn6e5d07Ie1SytmU0ACZQ
 Eke1sTFSD7CKXtgo953GA44dOtXcAgxbjRLaYtZU6/8mf0fqoW025ZXy4YJQWg227VxQ
 jUNLKPhJaZyint6w1GpYXMxFvfiK1I4EuopjlrVwgfFM1/ASbB+rhCm7xekQjbAh2y/Z
 klwUAbxZBrzBYPWoR2rA44T5SHuUkrVuwfdHI6smFe2jzJye9kK1ZiErQr0dafQSJ5Hp
 g2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rSZMDtHcjbRpJTILxI+UZec+ogwAKsGuZKbVwlIQtYQ=;
 b=QIgOvJfPPundvLdTGKCQcv1Kh79moovaiAj46SIWIwB/ik3qM60H1ix7TNq2JXrJaB
 GgE1gkTnj3eAhDYniCleKYcNqL94eIqIJSfBQo6dt37IYqQCve8ffFPHxUD4LVEevD7J
 51OHSKW4B/Wa2a4mT2e1W7Pv36txw2QlD+36bPJETE9rxcKmuAIiLzN25OUUakYuDknI
 rtdS0VgQTm/n3JDluxFogMlRXO+tTu39/TQhefH5X5p33gCpTN91l/Y1a0OmYbNM4Mef
 HMmgHXqi0KhKDw3aBDQTnzEjRAcDQSfUVdiotSgwulUOXTNyWgl/lvYi6ua+1oaw3rio
 TVdQ==
X-Gm-Message-State: AOAM530AgW9QPGf5CO1ZzJtv8p3CGHifgP9bProYFIYNSk1fTBsX4Jrv
 zRmIR+AoPbbYGZEKn1LsAoYkd/Vk3fW+2HSl9xU=
X-Google-Smtp-Source: ABdhPJzMKj9+Jgi9sVkrzMhYxZ1IXiugiJDZSSAAmMQ4qZv4bbJQRgkPOMp2g0C7xHRzK031P6B8BOeZNOAemCKJP28=
X-Received: by 2002:a25:db0e:: with SMTP id g14mr703029ybf.314.1606950586149; 
 Wed, 02 Dec 2020 15:09:46 -0800 (PST)
MIME-Version: 1.0
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
In-Reply-To: <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 3 Dec 2020 07:09:35 +0800
Message-ID: <CAEUhbmU5mGQSpVu+UXr_3qoP-M4x1pUuiLzMHU7djQE-LTrK+Q@mail.gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

On Thu, Dec 3, 2020 at 3:52 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > SST flashes require a dummy byte after the address bits.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> I couldn't find a datasheet that says this... But the actual code
> change looks fine, so:
>

Please find the SST25VF016B datasheet at
http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf. The
fast read sequence is on page 11.

> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>

Thanks!

Regards,
Bin

