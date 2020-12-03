Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532A2CD34E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:22:39 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkll0-00061j-4X
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kklip-0004ev-6u
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:20:25 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kklim-0006Vr-Ke
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:20:22 -0500
Received: by mail-ej1-x631.google.com with SMTP id n26so2641029eju.6
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 02:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4A5BS7TGx2K2PZKxs8N/ixg/aW3v17kd9VqFnrVvD0=;
 b=fyaf2GrX5q9LONJElPPvHQ0y+TIkLKeQinPb95WveqsuXHqvkqt1P1AawqyAKvQV1V
 Wxmgs3koQkov4QgSuJgU81MST40+0NrXaAS4ORe+Wz34Nrh536yxxZf4BDxHTpDIVg37
 vPpoaEIHfZnB1e9CwKLSGqAivye9RnIt2qcg7QMPwxMP4ph1NgE+xAuxziC49oInMKTu
 aLqc6PNOvXOv2OFLIfGY/hzSkXzBQCBAIWbm/YQbm5vTiYdVJlbgS7uAipSJn8PGajLN
 4unq0+f7PqBuR8rdjqyhU55NoWHvDrIFVxPsJKXUqmN+MeyBxOK89h71zebNye3WGrwD
 YGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4A5BS7TGx2K2PZKxs8N/ixg/aW3v17kd9VqFnrVvD0=;
 b=VG1cbBwatEUz+vOCyNquYUDm7Cl+qpKW2f4WarDVsriDjPovakZDU2zvNHEgTJjZZ8
 FwCZiN1Ux7d+Wn0vk2LlLB53ilrU8X9WuXx0b3E8EACL7JnFML+cHXvik/yykCZTWztO
 LFe5UevhAB7U4fYYHJZckbhl0KboiTftn7DtXQAaYfjYbGe+RcX3wjdGE7WzbmTfw6v8
 koz2oHv+x3sOlf7BLkWmPR5XrMxYwYGhTvMJw5uqavrOMxGXWbhfjOAB0ppuEmPywlVd
 FpZUOaPXYzsdjijyYkCXMjHrJycBUC/erfUNkJBdkKtCscbHQZaO9T9UkHLDEKmz/Og1
 PGzg==
X-Gm-Message-State: AOAM5314+SfFc8JTxJ832UXFlgfUAn/RkHjt3twx1f1fOiI7m2NYo6TR
 eqQnf1rfHcaUEU2nwFnmOlCthdPb88I6wR5TD1ymhA==
X-Google-Smtp-Source: ABdhPJz0Mx2pCsfkfMokKmCZcU7Yo4lKP+qKLGYle8FHvqUVj6FDpDz6DJ+8IG/Ut/yQa4B2yv1an3xLFIRZEp3ScTI=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr1921310ejb.56.1606990814050; 
 Thu, 03 Dec 2020 02:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20201202101655.122214-1-mst@redhat.com>
In-Reply-To: <20201202101655.122214-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 10:20:03 +0000
Message-ID: <CAFEAcA8N1Qh0gUX8oTTPOEuq_+DRzJ+9V1RqKzVhXN+4aoBZGw@mail.gmail.com>
Subject: Re: [PULL 0/6] pc,vhost: fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Wed, 2 Dec 2020 at 11:03, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Patch 5 gave me pause but we do need patch 6 as
> it's a guest triggerable assert, and it seemed
> cleaner to just take the whole patchset than cherry-pick.

Is this only "fixes a guest triggerable assert"? If so, that's
not sufficiently important to require an rc5 at this point.

thanks
-- PMM

