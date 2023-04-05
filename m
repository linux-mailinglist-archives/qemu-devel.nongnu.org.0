Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E4B6D7233
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 03:56:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjsMy-00085N-0H; Tue, 04 Apr 2023 21:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1pjsMw-00084y-3D
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 21:55:26 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1pjsMu-0002CZ-CV
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 21:55:25 -0400
Received: by mail-qk1-x735.google.com with SMTP id u15so11163662qkk.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680659722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hE26xBUkZTmwH4Je9IXwsxW8wh3Zr3I7UAwXgzrFqjM=;
 b=FQPGW9VYInUKhNltbdc11MLP7nVe1QuIkk7pDBXRY7RABe/DcZ1SXn/B4IRzv3NNMb
 WzrEDJYyY7tO/QVC7eQSQElL4DSX/xX9S8z6QG0c6PGIAlW8KSIuwvHMekBJ7AMMizSB
 u30MoheshhQKyo2WQA1F9dzHFmnQX36H4qcq2qJGFnIS4JDgoChTbp1eI4wEFdnuJbx+
 ktclUbfjbwZpBomLjlp0+OEnqQpF0ZBIZPEYD1ffqOyRF0tSuYg9TXyI1S7rI6plTpTp
 Ar0Mv8nY6I5l7WgFj/1oDCNwZR7ZeruGtMssAZlOPIrNzy765/WhEO7+lnKOaYKqqRML
 ay+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680659722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hE26xBUkZTmwH4Je9IXwsxW8wh3Zr3I7UAwXgzrFqjM=;
 b=OVzMuNaOD7+rYtNPCfNSbliNSN9IEAsg1xz49brOHWkP6dMifDpdmYo9QLl3yHAtxm
 i7iDQASa/BwerQoYbtZPNpyS3FjNUgJD5HVXTulvnZyJVvYM/qA4tBIQn73m/eW2Ryoj
 Qu+zOphNIXLTWt5Zbq/G7h11uz7ShFY3cY5FHUmF1xSa7RYLH1/I4SbmxdmHy0NGeROJ
 MSKPus380axR13JpLiCtP4Xj9vaQKJFXcR/ElVJqxt/GSoMrDVxZo9VHBiRoDd1CFwji
 c6hVtabFE8VY5kfiKoR4dYVcUHfK3ovOjFwr0DvnH7r5ZfK5UYeDZpHHwt3bKziwgReu
 C3tQ==
X-Gm-Message-State: AAQBX9c/+5vRV/Z+zPTr2R0EpadgEvfKN4eUQMbt1ubtl3J0XbbL5qPT
 2bq828khr+BPihiFf4Y75Scr/RFSW61u4Q+8/VJroQ==
X-Google-Smtp-Source: AKy350aQmaHCLaICDI45/smsxXbqFnPG0m1ho8tp0fsIlb76XQlQZliK6aR15QJ21o5QtzS2ldg2gg4C6zF9j+jdKLY=
X-Received: by 2002:a05:620a:1709:b0:746:977f:3aef with SMTP id
 az9-20020a05620a170900b00746977f3aefmr715114qkb.1.1680659722599; Tue, 04 Apr
 2023 18:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230401172825.tvmfms6qbh3tmi5s@hetzy.fluff.org>
 <74148c47-8232-02d3-2c37-d12c1fe156e2@kaod.org>
 <50b19eb8929da77f150c34585f805345e460daed.camel@codeconstruct.com.au>
In-Reply-To: <50b19eb8929da77f150c34585f805345e460daed.camel@codeconstruct.com.au>
From: Joe Komlodi <komlodi@google.com>
Date: Tue, 4 Apr 2023 18:55:11 -0700
Message-ID: <CAGDLtxv3z69dmDMpA=7dk8ADHwTaMPT-a3BceTvyidXk66+8oA@mail.gmail.com>
Subject: Re: [PATCH 00/16] i3c: aspeed: Add I3C support
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ben Dooks <qemu@fluff.org>, qemu-devel@nongnu.org, venture@google.com, 
 peter.maydell@linaro.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, Troy Lee <troy_lee@aspeedtech.com>, 
 Graeme Gregory <quic_ggregory@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=komlodi@google.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi all,

On Sun, Apr 2, 2023 at 1:11=E2=80=AFAM Jeremy Kerr <jk@codeconstruct.com.au=
> wrote:
>
> Hi C=C3=A9dric,
>
> > > Isn't this the designware i3c ip block, and as such could we name
> > > it so?
> >
> > Currently, QEMU only has a model for a dummy Aspeed I3C variant so
> > this is a great addition.
>
> [...]
>
> > According to recent work on the kernel, it is indeed based on
> > designware I3C :
> >
> > https://lore.kernel.org/all/20230331091501.3800299-1-jk@codeconstruct.c=
om.au/
> >
> > Jeremy, how different is it ? Could we introduce properties or sub
> > classes, to support both.
>
> The differences (at least from the view of the current Linux driver
> implementation) are very minor; unless we want to be errata-compatible,
> you could use the dw driver directly, plus the ast2600-specific global
> register space.
>

This is my understanding as well from an outside look.
From a QEMU standpoint I could split off the dwc portion into a
dwc_i3c model, which the aspeed_i3c portion inherits from. I can do
that in a v2 if that sounds good with everyone.

Thanks,
Joe

> Cheers,
>
>
> Jeremy

