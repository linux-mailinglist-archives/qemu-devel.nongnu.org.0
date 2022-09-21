Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8921B5BF1EC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:24:46 +0200 (CEST)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanXh-0004Sv-KB
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oanO1-0002Iy-Hv; Tue, 20 Sep 2022 20:14:45 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oanO0-0007nx-1F; Tue, 20 Sep 2022 20:14:45 -0400
Received: by mail-qv1-xf34.google.com with SMTP id v15so3290470qvi.11;
 Tue, 20 Sep 2022 17:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=XTdAlu23wNHJ6weopcwn5A+dKIor+xta4K+J9MdXBCc=;
 b=HsFHZCVuN9OVs0HwmEUUlNbjZxaj1mxx/wB6cy43Jv+OBMrnjgdgxLLnJgfPnGWe74
 4uvUTqchQPciZNQx0+dKKPCRpBHuZz07o9IRvTr4j+z/OyYNCC5BinCYX/5ZFd229c3G
 EAiAb6WOS9tvvO9DsNm9uxaDvRfRMnJXUPMlNy2tXdAuT5hi+BKB+8Es4GTaRsXeTIAL
 jMpndihFqXnC7NG6K7E9sNh8rmqiMzcZfL96UxxOsgX4waP+TaKvtNzZsTF4EUf14ULw
 ueIjYCmF+fuUcCfqdsxrlEPTMQpijwHhXb2phfoZN0I1swyDPlASw8q6E8zXKUcJjVq6
 P9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XTdAlu23wNHJ6weopcwn5A+dKIor+xta4K+J9MdXBCc=;
 b=ZumfihzXbbsnBCysiENhf2BpPhSCYYIEpshSeetDIfFtj8Q7++NW9571SaPe+nktQh
 MABEH2uBautRuUrpk0QjTIbOZ0GtB4/bZxuyZc378gdlsTOM52sJ+qf67pJYjtOld3De
 oHIt8W7OSGtzip0BNLR1366v+WE03VpWH/M0KsVdXQpq2rjYQiwh7C9IFz8l/mdoPzsD
 ruKkH8hP9f2yDZ6OGesS584v6kkpM5zr2kOgBKaVDK7tZireKpto7VaQbpuxOmPcXyL1
 PXsPv6cljoiJWLMDfKpDdNQy3PULNvj3AVxhk5HarlruexaclAOQPtfhideBtPMpd/du
 Fvzg==
X-Gm-Message-State: ACrzQf0IHPoe8Kd8tFC+ymUr4FEjiWTp609PVi/XOvGqnbzRLsllBQmR
 tKH6Nip2Gf3kHtZ3e9yKhalXiJUVWxUHIq3tL8kVzyTf
X-Google-Smtp-Source: AMsMyM7UNifRvWlR9ZPqaZq2Vk2kgLGYEE712BLCUHBNUKLJ29w4Q9b0pvHNHuHMVve0htUtXVMbHg/zFUPLrpS4ZHM=
X-Received: by 2002:a05:6214:20a8:b0:4ac:b917:ccae with SMTP id
 8-20020a05621420a800b004acb917ccaemr20859593qvd.85.1663719282684; Tue, 20 Sep
 2022 17:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-29-bmeng.cn@gmail.com>
 <8c9748e9-0204-c5c5-bdde-3ae069c0c98a@gmail.com>
In-Reply-To: <8c9748e9-0204-c5c5-bdde-3ae069c0c98a@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Sep 2022 08:14:33 +0800
Message-ID: <CAEUhbmWH16G+QstGNt9cSU5+nNZrC-Kp09SeMJnGR1eNkDd7nQ@mail.gmail.com>
Subject: Re: [PATCH v2 28/39] hw/pci-host: pnv_phb{3, 4}: Fix heap
 out-of-bound access failure
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 20, 2022 at 11:40 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> Bin,
>
> Since I'll send a ppc pull request shortly, I'll queue up both this and patch 27 via
> the ppc tree. These are good fixes that are independent of what happens with the
> 'tests/qtest: Enable running qtest on Windows' series.
>

Thank you Daniel.

Regards,
Bin

