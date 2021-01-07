Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C36F2ED531
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:10:02 +0100 (CET)
Received: from localhost ([::1]:47838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxYnR-0006LM-1t
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxYj7-0002sO-Tn
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:05:34 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxYj1-00062h-3u
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:05:33 -0500
Received: by mail-ej1-x62b.google.com with SMTP id g20so10765205ejb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngKUxnrD4yqT3kuglx5SGzYDsb2aXqgd3hChH3tpSWA=;
 b=aZKAV/nnorGZ13vrECE34hNwNPIzgKlI2P2fKxcbpq3K4MJ0uuAXhhk/P9bHQkaZ9P
 TC+OTjDuGK9XYNM9Bm4lJWMpObp3THePTtMEp56o6dyseAwlC1rW8AN7rqDV+Rp3+R48
 OOAYVpPW7YvGksiQS3PU9ORFNGyZj7RHNkwHsv+ffPrDjU8GNZtkDP+7qNBHyER+65IR
 i4fS2tKBdjr1yAjMK0ZYYEIF/65K5unt3Rd2/CdbEihU0uu1uWvUZT/EonvStAONn/IW
 /ZvCdQqkrgYCiyFoZwHedo2wtrPyaRO5umHZfWds02rHbxhrVWdJe/NIH030/TbEwlm2
 w9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngKUxnrD4yqT3kuglx5SGzYDsb2aXqgd3hChH3tpSWA=;
 b=PxUNh9ccwe0WX5ToVdpZGiJHmF1AfbG4jgjGW9te5TApc5Af74h9bTEhNaELLaCJ6S
 PGMoGsYMNOeyV8B5/GU0wSNbdIAmhfc5mOAWRKzxrgBEIZOGqm6Dwl4ijWFVOX6pVpSY
 m54vuKT/QuVMfy8vpYoaFQk/jwkm8w9UV9GHdjGqH9t3IajHmFn6wJhks+5RffYvky0b
 56YuGNNuLPobCq7otDSpFq64cknDB3tltOLeSPCRaMd87+G7jC0daWzcb+FVvUxifcLG
 gTuGn/doywRx7ztQHkmaaUZnXbGbmy+rV2M7+QZM2x6Bdz+6qw722MuAKc2M5GLPEEk4
 d3qw==
X-Gm-Message-State: AOAM531e1T0DzpmgWSoE5dlit9upumAxza14Ez0qwUIBDqQsIFbpnAZ/
 OzXCk4Y1VU/iukfCJeAHMGKWUzW4fhwizwhD/qWngw==
X-Google-Smtp-Source: ABdhPJyOyJd+EyX5aK0hlRktakcDtZ+RGBi54JkefzjhSv4LD87ePmtGruDM843NxBWkcllkRhMb11cdJSY7oPQnypY=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr7054929ejr.482.1610039118563; 
 Thu, 07 Jan 2021 09:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-2-farman@linux.ibm.com>
 <20210106190345.GJ149908@xz-x1>
 <9fcc99ca-aa60-2249-dfc5-bf0018b3ddb0@linux.ibm.com>
In-Reply-To: <9fcc99ca-aa60-2249-dfc5-bf0018b3ddb0@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:05:07 +0000
Message-ID: <CAFEAcA_eeHNBzgUFmYXO3-n8SWeTsM_jJUB=-u-BTu7gqhvDqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] update-linux-headers: Include const.h
To: Eric Farman <farman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Jan 2021 at 16:52, Eric Farman <farman@linux.ibm.com> wrote:
> On 1/6/21 2:03 PM, Peter Xu wrote:
> > Could I ask why the const.h is installed into include/standard-headers/linux
> > rather than linux-headers/linux?  When I was working on my version I failed to
> > figure out the difference.
>
> Considering the main difference is whether the header file is copied
> directly or edited with a bunch of substitutions, and const.h doesn't
> get modified by those substitutions, I suppose it could go in
> linux-headers itself.

No, it can't, because linux-headers/ only goes on the include
path when on a Linux host and on a CPU architecture with KVM support,
whereas include/standard-headers/ headers are available and
used on all host OSes/architectures.

Because include/standard-headers/linux/ethtool.h will end up
with a line
 #include "standard-headers/linux/const.h"
we need to provide a const.h in that location so that the #include
pulls in the file correctly.

thanks
-- PMM

