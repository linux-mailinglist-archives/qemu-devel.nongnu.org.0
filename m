Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43994EAAFE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:06:44 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8kN-0001nF-Fq
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:06:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZ8dz-0008G8-6C
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:00:07 -0400
Received: from [2607:f8b0:4864:20::b29] (port=40567
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZ8dx-0003OF-Cr
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:00:06 -0400
Received: by mail-yb1-xb29.google.com with SMTP id f23so210599ybj.7
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15nSE5bD12HulJX1OuydE+dSPYlDBgPZRUG+dwSskcg=;
 b=kTepUYeMqr4YKJ6/D7Soag3gZhXHAPac4NBylNvRr+h2+/N5skTp6Uzz6VfYxluvoo
 zes6y7W0WXiPLXmdrfFU0YA7xKScD30moFcfIYJqB37Yv8cYHKg4WDgZyEOyE5q/874Q
 curRm7/0Td3grdOr83bBs5Q8B7vrs1VCgP9H+xk8pVjQc5kylNyg2Jklmcza9QB6xK6p
 /JWH28b/271TCKZIxB2QZYV+uEYw66A5lwE3Zv+dctxxzrFTLQL73qGVMqhbm4F+VkIs
 n61rfnZjFsTXVDgDd/4YldC4r3p/zMeLbRTmX8AB6Sg22tFuMN7X6i2gJFaCNy1XqNt5
 Fa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15nSE5bD12HulJX1OuydE+dSPYlDBgPZRUG+dwSskcg=;
 b=HofaJMBLOj1hF9AKit+1SD6eeCZYaDCR/BlTfI6WP4gzFz10THtsEq7sCmCrM4Z9US
 RQZXnW7lrW5+0u72ROU9EX6IMMWYh1RXyeOfEh83OampNGo1ozFmenGBHzvcGJ+vcH5e
 rmrTCHXSpowQwAuAqMfAB6Yg8coDUxvH6/dSkNo60a3FPWwDCnLfESyPjGB28mlZByk6
 4TqMbtstQ91/FoYoJ2GnoKJxtLWi60CIwqHHXklIWLPJoIsh/sYfGpAa08yjwO4OEm8f
 NmkV1Vlv5S9vPolO5MWN9hnI+H1VweBVkb5ammJ+/tLv6jpKGB950wITf9o7x7D24gGK
 hAKQ==
X-Gm-Message-State: AOAM5329KU2EAp4jbe+RBuwz0afL+wh+OkZV1pfXtFITKtE5lWQeYwPF
 WWot7LRy8Aq9MhS4Gvnygd2DeskddC7tPphFIrdbDA==
X-Google-Smtp-Source: ABdhPJx6yF/So44fQc3Op5JeVFS9/BZqGad+59WIqNIR9ygribWv618/hxErxDYecX+uCwqdLhZ65IqPb2Hup7Koe8s=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr26185484ybc.39.1648548004120; Tue, 29
 Mar 2022 03:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
 <20220328165415.2102-2-kshitij.suri@nutanix.com> <87bkxp5kfo.fsf@pond.sub.org>
 <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com>
 <87a6d9429w.fsf_-_@pond.sub.org>
 <CAFEAcA8Lb0FFybmQCZdqD=o-Md=ZTGpTNtunkmd3moLzK7p=Zg@mail.gmail.com>
 <bf0a9075-e2f8-f4f0-b8dc-4b63c21100b6@nutanix.com>
In-Reply-To: <bf0a9075-e2f8-f4f0-b8dc-4b63c21100b6@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 09:59:50 +0000
Message-ID: <CAFEAcA9Qv=hH6u0WW86QUt0=8UR904NwFbAZ-ODvntkUqDkdAw@mail.gmail.com>
Subject: Re: On patch series version tags, and also cover letters (was: [PATCH
 v2 2/2] Added parameter to take screenshot with screendump as PNG)
To: Kshitij Suri <kshitij.suri@nutanix.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, berrange@redhat.com, prerna.saxena@nutanix.com,
 Markus Armbruster <armbru@redhat.com>, soham.ghosh@nutanix.com,
 qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 10:55, Kshitij Suri <kshitij.suri@nutanix.com> wrote:
> On 29/03/22 3:18 pm, Peter Maydell wrote:
> > Note that a multi-patch series always needs a cover letter,
> > even if its contents are quite brief. Some of the automatic
> > tooling gets confused by multi-patch series with no cover letter.
> > Conversely, single patches shouldn't have a cover letter, although
> > getting that one wrong doesn't really have much ill effect.

> Oh so regarding this PNG issue which has 2 patches, one to phase out
> VNC_PNG and one for core logic, should I send with a cover-letter?

Yes. There is more than one patch, so you must provide a cover letter.

thanks
-- PMM

