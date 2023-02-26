Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F16A2F07
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 10:47:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWDbW-0003bD-5d; Sun, 26 Feb 2023 04:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWDbR-0003Z2-0x
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 04:45:57 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWDbO-00088B-Vn
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 04:45:56 -0500
Received: by mail-pf1-x433.google.com with SMTP id ce7so1840598pfb.9
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 01:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUT8YqYM+r9cceQN0JMAR71IiL8LVPHg/rC+3AjolwA=;
 b=gpUYvcUXhLNhuJ7VYB9j+/UTnBo2QzkwTTYQstmb18MjbIznvUAkpSmleK2NEEwtO9
 JkAnlFPVKgxHb1x4BdyR9CSxGO6MJ17FCoqrpSaih6dIsc5Fv74cpJU80aoR5H5d08F4
 gWqCJ5zYQims3t/bSOaQ2rHl1h++js42P3En3tOdFVmbw4cVsGAugKd2f5Z8Qp5/nNg3
 QkTGnDdwtAjQzJtW0OKtFtLGjSWrkpuEJ72drde4EUbvbnJ+7CFlU+hZJf6dF68Q40z5
 6s/h/Jbw0ods+inIKE6roilXV8/eWsnvUBJx0PJvsPjI7OEcpt2W+jLhlhn0pPZux4cg
 lB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HUT8YqYM+r9cceQN0JMAR71IiL8LVPHg/rC+3AjolwA=;
 b=S7WFie/BR6rVdfCF7PUmv/8mykWsrn21YkhMlM1P3TYoqSFJ5rOu/I7NAyPfOkg3gf
 MD8cdorvVs5J1g0GWdS6hRdRhfL3eTyL95wGI8mXYELwo1f68cMtug2bB7XYoMboM5lw
 nJZT2sxE5MRVO0YwYuZsJSf/WkckzkYIAGbrIC2o5TDR/94+ztqCGkzhp/BblVJXZhO3
 IH0DWlmOeqO1e/lNWbNVkmmJ997Qob7q7do/MOMsHfJpK1oS/bU1mkiiEiJord87BPRQ
 eFxj4homh8RB1v9z/uva1FwZBEuZmKZv5cM2/63mqWw7BjvixvyJFH7vJ3CtIbzpxdM5
 BqrQ==
X-Gm-Message-State: AO0yUKXRS0ugplHxEulRrrbs9DlUecEfLFekOgg0fhUUX5CAm8dhi3YL
 X8pXIul7dE/10jNlAC0DFsbXmpjRxwXfi/iEw9o=
X-Google-Smtp-Source: AK7set++2t4LbNx9Uzx4VdDq18Exu8loA5k9uIjj60tZETjeupIVhh3BE30GhKb7ozbKjqAZjF1AWfciWIlrZP3ySZE=
X-Received: by 2002:a65:6e4e:0:b0:4f1:1bbc:be70 with SMTP id
 be14-20020a656e4e000000b004f11bbcbe70mr1530244pgb.6.1677404752941; Sun, 26
 Feb 2023 01:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20230226015755.52624-1-damien@zamaudio.com>
 <20230226035018-mutt-send-email-mst@kernel.org>
 <2a62e6fa-3c80-5d07-2b65-0ef27ceabb86@zamaudio.com>
In-Reply-To: <2a62e6fa-3c80-5d07-2b65-0ef27ceabb86@zamaudio.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 26 Feb 2023 01:45:41 -0800
Message-ID: <CAMo8BfKm1DAfKRo+8rO7rjiQ3N_BwPFPsMmUjwRA=mx1QJqa3w@mail.gmail.com>
Subject: Re: [PATCH qemu] timer/i8254: Fix one shot PIT mode
To: Damien Zammit <damien@zamaudio.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, Feb 26, 2023 at 1:18=E2=80=AFAM Damien Zammit <damien@zamaudio.com>=
 wrote:
>
> Hi Michael,
>
> Thanks for reviewing this on a weekend!
>
> On 26/2/23 19:51, Michael S. Tsirkin wrote:
> > On Sun, Feb 26, 2023 at 01:58:10AM +0000, Damien Zammit wrote:
> >>       case 0:
> >> -        out =3D (d >=3D s->count);
> >> -        break;
> >
> >
> > I think you need something like
> >       /* FALLTHRU */
> > here otherwise some gcc versions will warn.
> >
> >>       case 1:
> >> -        out =3D (d < s->count);
> >> +        out =3D (d >=3D s->count);
>
> It seems that there are quite a number of these consecutive fallthrough c=
ases
> without /* FALLTHRU */ in i8254_common.c
>
> Can these be fixed in a separate patch?

I believe that the comment is only needed when there's code
between the labels and is not needed between the labels that
follow each other.

--=20
Thanks.
-- Max

