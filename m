Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F454D2FA9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:04:30 +0100 (CET)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRvzR-0002NB-DU
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:04:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRvxY-0001db-T3
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:02:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRvxX-0000MZ-5R
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646830950;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTPJKtxqDRHgC2QnT6IlEBtP9Ou2vO0Qz840EaupxAY=;
 b=cQPsIfZMivZiOH9asC32Q/j7tI+yKx39R7RmAvFcp849PZCvZcESBJDFb3xuRyMOg1PArD
 vEKRBCGoozaDDMt1Sgz6BNb3RKBJfUM2ePDYT/UhFeFYNVmp47q5ZmZX4LK2mInFTq7Sl7
 EO51REidcLeFZiYVMU/SStNmpML/JQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-dZQRnE-nOl65byy__VzMKw-1; Wed, 09 Mar 2022 08:02:19 -0500
X-MC-Unique: dZQRnE-nOl65byy__VzMKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BE651006AA5;
 Wed,  9 Mar 2022 13:02:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07CBB7B8CB;
 Wed,  9 Mar 2022 13:02:07 +0000 (UTC)
Date: Wed, 9 Mar 2022 13:02:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v7 22/22] gitlab-ci: Support macOS 12 via cirrus-run
Message-ID: <YiilTXYgeORlVl96@redhat.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
 <f2898408-5082-7121-2496-fb296c48244d@gmail.com>
 <b05317e1-3659-2dce-4582-58bc6ca4a79b@redhat.com>
 <YiiehhaRPGWnM2Vn@redhat.com>
 <ae5f9f7d-e0b3-3d79-1fe1-d8dfdb1ba2b7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ae5f9f7d-e0b3-3d79-1fe1-d8dfdb1ba2b7@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 01:50:34PM +0100, Philippe Mathieu-Daudé wrote:
> On 9/3/22 13:33, Daniel P. Berrangé wrote:
> > On Wed, Mar 09, 2022 at 12:58:42PM +0100, Thomas Huth wrote:
> 
> > > Basically fine for me, but can we really run additional cirrus-ci jobs by
> > > default? IIRC the parallel execution of those were quite limited for the
> > > free tier, so did you look close that we don't run into additional timeouts
> > > yet, due to delayed cirrus-ci jobs?
> > 
> > You can run 2 jobs in parallel in Cirrus. Beyond that they
> > get queued/serialized
> > 
> > We have a 1 hour job timeout.
> > 
> > We have to expect jobs will sometimes run slower than normal.
> > 
> > IOW if we have a job on Cirrus taking 30 minutes normally, we
> > expect it will sometimes take 45 minutes.
> > 
> > All this means that if we want Cirrus to be reliable and not
> > time out, we can really only have 2 jobs by default, unless
> > we can get the job execution time down to around 20 minutes
> > to allow for serialization.
> > 
> > We used to have terrible problems with cirrus timeouts when
> > we were running 4 jobs concurrently (2 on staging and 2 on
> > master). We addressed that in 9968de0a4a5470bd7b98dcd2fae5d5269908f16b
> > by disabling the jobs on master.
> > 
> > IOW, we really need to choose 1 macOS job and 1 FreeBSD job
> > and others need to be marked manual.
> 
> Not sure which job to choose yet. Per the first google hits we
> still want to cover Catalina first:
> https://www.statista.com/statistics/944559/worldwide-macos-version-market-share/

My general gut feeling is usually to prioritize testing older versions
as they tend to be more widely used, and we want to avoid regresions
on stuff that has been around the longest. Compatibility problems with
new releases tend to get reported by users/maintainers and would not
be regressions, but rather enhancements to support the new platform.

But it is not really an easy decision, as clearly we would prefer to
test both old and new if we had the ability.

Having one as a nightly job is a reasonable compromise. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


