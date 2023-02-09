Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0013469072B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 12:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ52d-0006dn-Cm; Thu, 09 Feb 2023 06:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ52b-0006dW-H3
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:24:37 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ52a-0001M3-0u
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:24:37 -0500
Received: by mail-pj1-x102a.google.com with SMTP id mi9so1779296pjb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 03:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cV4+bd3hGEHhaQWm76b2hmm12IAapxvdtVmi3f647GA=;
 b=q9UicrzLmZuqVHKQuQtqBaVbjTirukMBgdognHn+cqEHe9Ji7P/Ns54Q/qpUkoRyOn
 XDaD50rcew2i3+o+TQA16OPsr9WmqJeAJPvl9zBhTHI2/qBTCsSXPGw4ceYvy4B8Dy13
 W8W/Y4dqYFlQ2w+Didmp86B5h3GBQnGIamnjK3JxpC8Jb4NM+dYCbJ7jkh0H7JYXM8MB
 Q7cEGVF0SrskBxAT9RwYsObjhxM3xu9airEzXi914X7aXCgUWE2z9XCdBOCOiGXWtJ8L
 /mwbDryEwSqgSfBiGtyEskOet5LgDme4n9JVIeqXzaPdDUXzMt2/L4iAydDOyDJpds51
 imwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cV4+bd3hGEHhaQWm76b2hmm12IAapxvdtVmi3f647GA=;
 b=uj6eZzXNSudOVkVCkGZq4i98IhK7rnXecBS1Ij3nBh6T09RB0rhtdtFjYQHKCzkIsx
 SYBkXg69/Hfn5uM9xEbtLA51AZ0W1IU8q5b8IP7Ua/g7+0rA/mrnsQLeQ5BB8m2C63TV
 c7Bp7DK142OXbmD5XRO2YoBeV3YyDIzCxsSfdNEmWBolXQZ3lIkhi/w/SQwdBZBKoX8o
 fR1ru+b5BAwCRjqQI/j0oJlN3eyzlnS5cjCgt5qfatF3YewrP1DK5ZRS+upDcYC1O3Kc
 9G9menm2MonVMnj4Gn57EVeZ2k7YjyQGi1/caMd/zMRey2KOmSfJlHjpuB0Q1U9Ad1H5
 kc9g==
X-Gm-Message-State: AO0yUKU/CcyTg665XVT2oy32JHVgEp2L4KV0t3AcsNbnhInJX6Jli5mX
 TBZAsxIVc8t9c0lNLlzHCZ2VdYkwu0v8JXeDWs1zPoG67/rJyA==
X-Google-Smtp-Source: AK7set9KL330Gpt9eCmyuLBzHIBj953wn3KTS8Sv1eLVcvvtyVG/PjZ4AwB3bI3LtEu72UGm5HQQq275okV7xCR7GP8=
X-Received: by 2002:a17:90a:d353:b0:230:c24b:f22c with SMTP id
 i19-20020a17090ad35300b00230c24bf22cmr1630694pjx.53.1675941874505; Thu, 09
 Feb 2023 03:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20230207165119.1479132-1-peter.maydell@linaro.org>
 <badcc737-279c-4a03-13fc-167501716f3c@redhat.com>
In-Reply-To: <badcc737-279c-4a03-13fc-167501716f3c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Feb 2023 11:24:23 +0000
Message-ID: <CAFEAcA80TR3k8yJmZaJ72ss=dZ1AVfCdaWF=NS9p6cnEpzsMZQ@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/netdev-socket: Raise connection timeout to 60
 seconds
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Tue, 7 Feb 2023 at 18:47, Thomas Huth <thuth@redhat.com> wrote:
>
> On 07/02/2023 17.51, Peter Maydell wrote:
> > The netdev-socket test intermittently fails on our s390x CI runner:
> >
> > 633/659 ERROR:../tests/qtest/netdev-socket.c:197:test_stream_unix:
> > assertion failed (resp == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: index=0,type=stream,unix:/tmp/netdev-socket.GZUG01/stream_unix\r\n")
> > ERROR
> > 633/659 qemu:qtest+qtest-xtensa / qtest-xtensa/netdev-socket
> > ERROR           5.47s   killed by signal 6 SIGABRT
> >
> > This may just be because when the machine is under heavy load
> > running the CI tests it hits the timeout before the QEMU
> > under test has started to the point of being able to respond
> > to HMP queries.
> >
> > Bump the timeout to 60 seconds to see if the intermittent
> > goes away.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   tests/qtest/netdev-socket.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> > index 6ba256e1730..1d98dca821f 100644
> > --- a/tests/qtest/netdev-socket.c
> > +++ b/tests/qtest/netdev-socket.c
> > @@ -12,7 +12,7 @@
> >   #include "../unit/socket-helpers.h"
> >   #include "libqtest.h"
> >
> > -#define CONNECTION_TIMEOUT    5
> > +#define CONNECTION_TIMEOUT    60
>
> Acked-by: Thomas Huth <thuth@redhat.com>
>
> Feel free to apply directly as a CI fix, I don't have any pull request
> planned in the next days.

OK, I've applied this directly.

-- PMM

