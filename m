Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD5E402CAF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:13:22 +0200 (CEST)
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdir-0002eF-7E
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdfA-0005D7-Kt
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:09:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdf8-0006Gu-IL
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:09:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so2081901wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rA5YxKox2AMdRy4jy1ap4QkVW9HrApzRNvqR83faANA=;
 b=FbjrEuCQZiB920tQXCl/FuEGzghe0cKBYyy1lgk55xfwpyDrayz9UY997CKI5tlOa6
 NSpXmpxb7iJSZ7OclCJq+bHgxGbgIwGS4bKILjQdiVttgPg4qSW3bbHXCNtr6xfwpfe4
 eQkz2CqfyD0bD9T+6yK+kNGSBIEolnq2z18TyEdyL0ZUrv7+6Fya9YHPDXaSHJafQHOw
 W1zorBb+3nwo+P+E9zZis+7bRM0SlVVNFgfHk2VxnFv9FO/s9gHGNfQcbdYBljdzDuCD
 6CGRShRfEHWYfU3Ek4aCtHoxVjJWqs7dDFVHhjGIB2AempWlJi2VoftVs5Cy5NbWWL4l
 WQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rA5YxKox2AMdRy4jy1ap4QkVW9HrApzRNvqR83faANA=;
 b=be9lSlrZdklw/yoCcQev2VqOMp8veoS3U80r671YGctdEXXGpe5IUI04Uqh+/v+0AM
 qzPkugE4FiB1ANVnKRA2OOiKiB/nFsD+gpOaoNG2QRy+rpHC9oB5QWSfBj2CicvV7OFt
 eGE/z21XIw3jV/btR2JA+9SKNbYd8t4TLVZVicNEK9/JRfyDniGb4mBeUpKuHsb/7whY
 gZsKJn4V7a5fl5CJ/j82SPoWv022MFI9rba0UASTQ9VGN5aONN3bWStirCSszsaIYZDY
 y81GWqyZNwTPvFOa4m4yMX4WNY24cvQW1HXahbaAhGUwiOBrifPQJVb7zwqBo6pHtuId
 MW0w==
X-Gm-Message-State: AOAM530bRsRNPkIGSWGB5rx73n4bE2kMgi8WbDYBSEwx4VxlHSw6VNK8
 CzilyBkqxHPDLZDoXHurgfqxI0Ls2YMkNzBDFtCkdQ==
X-Google-Smtp-Source: ABdhPJx0vZnfb52cgCwBZwkfucRSMQEaAuK2nnB8SfZLUTewHmU+UfGTdBuHNaxiHa9VxbXc9qBAzg81vVp1S2PxYs4=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr4797681wmj.37.1631030969084;
 Tue, 07 Sep 2021 09:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210907155641.197844-1-pbonzini@redhat.com>
 <20210907155641.197844-3-pbonzini@redhat.com>
In-Reply-To: <20210907155641.197844-3-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 17:08:39 +0100
Message-ID: <CAFEAcA_CvrcZJh+2RcOhZ_pRY1_kzjSw+nSmqrdKQbKLxdtokg@mail.gmail.com>
Subject: Re: [PATCH 2/5] docs: standardize directory index to --- with overline
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 16:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Use a standard heading format for the index.rst file in a directory.
> Using overlines makes it clear that individual documents can use e.g.
> === for chapter titles and --- for section titles, as suggested in the
> Linux kernel guidelines[1].  They could do it anyway, because documents
> included in a toctree are parsed separately and therefore are not tied
> to the same conventions for headings.  However, keeping some consistency is
> useful since sometimes files are included from multiple places.
>
> [1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

