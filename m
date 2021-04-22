Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D258367E78
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:17:58 +0200 (CEST)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZWPF-0004Q1-4v
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZWN0-00032O-JE
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 06:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZWMx-00039G-87
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 06:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619086534;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD2Vx2/uz+3g7nz0MpaN9DRRw/XZwG/tkyCwW3QkdhI=;
 b=awtsa13ukuGyVcxrG8IjgP0j1dIYIrUMTy3Y22A2eequkGR24sd+mvGs2Mu482Cb9wVtBi
 nkUTgYJfJtxaA+9xGLC/T7KLaUO3/t1zSLbUDP+ZkwJVRAaJ7D0mqU3QMrLSnSvqFThzQj
 /YAFPZssPkcfc4RUn/SPIOitRlyjN6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-DQnj7Ac0MEWKWbLs2ozLlQ-1; Thu, 22 Apr 2021 06:15:26 -0400
X-MC-Unique: DQnj7Ac0MEWKWbLs2ozLlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B726018982B8;
 Thu, 22 Apr 2021 10:15:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2F9D5C1B4;
 Thu, 22 Apr 2021 10:15:22 +0000 (UTC)
Date: Thu, 22 Apr 2021 11:15:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
Message-ID: <YIFMt+xg+xH+M4rd@redhat.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:47:30AM +0200, Thomas Huth wrote:
> On 22/04/2021 06.18, Philippe Mathieu-Daudé wrote:
> > Hi Thomas, Daniel, Stefano,
> > 
> > Regarding the following warning (GCC 11 on Fedora 34):
> > 
> > In file included from pc-bios/s390-ccw/main.c:11:
> > 
> > In function ‘memset’,
> > 
> >      inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
> > 
> >      inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
> > 
> > pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of
> > size 0 [-Wstringop-overflow=]
> > 
> >     28 |         p[i] = c;
> > 
> >        |         ~~~~~^~~
> > 
> > Daniel were right on IRC:
> > 
> > danpb: it is from a call  memset((char *)S390EP, 0, 6)     where  S390EP
> > is just a constant address 0x10008
> > danpb: the compiler doesn't now how big that is, so it seems to assume
> > it is zero length
> > 
> > This is a known GCC issue:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
> > "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
> > pointer from integer literal"
> 
>  Hi Philippe,
> 
> thanks for following up with the gcc bugzilla!
> 
> ... so the problem is that GCC thinks we're in fact dereferencing a NULL
> pointer at offset 0x10008 here? Wow, that's ... crazy.
> 
> Not sure what to do now - wait for the bug to get resolved? Compile the
> s390-ccw bios with -Wno-stringop-overread ? Add "volatiles" here and there
> to hope that these silence the compiler warnings? ... I tend to wait for the
> bug ticket to see whether the GCC folks change the behavior of the compiler
> again, but I'm open for other suggestions.

Assuming it is just this one place in the code ,then we should just
use "pragma" to temporarily disable/re-enable that single warning flag
either side of the problem.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


