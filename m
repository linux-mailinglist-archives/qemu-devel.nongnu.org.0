Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A5566536
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:40:38 +0200 (CEST)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8e6n-0001dI-Cd
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8e5E-0000NC-68
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:39:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8e5A-00056j-RY
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657010335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mv57wrnqPHpE7QYPgzIJoAGwf+XwLBb2/K4nB0bxI3U=;
 b=fyaayiMRb0nzQQysAa0rRvpcIMChhp+xTrdh1nDzaR7UPqH/iGuzURNe5Y+4Yfb9QItM+U
 ebJZ0yFYvjv6k3RSpWY7AA3IfPHWM1CcgQ3Z7DzWi6YnSF777yRFjCDuo01uelNugkzpL/
 XbiU76ZZahwh0NmetvfkFMsR4LIVG4Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-txxCh4DuOOupIcidNQUtkQ-1; Tue, 05 Jul 2022 04:38:50 -0400
X-MC-Unique: txxCh4DuOOupIcidNQUtkQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l11-20020adfbd8b000000b0021d754b84c5so188108wrh.17
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mv57wrnqPHpE7QYPgzIJoAGwf+XwLBb2/K4nB0bxI3U=;
 b=t8nMz8JGO32Qv4LAc6spYOmiIbuDeh33nyQeUAaviHHMoQIy5ImQ+KKVQ0nNUZopvO
 DMx3103K1P6AZQY6fPEUAbL4yTq4fGnrIpctWqbMmpg7lXtKTPIbFkMrRbV00ShiM3k7
 aMjR+RNJKtOkRmXFQbSU0gpwOUhXWNaXX5rmsJr/z43cZZqiNMSF8vwZxEMWUlL1UhRd
 SD8j53IKOMr1jiGIl1vbXfY7SIWSwBvcSTO9CO/MhjDYrA/qu5G9Fla3/JpPnz9ZKewa
 PTLUzZn3pgZseQxbrEKMdfMluMTNyo74/LZW6v7nI1k7U/VoutoZjZIm/6g1X8+6vkP+
 6ceQ==
X-Gm-Message-State: AJIora9XytREKE4rb9j/R20WZR+1QWne0toGsqZOpgXIUlq/Um38IYr9
 eE82B1n2rnSCOjfQ9tV+JA3kZapQNxXh6r/j4TMtAlHgoBJVr0GuZNE46qHWcK/eOtGjxmAVmEv
 crmzlgaIV1wmeaz8=
X-Received: by 2002:a05:600c:1c9d:b0:3a0:4e04:9475 with SMTP id
 k29-20020a05600c1c9d00b003a04e049475mr36905884wms.87.1657010329613; 
 Tue, 05 Jul 2022 01:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBpFOUQAvCdW6LKpmqTxTWV/D47V/Y5drkXKf9alxydPJ61ghkBJbGn+wl/0OUQyiSjBJ0YA==
X-Received: by 2002:a05:600c:1c9d:b0:3a0:4e04:9475 with SMTP id
 k29-20020a05600c1c9d00b003a04e049475mr36905863wms.87.1657010329304; 
 Tue, 05 Jul 2022 01:38:49 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q18-20020a5d5752000000b0021d6d18a9f8sm3965196wrw.76.2022.07.05.01.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 01:38:48 -0700 (PDT)
Date: Tue, 5 Jul 2022 09:38:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 5/5] tests: stop skipping migration test on s390x/ppc64
Message-ID: <YsP4lpXU6GpE4Hs4@work-vm>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-6-berrange@redhat.com>
 <f1c2d5b1-ee5c-281b-acd4-71035f6753c9@redhat.com>
 <YsPxp7386xTTWTrv@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsPxp7386xTTWTrv@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Jul 05, 2022 at 10:06:58AM +0200, Thomas Huth wrote:
> > On 28/06/2022 12.54, Daniel P. Berrangé wrote:
> > > There have been checks put into the migration test which skip it in a
> > > few scenarios
> > > 
> > >   * ppc64 TCG
> > >   * ppc64 KVM with kvm-pr
> > >   * s390x TCG
> > > 
> > > In the original commits there are references to unexplained hangs in
> > > the test. There is no record of details of where it was hanging, but
> > > it is suspected that these were all a result of the max downtime limit
> > > being set at too low a value to guarantee convergance.
> > > 
> > > Since a previous commit bumped the value from 1 second to 30 seconds,
> > > it is believed that hangs due to non-convergance should be eliminated
> > > and thus worth trying to remove the skipped scenarios.
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >   tests/qtest/migration-test.c | 21 ---------------------
> > >   1 file changed, 21 deletions(-)
> > 
> > I just gave this a try, and it's failing on my x86 laptop with the ppc64 target:
> > 
> > /ppc64/migration/auto_converge: qemu-system-ppc64: warning: TCG doesn't
> > support requested feature, cap-cfpc=workaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature,
> > cap-sbbc=workaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature,
> > cap-ibs=workaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature,
> > cap-ccf-assist=on
> > qemu-system-ppc64: warning: TCG doesn't support requested feature,
> > cap-cfpc=workaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature,
> > cap-sbbc=workaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature,
> > cap-ibs=workaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature,
> > cap-ccf-assist=on
> > Memory content inconsistency at df6000 first_byte = 98 last_byte = 98
> > current = 2 hit_edge = 0

98->2 is a strangely large gap, and just one page.

> > Memory content inconsistency at 4e51000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1

Yeh that's broken;   the way I think about this is you've got a loop
and the guest is following the loop incrementing one page at a time;
if you stop the world you should see one 'edge' where the incrementer
has currently incremented the previous page but hasn't done the current
page yet.   e.g. in this case the 'start' of the memory is 98, and we
were seeing 97, so we've run past that 'edge' at some point earlier.
Now we've hit 96, that should be impossible, because all of the 96's
should have incremented out before there was ever a 98 in the loop.

> > Memory content inconsistency at 4e52000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1
> > Memory content inconsistency at 4e53000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1
> > Memory content inconsistency at 4e54000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1
> > Memory content inconsistency at 4e55000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1
> > Memory content inconsistency at 4e56000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1
> > Memory content inconsistency at 4e57000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1
> > Memory content inconsistency at 4e58000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1
> > Memory content inconsistency at 4e59000 first_byte = 98 last_byte = 97
> > current = 96 hit_edge = 1
> > and in another 5542 pages**
> > ERROR:../../devel/qemu/tests/qtest/migration-test.c:280:check_guests_ram:
> > assertion failed: (bad == 0)
> > Aborted (core dumped)
> > 
> > So I guess this workaround was about a different issue and we should drop
> > this patch.
> 
> Yeah, at the very least needs for investigation.
> 
> It is a little worrying though that we get such failures as it smells
> like a genuine bug that we've been missing from having tests disabled.

Yeh I suspect it's a TCG bug not updating the 'changed' flag on the page
*after* writing the data.  I believe we've sene a case on ARM.

Dave

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


