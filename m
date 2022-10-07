Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4815F7C1D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 19:14:57 +0200 (CEST)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqw4-0007wa-O8
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 13:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogq8e-0002E7-1y
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:23:52 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogq8b-0007zG-GR
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:23:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id 204so5302959pfx.10
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+ri1G7IfXRxdaHvDMSxkIiJevumRXLIgBs+arnlyrTU=;
 b=mIS7SeNKwZtWmI61nwZMF96UsQN2UC+GaKukKKv2YxstS1IgHSAx7WTxs7u69s9MbL
 n8V5w3T79g5XKfwFWeVGcV0VZNF9S61D83Q51/IkzoUuGOFiDUUTsnsfib/kNKDVueNv
 f2PZSaDSOjlnKgYqHmZT0uMlg8anyNeAbdqiJVGEb3bVrvU8QtpI7jQKz2/zBorozCf2
 W5kmjnqI3MlSVAn6zIAPBqLgPDKjiKPwkoPwjxdVvoRz1MRSvNtPOMWpxvze+uN26cyQ
 JKPPRena/IxNTS0qSUDXQ8Kifa7xb2YdDBMqIET3EhikDx4aV6LUoAaI3Ovb8XqRh4LD
 K3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ri1G7IfXRxdaHvDMSxkIiJevumRXLIgBs+arnlyrTU=;
 b=0Tatf2ZJCM0OCEtFZLbardO90DoTUVDB4dVF5EW0c3xLFjkM3t1w1wRXv1bTRhKVWl
 +Kx5ia4ECnH1zhjaeiQmITmwLr7apXAnZqFYtp0mv/o2q/yT69U1EfmlVqWwLYV3CM9M
 P9uikbNSTduVyHQURTo1t4aQnDVfs0lAYh6PAROLbJL1eqTeHStEVh0bhHLwpKhyWxm+
 cP6ho9DUW2k6VwmtsvCjAjPsZcq9F9XyX73tnuOsCh5TudQuQuVBCxgQmyNpKVItm2Kh
 VKr2Bp4e70o90q7jQOCzQDx9Re7DwJJzj2ssz+us1Gcw+7sdpq9lOIaraxM7HmtR2/gl
 7aPA==
X-Gm-Message-State: ACrzQf2jshhclM8jnSQZHDziNsCKxxhxdlLe5qdh8szWfl17y2iS8MOK
 SNX7p6OWAM8tQn8tXQRX/AUCE9dtVcpKhX9IZ49H5Q==
X-Google-Smtp-Source: AMsMyM6WtxROW5E7ce8GrpmczTry4tUghNbEOQJ11X/6W1WDfEt0d8jsRDOSqY7wJ877zJ2y95O/zlccd3Y9DtdDLjs=
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr6183131pfa.3.1665159825431; Fri, 07 Oct
 2022 09:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-33-richard.henderson@linaro.org>
 <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
 <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
 <CAFEAcA8Tg2Vmy2B0a_QcF9wYMHsQUY8HhEOXhmhTF6qO_3RGtw@mail.gmail.com>
 <404f0bc8-c1cf-bc30-0df8-2a33a28d2219@linaro.org>
In-Reply-To: <404f0bc8-c1cf-bc30-0df8-2a33a28d2219@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:23:33 +0100
Message-ID: <CAFEAcA9gJWkOQEHwX0TbLcwFUqncNhktwncJFQr1S+Gp5P+11w@mail.gmail.com>
Subject: Re: [PATCH v3 32/42] target/arm: Extract HA and HD in
 aa64_va_parameters
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 7 Oct 2022 at 17:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 09:11, Peter Maydell wrote:
> > On Fri, 7 Oct 2022 at 16:37, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 10/7/22 02:24, Peter Maydell wrote:
> >>>> +        .ha = ha,
> >>>> +        .hd = ha & hd,
> >>>
> >>> This is a bitwise operation on two bools, should be && ?
> >>
> >> Bitwise works fine, but I can use boolean if you like.
> >>
> >> I'd be surprised (and filing a missed optimization bug) if the compiler treated these two
> >> operations differently in this case (simple bool operands with no side effects).
> >
> > The different treatment I would expect would be that in the '&'
> > case it warns you about using a bitwise operation on a boolean :-)
>
> Oh, well, no compiler should ever do that, because bool implicitly converts to int for any
> arithmetic, just like char.

Yeah, but -Wbool-operation is there to catch bugs where the bitwise
operation was unintended and the wrong behaviour.

-- PMM

