Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BAD62001D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 22:02:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os9FS-000551-Qc; Mon, 07 Nov 2022 16:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1os9FR-00054j-2Q
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 16:01:37 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1os9FP-0006Dp-Ct
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 16:01:36 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-369426664f9so116067457b3.12
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 13:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tEL76gD7JJ8/J1PKxMFO2+HQOYx2xefOW3fFzU2L/vA=;
 b=QB/1FKctSEBJQObG2oM+wnNYt9VowGbFJTR85IgI1g27zwcKpC4XtpOm5jqOJpQItj
 N6SXta7dv+z1SOZRrRDVTaCVJYy+X3E14XZoYxSaYge4tFVjiEM6aWveO3rMelHuUks5
 3J+00W98PZSONE5c15gSKGfzFqxQdmefrExdvlgOO8izPJ3hcYNginmynlURngc/RbQv
 bD9ucvVJzjo1Pf4N0nvym1ni1V/AKynprFCxP9OwPSJGPxSxVrgyuUoGbZTRSZI3K+K0
 r8l2RfHLZmYyTAIU+5eBM0LhZ6PtwG5JDeWZLKc3jvDy1+O5QP6jWq80Ibq2voyKj2MV
 uveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tEL76gD7JJ8/J1PKxMFO2+HQOYx2xefOW3fFzU2L/vA=;
 b=OzUnolG5/9LSbbirOgyxBHhzh05dpLMImi71rTwetFSYj/msEhu7hZtLW/W7gEPLFR
 i9UTDGTduSRwGHQg5nDHf4LjmXHx6UqG6pLdJ9f5mrYOh8yHWKf4k5VTVHU+MSalENjG
 Mf5OVAsBoOru2j+K1npYy4aY7c+Y0IV+rrpIKzdY7nMIMu4kDJLCW9Y2gxTWq9w8oEto
 ar1UzFZm5bdfzZ9UZaB2VhKgg3otxUJvZdptETqgb5VkkqolvYGzgj6X+jd0utpcEuus
 fV0fuM15J1PLR66ddQDnhJFTztSfNAgFBbCmfWyrw5V15YAj1WgDsu+YquxEW0KPqfUX
 IMRA==
X-Gm-Message-State: ACrzQf1lgyZ4xSUaA9hOWHdK4ClHrHqCB4YwvAR8OpKxWleBJuvrFYWo
 1L+wV3qdCem2fWqLW98mdOyb4/Z3Bf+Uy4eG06Q=
X-Google-Smtp-Source: AMsMyM4qJPjhODNJmGFvgA581E84mNSCUXPn5AYgebZ5ACkY21qwGlV0cbl5O0xw76tztQg/dIst2FuuILyyu3+cllc=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr51055531ywf.296.1667854893888; Mon, 07
 Nov 2022 13:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20221104120059.678470-1-groug@kaod.org>
 <136930a7-7e9d-8450-284a-17dba47f4e31@linaro.org>
 <20221107133412.49688989@bahia>
In-Reply-To: <20221107133412.49688989@bahia>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 7 Nov 2022 16:01:21 -0500
Message-ID: <CAJSP0QUwhLintN+7rq9J0P3oeXh4-ftJsupz1uBwgULSHSm2-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] util/log: Make the per-thread flag immutable
To: Greg Kurz <groug@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1131.google.com
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

On Mon, 7 Nov 2022 at 07:36, Greg Kurz <groug@kaod.org> wrote:
>
> On Sat, 5 Nov 2022 09:37:26 +1100
> Richard Henderson <richard.henderson@linaro.org> wrote:
>
> > On 11/4/22 23:00, Greg Kurz wrote:
> > > While working on the "util/log: Always send errors to logfile when daemonized"
> > > series [1], I've encountered some issues with the per-thread flag. They stem
> > > from the code not being designed to allow the per-thread flag to be enabled
> > > or disabled more than once, but nothing is done to prevent that from
> > > happening. This results in unexpected results like the creation of a log
> > > file with a `%d` in its name or confusing errors when using the `log`
> > > command in the monitor.
> > >
> > > I'm posting fixes separately now in case it makes sense to merge them during
> > > soft freeze. If so, I'll open an issue as explained in this recent mail [2].
> > >
> > > [1] https://patchew.org/QEMU/20221019151651.334334-1-groug@kaod.org/
> > > [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00137.html
> > >
> > > Date: Wed, 19 Oct 2022 17:16:49 +0200
> > > Message-ID: <20221019151651.334334-1-groug@kaod.org>
> > >
> > > Greg Kurz (2):
> > >    util/log: Make the per-thread flag immutable
> > >    util/log: Ignore per-thread flag if global file already there
> > >
> > >   util/log.c | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > >
> >
> > Series:
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >
>
> Thanks for the quick review Richard !
>
> I've created https://gitlab.com/qemu-project/qemu/-/issues/1302 with
> a 7.2 milestone.
>
> Paolo,
>
> Can you queue this ?

I've applied it to the staging branch.

Stefan

