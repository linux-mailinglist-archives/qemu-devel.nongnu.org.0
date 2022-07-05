Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC185664FA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:27:12 +0200 (CEST)
Received: from localhost ([::1]:33192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dto-0000kx-1o
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8dcX-0004UN-8U
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8dcV-0000EE-C3
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008558;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDs0zYMWjDNc76pE+wWskJZ2HkU0f4L0HAiqiumWlm0=;
 b=XYVKW5Kg6TiZwsADqg2/HQ6qKsO+DXYsuIam4beuZyA9PZBy8MqgRmGS7QXXpPfAHMt4JG
 ppf6HEo8OclwGwVg3qml/kdAAuqjaivYcv1cURlIypYhbvcCg02R0K4FFHzIX1nANmtwJZ
 9On0j2wuZGfK4weWZrno6KbaZrAk9jg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-pzpDgfzUMeu0xf-e23oZWA-1; Tue, 05 Jul 2022 04:09:15 -0400
X-MC-Unique: pzpDgfzUMeu0xf-e23oZWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D45A1032963;
 Tue,  5 Jul 2022 08:09:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A5440D282F;
 Tue,  5 Jul 2022 08:09:13 +0000 (UTC)
Date: Tue, 5 Jul 2022 09:09:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH 5/5] tests: stop skipping migration test on s390x/ppc64
Message-ID: <YsPxp7386xTTWTrv@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-6-berrange@redhat.com>
 <f1c2d5b1-ee5c-281b-acd4-71035f6753c9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1c2d5b1-ee5c-281b-acd4-71035f6753c9@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 05, 2022 at 10:06:58AM +0200, Thomas Huth wrote:
> On 28/06/2022 12.54, Daniel P. Berrangé wrote:
> > There have been checks put into the migration test which skip it in a
> > few scenarios
> > 
> >   * ppc64 TCG
> >   * ppc64 KVM with kvm-pr
> >   * s390x TCG
> > 
> > In the original commits there are references to unexplained hangs in
> > the test. There is no record of details of where it was hanging, but
> > it is suspected that these were all a result of the max downtime limit
> > being set at too low a value to guarantee convergance.
> > 
> > Since a previous commit bumped the value from 1 second to 30 seconds,
> > it is believed that hangs due to non-convergance should be eliminated
> > and thus worth trying to remove the skipped scenarios.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   tests/qtest/migration-test.c | 21 ---------------------
> >   1 file changed, 21 deletions(-)
> 
> I just gave this a try, and it's failing on my x86 laptop with the ppc64 target:
> 
> /ppc64/migration/auto_converge: qemu-system-ppc64: warning: TCG doesn't
> support requested feature, cap-cfpc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-sbbc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ibs=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ccf-assist=on
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-cfpc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-sbbc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ibs=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ccf-assist=on
> Memory content inconsistency at df6000 first_byte = 98 last_byte = 98
> current = 2 hit_edge = 0
> Memory content inconsistency at 4e51000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> Memory content inconsistency at 4e52000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> Memory content inconsistency at 4e53000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> Memory content inconsistency at 4e54000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> Memory content inconsistency at 4e55000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> Memory content inconsistency at 4e56000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> Memory content inconsistency at 4e57000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> Memory content inconsistency at 4e58000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> Memory content inconsistency at 4e59000 first_byte = 98 last_byte = 97
> current = 96 hit_edge = 1
> and in another 5542 pages**
> ERROR:../../devel/qemu/tests/qtest/migration-test.c:280:check_guests_ram:
> assertion failed: (bad == 0)
> Aborted (core dumped)
> 
> So I guess this workaround was about a different issue and we should drop
> this patch.

Yeah, at the very least needs for investigation.

It is a little worrying though that we get such failures as it smells
like a genuine bug that we've been missing from having tests disabled.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


