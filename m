Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6829E40C70F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:06:47 +0200 (CEST)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVYk-0006VD-8I
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQVVr-0003nW-QA
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQVVq-0003Nq-2g
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631714624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=36QM+q4hM51KsWTtuLoGODm1t4bUS7uBaVSaKDocKZY=;
 b=JKiFhvon6AGf/V7/nja69TC5cq2eXUcMt7U7kxjcxx4rElSz8W3K9bZspZxYCFWxt/uNYo
 ezuZ5djRZ0DFvD+mZbu7/X5+APd1osgCr+5JdZuYm8UH6swvdr8XqP9Lgu1l9OWyAEBidP
 58dZalx0nBQ6nqgQMlLesGwqiBnnkTc=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-yHkyuM7VNza5JH6J2Pqj-A-1; Wed, 15 Sep 2021 10:03:43 -0400
X-MC-Unique: yHkyuM7VNza5JH6J2Pqj-A-1
Received: by mail-pg1-f198.google.com with SMTP id
 h10-20020a65404a000000b00253122e62a0so1856660pgp.0
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=36QM+q4hM51KsWTtuLoGODm1t4bUS7uBaVSaKDocKZY=;
 b=ehENLzcJHHf4Qb3A8dy8q2TcouppcJy6kWNdVHxcrXVSxq1znP1RqRWqiG6bKjuYe9
 q2sfbeLfIx1t4wkxUxVkp/1413oAwYxbpBGAS54RBGkg2KsQ4ZE5yPMyUe40jj2F6SjP
 dlIkzQI6GNoE3grnAgq1xh6VDFvcaZ3PGOZz6eMoVpPzcfNEEpDCr0Rh5C1xxaGpiP7d
 u4UCGlX9/HaeZoh3stmWeCqKDUS8Mxr80V20TXjc+cbEuCec/F2QHwES772tHgc+fNkY
 sMSgzas/qs0xkJ5rg7wXrzgQnSfRMdeAKs4SgaKtKHXoljBEZPmChTgrtZ0vkNAKkRrW
 I0CQ==
X-Gm-Message-State: AOAM530/3J6m4ek3YW6kP9XLwg39JTOLbWPW/3cZnSAnetzjN2iL83vW
 0lok4ii8FpWf0Lhl32pWt02Hhs6iLb4y2IGRebqJwLn3FdOQtCFrvMzUEDjQXShA+Em4tP9Z5XA
 7HjV8H9olfnflVsts3AOnDPcuQ0Q38RU=
X-Received: by 2002:a05:6a00:88b:b0:43d:e85f:e9ee with SMTP id
 q11-20020a056a00088b00b0043de85fe9eemr133658pfj.46.1631714622071; 
 Wed, 15 Sep 2021 07:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz59jpIBf4oljxEcbsjpvdMLOwX7XJEBZl13vc1hPCuImFumZxXBCYl7Wt0TVj2etlpPUeo3egf2CuwtfVtBA8=
X-Received: by 2002:a05:6a00:88b:b0:43d:e85f:e9ee with SMTP id
 q11-20020a056a00088b00b0043de85fe9eemr133614pfj.46.1631714621692; Wed, 15 Sep
 2021 07:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210915123412.8232-1-peter.maydell@linaro.org>
In-Reply-To: <20210915123412.8232-1-peter.maydell@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 15 Sep 2021 11:03:15 -0300
Message-ID: <CAKJDGDbReLcQmsJpwHZQ1b-+oGu0HXyEijEmvKL_PNkhx9TVUw@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Mark manual-only jobs as allow_failure
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 9:34 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If a gitlab CI job is marked as manual-only but is not marked
> as allow_failure, then gitlab considers that the pipeline is
> "blocked" until the job has been manually triggered. We need
> to mark these manual-only jobs as also allow_failure: true
> so that gitlab doesn't insist that they have run before it
> will consider the pipeline to be complete.
>
> Fixes: 4c9af1ea1457782cf0adb29
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  .gitlab-ci.d/custom-runners.yml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


