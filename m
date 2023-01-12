Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B7668504
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 22:06:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG4lF-00084d-Hx; Thu, 12 Jan 2023 16:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pG4l8-00083V-Jf
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 16:05:15 -0500
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pG4l6-0000zO-Qz
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 16:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V18fetbMaLZLjyxTIVhIgGsOw03dGyBu4mHMz47t3W8=; b=VALzrtubf2HbHasQTIW0jVmjlX
 CEaFYoEfHQF0YbWUjIT6REpKrQ55TF2U2td2cxuKWIOnaYV2Z1TdJ7w4U0riWNXyV8ll00BuPQbPt
 odL8Wo/3MbqBd5HhAV4BMEWKPwvwU0OS7eDuCP8JvQa8dmiet/UC9G276Gym4zzxCpQw=;
Date: Thu, 12 Jan 2023 22:05:03 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/docker: Install flex in debian-tricore-cross
Message-ID: <20230112210503.7kkpzctw43r5cyrb@schnipp-desktop>
References: <20230112155643.7408-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112155643.7408-1-philmd@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.1.12.205123, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2022.12.20.5960001
X-Sophos-SenderHistory: ip=84.154.186.130, fs=13959137, da=161166573, mc=64,
 sc=0, hc=64, sp=0, fso=13959137, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Jan 12, 2023 at 04:56:43PM +0100, Philippe Mathieu-Daudé wrote:
> When flex is not available, binutils sources default to the
> 'missing' script, but the current script available is not in
> the format expected by the 'configure' script:
> 
>   $ ./configure
>   ...
>   /usr/src/binutils/missing: Unknown `--run' option
>   Try `/usr/src/binutils/missing --help' for more information
>   configure: WARNING: `missing' script is too old or missing
>   ...
>   checking for bison... bison -y
>   checking for flex... no
>   checking for lex... no
>   checking for flex... /usr/src/binutils/missing flex
> 
>   $ make
>   ...
>   updating ldgram.h
>   gcc -DHAVE_CONFIG_H -I. -I. -I. -D_GNU_SOURCE -I. -I. -I../bfd -I./../bfd -I./../include -I./../intl -I../intl  -w -DLOCALEDIR="\"/usr/local/share/locale\""   -W -Wall -Wstrict-prototypes -Wmissing-prototypes -w -c `test -f 'ldgram.c' || echo './'`ldgram.c
>   `test -f ldlex.l || echo './'`ldlex.l
>   /bin/sh: 1: ldlex.l: not found
>   make[3]: *** [Makefile:662: ldlex.c] Error 127
>   make[3]: Leaving directory '/usr/src/binutils/ld'
>   make[2]: *** [Makefile:799: all-recursive] Error 1
> 
> By pass the 'missing' script use by directly installing 'flex'
> in the container.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> https://gitlab.com/philmd/qemu/-/jobs/3594948730
> Duration: 4 minutes 38 seconds
> ---

Thanks for picking it up Phil. 

Reviewed-by: Bastian-Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

