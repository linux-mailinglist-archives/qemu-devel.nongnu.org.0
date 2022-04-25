Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CF50E3B0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:52:22 +0200 (CEST)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj04b-0005vz-76
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizbj-0006fL-7F
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizbh-00045r-4R
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650896548;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWQ1aaptlxH7yyyEdTtPxjd4Qeuq/NTQ+kZHKd5RL3E=;
 b=eQ4GSnUZDFIfSCC+TV2Kvt66cfCYTXdrzfKiDwkSYDz9TgKieZW0xEEdazc3Bc+zABhOO8
 C5fcDGQwH/fM6M5HPGSDM7upAr5dEatbCyNJ4Evl3LuC3DqnAzgN6rfXqVM+tYjGg5P0iu
 35fS7mymYEDt6lk7aYxbF1S41s6MBXk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-k2VB1bV4NHOgjVFzmfauuA-1; Mon, 25 Apr 2022 10:22:25 -0400
X-MC-Unique: k2VB1bV4NHOgjVFzmfauuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B78493820F61;
 Mon, 25 Apr 2022 14:22:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40F8940D2824;
 Mon, 25 Apr 2022 14:22:23 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:22:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Signing QEMU up for GitLab for Open Source?
Message-ID: <YmaunCsOBmTZyt2Z@redhat.com>
References: <YmZ8WpmZfdX5CsA/@stefanha-x1.localdomain>
 <8735i17278.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735i17278.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 01:53:28PM +0100, Alex Bennée wrote:
> 
> Stefan Hajnoczi <stefanha@redhat.com> writes:
> 
> > [[PGP Signed Part:Undecided]]
> > Hi,
> > QEMU needs to enroll in GitLab for Open Source before July 1st to
> > receive 50,000 CI/CD pipeline minutes and GitLab Ultimate features:
> >
> > https://about.gitlab.com/blog/2022/02/04/ultimate-perks-for-open-source-projects/
> > https://about.gitlab.com/solutions/open-source/
> >
> > CI/CD minutes also become available to personal forks for open source
> > repos so contributors can run CI pipelines without hitting CI limits as
> > easily.
> >
> > Alex, Paolo, Peter, and I are qemu-project owners on GitLab. Has anyone
> > already submitted an application?
> 
> No but if we are happy with the terms we should go ahead. I don't recall
> SFLC having any major objections and GitLab seem to be pretty engaged in
> ensuring open source projects are well treated.

Yep, they've been pretty receptive to feedback myself & other maintainers
been giving about the usage & needs of QEMU/libvirt and other major OSS
projects.

FWIW, I've applied on behalf of the libvirt group today.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


