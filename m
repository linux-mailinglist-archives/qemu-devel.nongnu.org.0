Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A332CDF30
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:52:59 +0100 (CET)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuew-0004Sm-FM
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kkudK-0003nd-Km
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:51:18 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:40157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kkudJ-0002Pf-0e
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:51:18 -0500
Received: by mail-yb1-xb41.google.com with SMTP id o144so3154969ybg.7
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rEIR1NLYaGo+kjt2ducK8nxnVtozbjav/8/FNjZtfGE=;
 b=SDsVgW5HAnYlCIKKITn7zh0uJXWr4FXwlKgDwZmxuEHqeGB7iWIogc8JcW8Rzy5wZX
 FNLSbMMKxufsMagTQcLcFDUclUQfM7rFizdiG46qtkEMWA+Xm/AeqdKTHAN0vB7Apjgm
 37+3W2rZbldDqow3X7O9DB2v2iVAMwsApRdWJ+nJYN4scJFhWFSHD4OeNtPfmzGnFC8w
 WIu4b0nRRfrRDqC+ZQGd5GIt/DL7wsEfbDkh8E+2nLMd9lCHMqgpgPlhDuJu6kDgJUbI
 9+bJQfkOiTeyhBP/sMqudWa1e75vEGb2bok51IXNctECMo3GYyJiLIWGpFKe6HuJeISg
 Zf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEIR1NLYaGo+kjt2ducK8nxnVtozbjav/8/FNjZtfGE=;
 b=NmVpT/LRwvsMs0crMjW//fdfg/jPmF5wozE/7LdfhbQQWftzIyP+J6/yGOtZ8DumWY
 u5JB60YOCwYoHDg51I4Iwp4/nUOVi3dqoVDod1GdQKShhH4QPV2N7hVQlKC+zsxRV5J2
 LA4rcsQ59hgCHm3r/JR00Zhu1SDiVXgh4cm/uTvscP3n3061tBlCSOjMylsComvvqxG/
 +rP9CbLL/YKk6YnWWR5P9DrI8hdE4mKbuHU/QLyfEVbiSXVglzufsNcEoTBpJKS6HKio
 3q3J6ZC74uK2odgxZtE4Tgn0CZvfqHfhQXuchNKlgmw5ctOVdBB3XIDxqJPtO51A12uu
 Fo1g==
X-Gm-Message-State: AOAM532/WcPcAndRIk+2zk501NssVSaoQ/WO/ePjKI7KDC7FdNpqPJCa
 HrAD27L0fm+GPZXe6I1bEdO7EeGg598rISzHR30=
X-Google-Smtp-Source: ABdhPJx0z866MUl5SIOgqM8j7amwVcgEOY7xGuLPGbshDce0/0LTsaT0aN84Ly2nhZVyRkQqnymIsllSiDFCAihxW3E=
X-Received: by 2002:a25:1e43:: with SMTP id e64mr1099768ybe.273.1607025075334; 
 Thu, 03 Dec 2020 11:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
 <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
 <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
 <CAHW_Pj+0Ex_PWhUzv_Fkcp2B5yOcD=p31Lu2xH+Xp9M6mAf4Vw@mail.gmail.com>
 <836f6aed-8f2a-cecc-d796-be7286333160@linaro.org>
In-Reply-To: <836f6aed-8f2a-cecc-d796-be7286333160@linaro.org>
From: Cupertino Miranda <cupertinomiranda@gmail.com>
Date: Thu, 3 Dec 2020 19:51:04 +0000
Message-ID: <CAHW_PjKChVWTiEJPCgG4G1+XwRd_QUcYLKBz+Vbnkkc_Um7g4Q@mail.gmail.com>
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-yb1-xb41.google.com
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
Cc: qemu-devel@nongnu.org, Shahab Vahedi <shahab.vahedi@gmail.com>,
 Shahab Vahedi <shahab@synopsys.com>, Cupertino Miranda <cmiranda@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Seems perfectly doable, no objections.
It will probably take me longer to integrate it in the build system
then to get the scripts ready.
I will start by placing the ruby tool and documentation there, and
later on, integrate it in the build system.

Hope that you get re-motivated to review our patches. No pressure though ;-)
Very valuable comments, lots of improvements happening here.

On Thu, Dec 3, 2020 at 7:34 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/3/20 10:54 AM, Cupertino Miranda wrote:
> > Our generation tool has different levels of verbosity, expressing
> > instruction semantics from a pattern level up to what it is shown in
> > <semfunc.c> as comments, which is later converted to TCG format.
> > For QEMU purposes I would say that input format should be what is
> > shown as comments in <semfunc.c> file.
>
> That seems reasonable.
>
> > Also, as is, the generator is done in Ruby, and to be honest, would
> > not be very easy to redo in some other language. Would this be
> > considered a problem if we would include it as Ruby code ?
> > IMO execution of these scripts should not be a step of build process
> > but rather a development one, such that Ruby does not become a
> > requirement to build QEmu.
>
> It's not ideal -- I would have preferred python or C -- but I won't object.
>
> At minimum, I would expect build system changes that detects ruby support in
> the system, and a manual build rule that rebuilds the generated files.  This
> build + check-in process would want documenting in target/arc/README or
> something.  If there are any ruby packages required apart from the base
> language, this should be documented as well (I know nothing about ruby myself,
> just guessing based on what happens with python and perl).
>
> Even better would be build system changes that, if ruby is installed runs the
> generator, and only fall-back to the checked-in files if ruby is missing.
>
> In this way, anyone who wants to modify the code generator would merely have to
> install the ruby packages on their system, but they would not be required for a
> non-ARC developer to build.
>
>
> r~

