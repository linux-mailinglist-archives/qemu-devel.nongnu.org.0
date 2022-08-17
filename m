Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A94597410
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:23:09 +0200 (CEST)
Received: from localhost ([::1]:35970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLoy-0002TF-CB
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOLOv-00010W-Gw
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 11:56:14 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:42720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOLOo-0001s3-Rw
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 11:56:12 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-32a17d3bba2so242447917b3.9
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 08:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lhqEScxeqHBa4Yh2gQgHwmHRbHNXD61jOG/0e4D2dfQ=;
 b=NIn8cg5G8QDP1PzJDavTs9ngLEzCohgilbBInISLwHmYfZT3rDESgt2TnF9GAo2vhx
 0CJ6HO7xjhNW+3af8El957c5PfHp0dCoSu7v0hHTvAVk7YIOqqvafdQgwjkshV3r4HGO
 EFhCf6W2/c1ZG+XNgsrKC/keD3UXjIdBO653sCPmOUF3W43Cq6jM9J+LiPerqx4kD516
 RAgtJvDofYf6/ivAfXtJWZXsb7fxWF2RAdWY3T7zXbpmKUfpZ8I+4/kz7yLHK4kx07ZO
 Ue0XWzO1gJR3nxmZmmNp9QqApiW+p0MXSCpTNUIXrqxWCKzgDScFqBAMknvZ4JQNL+N0
 WvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lhqEScxeqHBa4Yh2gQgHwmHRbHNXD61jOG/0e4D2dfQ=;
 b=VPMMlbRHzLVxOcYk1BSQafoHivx5J8chQLWDCUzsIk+c3APePYhj+MX3/u9Thbpovc
 9+ZsB03OgiqyI6EoqD8WkpadMPiLBKA300PaXgo9QHS7VHXMNvcjvERGPZdYMP6OATIL
 EX1JGbQHc6dy0Vj5m8gDta2nqrxAhQvyRRlrgrdPIPXvmYqqTsphpDhO9xFky2MI8rJe
 +dl8WmlwvBhk2IaQfI1zcNAyHWm9W9M5R6wqsX57tIRHPodHvv8t9C7L6UIWByBk0DxF
 LIhSVns8JieVgjCf4jQjNPrCp2M3N1MX8tc7LiHH10n1HjSiCNfEPNfdkKesuw6O/wWw
 e6OA==
X-Gm-Message-State: ACgBeo04GfEmR8FOHkQMaqbmOfmD73H0eexFU9I9sGYl39SfnmhvHsb3
 3r3GDOpoJEvmZycQlyqAURTwDYk/KOM0xvkdu3bCrA==
X-Google-Smtp-Source: AA6agR49aNRATlP8s2EuOIc0rrqiWPPReRXXZX1LZrdoApVsKpcOp5i2Yd7yzrRA+BSaiM8ILM6rI3WUqjstrYxl4R8=
X-Received: by 2002:a25:2457:0:b0:68f:ada9:ca3f with SMTP id
 k84-20020a252457000000b0068fada9ca3fmr4856027ybk.39.1660751765956; Wed, 17
 Aug 2022 08:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <877d3jupln.fsf@pond.sub.org> <3206015.kY3CcG7ZbH@silver>
 <7218690.D19hzYb2mh@silver> <87mtcen7bz.fsf@pond.sub.org>
 <CAAJ4Ao9rqmMjR2CGHBUKE8VH3pC0iuAJhUXv5Vqo5koGodt=jw@mail.gmail.com>
 <CAAJ4Ao_77mWH34V6GvrCP6suW0FPTV539C2amAm4EXbMyaLK6w@mail.gmail.com>
 <CAAJ4Ao__fJraFsh4=D-+2DfEe2B8y18yd3zOBwJ5d++x2aWQGA@mail.gmail.com>
 <CAFEAcA9bCqGRZ=oYCmmnaxkNfftRDdFk4d2wfHfW-Je_apb3Ww@mail.gmail.com>
 <CAAJ4Ao9M8CnfBtiricqteAfhPhV9sOhiicSYVsrqtCp7CisK_Q@mail.gmail.com>
In-Reply-To: <CAAJ4Ao9M8CnfBtiricqteAfhPhV9sOhiicSYVsrqtCp7CisK_Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 16:55:24 +0100
Message-ID: <CAFEAcA80d1Qd3VrzV79_ywEryikfLrLNMbe50hjMEP8_HKNBvg@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 17 Aug 2022 at 15:49, Nikita Ivanov <nivanov@cloudlinux.com> wrote:
>
> Well...
>
> What exactly is still under discussion? In my perspective, the main pitfalls have been resolved:
>
> 0. All possible places where TFR() macro could be applied are covered.
> 1. Macro has been renamed in order to be more transparent. The name has been chosen in comparison with a similar glibc macro.
> 2. The macro itself has been refactored, in order to replace it entirely with glibc alternative.
> 3. Problems with statement/expressions differences in qemu and glibc implementation have been resolved.
>
> Is there any room for improvement?

(a) do we want the statement version or the expression version?
(b) do we want "use the glibc one, with same-semantics version for
compatibility", or do we want "we have our own thing"?

I would have voted for following glibc, except that it does
that cast-to-long thing, which is incorrect behaviour when
long is 32 bits and the return value from the function being
tested is 64 bits.

thanks
-- PMM

