Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039234955AC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:54:58 +0100 (CET)
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAeSO-0002yT-B7
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:54:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAZYQ-0003Pf-ME
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:40:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAZYN-0007Zr-HG
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642693237;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQLFtZew9TllHfzTqYZQ8OIkKnxTXhmWhkI5AH1zZmE=;
 b=IVvgqBvRiiPlqkIlkBJJX/wRcr3TG/c7rqLJP3OG4QIppDwvQU17pu9EL48uR6RzFT6lb6
 9v9jCrWaKC6Xjd5RyNuWIWHD7FgfArvJy57BakepmuVV0i0omZrNKBf1xWla9cRgaq2L6c
 CTvNmpskyz0iqGD6ogxWw+xX7qnZlCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-eDz1RyqJNdGTkqLfickEtQ-1; Thu, 20 Jan 2022 10:40:28 -0500
X-MC-Unique: eDz1RyqJNdGTkqLfickEtQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B1E41018721;
 Thu, 20 Jan 2022 15:40:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB1287E64F;
 Thu, 20 Jan 2022 15:40:25 +0000 (UTC)
Date: Thu, 20 Jan 2022 15:40:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Message-ID: <YemCZ6UHLX4P4m08@redhat.com>
References: <20220119235720.371961-1-yang.zhong@intel.com>
 <YeknCiBuMEaD3XP2@redhat.com>
 <ec7654fd-5c2c-3d46-1151-6254c3c6951a@amsat.org>
MIME-Version: 1.0
In-Reply-To: <ec7654fd-5c2c-3d46-1151-6254c3c6951a@amsat.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 04:31:14PM +0100, Philippe Mathieu-Daudé wrote:
> On 20/1/22 10:10, Daniel P. Berrangé wrote:
> > On Wed, Jan 19, 2022 at 06:57:20PM -0500, Yang Zhong wrote:
> > > The SGX NUMA patches were merged into Qemu 7.0 release, we need
> > > clarify detailed version history information and also change
> > > some related comments, which make SGX related comments clearer.
> > > 
> > > The QMP command schema promises backwards compatibility as standard.
> > > We temporarily restore "@section-size", which can avoid incompatible
> > > API breakage. The "@section-size" will be deprecated in 7.2 version.
> > > 
> > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >   qapi/machine.json     |  4 ++--
> > >   qapi/misc-target.json | 17 ++++++++++++-----
> > >   hw/i386/sgx.c         | 11 +++++++++--
> > >   3 files changed, 23 insertions(+), 9 deletions(-)
> 
> > > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > > index 1022aa0184..a87358ea44 100644
> > > --- a/qapi/misc-target.json
> > > +++ b/qapi/misc-target.json
> > > @@ -344,9 +344,9 @@
> > >   #
> > >   # @node: the numa node
> > >   #
> > > -# @size: the size of epc section
> > > +# @size: the size of EPC section
> > >   #
> > > -# Since: 6.2
> > > +# Since: 7.0
> > >   ##
> > >   { 'struct': 'SGXEPCSection',
> > >     'data': { 'node': 'int',
> > > @@ -365,7 +365,9 @@
> > >   #
> > >   # @flc: true if FLC is supported
> > >   #
> > > -# @sections: The EPC sections info for guest
> > > +# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
> > 
> > I expected deprecation would start now (7.0, and it would be removed
> > in 7.2.
> > 
> > Also needs to be documented in docs/about/deprecated.rst
> 
> Isn't docs/about/deprecated.rst for user-facing changes *only*?
> 
> Machine-facing changes are already described in the QAPI schema.
> 
> Please correct me.

Just because something is machine-facing, doesn't mean it isn't
also user-facing, as users' write the machines that talk to QEMU.

deprecated.rst documents *everything* that changes in one of our
publically consumable interfaces, whether CLI args, QAPI schema,
HMP commands, or device impls or more. There's a whole section
there just for QMP command changes already.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


