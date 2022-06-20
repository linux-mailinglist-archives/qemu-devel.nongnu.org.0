Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C30155124C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:15:34 +0200 (CEST)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3CZJ-0007ch-5w
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3CVt-0004iz-5m
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:12:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3CVl-0000Cl-W9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655712712;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzTx4k2cjKviZoxWSYs/FXxsGAJ3QDvblw2EoeHgRvM=;
 b=PcO8MuRqfzyvjDi4FTgCyweQ8D2oy7cQkgVD4aZ+Q186vNIEBRkxBqq4gCjRA0fyqcrXVN
 5z80ElII2vbxPaEpOiv3x9qT1VeUnDFXxmJO28vcWTkfnTthGGef8a1GMTdisfe73u3NlK
 lsIIq7WxWaSfNJCHqxnfnm7C7QcpKNE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-vV9qkIhSO96HGv3IjDICuA-1; Mon, 20 Jun 2022 04:11:47 -0400
X-MC-Unique: vV9qkIhSO96HGv3IjDICuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68EBF29ABA3C;
 Mon, 20 Jun 2022 08:11:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73F952026985;
 Mon, 20 Jun 2022 08:11:45 +0000 (UTC)
Date: Mon, 20 Jun 2022 09:11:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Message-ID: <YrArvxwzVWQK4Hu8@redhat.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com>
 <Yqw1wf+QjaBQ3I6M@redhat.com>
 <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Mon, Jun 20, 2022 at 05:59:06AM +0000, Zhang, Chen wrote:
> 
> 
> > -----Original Message-----
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > Sent: Friday, June 17, 2022 4:05 PM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> > devel@nongnu.org>; Paolo Bonzini <pbonzini@redhat.com>; Eduardo
> > Habkost <eduardo@habkost.net>; Eric Blake <eblake@redhat.com>; Markus
> > Armbruster <armbru@redhat.com>; Peter Maydell
> > <peter.maydell@linaro.org>; Thomas Huth <thuth@redhat.com>; Laurent
> > Vivier <lvivier@redhat.com>; Yuri Benditovich
> > <yuri.benditovich@daynix.com>; Andrew Melnychenko
> > <andrew@daynix.com>
> > Subject: Re: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
> > submodule for QEMU
> > 
> > On Fri, Jun 17, 2022 at 03:36:19PM +0800, Zhang Chen wrote:
> > > Make iovisor/ubpf project be a git submodule for QEMU.
> > > It will auto clone ubpf project when configure QEMU.
> > 
> > I don't think we need todo this. As it is brand new functionality we don't have
> > any back compat issues. We should just expect the distros to ship ubpf if
> > they want their QEMU builds to take advantage of it.
> > 
> 
> Yes, agree. It's the best way to use the uBPF project. 
> But current status is distros(ubuntu, RHEL...) does not ship
> the iovisor/ubpf like the iovisor/bcc. So I have to do it.
> Or do you have any better suggestions?

If distros want to support the functionality, they can add packages for
it IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


