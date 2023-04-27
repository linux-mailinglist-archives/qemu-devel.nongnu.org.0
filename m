Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A539E6F028C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:29:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwzj-0006rY-SO; Thu, 27 Apr 2023 04:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prwzi-0006rO-7v
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:28:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prwzf-0001Ve-Tj
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682584126;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dzcvyMVS1jRbgP+qOXWEnuyTQJq0YQ6cJy5hLpZ5xOg=;
 b=Rb20L7u5Z7VTpghTQFNwwbo5cY4AI0ZZemElk7Pn92i/iH0LNHz5RpAsxIAJsC1PTNDniD
 1+cl4Y2X3w1VEzkQ4qEd1o6L811xhrxrn9Ez9ynG3qL782SBWeU12SgeUqkim6fDk4SFaw
 OG9Srnb7om7BUABuWt0M/pganHGMuiY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-G_jeD10RPI6dvhYHgYfebg-1; Thu, 27 Apr 2023 04:28:43 -0400
X-MC-Unique: G_jeD10RPI6dvhYHgYfebg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB19E28237D7;
 Thu, 27 Apr 2023 08:28:42 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D4C540C6EC4;
 Thu, 27 Apr 2023 08:28:40 +0000 (UTC)
Date: Thu, 27 Apr 2023 09:28:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
Message-ID: <ZEoyNt0UtSYRt9Go@redhat.com>
References: <20230425133851.489283-1-thuth@redhat.com>
 <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 12:59:13PM +0200, Paolo Bonzini wrote:
> On 4/25/23 15:38, Thomas Huth wrote:
> > - CPU types have different suffixes between the -x86_64 and -i386
> >    variant (see TYPE_X86_CPU in cpu-qom.h) ... do we need to care
> >    about this in the new qemu-system-i386 symlink run mode?
> > 
> > - The code in target/i386/tcg/sysemu/smm_helper.c looks like it
> >    maybe needs a runtime switch, too ... or is it ok to leave this
> >    hard-coded to the x86_64 version?
> 
> Yes, it would have to switch based on the CPU's LM feature.
> 
> > Anyway, I'd like to get some feedback on this idea here... What
> > do you think of the idea of getting rid of the qemu-system-i386
> > binary this way in the future?
> 
> I wonder if we should take this a step further and rename qemu-system-x86_64
> to qemu-system-x86!  Distros can if they wish create symlinks to both
> qemu-system-i386 and qemu-system-x86_64.

I can't help feeling this just creates a new upgrade burden for distros
for no obvious win.

Things have gone quite recently, but if we introduce next-generation
QEMU system emulator binary which is 100% QMP based, I think that would
be the ideal time to change naming convention to -x86

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


