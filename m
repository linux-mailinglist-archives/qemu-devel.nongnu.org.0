Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A64657E126
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:00:06 +0200 (CEST)
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErK8-0006ym-WB
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErHA-00042d-7l
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErH5-0004AI-A0
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658491013;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=71laO7WiXx+XjXA3zGlX9jm6HHOJ6fA7LrGvWsTA+iU=;
 b=QAeXw0M+SnZoHomtyQujFCAvGR/Xp8zj8tKeIOb79iBX35ztbAOUO9VQslhJ5DoSU7j0FM
 9uNuqLWdiuYAvJKONjADP2ZVmZeX2oFDfq83jaHZ1vE3dNG8cfW1ka4QmEfOzrwLPyWpPS
 N1d49HrHBIV2nFsjxoqPd0bzsZOPBK8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-Cb3hI_JbP6W1IxaNTJ3iAQ-1; Fri, 22 Jul 2022 07:56:50 -0400
X-MC-Unique: Cb3hI_JbP6W1IxaNTJ3iAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61A89380451B;
 Fri, 22 Jul 2022 11:56:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07E452026D64;
 Fri, 22 Jul 2022 11:56:48 +0000 (UTC)
Date: Fri, 22 Jul 2022 12:56:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH 1/3] tests: refresh to latest libvirt-ci module
Message-ID: <YtqQfsgOlzklwPt1@redhat.com>
References: <20220720165159.2036205-1-berrange@redhat.com>
 <20220720165159.2036205-2-berrange@redhat.com>
 <44dbc8f7-0216-c92d-95e4-98ae73216427@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44dbc8f7-0216-c92d-95e4-98ae73216427@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

On Thu, Jul 21, 2022 at 10:01:28AM +0200, Thomas Huth wrote:
> On 20/07/2022 18.51, Daniel P. Berrangé wrote:
> > Notable changes:
> > 
> >    - libvirt-ci source tree was re-arranged, so script we must
> >      run now lives in a bin/ sub-dir
> 
> Sentence hard to parse for non-native like me. Maybe better:
> "... so the script that we must run lives now in a bin/ sub-dir" ?
> 
> >    - opensuse 15.2 is replaced by opensuse 15.3
> > 
> >    - libslirp is temporarily dropped on opensuse as the
> >      libslirp-version.h is broken
> > 
> >       https://bugzilla.opensuse.org/show_bug.cgi?id=1201551
> > 
> >    - The incorrectly named python3-virtualenv module was
> >      changed to python3-venv
> 
> I can see that e.g.  py39-virtualenv is dropped from the freebsd.vars files
> now ... but no py39-venv package is installed instead? Is python3-venv
> installed there by other means (dependencies)?

There's no such thing as 'python3-venv' in almost all OS this
is a built-in standard part of the python dist. This is the
root of the original confusion. I saw 'python3-venv' on Debian
and assumed that it was the same as 'pthon3-virtualenv' on
all other platforms. In fact Debian has just done a wierd
thing by requiring 'python3-venv' whole everyone else gives
it by default with python.

> 
> >    - glibc-static was renamed to libc-static, to reflect
> >      fact that it isn't going to be glibc on all distros
> > 
> >    - The cmocka/json-c deps that were manually added to
> >      the centos dockerfile and now consistently added
> >      to all targets
> 
> s/and now/are now/ ?
> 
> Apart from the nits:
> Acked-by: Thomas Huth <thuth@redhat.com>
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


