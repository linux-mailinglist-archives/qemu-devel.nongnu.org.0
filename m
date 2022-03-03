Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE4B4CC293
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:23:16 +0100 (CET)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoEV-0001CE-J5
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPoD3-0006kP-Vl
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:21:46 -0500
Received: from [2607:f8b0:4864:20::112b] (port=35522
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPoD2-0006e4-FP
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:21:45 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so61741167b3.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 08:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7bj6+VLt8jnxmCcFjyOq5LDQB9t2EyrFEr8WRdPqcg=;
 b=B5wA3bnp3fjCttF8Yd24vHjZvMKcFwBu1IXRzMrrlJKMq45/+1lf2TeVnfkDvqQD2S
 ZaUuf22WrRAGQ950Dopy53aOI21Y4jxKZMdU4KIgLewy43W8c1Gz3oZJCegiDuguISQH
 241tCEP8wbVoRdvw8qobTsLy5jnmJ3vRYeB2YCLEIeN4QTRLOIb1ukZ+pSiibD5nh99g
 xI4gsYO5/LDMZi/IjsuyvQf5tigjtHJgYOmRB6vr3MPnYQoqGJ2jlNLy7FfYzGnPv9oV
 B7TgY5HjLWZBnoxRVYBDZKro390GgFCfmlShYi+gy+uEbrXlCqr3DC4ASwzLDHHvjwrv
 yxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7bj6+VLt8jnxmCcFjyOq5LDQB9t2EyrFEr8WRdPqcg=;
 b=k+SevsuRzieXnrTfbOQDBjxmirW+PQIpjY8fnrYTzuWOtSiwKcPrl7JWkN6XOde7jd
 Ayx0cFQh31YZEDhOtfd/low31i8BQCJlx2q1Uhi2ucJTlHaAkGPTy8HF+SflXwz02Yr6
 +G6fEifU4O3hcSFsuOAgSkTBtd/63zfY17w3eY7m4iwGwHOobOsHmsVKqSYsIBidOy0l
 I0xPrp9A5R4wF/cWtt02usY1UfO7WY0Jkr2ZainsQV1n9BoMRtMggng2CDgb9b+y0aQK
 6yhcoyIbomlCGbhAOIeNbr7XcfiOMou7Z1NDaO0XZTyrDnc17NV/+SVmEylJxUMOE161
 Cz9Q==
X-Gm-Message-State: AOAM532W/4NWTQHo8UnOi+qMjan+ozpPUhHKV5upcCiWSAtBjkCaV5AE
 zk5Pq0+EgOXlyB/p33AnA5M3RSU1nK+Dd8Tx/velkA==
X-Google-Smtp-Source: ABdhPJwA9Ie1Dc02pkkqRVLasF3nzFzS1aLg2JJ7n5HYTlBYsgmtAmqBnRE0MNKzTomOFL9KY9bKyJE1pYRRSaMaraY=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr2944217yww.64.1646324503452; Thu, 03 Mar
 2022 08:21:43 -0800 (PST)
MIME-Version: 1.0
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-3-git-send-email-steven.sistare@oracle.com>
 <CAFEAcA9OvfUdKrVtisL3hd-WqimimNPfgKpQDm-sFNOSnPOZZw@mail.gmail.com>
 <4d55c906-48cd-e399-f5dd-5baa3d9debc0@oracle.com>
In-Reply-To: <4d55c906-48cd-e399-f5dd-5baa3d9debc0@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 16:21:32 +0000
Message-ID: <CAFEAcA8409H5PuJS=xq=NZQrAyWaov3OvygfbZmu_X80+GqWnA@mail.gmail.com>
Subject: Re: [PATCH V7 02/29] migration: fix populate_vfio_info
To: Steven Sistare <steven.sistare@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 15:55, Steven Sistare <steven.sistare@oracle.com> wrote:
>
> On 2/24/2022 1:42 PM, Peter Maydell wrote:
> > ...it also seems to be making a no-change-of-behaviour rewrite
> > of the rest of the file. Is there a reason I'm missing for doing
> > that ?

> I'll change the commit message to explain:
>
>     Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
>     CONFIG_VFIO, and refactor so only one ifdef is needed when new functions
>     are added in a later patch.
>
> The later patch is "vfio-pci: cpr part 1 (fd and dma)"

I'd prefer it if you split this patch into two patches; these two changes
aren't related.

thanks
-- PMM

