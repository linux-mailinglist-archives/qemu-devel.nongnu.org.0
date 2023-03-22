Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371666C4A4F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexTB-0000To-34; Wed, 22 Mar 2023 08:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pexT8-0000Sj-TE
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pexT6-0002vk-V4
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679487687;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGtpZYciJZzY0vpbh1r9G/bZavBx6NjIAOuE/KfE/00=;
 b=PyYZNQFgWJeWtjroiYP4OTwrY3EEtg7YwY9WGsDDmkU1C0Re52LR+Q50g2zOdcr0kpHQ30
 sh9cHL3ZmjvpyW5VF3zhysrFZOiuLC+w6bsZQbF23NVdWC4UFOaIkW82Qp1udv23nTm4Pw
 msBi8pMS7PKMUtZ1CkHzZaX/jpi25xI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-2SeHKQTxObOp2FxeESeHqA-1; Wed, 22 Mar 2023 08:21:24 -0400
X-MC-Unique: 2SeHKQTxObOp2FxeESeHqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8AC4281294F;
 Wed, 22 Mar 2023 12:21:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B301B140EBF4;
 Wed, 22 Mar 2023 12:21:21 +0000 (UTC)
Date: Wed, 22 Mar 2023 12:21:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>,
 Jintao Yin <nicememory@gmail.com>, qemu-trivial@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] cirrus.yml: Cover SPICE in the MSYS2 job
Message-ID: <ZBryv0D3TVum0gVg@redhat.com>
References: <20230322110521.59949-1-philmd@linaro.org>
 <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
 <133c2b45-452c-c9e7-7fc4-c07d31d94298@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <133c2b45-452c-c9e7-7fc4-c07d31d94298@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 01:13:21PM +0100, Philippe Mathieu-Daudé wrote:
> On 22/3/23 12:30, Thomas Huth wrote:
> > On 22/03/2023 12.05, Philippe Mathieu-Daudé wrote:
> > > Include the mingw-w64-x86_64-spice package so SPICE is covered:
> > > 
> > >    C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc
> > > (Rev10, Built by MSYS2 project) 12.2.0")
> > >    ...
> > >    Run-time dependency spice-protocol found: YES 0.14.4
> > >    Run-time dependency spice-server found: YES 0.15.1
> > > 
> > > In particular this would have helped catching the build issue
> > > reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:
> > 
> > Well, hardly anybody is looking at the output on cirrus-ci.com, so this
> > patch here likely would not have prevented the merging of this bug...
> > for that, you rather have to add it to .gitlab-ci.d/windows.yml instead.
> 
> It seems we have 2 jobs doing the same testing (even same version,
> msys2-base-x86_64-20220603.sfx.exe). Does it make sense to maintain
> both? At least with GitLab we notice a failure.

IMHO having the .cirrus.yml file can probably be considered actively
harmful.  Cirrus CI has a concurrency limit of 2 jobs, and when we
trigger Cirrus jobs from GitLab CII using cirrus-run, we need them
to completely in < 1 hour.

If we have extra jobs being triggered by the .cirrus.yml file when
gitlab.com repo is mirrored to github.com, then we're liable to
cause timeouts of the jobs we do care about from cirrus-run.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


