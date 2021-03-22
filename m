Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6832343EAF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:59:39 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIHa-00086h-Pt
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOID3-0005Au-LI
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:54:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOID0-0004mB-9G
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616410493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r64pdwqq97ojDiPzcCERpxjx4nwQKtvbhqGcaHIzojY=;
 b=iu58XUtrXeT9mOcyJXq/ByyaMuOg+axTg+xoGNwy0Dy1M0MOocGUduyBK1bivIYQRdaqBs
 bFeDpjroRhS0zT+TWe3o9AQN8xKCJMNry2a8IfCIQoYHOtJeVEpJ2onDXb/yJCttkk1vV/
 pT5s/a+nuObFM7bzv7sc1QGzj0cxT+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-fbFagGu9Pcq6xCobKfX8EA-1; Mon, 22 Mar 2021 06:54:51 -0400
X-MC-Unique: fbFagGu9Pcq6xCobKfX8EA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D1B180FCA8
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:54:50 +0000 (UTC)
Received: from redhat.com (ovpn-112-245.ams2.redhat.com [10.36.112.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ECF663622;
 Mon, 22 Mar 2021 10:54:46 +0000 (UTC)
Date: Mon, 22 Mar 2021 10:54:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: spurious error in check-dco job?
Message-ID: <YFh3cwSpk4PA2G6z@redhat.com>
References: <fe4d7204-610c-37f2-b928-6a833dcf1e5f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fe4d7204-610c-37f2-b928-6a833dcf1e5f@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 11:44:24AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> I'm getting this error sometimes in the check-dco job:
> 
> Using docker image
> sha256:96fcfc3ceb2d65689c2918c1c501c45b2bd815d82e7fb3381048c9f252e7b046
> for registry.gitlab.com/philmd/qemu2/qemu/centos8:latest with digest
> registry.gitlab.com/philmd/qemu2/qemu/centos8@sha256:798eb3e5aa50eb04d60cdf1bfd08bcff5b443e933dcfd902ebda01927e2f6eb0
> ...
> $ .gitlab-ci.d/check-dco.py
> Traceback (most recent call last):
>   File ".gitlab-ci.d/check-dco.py", line 25, in <module>
>     stderr=subprocess.DEVNULL)
>   File "/usr/lib64/python3.6/subprocess.py", line 311, in check_call
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['git', 'fetch', 'check-dco',
> 'master']' returned non-zero exit status 128.
> 
> https://gitlab.com/philmd/qemu2/-/jobs/1108482890

I expect a transient error in gitlab's servers. Even regular CI
jobs sometimes fail when pulling from git.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


