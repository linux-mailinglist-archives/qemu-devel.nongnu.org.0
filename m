Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41149B61D
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Apr 2019 16:57:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKlEn-0007ft-GZ
	for lists+qemu-devel@lfdr.de; Sun, 28 Apr 2019 10:57:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hKlDj-00070i-Sf
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 10:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hKlDi-0003Vp-MN
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 10:55:59 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:35306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hKlDi-0003VO-FL
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 10:55:58 -0400
Received: by mail-ot1-x32b.google.com with SMTP id g24so1943569otq.2
	for <qemu-devel@nongnu.org>; Sun, 28 Apr 2019 07:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9iML0q+Y2zXHOTw7pF90C39acLonSMJzVN+fT/f4m2s=;
	b=kw5k/SnvEsAVgBAUagQSG66bW4b7ItEKTvZLaKR+TPGLMiYQ/8DWRImB+h7U9bR/Lz
	7EArx4UtQAB4j9MB9PZXKoe6WtAUtgqdENwK+8OH0UmFTBUGm7FfesLvrXARntxWCwUb
	mOu5fMiSwwrxju6lKnY3iOKwYO6o8/FKbDELJ8Df4Fg8/Jpsa/6OuaH+0aUiG/ndI9rf
	wuasFpW46k+hczwn4sB0PgpWUI+WX7xdYHqMR9Lu96/OuQyCkrpY544mkb4SIqDCZ3oM
	A1sxdqf6UreD9b7KLg+hFRleZ/3F3iwALvhrSG46Kc3DHUeBkWV85hNOq+6OeOMKoDRL
	iUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9iML0q+Y2zXHOTw7pF90C39acLonSMJzVN+fT/f4m2s=;
	b=NjPU5vWgjKkgoDbEWLCW+//xgzwwvF93PN0vjhFxV7x/sy2kw5C8JJk0fdWR0tMhhb
	biRtvSrlhyAqoNVAWBj/G51UM61zdrll9O/pP+W8nu8w5I/53DRCoKkq7yQUcCYZz3c2
	i6S61iKIouZ7WSqylADxVHMJYnnZOFHnpibLtlaHObdDiHK02eTxFL3I50bi1UHEhEkE
	qfdEvuRHhTOLggFPag3Dtuksnex/xWn55gkM2w0Y2izsMwO+HIvTOEGygHyQUnH6oOoo
	T9H0CrrTDm15wPNNOEdPDivX7k7BqL3zEwNJO19OJV8Jr1YJkVSIbmbCUV1FTfmylh+t
	hVkA==
X-Gm-Message-State: APjAAAWRGuCNnVd1ZQOyJq6WRy0/OKfBTfdrNRmm+cYPAjqbTmwjFI0u
	GHmCHh7tAONEcjilWwsnojr0kj9QHaOqwZW9m6jJdujXqR0=
X-Google-Smtp-Source: APXvYqweZMZhS9zcUaWPMx2+ir2Yl2I+2wbkZj+5ztHh2CcMtmwhIu5FBgbA/Y1ApvBGHpBaIaUjNJ597Proes0Twpc=
X-Received: by 2002:a9d:6156:: with SMTP id c22mr5570575otk.363.1556463357027; 
	Sun, 28 Apr 2019 07:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190426182210.10442-1-richard.henderson@linaro.org>
In-Reply-To: <20190426182210.10442-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 28 Apr 2019 15:55:45 +0100
Message-ID: <CAFEAcA8BwY07Z9NdnVy=FS78kEYzQgw8AzU=7g+w3kOtBtKCgw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32b
Subject: Re: [Qemu-devel] [PULL 0/2] target/hppa patch queue
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Apr 2019 at 19:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 3284aa128153750f14a61e8a96fd085e6f2999=
b6:
>
>   Merge remote-tracking branch 'remotes/lersek/tags/edk2-pull-2019-04-22'=
 into staging (2019-04-24 13:19:41 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-hppa-20190426
>
> for you to fetch changes up to 647ad90a1eb6c016071d21e4f1e22b9cd4986417:
>
>   target/hppa: Always return EXCP_DMAR for protection id trap (2019-04-26=
 11:09:22 -0700)
>
> ----------------------------------------------------------------
> Implement fast tlb insert insns.
> Fix data tlb exception for pa 1.1.
>
> ----------------------------------------------------------------

Hi; this doesn't seem to build:

/home/pm215/qemu/target/hppa/translate.c: In function =E2=80=98trans_ixtlbx=
f=E2=80=99:
/home/pm215/qemu/target/hppa/translate.c:2544:5: error: too many
arguments to function =E2=80=98tcg_temp_new_i64=E2=80=99
     atl =3D tcg_temp_new_tl(ctx);
     ^
In file included from /home/pm215/qemu/tcg/tcg-op.h:28:0,
                 from /home/pm215/qemu/target/hppa/translate.c:25:
/home/pm215/qemu/tcg/tcg.h:975:24: note: declared here
 static inline TCGv_i64 tcg_temp_new_i64(void)
                        ^
/home/pm215/qemu/target/hppa/translate.c:2545:5: error: too many
arguments to function =E2=80=98tcg_temp_new_i64=E2=80=99
     stl =3D tcg_temp_new_tl(ctx);
     ^
In file included from /home/pm215/qemu/tcg/tcg-op.h:28:0,
                 from /home/pm215/qemu/target/hppa/translate.c:25:
/home/pm215/qemu/tcg/tcg.h:975:24: note: declared here
 static inline TCGv_i64 tcg_temp_new_i64(void)
                        ^
/home/pm215/qemu/target/hppa/translate.c:2546:5: error: too many
arguments to function =E2=80=98tcg_temp_new_i64=E2=80=99
     addr =3D tcg_temp_new_tl(ctx);
     ^
In file included from /home/pm215/qemu/tcg/tcg-op.h:28:0,
                 from /home/pm215/qemu/target/hppa/translate.c:25:
/home/pm215/qemu/tcg/tcg.h:975:24: note: declared here
 static inline TCGv_i64 tcg_temp_new_i64(void)
                        ^

(maybe a conflict with your other pullreq I just applied?)

thanks
-- PMM

