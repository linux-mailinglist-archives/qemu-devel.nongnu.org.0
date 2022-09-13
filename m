Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9735B70F5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:40:02 +0200 (CEST)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY74z-0007Jq-Vr
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oY6zs-0001X5-VM
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:34:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oY6zq-00085b-G3
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:34:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so13526077wmb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=XPQHENrQssTlQpOCqgNm/4TM6G5jZv9RDx24bJeM9Bo=;
 b=sQuSX28tohLi+SRmjF34mEqKzc+jpwGehyWFGD5hbChBTFIoObUQwntFTefOIx9zjL
 uCGiZtIEXkZxqOBuu8+XUd2ofQ8zMScqTI12TS80OZsUMtSKA2NSYd4wjjVKLVzZGIVi
 eQFdaiO00aeCNOCgkkxAd+0VrIZzANiSC5x8WaxwHZeZkcmU00i6mcIGuL/gnuMnJQc5
 rNhjI/Ay6vWwaZTzSHQut1GB3vNe8gLsgyiuAFbY9pJlsZcZV/9dQErRW6aSr+YxqWcR
 cYrCwOgXWLjJ3azfFQaKfhosGXUJ953b5Kbbgd9LeJsYRb7NXzK5QpPP1vBUqVXYJcPq
 rvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=XPQHENrQssTlQpOCqgNm/4TM6G5jZv9RDx24bJeM9Bo=;
 b=3EsIdzSpfmnDstiy1d3B9q00Nzkik1zaC4S/HGLD2sr9DL9eQGMKvwcu5ZjRiweee5
 DpIyXCquCv1pextpz1LRAG7bPXOr+PUUtSqlFFb+hoCbQghnqNMr4teBkcKc2pHPvDaQ
 ZLDeg27cyxUC5nGP96IuGMcWt5rD+yefeaKjO/8Nhl/d8tlZXL/K5JTT2wFqYt2XyRJx
 MLXtpFMkE6CcepeQAli9XWTFuTtw/x0vjVG5s4deUYpODZJlykgNayULo28beiiLOxFt
 rKW4MbOgi3jEDr/SGkwBSXFNle0wIeLLJ5EpCMrq7fiIMRggxBz3vc9qA3FjS5g1k6QQ
 cZmQ==
X-Gm-Message-State: ACgBeo2IkJ/TD8WK1I5SIdy0u3Cp9VXJfMp59UoJ7vhSBPiHwGsxsN+s
 XIqGo7Y2p09X3axtgvmSG6/R1Qcqv4SIt4Ce
X-Google-Smtp-Source: AA6agR7SoYFGnjl/IP9wGi8+0eU4hApxy2yHkwnkZra9LswJegPFHR4BSx0XwFM/82X4ul5qHMb1Cg==
X-Received: by 2002:a1c:ed0b:0:b0:3a6:30c:12f with SMTP id
 l11-20020a1ced0b000000b003a6030c012fmr2676046wmh.133.1663079679962; 
 Tue, 13 Sep 2022 07:34:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a1cf413000000b003a5537bb2besm13231949wma.25.2022.09.13.07.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:34:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94B121FFB7;
 Tue, 13 Sep 2022 15:34:38 +0100 (BST)
References: <mvmczbzty5j.fsf@suse.de>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andreas Schwab <schwab@suse.de>
Cc: qemu-devel@nongnu.org
Subject: Re: qemu-x86_64 runs out of memory
Date: Tue, 13 Sep 2022 15:33:57 +0100
In-reply-to: <mvmczbzty5j.fsf@suse.de>
Message-ID: <87sfkvz6kh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andreas Schwab <schwab@suse.de> writes:

> $ cat mmap.c
> #include <stdio.h>
> #include <sys/mman.h>
>
> int
> main (void)
> {
>   void *A;
>   size_t L =3D 0, U, Max =3D 0;
>   for (U =3D 1; ; U *=3D 2)
>     {
>       A =3D mmap (0, U, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORE=
SERVE, -1, 0);
>       if (A =3D=3D (void *) -1)
> 	break;
>       else
> 	munmap (A, U);
>     }
>   while (L + 1 < U)
>     {
>       size_t M =3D L + (U - L) / 2;
>       A =3D mmap (0, M, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORE=
SERVE, -1, 0);
>       if (A =3D=3D (void *) -1)
> 	U =3D M;
>       else
> 	{
> 	  Max =3D M;
> 	  munmap(A, M);
> 	  L =3D M;
> 	}
>     }
>   printf ("%zx\n", Max);
> }
> $ cc -O2 -g -Wall -std=3Dgnu11 -g     mmap.c   -o mmap
> $ ./mmap=20
> 7f672e5ff000
> $ qemu-x86_64 ./mmap
> Killed

This is probably the same as bug: https://gitlab.com/qemu-project/qemu/-/is=
sues/967

--=20
Alex Benn=C3=A9e

