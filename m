Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6234DA26A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:29:03 +0100 (CET)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBuo-000437-Ow
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:29:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBn2-00071B-Co
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:21:00 -0400
Received: from [2607:f8b0:4864:20::b30] (port=39488
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBn0-00027E-Ri
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:21:00 -0400
Received: by mail-yb1-xb30.google.com with SMTP id t11so154048ybi.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gcYFxqP5Bu1pjBBm3B/h7vESUEKQ7M9BcrrJ3sR1ZxQ=;
 b=JBMrCloq23M/Pr65w+wUKmIc8t6y+kEf1+H8fpXj3Nsum0uV2ikehuVGGVLfTCY2dJ
 o3QbxqK2/tLrQMz9wt8CEiaZoZP5K9445/EhdhrYb23eMUD6IZMJFuBOGBGfh0GFMAb4
 f8IBPxtFbJCKx3Kg/v7BEm5/N95yqohhB1F6INRWG+6ljCadK7ll5GSRccsy1dYf+g1P
 0Al9GTRjNnXIIbsfDQ8mPdxcgatSWORvvNtIqSltynEObq917T3kvH14raF2gB2otC5z
 9xz5xJALU1HvdGmHHr9S15rKbN2p9xljFkJRDKP6SGjlPEk7/oACWOlBtAnh8xJcX4XB
 g1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcYFxqP5Bu1pjBBm3B/h7vESUEKQ7M9BcrrJ3sR1ZxQ=;
 b=NNa2T4Kw6g7aU5CuocRwEDWjz1svC50/kBkO3xv7PmWxN4XkDZnlzEnu+S1Co04RCu
 4uttBG+vNTacw01JJ11c4zA63P5wPtEP/xq9u2qSYrpsHMtwwOVfbNk5kI/I8mAMVwDz
 6z2dMq0BJPYVsm9Re9OSEhF0s3GjXXKzmgfUnJWPLE1tdQhznYQFwAIF4djM/URAv6HT
 SRHvYuq0aM8ZMg2k2ply0WxppksjS9k1ER5rWfZy82jGTFG3kYqxwoKx6Oq1GIaGQ4iN
 2TJb1IrNa+MjgmIwusX2f8QbsagVJb6xEsGsegwGkxDWVrYWKKY60TNkX9PM852ksFRd
 pfLQ==
X-Gm-Message-State: AOAM533Zs8RnbTNpk+9+mMjdrVLgLmoXo9+qvumSv9hs4lh09xWckPpS
 T1SXQGD0/WWa+vtxGJn9zyUFWJSlf1A5Y+rq0ibE5g==
X-Google-Smtp-Source: ABdhPJxSIq1RxvhFhed9S6xRb6sHnJrSajhoJSqPUbL8GcuW+Va2k4sCdCMGvfc4Qc5SaZL/zMBvBFUNPr9+uGuP0Z4=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr23752401ybs.140.1647368457069; Tue, 15
 Mar 2022 11:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220315022025.18908-1-adeason@sinenomine.net>
 <20220315022025.18908-4-adeason@sinenomine.net>
In-Reply-To: <20220315022025.18908-4-adeason@sinenomine.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:20:45 +0000
Message-ID: <CAFEAcA_yqknaEs7eLNJg6jXNiATFcCXLjDOzrBqX9RBvtjsLMw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] util/osdep: Remove some early cruft
To: Andrew Deason <adeason@sinenomine.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 02:20, Andrew Deason <adeason@sinenomine.net> wrote:
>
> The include for statvfs.h has not been needed since all statvfs calls
> were removed in commit 4a1418e07bdc ("Unbreak large mem support by
> removing kqemu").
>
> The comment mentioning CONFIG_BSD hasn't made sense since an include
> for config-host.h was removed in commit aafd75841001 ("util: Clean up
> includes").
>
> Remove this cruft.
>
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

