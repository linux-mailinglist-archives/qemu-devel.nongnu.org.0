Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3472E9F7A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 22:22:26 +0100 (CET)
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwXJ3-0004qf-2D
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 16:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwXHl-0004Kf-D0
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 16:21:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwXHi-0008IE-2U
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 16:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609795260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFbOmj7L4eYxV1Pa9YWktYBfovlirllbaINQouFm1Hs=;
 b=SYjQZ8v/MaBzHEiVb550oioLdie1P37Ia2y+WZN0St1a3H9lVcTIDqR9CUGQnNi2/Mrl9I
 WbEVMJu7EK2h1d07cZvpvNuLwR2lr25c1yaQ8MhEBSch4FlHWOCZ8T85b6uMxjcIpHrk7o
 J39hJpkSJq562pJWyvP06dZCcOG0bMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-P6M7Dgi0MoyFFJyCq6On1g-1; Mon, 04 Jan 2021 16:20:59 -0500
X-MC-Unique: P6M7Dgi0MoyFFJyCq6On1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A05B8BBEE0;
 Mon,  4 Jan 2021 21:20:57 +0000 (UTC)
Received: from localhost (ovpn-116-153.rdu2.redhat.com [10.10.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAD645D9C6;
 Mon,  4 Jan 2021 21:20:50 +0000 (UTC)
Date: Mon, 4 Jan 2021 16:20:49 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 2/3] hostmem-file: add readonly=on|off option
Message-ID: <20210104212049.GJ18467@habkost.net>
References: <20200916095150.755714-1-stefanha@redhat.com>
 <20200916095150.755714-3-stefanha@redhat.com>
 <20201214121015.592aaef0@redhat.com>
 <20210104154223.GC344891@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210104154223.GC344891@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 qemu-devel@nongnu.org, eric.g.ernst@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 04, 2021 at 03:42:23PM +0000, Stefan Hajnoczi wrote:
> On Mon, Dec 14, 2020 at 12:10:15PM +0100, Igor Mammedov wrote:
> > On Wed, 16 Sep 2020 10:51:49 +0100
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > 
> > > Let -object memory-backend-file work on read-only files when the
> > > readonly=on option is given. This can be used to share the contents of a
> > > file between multiple guests while preventing them from consuming
> > > Copy-on-Write memory if guests dirty the pages, for example.
> > > 
> > > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > cosmetic/style nits only
> > 
> > s/Object *o/Object *obj/
> > 
> > for consistency with the rest of the code in file.
> 
> Will fix.
> 
> > > @@ -153,6 +154,26 @@ static void file_memory_backend_set_pmem(Object *o, bool value, Error **errp)
> > >      fb->is_pmem = value;
> > >  }
> > >  
> > > +static bool file_memory_backend_get_readonly(Object *o, Error **errp)
> > > +{
> > > +    return MEMORY_BACKEND_FILE(o)->readonly;
> > 
> > I thought using macro this way not acceptable and one should use
> > 
> > HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(o);
> > 
> > return fb->readonly;
> 
> I'm not sure where this is forbidden or why? I've updated the patch as
> suggested anyway.

I have a vague memory of seeing this documented somewhere, but I
can't find it anywhere in the QOM documentation or git log.

I don't think we need to make this a rule, though.

-- 
Eduardo


