Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6BC333806
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:59:43 +0100 (CET)
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJugw-0002j7-HF
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWc-00006Y-Io; Wed, 10 Mar 2021 03:49:04 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWa-00083W-VG; Wed, 10 Mar 2021 03:49:02 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id p186so17057086ybg.2;
 Wed, 10 Mar 2021 00:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5pxy7YMCCE2s7h7w49S5P7RF6GZWQag5ZmLvco+c9GQ=;
 b=hEOe+pgE2VDpqyMBb826iu1to0tllt8JLlCiPLmGgXJH5GcVvEdxOtV1mUGf3gEhdb
 GQatailD0t3FgPWu04gqZheG8CTX32AizWepAVich+alqJkt2dRpQgeCevHZ4fEo4EeW
 zsuPlWY+Zy4Q9upo5ebg+8BC8AL0ppPINQGgB6BT3ypgBRJF2d8czinyul0sJTphx8XP
 WLm45YzRgw19MVfZly+J97DNZMtrgN8kTzFeASKTB65G96v6pBaUSp5SFRWKbKx3mwNR
 btRu2cEleea6fA7TD0a+324rxEMIa+2MgtdZZAH6ijHixIvrTwYsePmQ0iM+KFXW98n5
 L2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5pxy7YMCCE2s7h7w49S5P7RF6GZWQag5ZmLvco+c9GQ=;
 b=alH/SyQxhFhpoSBWSikMR8m+JO4IJfKRfMq43zMr3NSfK2v671sAK2pctJqjbnoLDV
 lwY4ISRZLexdRhxD0w0q5BSnbIb1gSI8HlLI0//Hun5F8s10Etk4qelmJYMbG2YnydfL
 JnvspKwTneGUeMr+UfGd8rroic076gjdnxUY3pF5NCR7vSmW3/ptXO68sYKUYrBd1O4b
 XVf+pQhhs8O6KR2kE7adTKv+t9NZDp7eyainQrV7uWuKC70mPB2icsGV0ng9hD7IOtME
 HQpkEJ0LvdFpPlY2POTc653iRR3woUb2o4zVt3QJkkdJiJyx+nsd3eL6RtQBUnJLUnGQ
 nX2g==
X-Gm-Message-State: AOAM530HZVkrSq1k+pTiUihHo39lOeQ7PVXIsvtRpjhDHrMyx6B2IUAA
 EdSoa0eTR/SSdeRRK1+lFqJ6yXL4zZv7KpIfgFzYomtn
X-Google-Smtp-Source: ABdhPJzqpI4qmi5TtHuFN+TBoP6sJhOGSmnuLPezggDASQy4hb2hLYpVpkOFAmP18SrOjewDu2HTG2EVx/Lnv8Je0Cc=
X-Received: by 2002:a25:abce:: with SMTP id v72mr2916023ybi.152.1615366139804; 
 Wed, 10 Mar 2021 00:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-9-philmd@redhat.com>
In-Reply-To: <20210309235028.912078-9-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 16:48:48 +0800
Message-ID: <CAEUhbmXqMJWyb-37nbuM6uxYOnz8LWqX4GaYiqAEU9Dim0n+rg@mail.gmail.com>
Subject: Re: [PATCH 8/9] hw/block/pflash_cfi01: Clarify trace events
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 7:53 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Use the 'mode_read_array' event when we set the device in such
> mode, and use the 'reset' event in DeviceReset handler.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

