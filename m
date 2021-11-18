Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCEA455C38
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:05:59 +0100 (CET)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnh70-0004re-IA
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:05:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnh5I-0003zp-ON
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:04:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnh5F-0005TU-Q9
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637240649;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RfT9GwFyp8KuaF8ltAavh6qqU2pDRkdFVDZ2OWJl58=;
 b=hw6B4a9vOO7Co+dEHx51e85CivU6uHdfuhm/hTYh9Qt/BKImLGOaN6gbRW4SeGTcsNQq0i
 oPa0qZL5bSHXcgMQMT7HBDY8J4IoPLV+pnRXavxyAWV29gAS0wx4Gj1EFYG5cjy0DULMXQ
 MYwf/IGa/gR8QsX21wpmC7JZ29TNVjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-236-shbjc0aoPfOozKEU3DGIog-1; Thu, 18 Nov 2021 08:04:01 -0500
X-MC-Unique: shbjc0aoPfOozKEU3DGIog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF8DC100CD02;
 Thu, 18 Nov 2021 13:04:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A91D5F4ED;
 Thu, 18 Nov 2021 13:03:59 +0000 (UTC)
Date: Thu, 18 Nov 2021 13:03:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2? 1/3] docs/devel/style: Improve GLib functions
 rST rendering
Message-ID: <YZZPPcqfDZ4PeHcN@redhat.com>
References: <20211116151317.2691125-1-philmd@redhat.com>
 <20211116151317.2691125-2-philmd@redhat.com>
 <m2h7c9n31m.fsf@oracle.com>
 <76394aee-bbae-9445-c106-0abf3780d291@redhat.com>
MIME-Version: 1.0
In-Reply-To: <76394aee-bbae-9445-c106-0abf3780d291@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Darren Kenny <darren.kenny@oracle.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 01:12:26PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/18/21 11:58, Darren Kenny wrote:
> > Hi Philippe,
> > 
> > There are some inconsistencies in the use of '()' when referring to
> > functions or macros below...
> 
> Daniel, if you agree with Darren comments I can respin addressing them.

It is fine with me.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


