Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E014CAB15
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:03:40 +0100 (CET)
Received: from localhost ([::1]:43284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSO2-0003UZ-DJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:03:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPSKN-0000xp-48
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:59:51 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=33699
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPSKL-0000bn-HH
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:59:50 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id j2so4740160ybu.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 08:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TuVpbxTwgSwy72Fo18NRg/CVIoMts+CWzhTYCfLZaJ4=;
 b=YyPp+V8adqTpWATekbY0A8QFa7huvy59AnxgVLQIXRyCZvUzSwNRgtD23iomfTTyPf
 jCJZqlN6Bspt/NAIpFmc+urOVo8Q/BB5JGvuxb2Fsj+u/zRiWVimujhpbLgCY2DmW7Gs
 WrqAUrjj973yL9KYARj1fVscuUC69O1xF6RUzB3f628nyK5KiCyj5iSBbGGRqT/pDiDt
 yvnNs7A3yW/pV41CBdJVgKqOtljQZ9OPnykDm1qkPAREQLaiZYPbYe6CbSrXWnvlUoFT
 90J32zkM9YIf0kP1YmvGM50BDCIymOCkX7c8LHIAdPoGyn/ea3oLcf/e41fMluHVI+ik
 zd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TuVpbxTwgSwy72Fo18NRg/CVIoMts+CWzhTYCfLZaJ4=;
 b=i9xog3+lTqSkdJJaQxS6N7PsGp+XWxfAPxxKaRnnCwlnPHD7/0nPZLWfp3tigCQaKZ
 q90mceo6ynqAEBUYycjie/nNyiQ0IUe807y6vGN8Rnn2rxEBOyjsMj+HuM3K16OIimn0
 Q/cIoCH2sFFSp71D0PIrny8XylXN71477USq0vlf8DzmI6zqK3XHaBbdCHo1erzQh5ZT
 WnfXXSpaI1JsepJpyivKOYfymLwEQryZoY7ZSqGOEmc0gJHORbXlE4dvL1XI1LxR2XHX
 UOrHNKYboEYcOgBaSaNzEvB3VjViT1OBlN/P1ykE8oLsdNqrDmzYgjEHsBAuw2SPP36R
 tfcw==
X-Gm-Message-State: AOAM530nKmvIcjJlCJUDqx1NBOwRo+UOpdjkw/lJlcNa5KvfIAXkhdg/
 M3UJFB8OBWHqrknXo/KyPdCLZRRMZODHvU9fsaLH3A==
X-Google-Smtp-Source: ABdhPJxbOGmimcLdvIdF1Eddadc2XI/Enl510zctpbuqdwL6oqkal5cfd9TU3fJ0ejnHUPf5NoCRGhoo3y6l9vom8RE=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr6981767ybp.39.1646240388544; Wed, 02
 Mar 2022 08:59:48 -0800 (PST)
MIME-Version: 1.0
References: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
 <CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN21Va0D7yepJSa3Jyg@mail.gmail.com>
 <2106481.Hga0XrbuFZ@silver>
In-Reply-To: <2106481.Hga0XrbuFZ@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 16:59:37 +0000
Message-ID: <CAFEAcA8JQAp4SuiWr-QAH7c9AyqD3nnNFGLYzVhsF2UQhFspBA@mail.gmail.com>
Subject: Re: [PATCH] 9pfs: move qemu_dirent_dup() from osdep -> 9p-util
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 14:16, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Dienstag, 1. M=C3=A4rz 2022 22:59:43 CET Peter Maydell wrote:
> > On Tue, 1 Mar 2022 at 20:47, Christian Schoenebeck
> >
> > <qemu_oss@crudebyte.com> wrote:
> > > Function qemu_dirent_dup() is currently only used by 9pfs server, so =
move
> > > it from project global header osdep.h to 9pfs specific header 9p-util=
.h.
> > >
> > > Link:
> > > https://lore.kernel.org/qemu-devel/CAFEAcA_=3DHAUNomKD2wurSVaAHa5mrk2=
2A1oHK
> > > LWUDjk7v6Khmg@mail.gmail.com/ Based-on:
> > > <20220227223522.91937-12-wwcohen@gmail.com>
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---

> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > since it's just code movement, but those "@c"s look a bit weird:
> > are they really valid kerneldoc comment markup?

> You are right, that's Doxygen format, not kerneldoc format.
>
> If you don't mind I send a separate, subsequent patch that just wipes the
> "@c"s away, and leave this patch as-is (as this one is pure refactoring).

Yes, I agree that should be a separate patch, and just removing
the formatting is the simplest approach.

thanks
-- PMM

