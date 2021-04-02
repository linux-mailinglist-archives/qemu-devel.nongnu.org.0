Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DBB3527AA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:57:25 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSFcK-0000mf-2m
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lSFbW-0000KL-TT
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:56:34 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lSFbV-0003iu-4a
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:56:34 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id c195so4480795ybf.9
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67DtOtIfUvANibYjz/VEnIriXMrIIl3/I/SbukQmtOQ=;
 b=vVx+dGEMLvaLk53kLHNtDyDvEd/OEXVN4n+sPPnA8KFmiPZdFWC3im6AQw9X/45Tj/
 AWKsEKhsJ4c/ztgVXNs5ydruwbUhMuPyyQtgnbbuJd1UmOsBG1LSkFOJdTYlkbRKCgu3
 MKz2Yi+b97QQHIeO0XXJcvH/sSPPgMjFQh4X9fObkcgqcQYfpu4JXY6txFbeCxABQcXY
 TQj/Zh4m363+o77z9uaXwZZsWXHO0S1G+chTcmMAoTKYfk4yPSfDhzGzfqhw4NB/b2fc
 kZX0EX7Osn0JDRrs7mCtdJiav8wEtYA1ui8ViDdfoTmZwkmGisLdn3X6UjLdtaKJrZJt
 ub+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67DtOtIfUvANibYjz/VEnIriXMrIIl3/I/SbukQmtOQ=;
 b=TbIvBrheWW2JUjjBg5LnkSWn8MY60DqyCB4wWkZuvJ0BTKI5wc5rdvifd2bg1zZq7J
 KQLpfuies22R9Dvl4LcaqBfyQ+JQHOdthTgpt15YgSMTZ6EpKPNR98e0WxUpyL/J5Ru6
 uHlfNudso3at0EN4GPYgUf1XlZEHIyhZJ8d+jT9xDq5Zg6u7LXMOUOQmxIBHvDDITdA8
 6tB0sjAHL1+AKwKpI/zg2SGwkSQKefxvphfvyORGvUClgmzQPBiPyUkNpwbsA4IKm2xk
 GDwrkqA3R+xqrxnssPXa7FfYiv8AGTLck+ZJwDL4Vrolh6vCGF6/rq6l8SSPBhY9C17T
 5LkA==
X-Gm-Message-State: AOAM530YLQGhv9HeYK4txGelAgA/7f4S556J/jNUizGRU1qnUnRrei0t
 eaIX4I45za6Yh060PMrM5T5B4YXjEKD+/JuNDF0=
X-Google-Smtp-Source: ABdhPJw1dShbzm7HinH1wHQ7MzrHw7X1pei/eXDplCPaQZNN55TlLGd70BwBTmZODC4y3JttOrDygLCUIctJuHB07qM=
X-Received: by 2002:a25:7d81:: with SMTP id
 y123mr16903960ybc.294.1617353792236; 
 Fri, 02 Apr 2021 01:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAM0BWNCTD_oe3BgKQUqG41fgFqGCXVh1gaiMqJpvXbR4Fh5vHg@mail.gmail.com>
 <7c63e938-2482-3150-7cfb-1459c132fda6@redhat.com>
In-Reply-To: <7c63e938-2482-3150-7cfb-1459c132fda6@redhat.com>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Fri, 2 Apr 2021 16:56:21 +0800
Message-ID: <CAM0BWNCYXywdDdr+b6R1uFBNOKdaWnotaoy=W2DLjpx9eshcrQ@mail.gmail.com>
Subject: Re: Bug: fstenv is wrongly implemented
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb2b.google.com
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
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

Thanks for your reply.

I read the IA32 manual just now and indeed the patch is not correct.
Is there any related patch for this bug?

Ziqiao

On Fri, Apr 2, 2021 at 4:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 02/04/21 10:29, Ziqiao Kong wrote:
> >
> > According to git blame, this bug is introduced about 13 years ago:
> > https://github.com/qemu/qemu/blame/633decd71119a4293e5e53e6059026c517a8bef0/target-i386/fpu_helper.c#L997.
> >
> > We also had a patch for this bug:
> > https://github.com/unicorn-engine/unicorn/commit/59b09a71bfc6fd8b95357944f6be9aa54f424421
> > which you may refer to. I can also help draft a patch if necessary.
>
> Hi!
>
> Unfortunately the patch is incorrect, because fpu_update_ip is called
> only at translation time and not at run-time.  If more than one x87
> instruction is present in the same translation block, or if a
> translation block has been compiled after the one that is executing,
> env->fpip will be incorrect.
>
> Thanks,
>
> Paolo
>

