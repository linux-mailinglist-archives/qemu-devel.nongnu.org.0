Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25564029CC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:35:42 +0200 (CEST)
Received: from localhost ([::1]:53064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbGI-0003sX-03
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNahe-0006I4-SK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:59:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNahd-0004iA-Cv
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:59:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so2153324wms.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ayf9E/+/5HeUXZuNjNywgORqjAQrn/NYdb5j4cI7Kno=;
 b=SwZtvf7T2s9z//cbhgpOOxJfX9VYZM9Wd0caLSkKlRVp4/mtbzBfrbL8yup5sSiNG/
 LRlTQfQzM1wyIllE98nWNN9MfLmEaFJ2BSg2fc+yBBKKtPjZYIzRMV6BF65i/tLr3clC
 zFBt85CVTHLAgdgt7KFE5l/Ap6n9aaBPuPQLFTPZ3j3IynN0iCcGx6oECPOySUFddtFd
 xfRg7jo+GncFyA30uFYkM2jlu7JgwazXBdqbQjZLeAQmJM+IXVY8MmIaU6Lf5C2kSY80
 2+LeGMmm6iWIvgVGK51r6zF/+lFNm30gzrYByf6I45IwB/mZJWD+m4vG1QumJBHAf0f7
 SKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ayf9E/+/5HeUXZuNjNywgORqjAQrn/NYdb5j4cI7Kno=;
 b=rTJYP1ZoPMhEhxtBjxzU4IeH9zpHM/8+qTz13bnczPC9aeGGDgpVm23aL3lvjVcTu6
 aR34DY1LPVYHvvQdNfYYsjEllD+E5sdTPmgnUyJVbqzw+zrrBXhRt9pySdpDIfS2TPwV
 yjQ2+8Fm+Z7YQvn2KKGNCdta04hiUR01aFi9ybjli4pDPUX7wDCCKHrh1nhdgkPq2xmC
 dzLemg19JtVAwvTT76/oQJFrdOqzm5KcqHM5oZRKDHFI5MZYkZNKofXOTjuryPr+IKsW
 e3NpogYVjrPcxhlVuBqBmclkMVseVrioyAextQ5i4VEm6eCKnaQjP1pBdWzl5CFDYcQz
 NxPg==
X-Gm-Message-State: AOAM533K0Tbz6pDPACx1n3LCa+TRps2eTydjwF/HButfVtcbXxx8aj4s
 LFVbS2Uv4eBNCSGfXSqryAn5CXx7uIThcXspa+8j5ReOA1Q=
X-Google-Smtp-Source: ABdhPJzDJo5AIX0ME0n7g4NTVe9Vcf8D4kaOExGpzy7gbfcmcMcFILBjLkLVL9i0b8NVvt27aIncLNCbOYOhwtTU1yE=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr3810099wmq.21.1631019591782; 
 Tue, 07 Sep 2021 05:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
 <20210903113223.19551-3-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210903113223.19551-3-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 13:59:02 +0100
Message-ID: <CAFEAcA_Scw3mwNYx8zJzGT169WGxiuq9JM5vfk9-GtWbK8onLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] escc: reset register values to zero in escc_reset()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 12:58, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is to ensure that a device reset always returns the ESCC to a known state.
>
> Note that this is currently redundant with the same code in escc_reset_chn()
> but that will change shortly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

