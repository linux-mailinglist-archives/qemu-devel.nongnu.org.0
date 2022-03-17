Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132284DC6BF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:54:48 +0100 (CET)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpeR-00008s-5I
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:54:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUpbj-0006iD-96
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:51:59 -0400
Received: from [2607:f8b0:4864:20::32a] (port=37790
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUpbh-0001b7-JC
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:51:58 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso3440356otp.4
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f9dehXjP9dIk9DeYJMjuCIjnZsjjd6FVE9Zfxjm8YZE=;
 b=L9cBplX3BwVnzTk8An8RZhQebFJ7BAapl61VuKiLAAOp0Wm4W8wW2jOSQQQx3037i8
 +iUy9hrw9ScrXVUUCBOOkYWZ25fM4rRFkt620TQaZXxd6ztzyHby/SpUvLNaGW9DsF++
 JOwCqE+whGWkLJgBq7osdFy7sa/fC9uqYoprcchP+RFWH265VB2RSTkU0oD3GOUBywZ0
 QB2R8fObPFWC4+c0X4G8MW2cj8wqIF4ZKPh5DMZ+zrUe8iU6ZgOQknvG8QfoWji9L6xA
 se31PR1qj+0qIPiE0jl1hIg+uJ6w5aOpFyM1NkgG/LmB0N1B7xtAF8O3FOl4CmYtvXQv
 fAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f9dehXjP9dIk9DeYJMjuCIjnZsjjd6FVE9Zfxjm8YZE=;
 b=JzUrUWqhVx4mY1QCvMtkWFrihnjZ6n0Pn4pkoE19VIIKyNv2B7ouPc8ftItnjrGw6x
 XGez4gj4lHLgGW3OPX6R8A5XNdYX8HvBAY4jmsbyu3Ylq4mo3k0UPr3l3X6xBh2Tye9+
 8c1/1CugekUBNvSH33rJGVMJ6vKQe2VxSOwUb3Mfz/m+szP4ERQsf/dhlS3EDKoxo7nA
 ld04NrSe/N4vCy/9d4G/j9Y4JNksa4Igx4EWWRJ3TnSkWZtEOYydeqXD8y8WphqE3JNB
 Glkw/5WDrTID9YerwylOOoY85yRKAJ+CmKESEPoJNfAbghB1/U9aZ/yhl0RZIFU5R5m1
 T2mw==
X-Gm-Message-State: AOAM532io2OTcElSI2NpnTZmnBe/id7IRJk3RqFVw8HVQwik3N7HAzY8
 JJg1jFVUNauixzyEvFtLotpapYP8yyo8u1iaaLA=
X-Google-Smtp-Source: ABdhPJw/OF/SXzeC/IT3VtPtiWsKefp26eq5TqdotTIlDIgph7aS2rAY3QjDciEgJVx926KZl1PWAvqjF9b2U6w5h6M=
X-Received: by 2002:a9d:758f:0:b0:5b2:6857:4a5b with SMTP id
 s15-20020a9d758f000000b005b268574a5bmr1503271otk.57.1647521516342; Thu, 17
 Mar 2022 05:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
 <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 17 Mar 2022 21:51:45 +0900
Message-ID: <CAMVc7JUjAJNiuSUtBwQbbBN-0yz31oyMZiMdHx_irqvCaHa92w@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.0 v3 2/2] ui/cocoa: run qemu_init in the main
 thread
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 8:57 PM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts.  The cocoa_display_init()
> code that is post-applicationDidFinishLaunching: moves to the
> application delegate itself, and the secondary thread only runs
> the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().
>
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.  The newly-introduced assertions in the block layer
> complain about this.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20220307151004.578069-1-pbonzini@redhat.com>
> [PMD: Fixed trivial build failures & rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  softmmu/main.c |  12 +++---
>  ui/cocoa.m     | 114 ++++++++++++++++++++-----------------------------
>  2 files changed, 54 insertions(+), 72 deletions(-)

The following lines which will be out-dated.
> /*
> * Create the menu entries which depend on QEMU state (for consoles
> * and removeable devices). These make calls back into QEMU functions,
> * which is OK because at this point we know that the second thread
> * holds the iothread lock and is synchronously waiting for us to
> * finish.
> */

Regards,
Akihiko Odaki

