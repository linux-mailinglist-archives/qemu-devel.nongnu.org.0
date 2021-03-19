Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B655341A15
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:32:23 +0100 (CET)
Received: from localhost ([::1]:59304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCQY-0002gf-9W
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lNCDk-0007jE-HC
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lNCDg-0003Qn-1H
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616149143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7WNsls/ldG29rVQwnd1LqYb2LSb5M5L/0GbzeAPKivM=;
 b=P3XMoJ8BoINwOeSGPaUzRNwWSZUGNFY09irU1mlqEgliuSSKQdTM81m0j3l9G+su8+qQ1Z
 biKQVkI/c2Ez2tl9DmJ5jyMX79cuj/W4MottpPgKkx6G5QTn1vb4HXsuxye8KQqz0B6OXA
 FJxNFeGDdyU24SLDWuKqERZMPfkDsc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-__jtGmh-NxG0WVJArHasfg-1; Fri, 19 Mar 2021 06:18:59 -0400
X-MC-Unique: __jtGmh-NxG0WVJArHasfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FAE991222;
 Fri, 19 Mar 2021 10:18:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBB0F5D76F;
 Fri, 19 Mar 2021 10:18:51 +0000 (UTC)
Date: Fri, 19 Mar 2021 11:18:48 +0100
From: Andrew Jones <drjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 09:33:43AM +0000, Stefan Hajnoczi wrote:
> On Thu, Mar 18, 2021 at 09:30:41PM +0100, Paolo Bonzini wrote:
> > On 18/03/21 20:46, Stefan Hajnoczi wrote:
> > > The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
> > > GitLab Merge Requests so that anyone can submit a merge request and get
> > > CI coverage.
> > 
> > Each merge request consumes about 2500.  That won't last long.
> 
> Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
> on slow machines or if we'll hit the same issue with dedicated runners.
> It seems like CI optimization will be necessary...
>

We need to reduce the amount of CI we do, not only because we can't afford
it, but because it's wasteful. I hate to think of all the kWhs spent
testing the exact same code in the exact same way, since everyone runs
everything with a simple 'git push'. IMHO, 'git push' shouldn't trigger
anything. Starting CI should be an explicit step. Also, the default CI
should only trigger tests associated with the code changed. One should
have to explicitly trigger a complete CI when they deem it worthwhile.

Do we already have some sort of CI limiters? Or is anybody looking at
that for QEMU? Are people aware of other projects that try to limit
their CI and how they do it?

Thanks,
drew


