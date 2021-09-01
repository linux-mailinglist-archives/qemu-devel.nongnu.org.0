Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA003FD4DF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:06:25 +0200 (CEST)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLGK-0000vJ-Ow
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLDY-0007Wh-3K
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:03:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLDV-0000r7-T5
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:03:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so4104663wmi.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDt2ROSk9hoFzPAkovRW/KplVuckM6z30AfhNKjm5tk=;
 b=vtkT2fUTd/4knv/c6gAEAI9dVe1r0bBslb75gjO+VWyeMvkKfvau+txtb9zTOXkE6C
 aciRkBdZ2E5D+pS3oVo3uWOaDl9igrFBfO6TN3cYJ0DZmRWQalqjuBBtgcDNHYNYcc0R
 ux0upd2lAm9N71/TTwAOlRhJmWX6+UhNTCioFRLTe2FJujE/FvYioZn1y7i+4XCAdQ7j
 TdKFA1vl8NYYPwPGcP8zKMBSN871P3VOW3t2srkCGiAtoQpfP/HFd16dJPk0dC4Jl1Vn
 wBSOvEcGAi+d2Rne/+ZcJLYq9OgMD792pz4rBiRhI5rbaXvA0bFwWjxt24T3oT923CWG
 90vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDt2ROSk9hoFzPAkovRW/KplVuckM6z30AfhNKjm5tk=;
 b=Li8+/npYV/RHX8pjA+q68/qXsB/NcRLFC43lzzK3xTnE7naGrOM0rz+MoqYcFJdLHM
 VMOTbTU+tDspYo2DQsBVsD9dKyQWTmePXhcSlmbF9vHA8dr2PUqcJezyZ/ApM6/uUeBq
 W8iQO+GHkygUWIvpgEC4m7u2iL1qk9b6JrBmclmKySo1JcXR/0ESBc7cQmrqRj05BeiX
 SxbGestBo0nULWkM4hPtqeFe09HrQk5Xj9s9cRrDcpLncCVHYCVD597fhH7Cd7epUXRQ
 J4H4zL6yP8R0uD83yfXkIZKISNmMfeiSf/DycL8+tkzJtUWS+BeB2y9QCWkL8mUxJZvM
 BZqw==
X-Gm-Message-State: AOAM5317dAJxOCwkS5P2HtGEuNu+QOZQyA7aee4inaJwozPM1iFRNisJ
 By1Qtx+ByD65MHOgosPC5uTkiumHlXAaJ+aOmnEwDA==
X-Google-Smtp-Source: ABdhPJyy8M2myY6kfrG2SFGK9+0KQQuzWs3HVlLTBIRAYta4PyJq6nUpBEnIYpeXfjr+TkAWF2b38tVd2/2xgDzIFrM=
X-Received: by 2002:a05:600c:4106:: with SMTP id
 j6mr8299483wmi.102.1630483407499; 
 Wed, 01 Sep 2021 01:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210831015426.101188-1-wangyanan55@huawei.com>
In-Reply-To: <20210831015426.101188-1-wangyanan55@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 09:02:39 +0100
Message-ID: <CAFEAcA9_DC+5gtScF1EjyqBc+Z7p-4ZtKb8k93QwRoT2gZtqqA@mail.gmail.com>
Subject: Re: [PATCH 0/1] hw: Add compat machines for 6.2
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 at 02:54, Yanan Wang <wangyanan55@huawei.com> wrote:
>
> This patch adds 6.2 machine types for arm/i440fx/q35/s390x/spapr,
> which is originally from [1]. Here resend it separately and hopefully
> it can get into upstream first, so that some other patches currently
> on the mail list which depend on 6.2 machine compat stuff can be
> rebased on this.

Thanks for resending this; I'm doing an arm pullreq today so I'll
put it in with that.

-- PMM

