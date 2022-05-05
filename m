Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977151BA41
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:24:22 +0200 (CEST)
Received: from localhost ([::1]:41178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWmb-0007k1-IM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmWdd-0005k7-DT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:15:05 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmWdb-0007TI-2k
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738502;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=f7UpaE8ZnpfIU0GxGamyWxRnilwv6X4q2C2eo44NbjA=;
 b=cJIajEM6ohrjh7AZ3TeUKk1pVPWcKLO6DpeqyNGKF6M7sPcuX7RYKvXy3TvXAdP8Q/8rU1
 il1nd1aPxQ9oOLr9CiX3JlvLZzxTy/M841zkAB1S8Ze4TF6Ak9TqAmg5WvTveTAzX4yr9N
 jZGyBFt0rEwjXT/qk0l2mk9xregVn7U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-RhikGSFXOESwjYNfYImdIQ-1; Thu, 05 May 2022 04:15:01 -0400
X-MC-Unique: RhikGSFXOESwjYNfYImdIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF0B03C8ACF6;
 Thu,  5 May 2022 08:15:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFD1F4010124;
 Thu,  5 May 2022 08:14:59 +0000 (UTC)
Date: Thu, 5 May 2022 09:14:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH] docs/about: Update the support statement for Windows
Message-ID: <YnOHgZWHZ3fdYXqM@redhat.com>
References: <20220505074841.406185-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220505074841.406185-1-thuth@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 09:48:41AM +0200, Thomas Huth wrote:
> Our support statement for Windows currently talks about "Vista / Server
> 2008" - which is related to the API of Windows, and this is not easy
> to understand for the non-technical users. It might also not be quite
> true anymore, since we only compile-test QEMU with recent toolchains.

We documented Vista / Server 2008 because that is what our code is
declaring it wants in terms of Windows public APIs:

In osdep.h we have:

  #ifdef _WIN32
  /* as defined in sdkddkver.h */
  #ifndef _WIN32_WINNT
  #define _WIN32_WINNT 0x0600 /* Vista */
  #endif

which tells Mingw / MSys not to expose windows header file declarations
that post-date Vista.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


