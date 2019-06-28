Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE475A791
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 01:27:45 +0200 (CEST)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hh0HQ-0001a4-Ke
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 19:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52432)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marlies.ruck@gmail.com>) id 1hh0GA-00018x-1P
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:26:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marlies.ruck@gmail.com>) id 1hh0G7-0006hv-Jh
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:26:25 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:34815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marlies.ruck@gmail.com>)
 id 1hh0G7-0006fw-9e
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:26:23 -0400
Received: by mail-io1-xd29.google.com with SMTP id k8so16050936iot.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 16:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=imEa4zBbfpb3JvR5Et11p6DtFQJbKbq8llXxmzPWmPg=;
 b=JnE4oFX066q48b++4ewKACn+n80qsgphMjTUP+NXj8eCvQQZ7f5ad/f1a8Zcu8U7ay
 QD8HiB5iaDJv4cPrT2tHNDPO/A0qTJSxRbQVsNC5TFtIa3JvIsUIgiVfr/i8vRM98K5A
 LZeSvVG280nwJbVhpIrLBAdR2HPAxXfH2OSKPYIdAltxW+N83+PhoOEjo/o2xbai970N
 h4lf4E4WCs27+ETY1WqYwE78g/3bdD6TfYNnhWICTl/PHzPx/TA2Dtpxv1faA+J6ToP9
 liZAPoAjc8suTH3mQw1FWfTPFcvHB71vcl02z7jQp7FFMR+XQCgKC8tPNBSHobcEWtg0
 JSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=imEa4zBbfpb3JvR5Et11p6DtFQJbKbq8llXxmzPWmPg=;
 b=Ik9Nq3Y0N//Oz/BbzdWIMF3PniTtRXUhGCUV6IC/QPobK4jPdXrIIiSekBtPselsc1
 p4Xkqkd9znKNev5Gfcdc6KZgn4v8OUyHyLXISz3kPIap5ajZlNZ4jJg68xfJaoy7dj4t
 lf12p9yVXbwiR2vzeAq8uDJzqab0vnnT4mqVbWbxdhzCKU/m+kuze0ComiDEt67lcEdd
 0Mdy+NONYnwvVPR2goHKau7OPbDVVdCed4VrX+Y1eGGCMcfvhy9j6VYScMmxKmGT0tE0
 UdYbu6WUcJEQwBlfEU2Y8Yuay2y66iu71M53RvPCZXlBNjHiKouIxqC+VXdSe5+TMCqa
 d0oA==
X-Gm-Message-State: APjAAAUM0fQ4+8KRqOIEeu/1UyAgZMKPlbkTT29asgIAjTtLdU+LVfSE
 kAue7HONaqALfunYjNABc8JNuiXwkhpEAFYQ6fpBnA==
X-Google-Smtp-Source: APXvYqwP+yn16jkHoPIZKrOMkOdQ1cEA2MMsa0I/L6i3nq7TBpc7bH3eOEl17hP4IE9UG9Hi8+/xKwaBMY1poQycvLw=
X-Received: by 2002:a5e:940b:: with SMTP id q11mr13630095ioj.251.1561764381282; 
 Fri, 28 Jun 2019 16:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <CALw29ZZZ08Lt13oZsbZCwV+uP0roLuT6t+8m16y+8YT-KH4t7A@mail.gmail.com>
In-Reply-To: <CALw29ZZZ08Lt13oZsbZCwV+uP0roLuT6t+8m16y+8YT-KH4t7A@mail.gmail.com>
From: Marlies Ruck <marlies.ruck@gmail.com>
Date: Fri, 28 Jun 2019 16:26:10 -0700
Message-ID: <CALw29ZbiqpGFOGHOP_7K2DvAfap_xE+PWAfXvvr35eK7aKn-dA@mail.gmail.com>
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d29
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] patch to swap SIGRTMIN + 1 and SIGRTMAX - 1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I just wanted to follow up since I sent this patch a week ago to make sure
it was a received.  An ack would be appreciated.

Thanks,
Marli

On Fri, Jun 21, 2019 at 3:58 PM Marlies Ruck <marlies.ruck@gmail.com> wrote:

> Hi,
>
> Attached is a patch to let guest programs use SIGRTMIN + 1 by swapping
> with SIGRTMAX - 1. Since QEMU links against glibc, it reserves the signal
> for itself and returns EINVAL (as noted in the commit message). This means
> various applications that use SIGRTMIN + 1 cannot run on QEMU, including
> G-WAN web server and Open TFTP.
>
> Thanks,
> Marli
>
