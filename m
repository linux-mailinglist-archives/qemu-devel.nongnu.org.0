Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BF96FC780
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:08:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwN3m-0005ty-05; Tue, 09 May 2023 09:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN3k-0005rn-4q
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:07:16 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN3i-0004Kt-Gx
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:07:15 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso11053477a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683637632; x=1686229632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UlFrjLT1YDA7Q/06T4pLzgsx+vEIz1i60GEEUl+6gcg=;
 b=tWmS+X2jkCetDpPxtlgulYAn5+fYL//jWx+uWUT/rleOKm93IexwvdGoQyRK4VY18Q
 MCxs2xaiUg7g9/O0vJhO9sHShudWkSMCM4QnJU9jfRvVpSFGjzSVv5eW+cANrI1Q72xE
 4ADoxFeC1u3jSnunQHbqfB/nqKAQlh3Rx0WQEGaJHnkQXGp6JrWZzsUrOa8tTPggbSBI
 Cy/R6gHKFm9dymj5bqpKaGPVTvzXffxvA7c/73c4vID25HzsZSefch2UAL3D/2NjbXfM
 znLsF8CG9Edd0lULNIyurNp9ojsTOct+SZJvAZYmMV7qgJKd5DK8OouuDc2NvtBZcr7l
 mcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683637632; x=1686229632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UlFrjLT1YDA7Q/06T4pLzgsx+vEIz1i60GEEUl+6gcg=;
 b=TbBO7Y8QUfqHf9CiJowoDJjJ3yrHD7zmo2ieCaNKKI+XPF4QAd5/kIevfqkHOuBOkX
 SWAaaemzz3JI9WrI5fPXDmRVp49L5Tb5JpZQay+Oh+KhfTore8KFXUuj2Md238Kogqch
 6Zzdv1Jn97AH0Erswq+4hMY+6hW5s/d9YRs4qEehEmLeXEsyJCQQBrq8HNM/s60vA53Q
 rQjoSiVxHKKIVtqNCKTGteEFWecivPLVhnEZ+VY9pbdcEQZ0ayk/R5HoxK1MzcTeNmR/
 64nBDN5qVvK6OCYyvjduGy0rWgK9JDzGZdH6rfcHs3yNH7iUvPVGhMXht9JwoFD0Jl5L
 wXRQ==
X-Gm-Message-State: AC+VfDw9xSt4envu8TWSleVcl91PEMPh6PXxoYKjO83r1U13B2iXc0tA
 3L/g8QZHgM7sOf7kXWU69kaqkHbFHpadn+3cYu1R0y497A2Uldgh
X-Google-Smtp-Source: ACHHUZ7WUS39qXjd0AGvnFlzaLU/oQKuVpK74axSM3wsfevpa4Nfe0U1/BX8Nl7gOWOPFVhJDhnmKxVQ+qHir1k/FSE=
X-Received: by 2002:aa7:c586:0:b0:50d:b92e:d1dc with SMTP id
 g6-20020aa7c586000000b0050db92ed1dcmr1792882edq.14.1683637631830; Tue, 09 May
 2023 06:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230406153721.3349647-1-peter.maydell@linaro.org>
 <d26a0128-10b5-0dae-cf12-15072a564396@linaro.org>
In-Reply-To: <d26a0128-10b5-0dae-cf12-15072a564396@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:07:00 +0100
Message-ID: <CAFEAcA-2hrnjnMnA+GA1w0M-=rfcsO_FwJ2RkysMXpyCmCkO7g@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/malta: Fix minor dead code issue
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 6 Apr 2023 at 16:54, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 6/4/23 17:37, Peter Maydell wrote:
> > Coverity points out (in CID 1508390) that write_bootloader has
> > some dead code, where we assign to 'p' and then in the following
> > line assign to it again. This happened as a result of the
> > refactoring in commit cd5066f8618b.
> >
> > Fix the dead code by removing the 'void *v' variable entirely and
> > instead adding a cast when calling bl_setup_gt64120_jump_kernel(), as
> > we do at its other callsite in write_bootloader_nanomips().
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/mips/malta.c | 5 +----
> >   1 file changed, 1 insertion(+), 4 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Are you planning to take this into a mips pullreq?
If not, I can throw it into my next target-arm series.

thanks
-- PMM

