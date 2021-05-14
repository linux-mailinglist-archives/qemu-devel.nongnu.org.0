Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A146380233
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 04:56:13 +0200 (CEST)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhNzo-0008GU-3D
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 22:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNxz-0006ql-PX
 for qemu-devel@nongnu.org; Thu, 13 May 2021 22:54:19 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNxw-0005fU-ME
 for qemu-devel@nongnu.org; Thu, 13 May 2021 22:54:19 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id i4so37196501ybe.2
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=heihHt5cbibnYtwnsR8b4WGsERzgZLw8zZQFI/Li29U=;
 b=hbEJVTrEWYwddvpPU5ocls2a+bL25aCuPSg8EP/zFIRyuOJUJSftptvMuqO60IyI+D
 R9vQUYoGaV64VMkN7Vv3BQMVh5Ss4YVdrGgvEbqUEbmA9UQn3RAdyzOSBpLsLOkh6rr4
 jer+PP/LcuvBWL9L8QzAb+D+Y/ZQp1yrxqMUzVZEdHl8K2gv+bfehYMq9y60zZ6ymsmu
 tfGDOw+2zbXZ9huLEDGm8E7Wp0kAq65ksDoCDM1P0Phe7rKAV5GhqHtNxg/MXtxG5Ew7
 VsgL5KDGvBxz+UdA4PtgGC8OBpYP119oJgYFb72Ffc37R6wogpE0Kz0wIXpv9FNRjj1i
 45PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=heihHt5cbibnYtwnsR8b4WGsERzgZLw8zZQFI/Li29U=;
 b=BhhMedAl2AbqLm9lLAmbnvmQfVdR9rCe8uYU7U32PzjZSyreXaXQg4BTmg5tdD09aY
 7+hH7zfstpd0Fr/3HwPVAMfQCyO3KQ3QOnQ9tZKZdckmIn1HSCkBmvErlw+bLrTo/yey
 R0DZP55ZSdDTpimnddGUiu8qb2ku8c87Y3kkHcHsPwXRvK7s4IZSiu//Dj8nGs4WN1yT
 keToGkoFrAkNuTPQzp2YcYErjZni4Li8I6JOCo83iXkgnC5AvODbVdPyvdHVcRu7mvmt
 R1NuY2KrjQg894xUYgWczEL4rZZFs90mOOG6iNNq6dTKYKeHNNMF4kalVctKjvbOO3/Z
 AarA==
X-Gm-Message-State: AOAM533HxYdoU4nR7vE0thtUq3MT4qTsQhrAbvZLy5K7vPgwyqCJtXL0
 lI3+paj3BBHAtf5wid+wsSZkP2cYIEW5Jr6zMESc0mgSoVU=
X-Google-Smtp-Source: ABdhPJy5SJv1iVxujJbJ7rNyEu1sddX2ejpS40S4DKD1FnITC3Na+Um1OMnHVlshacZn5Vy/ILMh2+Mn93TQlMcQe+o=
X-Received: by 2002:a25:d990:: with SMTP id
 q138mr65718374ybg.387.1620960855986; 
 Thu, 13 May 2021 19:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-10-philmd@redhat.com>
 <CAEUhbmW-Aw63TPG6_MQC9X8xjjvK-F=oHWOZWv30yMtj8yaotw@mail.gmail.com>
In-Reply-To: <CAEUhbmW-Aw63TPG6_MQC9X8xjjvK-F=oHWOZWv30yMtj8yaotw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 10:54:04 +0800
Message-ID: <CAEUhbmVoeFr13R+A-st1bDjpB8E9tg_btfYLn8Ay2sWDjYuEpw@mail.gmail.com>
Subject: Re: [PATCH 09/10] default-configs/devices: Remove implicy SEMIHOSTING
 config
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 10:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, May 14, 2021 at 12:58 AM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> > Cmmit 56b5170c87e ("semihosting: Move ARM semihosting code to

typo: Commit

> > shared directories"), added the ARM_COMPATIBLE_SEMIHOSTING symbol
> > which selects SEMIHOSTING.
> >
> > Since the ARM/RISC-V targets select ARM_COMPATIBLE_SEMIHOSTING,
> > they don't need to select SEMIHOSTING manually. Simplify.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  default-configs/devices/arm-softmmu.mak     | 1 -
> >  default-configs/devices/riscv32-softmmu.mak | 1 -
> >  default-configs/devices/riscv64-softmmu.mak | 1 -
> >  3 files changed, 3 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

