Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060AD621BA6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osT70-0000cp-Dw; Tue, 08 Nov 2022 13:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osT6x-0000bH-3Y
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:14:11 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osT6v-0001E3-Hu
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:14:10 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id r3so18328720yba.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 10:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0uvu5MxOxZ9KN0DuvxDP+GeHmaLd+VCk3lhykOme0o=;
 b=FrcsR8wz5IaQEPsmzfIKi4sj4kgqdTv9qrZovJEesGrAXdKr2uZF+AWpE0qARIesZf
 E06H8aNNFKydbShm8PqgF8doYnueVzJmSbrsccZ0iKwQkAbvNHZ16HU8JLmiQChug8yP
 R6+HmH2B26S8Pmury5zA9PHeelltWIZS4NFwaoyziesleOVhx8/o+ENXebQnVx6G4DxJ
 Tp/8oGwzHP12hidNCv6J9pd5xmsnmF7kn1AiNbo44EKXiMhoinpjdbILlHLu8o4uZVYc
 qeCxQmvJ2AphbiKqGkxCXLtbzfZ4vYcbFlfgQYNpuxVK6NUCOu4RJK80rCuaWSRNVNRL
 bnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0uvu5MxOxZ9KN0DuvxDP+GeHmaLd+VCk3lhykOme0o=;
 b=Q5Uk8MNIcE7xV0fXqoyiFO478xCA547gmvvKkGXzDXS8LQUIW03vh9SulgsfexNUSF
 6AgIO0taU7bVr/zxdKfo1Ff9ZLOCf+UGl1fvxBtrw4YO5ytTdEDQdEFw40tRccuZzVrV
 lalYlHcHeAJ3GfzqrhuMEo7zeffwWNfObk41QEj2xKwynWdjv1bGJJ7tWnCm2lDdmzkQ
 QtgEeUzxp/e7uUAQfInd+JSIis+EHwVbQDXbWfITVEEOjoQaBnjEAMY6vGgyAkvNj+LO
 mRxhkhUeGjk5hbZztNp33tD2z6Yx/Jvh84DY7UnSOQEUCOVE72PajezQf5KE3rlhwmVD
 oY2g==
X-Gm-Message-State: ACrzQf2XI55NUs5hyG8BGo8b7ivmzgHJe0gVSePJJIO8x2EgUFAgachK
 06N9vwFEdE3gLd0AmCinhpXd/lN0U3E5JxgU2RY=
X-Google-Smtp-Source: AMsMyM78NYznOQbRAwI8qBhp6Xfy6YlD/LlRgfLTL8BrZr9jJlkQ9PyK6C7jk+/l2icbhW9dFTgOC+yH7XmiB7UcOhs=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr56505754ybe.642.1667931248505; Tue, 08
 Nov 2022 10:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20221108172633.860700-1-danielhb413@gmail.com>
 <3c53ebf8-7be6-7838-63d6-0dc232399669@linaro.org>
In-Reply-To: <3c53ebf8-7be6-7838-63d6-0dc232399669@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 13:13:56 -0500
Message-ID: <CAJSP0QUTzpuoMaSn7KvVoNfn0NB_GWmij7VMn2k=Vqu9L6tCgQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "hw/block/pflash_cfi0{1, 2}: Error out if device
 length isn't a power of two"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org, 
 Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 8 Nov 2022 at 13:10, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 8/11/22 18:26, Daniel Henrique Barboza wrote:
> > This commit caused a regression [1] that prevents machines that uses
> > Open Virtual Machine Firmware (OVMF) to boot.
> >
> > This is a long standing behavior with how pflash handles images. More
> > information about why this happens can be found in [2] and commit
> > 06f1521795 ("pflash: Require backend size to match device, improve
> > errors").
> >
> > This reverts commit 334c388f25707a234c4a0dea05b9df08d7746638.
> >
> > [1] https://gitlab.com/qemu-project/qemu/-/issues/1294
> > [2] https://lore.kernel.org/qemu-devel/20190308062455.29755-1-armbru@re=
dhat.com/
> >
> > Cc: Bernhard Beschow <shentey@gmail.com>
> > Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Cc: Stefan Hajnoczi <stefanha@gmail.com>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1294
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >   hw/block/pflash_cfi01.c | 8 ++------
> >   hw/block/pflash_cfi02.c | 5 -----
> >   2 files changed, 2 insertions(+), 11 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Thanks, our patches crossed :)
> https://lore.kernel.org/qemu-devel/20221108175755.95141-1-philmd@linaro.o=
rg/
>
> I'm queuing yours which is first and will amend the description
> (if you don't disagree).

I've already applied yours, Philippe, because the description is more
comprehensive.

Daniel, thank you for sending your version of the patch!

Stefan

