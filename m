Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5E4CFE3D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:24:35 +0100 (CET)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCPi-0007iH-CA
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRCJ0-0006Dv-Bk
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:17:39 -0500
Received: from [2607:f8b0:4864:20::1129] (port=33694
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRCIy-0008Ty-SQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:17:38 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2dbd8777564so161656597b3.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 04:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dd1Tu9voO2mx1o5Ch5I8OMvkIaVjfLyYHIKRTZAiOzw=;
 b=DMZ0f6XbU3qJQGL8r70xujS2Ub+yBjO2WUt9gCaYGVkivYj+OpxuOTicIg3GmuznLl
 JzZFX9YZewNls60pncEAUwkiVaDcqBhg38SziYapR13rn+qEUj1iggE+2tonlKGuUt2p
 rslPh0RPK0QnFWgcqLTNAIHykShoCEWkNiO54KAteaDSD6GiL6hViUmDS3+Tw69HvFF9
 ouN1BSDitufruB7dU9QEeLpKyBsEP++BYpU4ko/gPTFI/C7BGRa/5IM0Cq0Q+d1WJLj4
 l358WOkytNDKD/dddz9aYb8fhIFKPPL1q4SOTP1RQfj4wBolwosqRteUN4HEzxwRPj0Q
 /J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dd1Tu9voO2mx1o5Ch5I8OMvkIaVjfLyYHIKRTZAiOzw=;
 b=e6G2TIE4cpLkBDiNLZZpHt68F4DFMt6pHJQcQkQ6NJ9K8OMSpDfeyQjzKBSMSMrLyD
 P3e3hgaMrkEnbNw+BSXc1vFG9pPQ8v0cJ0no21ZHhXE3uZqf97H3oMLvZkobi9wkLfJk
 Au9aSwFffOiq1Alzt2RxK1riA9Xwir3SLfQ/MMmucUHpq97UZmVOqrp9qkW56vguAU/A
 ieyUrPDFSdP3HxYUjse3wIKJlepkMq1KLsgHP+cadHSrx8cpqdkB6BDL4/zAT8ehmQ6x
 4HtIbXR8+qtLYTob9Rptix0qaonOGnj763xEGvY94/uiINg5b1xupXlEOc+RxbDDed1M
 r8ZQ==
X-Gm-Message-State: AOAM531z0FUJoxfrK9ao3a9izMDuAZE9VziSnIJa5YBHUEmArxkDoIhx
 S152MUI1tatfhumYHDHsWXkqN/6uFgOVzvupF1TSWA==
X-Google-Smtp-Source: ABdhPJzNta1jSRcUNaqoyggh9j75gVHAsm9+/thSPXCtRvbUXM6vfrgGv6pIZkwvNMW5T+S0cnTS7W43VAqb4Yy6xHY=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr7879849ywl.455.1646655455540; Mon, 07
 Mar 2022 04:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
 <ad3118f9-0079-16cc-8a9d-51b8e32e7b2c@gmail.com>
 <CAFEAcA_rLaphLoyZNUGOPoj5n2z7X+RJNSpnJGqhu9ujAMduEQ@mail.gmail.com>
 <ec456ba2-71ed-7cbd-ae3a-595131962918@gmail.com>
 <CAFEAcA9tzq6atDCFDSmFZ2FhNgn7dXt21=GazcXZ9+3WYVtWuA@mail.gmail.com>
 <YiX2uVVtuj6+l3R4@redhat.com>
In-Reply-To: <YiX2uVVtuj6+l3R4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 12:17:24 +0000
Message-ID: <CAFEAcA9YYZj2Zwda2UdS+_r5j0uvO-VQ-Yu_8unTGE4iJ=8+ZA@mail.gmail.com>
Subject: Re: [PULL 00/33] Abstract ArchCPU
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 12:12, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> A big issue IMHO is that the pain/impact hits the wrong people.
> It is most seriously impacts & disrupts Peter when merging, and
> less impacts the subsystem maintainers, and even less the
> original authors.
>
> If we consider a alternative world where we used merge requests
> for subsystem maintainers just to send pull requests. The subsystem
> maintainer would open a MR and it would be their responsibility
> to get a green pipeline. Peter (or the person approving pulls for
> merge at the time) shouldn't even have to consider a MR until it
> has got a green pipeline. That would put the primary impact of
> unreliable CI onto the subsystem maintainers, blocking their work
> from being considered for merge. This creates a direct incentive
> on the subsystem maintainers to contribute to ensuring reliable
> CI, instead of considering it somebody else's problem.

CI fails merge isn't really a big deal IME -- I just bounce
the merge request. The real problem and timesink (especially of
CI hours) is the intermittents.

-- PMM

