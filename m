Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE290422E8D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:55:04 +0200 (CEST)
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXniZ-0007da-Qr
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mXmvb-0002Lk-2a
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mXmvY-0007IP-90
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1HUGPf8Ht9JX50qtu3ojpwpfOEA87thif3deFMuWvI=;
 b=ic5rja3aDSzSLMadmc78qVkvL+8nkpzYcaKYzYNl1macw9O1ofjyvd1tte/rfDYtZjFUfs
 3DdM5Uf1mgup5L/p4BL3W0IlG+fbkSyxBpIfTHoXwpk8wCdk7gQs4CrXU8i7eR4PAk1Cev
 uOkwsW0WpApV6nmvcVR41RszlPf5XZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-Iz0yL4UjPhqD6jtlv_gniQ-1; Tue, 05 Oct 2021 12:04:21 -0400
X-MC-Unique: Iz0yL4UjPhqD6jtlv_gniQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30228802921;
 Tue,  5 Oct 2021 16:04:20 +0000 (UTC)
Received: from paraplu (unknown [10.39.192.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC8160C05;
 Tue,  5 Oct 2021 16:04:01 +0000 (UTC)
Date: Tue, 5 Oct 2021 18:03:58 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: In-tree docs vs. Wiki [Was: Re: [PATCH 0/3] rSTify SubmitAPatch,
 TrivialPatches, and SpellCheck wiki pages]
Message-ID: <YVx3bqvVny2wdTEh@paraplu>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <YVxarQkCtPkhRc4Z@stefanha-x1.localdomain>
 <YVxdKpks4ARkVHlj@paraplu>
 <YVxgBvQTwfnBgZXI@stefanha-x1.localdomain>
 <e91b1c71-63dc-644c-bdab-308b989d5b94@redhat.com>
 <YVxxTgCxQ39nIQxc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVxxTgCxQ39nIQxc@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 04:37:50PM +0100, Daniel P. Berrangé wrote:
> On Tue, Oct 05, 2021 at 05:07:06PM +0200, Philippe Mathieu-Daudé wrote:

[...]

> > One point Peter raised on IRC is it is easier to update a Wiki page
> > than get a patch merged into the repository. IOW we are making things
> > harder.
> 
> There are factors to consider beyond ease of contributions.
> 
> Certain information here is documenting a fundamental part of the
> QEMU community operation & processes. That ought to have a high
> trust level and be subject to review of content changes.  I'd say
> the SubmitAPatch page falls in this category.
> 
> Other information is essentially random adhoc user written content
> that isn't critical to the project. This can live with a low trust
> level and little-to-no review.
> 
> IMHO, the wiki should only be considered for the latter type of
> content, with any important project content being subject to
> review.
> 
> I also feel like docs in git is more likely to be kept upto date
> by the regular maintainers, than wikis which can become a bit of
> outdated mess.

I agree.  Here's an example that proves your point: had I written this
huge 'live-block-operations.rst'[1] doc as a Wiki, pretty sure it
would've been slowly rotting away.  Now I see 5 other contributors
besides me (including Peter, yourself, and Paolo in this thread) that
have patched it ... by virtue of it being in-tree.

That makes me even more convinced that having development, interface,
and any valuable docs that are in-tree are more well-maintained.

(FWIW, I seem to have more motivation to write docs in rST or similar
formats that can be iterated over, with in-line reviews like regular
patches.  I can't claim the same level of motivation to write Wiki pages
somehow.)

> It is a shame that our normal contribution workflow doesn't make
> it easy for simple docs changes to be accepted and merged :-(

Yeah; improving that can be nicer.

[1] https://qemu.readthedocs.io/en/latest/interop/live-block-operations.html

-- 
/kashyap


