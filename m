Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F362DD3C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:52:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfIl-0000Qt-GI; Thu, 17 Nov 2022 08:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovfIE-00007Y-OD
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:51:10 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovfIC-0003d8-Ng
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:51:02 -0500
Received: by mail-pg1-x52d.google.com with SMTP id q71so2001580pgq.8
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 05:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3B4nkwqkbgcaRBUPMQ9EaDT71anIYh4TBtgEntMkYg=;
 b=YK/BGFEWEnH2O/FklSnJxSINBZiL6Oyomk1foPk17MzT9hfmkKnhN3Oy5heSfJYEIq
 V+7C0mqejq3KF7I891Oe4rPL6/NePHecFvZmllzs+ivFcDRGRoPw6nKtrCa/1CM917yG
 5QaDdG11OnU8s6hXqT/PbX+kGXH8FqHdlzlns0Xes1NrW2lOuG53M6WeK++lUP4G/zSp
 EHBxNtN5y+9gxJ56wxJHxODr4xNbx14e0zW+i0tSH1La6JoC0Ke8Wd1GMO2i9XbI/dD3
 TzOue9AhevVegtmkSSciKY4LHEkcQrmeI3zZGiz/oayU6R1x3ULkFaMThig71h+wgLTt
 5mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3B4nkwqkbgcaRBUPMQ9EaDT71anIYh4TBtgEntMkYg=;
 b=d2bnPxbkpNXXrwCNiA4KaDN7QfeRlo5qj5q9ZfOCPRIYLoALN5BFZuowkLemriQhuQ
 e+FX7J6vTGesiHYgJZfYgWphRBSpyDfYYZkgq1wpEPwymYFD7X05W+2JkL2kiC7xZfcH
 bXWjtjCbT3pLGwYGAh2BRso39IYygpeSknTCoXXrCslYysg4HbXEP7Y0MlBe4KK8QG2Y
 5u3lz4J23hObS0YqnPrIHeGNxolmTRRNBMRe5asjLOzw3oBTtJi3h+vV1hwrHBkJmVAk
 PzhxTOUc5UwFS3prElkUf/z5r/y3E120Atf379Vm5EHkiaPIhYZNrOtZ3mEa9dh+/mK8
 iBnw==
X-Gm-Message-State: ANoB5pke6O/rDNLiT7eYUa14gZqjCBz/1wf39j9UiBVyyV0exAXgdn+h
 oVbhqSqndWI4XmgT370LHPL+D5hHILFjouS/3SvcSw==
X-Google-Smtp-Source: AA0mqf73YnMaoWZwshVUBmb28YII5lJMtuHMDK2fHsuX81ISQb4QxPQc5l/midF8xGhjCzeGTfZ7BDCBziTWtGNaWTk=
X-Received: by 2002:a65:681a:0:b0:43c:7da:e64b with SMTP id
 l26-20020a65681a000000b0043c07dae64bmr2185545pgt.231.1668693058490; Thu, 17
 Nov 2022 05:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-3-alex.bennee@linaro.org>
 <33e63f5c-8a32-8093-6ce8-2641d0d8e325@kaod.org>
In-Reply-To: <33e63f5c-8a32-8093-6ce8-2641d0d8e325@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Nov 2022 13:50:46 +0000
Message-ID: <CAFEAcA-tixjaq9ErMztzrgAXi=VpGqQOrHCLHTe4Wcx+qMqO8w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] tests/avocado: improve behaviour waiting for
 login prompts
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, 
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com, 
 crosa@redhat.com, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 17 Nov 2022 at 13:39, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Alex,
>
> On 11/11/22 15:55, Alex Benn=C3=A9e wrote:
> > This attempts to deal with the problem of login prompts not being
> > guaranteed to be terminated with a newline. The solution to this is to
> > peek at the incoming data looking to see if we see an up-coming match
> > before we fall back to the old readline() logic. The reason to mostly
> > rely on readline is because I am occasionally seeing the peek stalling
> > despite data being there.
> >
> > This seems kinda hacky and gross so I'm open to alternative approaches
> > and cleaner python code.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> I have pulled this patch in the aspeed tree hoping it would improve tests=
:
>
>    AST2x00MachineSDK.test_arm_ast2500_evb_sdk
>    AST2x00MachineSDK.test_arm_ast2600_evb_sdk
>
> but the failure rate has increased :/ I have seen failures in these also =
:
>
>    AST2x00Machine.test_arm_ast2500_evb_buildroot
>    AST2x00Machine.test_arm_ast2600_evb_buildroot
>
> which used to be quite stable.

This version of this patch is buggy, so you should drop it from
your tree...

-- PMM

