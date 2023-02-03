Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D0868984B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 13:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNusK-0000eD-SE; Fri, 03 Feb 2023 07:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNusG-0000bo-BZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:09:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNusA-0002pf-9J
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675426132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmsAHm3NBvgQTl8uDtwhiydinj4CPL3sw+OhKNa4130=;
 b=fB86TQai4y52hcnEoFC6v5ioLh6wDlG2SgsX6G1h+xMD1Hs7OWSlztJWM4HH/l5XS7hSS0
 ZqnXiNfi/RHk5xTTQHoUwPcCkIhP/5oV1aUmjTPMfYNrWQCcSM0rK6DpPqAkO2PktKuN/Z
 0DkNMr/xk4+bMLsepHrAfhiJ4yBDvkE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-bQwBghMxNjiGKA69f62BTQ-1; Fri, 03 Feb 2023 07:08:49 -0500
X-MC-Unique: bQwBghMxNjiGKA69f62BTQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DB191C0419F;
 Fri,  3 Feb 2023 12:08:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65074492C14;
 Fri,  3 Feb 2023 12:08:47 +0000 (UTC)
Date: Fri, 3 Feb 2023 13:08:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, hreitz@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
Message-ID: <Y9z5TohXERGuQ6TS@redhat.com>
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com>
 <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 03.02.2023 um 12:23 hat Thomas Huth geschrieben:
> On 30/01/2023 11.58, Daniel P. Berrangé wrote:
> > On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
> > > We can get rid of the build-coroutine-sigaltstack job by moving
> > > the configure flags that should be tested here to other jobs:
> > > Move --with-coroutine=sigaltstack to the build-without-defaults job
> > > and --enable-trace-backends=ftrace to the cross-s390x-kvm-only job.
> > 
> > The biggest user of coroutines is the block layer. So we probably
> > ought to have coroutines aligned with a job that triggers the
> > 'make check-block' for iotests.  IIUC,  the without-defaults
> > job won't do that. How about, arbitrarily, using either the
> > 'check-system-debian' or 'check-system-ubuntu' job. Those distros
> > are closely related, so getting sigaltstack vs ucontext coverage
> > between them is a good win, and they both trigger the block jobs
> > IIUC.
> 
> I gave it a try with the ubuntu job, but this apparently trips up the iotests:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/3705965062#L212
> 
> Does anybody have a clue what could be going wrong here?

I'm not sure how changing the coroutine backend could cause it, but
primarily this looks like an assertion failure in migration code.

Dave, Juan, any ideas what this assertion checks and why it could be
failing?

Kevin


