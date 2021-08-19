Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35A3F19EE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:03:45 +0200 (CEST)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhhw-0004WL-Gk
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhgf-0003dg-AK
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:02:25 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhgd-0001iP-Ux
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:02:25 -0400
Received: by mail-ej1-x62f.google.com with SMTP id z20so12761553ejf.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1X7vAtwHmXMO/cjy8YKmYQZzOURPdwo0B19yYrS6zKQ=;
 b=CdaeBxOEzZBQOoiIDb4WNdQVbztfGUcbT9SVC/Rpiwrbe1vF/+YcDGr4HjmZ7VEJ66
 WD47idVHany/tM+56G43EvhhWA14SE0NAnNjOQYCzxzIQn1ZvbEbWFrcCr1J2VF3txxg
 smh+dHIp6Z14goxL1oCwFDdDVyDq4erB0PsNn/fDTrVRNOE8ivt27Nneg6qoqyUA1pM0
 hAdYNJp17TAf3enyqVSrX4B31+i9keyZO37TPTcsi4080Tn5HEGp2bngsCkCt6eM6BTQ
 BIdW7qKwuWJRtO6X+Sjh2plGoW7Ig/vDkpLzI1J//9s7bAb7KXClpRiNy16Ajy8etjUO
 pRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1X7vAtwHmXMO/cjy8YKmYQZzOURPdwo0B19yYrS6zKQ=;
 b=DA11oi3cj9WvC5tZ0OPI9fi8qC+ksD1TifyToLS2dgl6mhoXSNaCCHLJbapC+eQ0ZB
 YqBeiRs2TWwOmPSKstHMuHYBDBKq4UZTy1lgjo4/1W3DmA+KF3W9a777MwFdFpOatasT
 jb9rrWKVtkFBKb5P5oWXpZ09d3X2y1CQaAh3Jlv11LwCIPeP4SjJFKYprpFmbg7qskxO
 qlsl9krSsTdzDu0nbfs3PanmiSP2q9xLpGtSu64qA0wCSPUsmt/67tVKamv/XX8Aim5e
 35Y5jwsLeEljAEY7Fyi0N49aQY/B45SbbsmVvangOgqNdRwe9RzpSMSoZ59f3F0zd/yE
 Jwjw==
X-Gm-Message-State: AOAM533qdGzZQkydZSuhnyfC8g2dnVmRUbFoDi2A86O8HKj/9abRZgUg
 j3GO2dfXBd6f1bV/A9Vd8BXzd8oZj4N4aU+h7LJGoWT9STY=
X-Google-Smtp-Source: ABdhPJzeP8pBFDOJotGlof66rc684kc7e6Pk1Opt/foD9L9aBViAWarnxd3+2OtVBFhxXK+W5yinUwj9Q5feYF3bsQk=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr15235350ejb.382.1629378141544; 
 Thu, 19 Aug 2021 06:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210806023119.431680-1-ehabkost@redhat.com>
In-Reply-To: <20210806023119.431680-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:01:35 +0100
Message-ID: <CAFEAcA89zK6pET09ZuDAmOB8O0PHrycmKcWWmTfVK1Tm5wQ=LQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2] sbsa-ref: Rename SBSA_GWDT enum value
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Aug 2021 at 03:31, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The SBSA_GWDT enum value conflicts with the SBSA_GWDT() QOM type
> checking helper, preventing us from using a OBJECT_DEFINE* or
> DEFINE_INSTANCE_CHECKER macro for the SBSA_GWDT() wrapper.
>
> If I understand the SBSA 6.0 specification correctly, the signal
> being connected to IRQ 16 is the WS0 output signal from the
> Generic Watchdog.  Rename the enum value to SBSA_GWDT_WS0 to be
> more explicit and avoid the name conflict.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>



Applied to target-arm.next for 6.2, thanks.

-- PMM

