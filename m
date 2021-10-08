Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D9426B7E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:11:16 +0200 (CEST)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYped-0001nS-MN
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mYpcp-0000Zd-Op; Fri, 08 Oct 2021 09:09:23 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:42788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mYpco-0002Rm-G6; Fri, 08 Oct 2021 09:09:23 -0400
Received: by mail-io1-xd35.google.com with SMTP id 5so10641056iov.9;
 Fri, 08 Oct 2021 06:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vaXnxleU7OKVGJ65ZzcxDq+r9wVMDIOIXaHaLsMQFOc=;
 b=q4xGLDzZ3ZKQMkiNrVWTkT5bWZkvUxtke00/pqP1q4TA/hlwHpRctpv0KAImoTrgUR
 e4jrg9137vl5er0dkJF9ksfBuWo1OqY12Oum/IsXzIwU+tCFUVY6u4HVM7FWzv9zRmjD
 bRUqRLkXM1j20P9HK1aQGyMX8FyzDnPlDP/IlicID1G1k2WcrsAs2x6opqrpNGMv4cPn
 zo4Q5GVTRPdtUavUAPuJ+ur1loJ+VUwD+dU94+eVxojdtJvhVV0+wC/qRNzOgyhnpFh5
 6otn26DQtbl6zV7I/UikoQKTxV71mRzxgpBkmXX0t56feAgIUdYotUI4ii7YWK07JYNM
 lLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vaXnxleU7OKVGJ65ZzcxDq+r9wVMDIOIXaHaLsMQFOc=;
 b=irdAN/1culp3m1xF+Mo4697L04QX2GxpI9bEcpZPIukxldbV33sHlYzQa+so9X9Raq
 9ujBs+cP36HHKLvg7iq8Cq0/D0SmcjZ5m2aHNBLAnwx8Pa5WCqUkrW0B0b0thqPbggZt
 0K40SM9V+4EIOyK2iYepnt77HtQGMMt0FCwJowwMSO4gOFG7wVhqePG16DlJfytRw/90
 4VY1vcbCEiDtuWYYetT18nuZR/FUogB5y+H9hz7V3YEaT/NDEvdHBqvrorLuweSadKdW
 wzqEHKWKaoDljDmyeQJDMkH6sDDDU0DSi3I0/4CR9BsGzJNkyIm3SpnH+a+xInCGid67
 94RA==
X-Gm-Message-State: AOAM531g+G6S/4+7XtyxWT1cHbDblkzGXaJ1hAlI5tsUsAqT5yKBSsWl
 miWBMcKSsPCHQCOeQ84oq0SThzXgZTEc3wslWH8=
X-Google-Smtp-Source: ABdhPJzOlEf64zDX+rS9UsoXIB+sRTuPSWtsVadT/8WMIaM8oj/XLrqAT7Lrr3QEs+juDaAo+39VGD+PWyxXlppx/MI=
X-Received: by 2002:a05:6638:37a7:: with SMTP id
 w39mr7743453jal.19.1633698560605; 
 Fri, 08 Oct 2021 06:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211007093108.323223-1-philmd@redhat.com>
In-Reply-To: <20211007093108.323223-1-philmd@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Fri, 8 Oct 2021 16:09:09 +0300
Message-ID: <CAC_L=vU-WH9qEbJN2B_4BSnCS=sUoN8eZk+iLY3hKzhPvpMDMw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer of 'Machine core' API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Thu, Oct 7, 2021 at 12:32 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> In order to help Eduardo and Marcel with the machine
> core API, add myself as reviewer. That will also help
> me to learn more about this subsystem :)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..b0a7bf36aa4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1617,6 +1617,7 @@ F: pc-bios/bios-microvm.bin
>  Machine core
>  M: Eduardo Habkost <ehabkost@redhat.com>
>  M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> +R: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Thanks,
Marcel

>  S: Supported
>  F: cpu.c
>  F: hw/core/cpu.c
> --
> 2.31.1
>

