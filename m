Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90A414A62
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:19:56 +0200 (CEST)
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2AE-0000dU-5y
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT277-0006Mw-KE
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT274-0006p1-FY
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632316597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXIQK2VxzpxpJpZnFZZLBh531VPx6oDuGrnq2jSfdbo=;
 b=HYATu6hz28kjSVIxFqe5cfqbMLsYXNLmYGBahkaE7Xo3UlTPq7uZCXKwVNi9Y0KeXGronH
 cd9PNTM1uoy8IuyWVd9doVkg7bc1RMAsM3GSK2UDkqhkCARZISz63knmeMJEH/1Xufcg37
 lZr7a6QWy2llwkYUgWt39ApOlmCX3JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-RqG8t5OjNzmwE-e2LWMq9w-1; Wed, 22 Sep 2021 09:16:36 -0400
X-MC-Unique: RqG8t5OjNzmwE-e2LWMq9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2766802B9E;
 Wed, 22 Sep 2021 13:16:34 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.195.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1208F5D9DC;
 Wed, 22 Sep 2021 13:16:26 +0000 (UTC)
Date: Wed, 22 Sep 2021 15:16:24 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/3] docs: rSTify the "TrivialPatches" wiki
Message-ID: <YUssqP2PTY0SClCg@paraplu.home>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <20210922121054.1458051-3-kchamart@redhat.com>
 <09166fcf-7170-e466-0221-958703146fc5@amsat.org>
MIME-Version: 1.0
In-Reply-To: <09166fcf-7170-e466-0221-958703146fc5@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 03:05:02PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Kashyap,

Heya,

> On 9/22/21 14:10, Kashyap Chamarthy wrote:

[...]

> > +If you would like to join the trivial patches team, contact Michael
> > +Tokarev. The current team includes:
> > +
> > +- Michael Tokarev
> > +- `Laurent Vivier <mailto:laurent@vivier.eu>`__
> 
> I asked Michael if he could send a qemu-trivial@ pullreq last month
> when Laurent was on PTO and he said he hasn't done it in years.
> 
> Indeed:
> 
> $ git log --committer='Michael Tokarev'
> commit 9a232487aab8a7640ff8853d7d8d7c27106b44f8
> Date:   Fri Apr 13 18:45:45 2018 +0200
> 
> So I think you are trying to commit obsolete information.
> 
> Anyway, up to Michael to adjust.
> 
> Thanks for rstifying the doc :)

Thanks for the quick review.  I first just did a 1-1 conversion of the
wiki, because I didn't want to mix content changes with the rST
conversion patch for various reasons we both know. :-)

If we don't hear from Michael on this, I'll let Peter/Laurent adjust the
doc while pushing the patch.

-- 
/kashyap


