Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E423F67DF83
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 09:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLKRw-000203-1e; Fri, 27 Jan 2023 03:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pLKRg-0001zB-SO
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 03:50:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pLKRf-0001xk-AW
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 03:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674809450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zqroJj5qXErcwLmgbOPJPa5TkZbA0QXH1ahDb3Fhaqg=;
 b=ezlBBWll2YzgpQzrAyCJQrldEzpshc2mA5uNFsmvMu/GRrZqqU5Cq1qW29XcJ1VOFEw3XW
 0GPqnoK0CCSgZ7Yrk/iBoQNtxHlGkxwJl6NNf3DpH8pQP4vBRm8jvJIB+DAM1l8TZy6N6Q
 W7lbAAW8nZ1o4xw4xJ4HZElReyPtuuM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-AD_PJ5OyMn-2UMK2oTtJMQ-1; Fri, 27 Jan 2023 03:50:49 -0500
X-MC-Unique: AD_PJ5OyMn-2UMK2oTtJMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3E6E2807D7C;
 Fri, 27 Jan 2023 08:50:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC0F7AD4;
 Fri, 27 Jan 2023 08:50:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0499B1800606; Fri, 27 Jan 2023 09:50:47 +0100 (CET)
Date: Fri, 27 Jan 2023 09:50:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eldon Stegall <eldon-qemu@eldondev.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: no more pullreq processing til February
Message-ID: <20230127085046.6p44sto3ijl6xjpx@sirius.home.kraxel.org>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <Y9KFp06pp/qohgV1@invalid> <Y9KLr691LwO8WUgI@redhat.com>
 <Y9KOm61iNRlpq/qU@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9KOm61iNRlpq/qU@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

  Hi,

> Scratch that, it is actually possible to configure private runners
> to pick up un-tagged jobs
> 
> https://docs.gitlab.com/ee/ci/runners/configure_runners.html#runner-is-allowed-to-run-untagged-jobs
> 
> i'm not sure what the prioritization  is between shared and private
> runners when using untagged jobs though. If a share runners will
> pick up untagged jobs and then error them due to lack of CI credits
> that might prevent our private runner picking up the untagged jobs.

Both will pick up jobs, the shared runners are usually faster.

> We would need the private runner to be configured with the docker
> engine, so it can handle our container based approach.

Yep, then you can also use the containerized gitlab-runner.

take care,
  Gerd


