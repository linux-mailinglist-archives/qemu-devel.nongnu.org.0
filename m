Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CB3DA07F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:44:55 +0200 (CEST)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92b0-0007dD-Vf
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m92aD-0006ks-RV
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:44:05 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m92aC-0003bV-7j
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:44:05 -0400
Received: by mail-ej1-x62e.google.com with SMTP id e19so9618597ejs.9
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lne6nm+b8QN/YVq4G3DHwTADJQvygLl78P+89H3EuTw=;
 b=Rs37zKnIU7FmkH5I9gx92FEQm+iCi7CG1TM4az523Iz8PyS3UoZuOwTfbBJm0Cu8K7
 4UpFo2yBvvZ343UftnOTHayMB3hmAVVEgTMHZS9OJMug5NgNwRltknvqHuFcgtL2gaA6
 hBXMCl5T/S1zJ96nG6SD+3b6jyldHqEypRjmni6wFoKbC7RnX42swENMsR6MlrmFLUPx
 k9DVWKwJPI0isylP1bRuS1K00F3tzRKb3Rdie7g7Rh/bb/QfE/Fdo/DgAMhXU0TUk0na
 CfyEMhmNveWgYB/tz2oELYPi6ryCv9rQcPH2SRX/hlGopdjoXB+g2siqXEWyYrfrD8Xo
 W3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lne6nm+b8QN/YVq4G3DHwTADJQvygLl78P+89H3EuTw=;
 b=dgRPz8V70t8n2NrJtaJbKXYLqeS/hVcyKLQlRTxNn4HvRgSugnte0OjvzFpPfw8kC5
 wFGrBu65P+eayhq3v4k14pOnQrWYoTSjEDpVpaSkBrgn2ngxVTQOQ9a5LNQKqIwwz511
 ih/elYD2pMkriKm6vMz43yO0RprJzqpTxYPVvGJtCgw7EPTIz6GmUyWTJ+D+X8IKSeCd
 MomshWHl7ixU47UUc1LNjRdI0o4S3X3DQ8lDH0odKZCwoPIzYqBQdKXbyx289brDFYa6
 AHly6gCACI6EQ5VawG0PfHOa8o7kEbHJnQrAD4vB7uZDJ0sIn3pnU4Ef+tqSuVNltTPe
 PuKQ==
X-Gm-Message-State: AOAM532S7ua0CyzszsNJdsDJ5n9Y8UxH5rqnwJ22+h8cUOTjKOudbJ7v
 /ltUHethqJbvTZlVvgxTPtalTrblk7SPyGH/1SFhBg==
X-Google-Smtp-Source: ABdhPJxQ01vLN8rI1DCLaH0JF4QxXeFVrrfAOIlI73RQy9IOmFwqph+p2CtCwaHpzJjD+1cfEDDXRlFKdCh6V+ApSmo=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr3858587ejz.250.1627551841788; 
 Thu, 29 Jul 2021 02:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-5-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA-Dd0eh35CUo7_-_adye+DrTuFK471-A3JfBbegxoU9Jg@mail.gmail.com>
 <TYCPR01MB616010C1BAD136B9156C6B86E9EB9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB616010C1BAD136B9156C6B86E9EB9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 10:43:19 +0100
Message-ID: <CAFEAcA-_Q2D3WjfabyNXFnHsGsi2i1f=JmYVDGg47=EJamerCg@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/system: Add a64fx(Fujitsu A64FX processor) to
 supported guest CPU type
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 08:31, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hi, Peter.
>
> > This adds a64fx to the list of CPUs we support in the 'virt' board, but it hasn't
> > changed the valid_cpus[] array in hw/arm/virt.c, so trying to actually use -cpu
> > a64fx with -machine virt will fail.
>
> I'm sorry, but just to be sure, let me check.
>
> Is it correct to understand that the above comment means that we need to add
> the following fixes included in "[PATCH 2/4] target-arm: cpu64: Add support for Fujitsu A64FX" patch
> within this patch to make it a meaningful fix within one patch?
>
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 93ab9d2..2e91991 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -202,6 +202,7 @@ static const char *valid_cpus[] = {
> > ARM_CPU_TYPE_NAME("cortex-a72"),
> > ARM_CPU_TYPE_NAME("host"),
> > ARM_CPU_TYPE_NAME("max"),
> > + ARM_CPU_TYPE_NAME("a64fx"),
> > };

If you want this CPU to work with the virt board, then yes.
You should put it above 'host' and 'max' (because those are
not-real-cpu special cases, so it makes more sense for them to be last
in the list).

More generally: how are you testing this patchset? To test it
you should have at least one board that lets you use the new
CPU type so you can boot some guest with it. So if that's not
"virt" then what is it?

-- PMM

