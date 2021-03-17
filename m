Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB42033F66C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:18:25 +0100 (CET)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZoO-0004NT-Th
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMZks-0002IS-Og
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:14:50 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMZkq-00060V-N8
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:14:46 -0400
Received: by mail-ed1-x534.google.com with SMTP id y6so3229284eds.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 10:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hEFr6DNpuGLkoDoDiGl1CzZPRKZks3liSdFuHVgNlQA=;
 b=rO9m5SRWSJSXGJcOIociFDqdXkIa2WsZoJFgoMEWv1be7bH0BkZjXsne4c5ip+p9OP
 5kxy1nj/plGX0+YSYEp3yTZh3QwcHTkRy3XIrjGXvzumjhkxX/C1iNXLIw+NveZnhykL
 o30quxB+NQOBzchHLK1v1otXmzgCFsrzSSzK96fit64jZpNXYyjczD8urjPn63L16s+g
 P4g/DbEE4ETX8XF93Ixs+pP4Z/WQyIhZbe94+EpTyMvLaVW6cYMCzFC0Eky0sjqGvQM4
 SYlIxIhlmDubE5fuq14+vU6omsAPa5y077doVVF7UD22yT9TRSCEEt3UVpGhyntmpdxx
 lhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hEFr6DNpuGLkoDoDiGl1CzZPRKZks3liSdFuHVgNlQA=;
 b=tP3GCaHXQp6TVGkaPHo77P5MhFXIPmLVTfFlwT7Z1Bjk2yMWFn1KyNzaHlx1HrMZQS
 fP1O7YfhK9yo5SQvwMa7nSrYmAHOWCcDQQQVD24dHEuiJcwP3hGJeqQpOIpMsPYKlsl6
 j4BmYYkmc9lOYMkOskKSSE9wbhll/wSDEpXQ3Z7TlKF8h09XU6+4runZ7iF1kSYPYiDj
 pW1E49nOqwrJB142zIRxSt5NLwJ0TWeUT6MNyprPk3WZYGyGEvjVcOj2All6dyblzm1H
 pbyp4Jeq9L/de0AS+SW1kqjWeloNXWb4ZnBmEMswC3VPq07CCtTHoz+1wEC0Za+xIC1r
 rBOw==
X-Gm-Message-State: AOAM530dKWDcNeOki3RXzavHkn0QuxzE/s42ebsgBrsctLKkaFpaUg/g
 ZgRTVsqz/3pNnIlTpfvJdy/esi/upLEQAGn9mbDGuw==
X-Google-Smtp-Source: ABdhPJwl9i4ot4SBjDxtlw/D1Tcnlb/US4Nod0sI0krfpVNDjf2Ew6FmN6NfuXjW1/TNtA8KV6nH27oKTxIib/v+Hck=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr31778115edb.204.1616001281836; 
 Wed, 17 Mar 2021 10:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210316103308.3458293-1-armbru@redhat.com>
In-Reply-To: <20210316103308.3458293-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 17:14:18 +0000
Message-ID: <CAFEAcA9v1Ne4Ty4cB07RFVVoshVB5YiqjRLuKfLLda08hqBL+A@mail.gmail.com>
Subject: Re: [PULL 00/11] QAPI patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 10:33, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 2615a5e433aeb812c300d3a48e1a88e1303e2339:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-03-15 19:23:00 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-16
>
> for you to fetch changes up to 5b728a7754e32ff6dac3501ded3ba820ef2edc7b:
>
>   qapi: New -compat deprecated-input=crash (2021-03-16 11:10:38 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-03-16
>

Fails to build, linux-user static config, when trynig to link the
qemu-aarch64 etc executables:

libqemuutil.a(qapi_qobject-output-visitor.c.o): In function
`qobject_output_visitor_new_qmp':
/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/../../qapi/qobject-output-visitor.c:283:
undefined reference to `compat_policy'
libqemuutil.a(qapi_qobject-input-visitor.c.o): In function
`qobject_input_visitor_new_qmp':
/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/../../qapi/qobject-input-visitor.c:746:
undefined reference to `compat_policy'
collect2: error: ld returned 1 exit status

thanks
-- PMM

