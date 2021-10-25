Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF803439108
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 10:18:47 +0200 (CEST)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mevBu-0008Ca-GG
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 04:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mevAe-0007Th-87
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 04:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mevAX-0005Nf-9K
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 04:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635149838;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjFDgWDM4NF9GeWt1FG07zrDyXYthWmIr9p+1KH66kU=;
 b=DuXqMz7AtNCcTlN8tLcfpa7nesRv8MTDVjPjAHuwHHsvxEvHWyUdMJCwc9MwkG7X37+Kg/
 PuOBHT4pUFU8Q9MYw24fNhSfgnYxGWu70pQOubJHZx2QoGVViXsTWK7IA7xomSdck99kKf
 zLAlSLsSuET2NSf0azhgOPxtJSfkGeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-flP6VDyyPRKqs13uVflZ2A-1; Mon, 25 Oct 2021 04:17:13 -0400
X-MC-Unique: flP6VDyyPRKqs13uVflZ2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1BF21006AA2;
 Mon, 25 Oct 2021 08:17:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A317A6418A;
 Mon, 25 Oct 2021 08:17:11 +0000 (UTC)
Date: Mon, 25 Oct 2021 09:17:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: gitlab/cirrus auth token failure
Message-ID: <YXZoBDndaM5nCpwU@redhat.com>
References: <8257c433-f8fb-7766-dec3-a220e9bee84b@linaro.org>
 <f80220c1-84cd-e9c1-9542-40f4ea9aa419@redhat.com>
 <c713ff41-0546-ee6c-dafa-f83624437fc2@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c713ff41-0546-ee6c-dafa-f83624437fc2@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 24, 2021 at 06:15:38PM -0700, Richard Henderson wrote:
> On 10/24/21 12:42 AM, Paolo Bonzini wrote:
> > On 22/10/21 20:31, Richard Henderson wrote:
> > > Hi Daniel, you win the cookie because you committed cirrus.yml.
> > > 
> > > I should have reported this before the weekend, but at some point
> > > this week the auth tokens expired(?).  All of the cirrus-run tests
> > > are now failing:
> > > 
> > > cirrus_run.api.CirrusAPIError: API returned 1 error(s):
> > > [ { 'extensions': {'classification': 'DataFetchingException'},
> > >      'locations': [{'column': 13, 'line': 5}],
> > >      'message': 'Exception while fetching data (/createBuild) : '
> > >                 'AccessTokenAuthorization(token=[MASKED]) '
> > >                 "doesn't have permissions to create builds for "
> > >                 '5748266831446016!',
> > >      'path': ['createBuild']}]
> > 
> > It seems to have fixed itself for kvm-unit-tests, so maybe it was just a
> > temporary issue within cirrus itself?
> 
> It's still failing today.

It fixed itself for libvirt too, but obviously qemu still seems to be
broken.

I'm wondering if it is as simple as having someone login to Cirrus CI
whose account owns the QEMU project. eg they might have disabled tokens
due to account inactivity.

If that doesn't work, then I'd suggest just re-creating the token.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


