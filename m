Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FFD14345E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 00:08:27 +0100 (CET)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itg9f-0007tU-Fn
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 18:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1itg8d-0007CK-9L
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 18:07:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1itg8b-0006Ei-Dk
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 18:07:19 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:41200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1itg8Z-0006Cv-JN
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 18:07:17 -0500
Received: by mail-lj1-x22c.google.com with SMTP id h23so745292ljc.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 15:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbzMdSFtgCwc/cY3YdvLk01Ryr7YM5H4YIEEiNxLLGc=;
 b=OZVSQaAwMO3QNdi7J6rmq7D/ErWzBMl/Hplvg77mNwOUbedFZ4iTNIiGymt3biVnQd
 MNcYF+wenIX8ESkezZcUrAyiQo/AyvbeP0v1mc6wCHoEc+4bzb/ZrR9uMXazvECnfE0a
 ka/GiCvQZPsieRDDaBK2K648s3ouCBpgOTO6ejoV6KRMAk8hVOBFiTikWDfQw+7BnJui
 yV4Ipisu2jGsz2NqgnVtmO7EHi/FaOZxlxqkCml+pDGKHOJmBNp2VjweTnBrR3890WOj
 DI2/xYSfSbYZfJAOg2T61sjeOVH0O+QcdvnurvZNu/qX7r378U5RGOUkgZu5bONYHc1v
 iq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbzMdSFtgCwc/cY3YdvLk01Ryr7YM5H4YIEEiNxLLGc=;
 b=RgTT027qyRC1udw+Oz2ZJPfgpjCqPQZoFhGFLRRIDVHMaXTcDmZHUF+bNi3Rllj9Sp
 wQvEl2OpS6UFz5R3VtDtjYziXq2j34SYeON7KixFUSd30k48714hgtU4apM/cD6tSoGy
 8sFopZke6Sz1rE3qTIzeRI8sX23GVt7uiII4apZ/nxBPeEg9wqT4DGR9AUaUfZNiKZl+
 ogGaDHzfh3YLjb+HaFboOv5+JETAibHk0nvBHlTgOEsV7ywoPVMo6FrBDc6SVwQNP0Gp
 zOrUblC/Cv/voOk4bNN47oKZHEVGa2QQwgx3gVzKwkavF9nochz1tBadSBmmwbUsrAO0
 Y/EA==
X-Gm-Message-State: APjAAAWScZF1wboScvwAWbCalews3OtCSi7dlu3HoykNmpGeEzI3li8z
 0Rrx5ZAmpXsPW8XtVhlvRoNWG8G9YLwXZ5blfXoM1U8O
X-Google-Smtp-Source: APXvYqzv/wV0k/MnTo/GG1SZjv1MHR9fQ7mnF9fw2zgbIxN6+vR1ADK/j+U6yk9VEonbfk0JOqjOtVyBegZx05y9EWI=
X-Received: by 2002:a2e:461a:: with SMTP id t26mr14487206lja.204.1579561633212; 
 Mon, 20 Jan 2020 15:07:13 -0800 (PST)
MIME-Version: 1.0
References: <CAMAD20nGNi3N=Nj0x_ifUkH0Hb465eG77w6VG-vPLb1u1mPCsw@mail.gmail.com>
In-Reply-To: <CAMAD20nGNi3N=Nj0x_ifUkH0Hb465eG77w6VG-vPLb1u1mPCsw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Jan 2020 09:06:44 +1000
Message-ID: <CAKmqyKP0BEZsHpg_YazbDw7ouZE6eSEmpJHggggXEMXojxOksA@mail.gmail.com>
Subject: Re: riscv: How to get more CSR information in debug trace?
To: Ian Jiang <ianjiang.ict@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::22c
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 17, 2020 at 11:36 PM Ian Jiang <ianjiang.ict@gmail.com> wrote:
>
> The following registers are given in QEMU debug trace with "-d cpu" parameter.
> pc       0000000000001000
> mhartid  0000000000000000
> mstatus  0000000000000000
> mip      0x0
> mie      0000000000000000
> mideleg  0000000000000000
> medeleg  0000000000000000
> mtvec    0000000000000000
> mepc     0000000000000000
> mcause   0000000000000000
>
> I want more information of other CSRs, such as sstatus, misa, pmpconfig0.
> How to get debug trace on all CSRs defined in RISC-V specification?

You can use the `info registers` command from the QEMU monitor.
Otherwise you could edit the source code to trace the registers you
are interested in.

The problem is there are so many CSRs we can't print them all.

Alistair

> Thanks!
>
> --
> Ian Jiang

