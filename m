Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111FD1E9B8A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 04:03:54 +0200 (CEST)
Received: from localhost ([::1]:40022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfZns-0001wQ-JI
	for lists+qemu-devel@lfdr.de; Sun, 31 May 2020 22:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jfZn8-0001XM-TL
 for qemu-devel@nongnu.org; Sun, 31 May 2020 22:03:06 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:33361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jfZn8-0008He-4r
 for qemu-devel@nongnu.org; Sun, 31 May 2020 22:03:06 -0400
Received: by mail-io1-xd2a.google.com with SMTP id k18so5381227ion.0
 for <qemu-devel@nongnu.org>; Sun, 31 May 2020 19:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MDH86AHnAcnePJ6wjSngblxnMZGTXXb33hzy9xXQVHk=;
 b=WDD9qIOHgpeCo1idAcDZvTuIEdBzPl7fzTtonYHCd+p9mxkKtBUA6uWqYdLuXM8wm7
 QIKkT+S/l058CZmWGUqzYv/RBEPo6XJ8cJ08Y3nXl04jOmY1KBnla2pHENXIYCtL9w7j
 NthoT0DcJjt6h8EFIUVK8KcVuSFjnO0vsOLSZBL7ebU93SL1FSDUEQ65qWpMeHITtI5b
 rXG/5WkLADWUf+qF4QrVp92d9gwfab15PP402xmtNask8MZOIwkov2C5IJg36G/ETvPT
 eUucIUcekhtmNyxWMZvlrU/NhiI6R/fmBd2SqU1GKSkuaqA1D+wzqaxTt8iYfEy9AhSW
 GpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MDH86AHnAcnePJ6wjSngblxnMZGTXXb33hzy9xXQVHk=;
 b=R75ABodYUixGXn4U1fYVSV+HBcscM08UTewBmXirKiELcmfGSiKWarop0igJNpGpuP
 urijYeBhoGz2Lq6toxc6BlQ5tJ2Wpqe3MpQnsp1Nqu9O2tTQJ3HASamPBXPQ9toVOWLi
 L+DNMRQx4NCefnLJb2zwrj78iVdUrs8lWIg9IV5zbuTMx+/Vsh1IxaMtPw9EcTFdnLSF
 BJEk74bRK4SuNMP4SJNbSu55oOHVx070mB4dmqbjHu6h/DYck/kWJiR99v59rnyShqdX
 roVKjJej1T7JVA9pPb+fSPpMZUMaGPgvQNkfvPy+8KoiauYSgfMgBYbKtEhmjKg93c6f
 DKeQ==
X-Gm-Message-State: AOAM533eP8Df3nwCtO0awPWUJJ6EWyHtbBpaOA3MX85O6M+Qb8zlZttt
 TXLY3nmQgdCn1bC8/JqnfVeLtzdKWrELi+fuozE=
X-Google-Smtp-Source: ABdhPJxiGzLOISJVZ2l4eiwIsOyeIZbVg1OOAyr/d1rgRUk5e+2zfXSHsdeeiDDZ9eTRRi+uaHk0i8KNMzix9ajJ/3Y=
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr19384421jaj.106.1590976984582; 
 Sun, 31 May 2020 19:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAEEnZxSx-ayjrMsL2osMe8-=8ojA22AvOxgeyZaafSitGPJYwQ@mail.gmail.com>
In-Reply-To: <CAEEnZxSx-ayjrMsL2osMe8-=8ojA22AvOxgeyZaafSitGPJYwQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 31 May 2020 18:53:57 -0700
Message-ID: <CAKmqyKPBvnmd+T1ehz90tMm1ToJFJ7RjSGWnvVKMHRPVhkAm4A@mail.gmail.com>
Subject: Re: Adding a RISC-V board to QEMU
To: Yash Jain <yashjain.1999@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 31, 2020 at 10:33 AM Yash Jain <yashjain.1999@gmail.com> wrote:
>
> Hi,
> I'm Yash. I'm a 3rd year college undergraduate student, currently interning in IIT Madras in Project Shakti. We have built RISC-V boards and  I have been assigned the task to add these boards as machines to QEMU.
> I am absolutely new to this and have no idea how to go about this. Please help me out!
> One way I can go about this is by modifying sifive code to fit my requirements. Is that a viable option?

Hey Yash,

That's great news! I'm glad to hear you want to contribute and I am
more then happy to help :)

Your best bet is to find something similar and copy that. For example
if your machine (SoC and board) is similar to the SiFive U, copy the
QEMU sifive_u model and make changes as required.

Let me know how you go and I will help where I can.

Do you have documentation on what your board is and what it supports?

Alistair

>
> Thanks!
> Yash Jain

