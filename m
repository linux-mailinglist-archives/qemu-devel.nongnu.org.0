Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3A4652306
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:48:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ckQ-0006q3-Gp; Tue, 20 Dec 2022 08:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7ckM-0006mq-IJ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:33:30 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7ckL-0005Sy-1O
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:33:30 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so12120421pjm.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 05:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUnm1Lc1bnEBacgSFQj7Q8NFw4LGD+KhZVxvPJYjEug=;
 b=U9OtJdTXtrRiTGqw/tcq79NLA8//XadxSWerHjD5dlqHt9+crrW4iTWQm+oV2qj2vw
 Bf1RgI1fB0Qh1CqEIcJ9yzJANcwISCr1nJXfe1qdQz7Fa0syp+g0wTI/Y9mBvhkmeN/e
 yIdfUhCjkSQyNmfZ+RbsQk9JlF3DrXpGvIOcE5R4xssufSWMiprZqWJR0uAD78+DHGTi
 1Y7O0vTtfwr5ModHjJeCNRa6PpmBwaZHlkUJrd5uSuZF/sDK5MQlD6x7Kgakt/TzRA2S
 B1bIX1DafTX00n0D1YYL139l+Pq+7hqrJX21WiTsAmTlHDEht1GOk2tkW/4pZoAfLSmW
 lHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZUnm1Lc1bnEBacgSFQj7Q8NFw4LGD+KhZVxvPJYjEug=;
 b=g2YMQhQzkge4dWzD7znIo/hfXsiDFAMIGfEdAjtHXPel55V4VjOjk4C4+lH0750xa7
 VreFcx2ZyN6H6xMPZs6vp+G0/MdH2OhhL4SFzROJtSu3MyF96YuyK93MPLA0+yZrG/FD
 N+LcAXmGpWlJ6sD/KLpI1IiV4TobLvscwD9Osi867A7Wq1nYi+7gOKskmDJ4/q/OFnT4
 dZXJGrFspTOEj2btx+AuFUHGuFMFtaIo1wjS8+P8lOIvf4/gVb6MuNwSkNVBL6E7s6za
 LaRAHSXePovCXgQgDfd1qNbcdu4Q5zrxto4zrfK+dgDiUTjSMV6MTj4/Q59J3T+Joj4z
 +hWw==
X-Gm-Message-State: AFqh2kokPSIz3nCCgjkG7dlkJodqNhACOH8DKI6Upi2jW6KiD7+rx2PZ
 1ENosVVeu/CzaSZNTzw6Sinat0pyP8uQJrLcI3DIyJvaj0RSWQ==
X-Google-Smtp-Source: AMrXdXvkyyVbsQhs34Q4wrexYWYp4hNgBVXoORJOqY0GB0Ts7/1RH5LLl0hwQYOmVpCDD8hCOnjG3oUvjyzuozr3sYA=
X-Received: by 2002:a17:90b:4f8d:b0:219:9874:c7d3 with SMTP id
 qe13-20020a17090b4f8d00b002199874c7d3mr1858483pjb.221.1671543207255; Tue, 20
 Dec 2022 05:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20221219155120.2273041-1-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 13:33:16 +0000
Message-ID: <CAFEAcA_no44BXZUf=fXgTYymcx2zdjaxpieSTfbvUUNUoKCG7A@mail.gmail.com>
Subject: Re: [PULL 00/13] Monitor patches for 2022-12-19
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Mon, 19 Dec 2022 at 15:51, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 562d4af32ec2213061f844b3838223fd7711b56a:
>
>   Merge tag 'pull-loongarch-20221215' of https://gitlab.com/gaosong/qemu into staging (2022-12-18 13:53:29 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-monitor-2022-12-19
>
> for you to fetch changes up to e221cfac5935b0fea0989da9ef4ee5024777f23e:
>
>   pci: Reject pcie_aer_inject_error -c with symbolic error status (2022-12-19 16:21:56 +0100)
>
> ----------------------------------------------------------------
> Monitor patches for 2022-12-19
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

