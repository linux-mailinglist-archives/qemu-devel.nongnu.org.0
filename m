Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CC35BF80
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 11:09:36 +0200 (CEST)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsZb-0004Pi-R1
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 05:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lVsVx-00028Y-7q
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:05:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lVsVu-00088S-HY
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618218345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AbdP1rwSpsjgH8HBTGATHrHyyt6/V5lcvLmLXEiM60Q=;
 b=Mbn0dbivqMNrMLWKplbo+eI+Am1GEQeiDI+CTGt3aWXlmJFingQCKo1y4flf/Y/7nTuzSb
 xgGh9wNbpUV3HEOYbP00RJ70mNwrlfa+hkQzhKdi//5em/JlKfA0G4VLwQdLkOFB8dFjHI
 xSc7lme/h7ScD80QktKFD8uwSs6OE3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-3ECjiiCkNcm2n_S7t1dREg-1; Mon, 12 Apr 2021 05:05:44 -0400
X-MC-Unique: 3ECjiiCkNcm2n_S7t1dREg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1941C6D246;
 Mon, 12 Apr 2021 09:05:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-78.ams2.redhat.com [10.36.115.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43CCB59463;
 Mon, 12 Apr 2021 09:05:42 +0000 (UTC)
Date: Mon, 12 Apr 2021 10:05:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: gitlab-ci check-dco test
Message-ID: <YHQNYzydXnzm+ZD+@redhat.com>
References: <524450fb-2baa-12de-710a-3e05ea1f3f25@linaro.org>
MIME-Version: 1.0
In-Reply-To: <524450fb-2baa-12de-710a-3e05ea1f3f25@linaro.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 07:58:48PM -0700, Richard Henderson wrote:
> On development branches, it's not uncommon to push
> temporary --fixup patches, and normally one doesn't
> sign those.  But then of course one get hate-mail
> from the gitlab-ci job about the failing test.
> 
> Is there a way to make it fatal on staging, but
> merely a warning on other branches (a-la checkpatch)?

Note,  checkpatch is *never* fatal on any branch because there are always
scenarios in which checkpatch gives false positives that we have to allow.

We can of course set 'allow_failure: true' on the DCO check, on non-staging
branches, but that loose some of its value. In general I think users should
see this as a mandatory check, because we don't want them ever sending
patches without this passing. Your scenario of sometimes needing to push
temporary fix patches is valid too of course.

So this is a no-win scenario and we have to decide what the least worst
option is. When I added this check I decided the least worst was to have
developers see failures when they have temp fixup patches, because I was
optimizing for the ensuring developers see & fix problems before they
submit to qemu-devel.

In libvirt we have the same check, but we moved it to a separate stage
in the pipeline "sanity_checks" instead of "build", so developers can
see at a glance in the UI that the build jobs all passed, and only the
sanity check(s) failed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


