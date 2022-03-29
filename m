Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B184EAE7E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:29:21 +0200 (CEST)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBuS-0004oF-U3
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:29:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZBsa-00048k-Ta
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:27:24 -0400
Received: from [2607:f8b0:4864:20::b36] (port=42805
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZBsZ-0003o2-H2
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:27:24 -0400
Received: by mail-yb1-xb36.google.com with SMTP id u103so31502968ybi.9
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0qx6s3egpRoOIZsFBZU1CArde91wCDblH2nmOFmVEY=;
 b=wJnlNMAdVxklr74c7K1GVl0HesRSPbCQCt2U1MyGiV/etLKTzlAA3zsXkHhTFB9oKP
 27I+MNIqdCmfAbemiCyzaM8ivSzx8RLGDMbpo6MwW1U/oTmmwvWEKLQro8d9UVo26Tv+
 W/jXT5jo+Ttez2D3/VNPOIb86WyXQv5JIYvUKGJl3guSJzKi7idGzoVQRZNHna42jz4a
 kbcbtkpVn1DQ/g8yx842/DQ9AZCDShDFRMVdZk4+1FvTymTaBq9Xxyp1MAtkT68zAubK
 dAsOUSJWXMyVynPrT+iEQDBN6dvAisk6MHgCUGISv3we1c09xll39bXM3xPpxqUZ/izL
 Cbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0qx6s3egpRoOIZsFBZU1CArde91wCDblH2nmOFmVEY=;
 b=zNAokrZYb5pX3/rKk4sUNGcH5L+7DFV1GoaTj9buVN3Pv5NMENflOSxnyj0ABQm8RY
 2oNZbdBXSZUsRo1GO7krCA5CYDeYWKS0lXbyUJw5uhownFFDthlRjJUG38CNAsQ01cli
 DoJZMglwupef8rSSyUswOFPkqLzAdVPCCML1YCdFv6zYF91dZK6KZjjjRowc6fn0h+6y
 gbcYyI5eeDLGsouhSgXlhPzGe+/k2TdnhdXzyKN2yPearfAN2emuLMJXgwuzMa7bNmSy
 8+zww80Q1JJ7+Ib+9VkDkltyl2qz1fUMupZbBdbYQR9QaafA0Peu3eI4m8fglm/oL1YZ
 +Paw==
X-Gm-Message-State: AOAM531XJVJUMQqq6TfIrC/TCI8G21uKul325mVPbm5rFumb4TcB/5cr
 n7coEkDt8dPLveRLxFUH8sf5Nf7PHlTIo/TW7Z6c/g==
X-Google-Smtp-Source: ABdhPJxbH1h9guI3dYD7JJdNyXJYLVuPjiz7dO3vNpWJxP0Nu8pBGowPS0P7NJimlEOAry0PYEqHitMMf0XjP41F5DI=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr25566935ybt.479.1648560442411; Tue, 29
 Mar 2022 06:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220329124259.355995-1-lvivier@redhat.com>
 <f329f744-e807-fc0c-69f6-52cc3d10ab9e@redhat.com>
 <CAFEAcA9=Gjavrm3_2zOL_yeXE72KaSVP7EhjJg3zGeZKJX6epA@mail.gmail.com>
 <7deceb9e-536d-c294-2580-a246b6fed22b@redhat.com>
In-Reply-To: <7deceb9e-536d-c294-2580-a246b6fed22b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 13:27:08 +0000
Message-ID: <CAFEAcA9t6MvuwtJ3qBr2UfNw3KU9Y0gzC52RzqqhMy_rL2a8aw@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: failover: fix infinite loop
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 14:25, Thomas Huth <thuth@redhat.com> wrote:
>
> On 29/03/2022 15.23, Peter Maydell wrote:
> > On Tue, 29 Mar 2022 at 13:47, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 29/03/2022 14.42, Laurent Vivier wrote:
> >>> If the migration is over before we cancel it, we are
> >>> waiting in a loop a state that never comes because the state
> >>> is already "completed".
> >>>
> >>> To avoid an infinite loop, skip the test if the migration
> >>> is "completed" before we were able to cancel it.
> >
> >> Is this still urgent for 7.0, or can it wait for the 7.1 cycle?
> >
> > It's a test case change that fixes at least one hang I've seen
> > in "make check". I prefer those to go in, at least before rc3,
> > because the CI loop being unreliable makes the whole release
> > process slower and more annoying.
>
> Ok. Do you want to pick it directly, or shall I create a pull request for
> this? (I don't have much else queued right now, that's why I ask)

I can apply it directly if you don't have anything else you're
sending anyway.

thanks
-- PMM

