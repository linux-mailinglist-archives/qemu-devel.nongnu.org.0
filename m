Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF226D981
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 12:49:33 +0200 (CEST)
Received: from localhost ([::1]:42942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIrTo-0000YZ-7C
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 06:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kIrSo-0008Lq-Ig
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 06:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kIrSm-00089Y-Sf
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 06:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600339708;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5/9GiFaFnqJVToHHc2z78rBF/1bg5vjUsT8fxhzRN0=;
 b=X2MiZR8YegVK5fes2CpaSq5ksNY9njY93o+S+J17qD1JUzx4b79hy4maN4u0x66Ew+l4VV
 zpUb5XQAfh5VwP6s2dIgVSt8VfYQ6x2Izp3kcRJJO7aLjt5d491/1rfcgTDKSNFJbN5Ode
 +ub8MFyBpyy5EGYYcBrkBvtn41cLRmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-G44Btnp1MoGHJDo50tR_GQ-1; Thu, 17 Sep 2020 06:48:22 -0400
X-MC-Unique: G44Btnp1MoGHJDo50tR_GQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B8F66408F
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 10:48:21 +0000 (UTC)
Received: from redhat.com (ovpn-114-29.ams2.redhat.com [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D57E19D6C;
 Thu, 17 Sep 2020 10:48:20 +0000 (UTC)
Date: Thu, 17 Sep 2020 11:48:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docker.py: always use --rm
Message-ID: <20200917104817.GE1568038@redhat.com>
References: <20200917104441.31738-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200917104441.31738-1-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 17, 2020 at 12:44:41PM +0200, Paolo Bonzini wrote:
> Avoid that containers pile up.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/docker/Makefile.include | 1 -
>  tests/docker/docker.py        | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 3daabaa2fd..75704268ff 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -243,7 +243,6 @@ docker-run: docker-qemu-src
>  		$(DOCKER_SCRIPT) run 					\
>  			$(if $(NOUSER),,--run-as-current-user) 		\
>  			--security-opt seccomp=unconfined		\
> -			$(if $V,,--rm) 					\

I guess the intention was that if someone is running verbose they might
want to get back into the container after a failure. This is certainly
a pain for CI though, because running verbose is desirable but keeping
around dead containers is not.

The DEBUG=1 option is likely a better general purpose debugging approach
than relying on the dead container being left behind, so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


>  			$(if $(DEBUG),-ti,)				\
>  			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=$(NETWORK)),--net=none) \
>  			-e TARGET_LIST=$(subst $(SPACE),$(COMMA),$(TARGET_LIST))	\
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index 356d7618f1..36b7868406 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -377,7 +377,7 @@ class Docker(object):
>              if self._command[0] == "podman":
>                  cmd.insert(0, '--userns=keep-id')
>  
> -        ret = self._do_check(["run", "--label",
> +        ret = self._do_check(["run", "--rm", "--label",
>                               "com.qemu.instance.uuid=" + label] + cmd,
>                               quiet=quiet)
>          if not keep:
> @@ -616,7 +616,7 @@ class CcCommand(SubCommand):
>          if argv and argv[0] == "--":
>              argv = argv[1:]
>          cwd = os.getcwd()
> -        cmd = ["--rm", "-w", cwd,
> +        cmd = ["-w", cwd,
>                 "-v", "%s:%s:rw" % (cwd, cwd)]
>          if args.paths:
>              for p in args.paths:
> -- 
> 2.26.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


