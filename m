Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765272C8628
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 15:04:16 +0100 (CET)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjmp-0002rl-EK
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 09:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjjkP-0001YM-P4
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 09:01:47 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:34890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjjkO-0007EF-1J
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 09:01:45 -0500
Received: by mail-yb1-xb42.google.com with SMTP id o71so11491098ybc.2
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 06:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dfef49hhI3SpECeeCH6F8p3ZEHCbb7QKlVMMSUMXbhY=;
 b=j6yBgXUdayDayho/CZCr36KS1MYlq/2Ucj+ot/reqAp0OyL49arrJNNr2iHkJKZoZJ
 njE6XXHQs2F5BeKquLzsq40RusUQS7Qzt9Rc/agHEV5xYzqpTe1w/ouV0NjQCPkuCyc7
 NTFFpMCNF6TCKBoMwdOnEmTONLcbROL1DuT2KGhpF/fiBJnIA4fO75WSy/LXHXsX4HEB
 TSg6jfDtzJX6LTqJvh9MvtHq4laDTsqzK95h+hSggZ/lwvi36JBVVnpd5TTYRp507TEZ
 NjgkG/bvFUsACIktrII90SdP/Ga8mzmBoVjPCp7fOdZDdEtNuRv1LezzRoxSu3ZabBm1
 GuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dfef49hhI3SpECeeCH6F8p3ZEHCbb7QKlVMMSUMXbhY=;
 b=kxhwRmc3aRhNEEvaOHGASL54v8yfdm4YDxErhWk21VLR9mxv4v6Z/HvzMzp5BhDYS6
 Wz3jGBZK4s0yUBjs06FMvof/gEXSZwy2+9BGDI3DITt69mO8awDsljr/JIshALhXhzSn
 Feau6TSX1aoXD86bwrDaY3e5rMHue58FzUDFTo8qqrrtK7jXdx0m4CUq0isFAPyVLDqV
 uMj8dLWDxXEJnt52D/Va+4HRRhC1TW7nCKLjP4Vrzy8gOgR5sUYDBXpaV0XJiIX2jIFr
 l2aZYsR70Vw0O8xDEeT7IwFdZNO4h0cUHNfMJ0PqmDULqeP/p4PlRHnAL43zAPbmCXoB
 CKkg==
X-Gm-Message-State: AOAM5309rgxgk6X5k7C2zjeDsVPQPR0NbxkbOSUjQCCmwFCcIJDF2Aa7
 B7a7vffCUkA9kHPaSopwbP8XnkSOPLlwhbKI6ok=
X-Google-Smtp-Source: ABdhPJwIBp3XFpyKgv4UKh230N9Af9Hn7+g7c0qfiIx90T4muAbC2mIuHoZnj8naZ5Sv+4QbPBcqGvCZMgbrkqrJ0U4=
X-Received: by 2002:a25:5084:: with SMTP id
 e126mr32714556ybb.239.1606744901564; 
 Mon, 30 Nov 2020 06:01:41 -0800 (PST)
MIME-Version: 1.0
References: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
 <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
 <8a814c60-7863-6f63-0f69-a909eb371d7d@redhat.com>
In-Reply-To: <8a814c60-7863-6f63-0f69-a909eb371d7d@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 30 Nov 2020 22:01:30 +0800
Message-ID: <CAEUhbmUUbPyLSCArqeTRRguLeHs5kW8KO4TvhZBX6ky8iLYKnA@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 8:48 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 11/13/20 11:18 AM, Paolo Bonzini wrote:
> > On 13/11/20 10:56, Bin Meng wrote:
> ...
> >
> > Queued, thanks.  It would be nicer if the commit message explained how
> > the guest can notice the difference.
>
> Typo "segement" -> "segment" in subject.

Thanks Philippe.

Paolo, please let me know if you need me to respin this patch, or you
can fix this when applying.

Regards,
Bin

