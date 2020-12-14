Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B597A2D97B3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:54:52 +0100 (CET)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1komRH-0004A5-9p
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1komPu-0003aR-0H
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:53:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1komPo-0004Z5-OI
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607946798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=du9WPFZV3tQd6L758nhlyCx3hhFt0LRyPAVuZ/pHNvo=;
 b=GcczlfR2fqh0FN3t3xLG0sIiM7I51FGF+dWP7HYfijGI7eqrvx/xAk2Nx4B2lTd6BBCSJC
 r/NwCRP8kscILYa/3Ed0hiFujRn0Hhh6rmDxUrobv9Au9+9ZsO0pswU2BqDlFHbOP3dNiz
 8SSnW9sf40HXx17VK0B+2oZ+x2Umdig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-EzHUuaSOPZqkCeS2jPYZnw-1; Mon, 14 Dec 2020 06:53:17 -0500
X-MC-Unique: EzHUuaSOPZqkCeS2jPYZnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 049C4800D55
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 11:53:16 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 135875D9DC;
 Mon, 14 Dec 2020 11:53:14 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:53:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 14/15] null-machine: do not create a default memdev
Message-ID: <20201214125313.0e067fdf@redhat.com>
In-Reply-To: <4e36d013-d379-05e3-7803-eb4df9fbb0d3@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-15-pbonzini@redhat.com>
 <20201207174359.03b099ce@redhat.com>
 <4e36d013-d379-05e3-7803-eb4df9fbb0d3@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Dec 2020 00:24:25 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 07/12/20 17:43, Igor Mammedov wrote:
> >>       mc->default_ram_size = 0;
> >> -    mc->default_ram_id = "ram";
> >> +    mc->default_ram_id = NULL;  
> > probably that will break:
> > 
> >   QEMU -m X -M none  
> 
> No, it works.  "-m" is simply ignored, because the default memdev is 
> created here:
you mean it doesn't explode.
By default with current code memdev should not be created, 
but it is created if users asks for it with -m.
This patch breaks the later.

I'm not sure that any RAM on null machine is of any use at all
but the if we decide to get rid of it completely, then we need
to clean up
    /* RAM at address zero */                                                    
    if (mch->ram) {                                                              
        memory_region_add_subregion(get_system_memory(), 0, mch->ram);           
    }   
and commit title/message should match what patch does and why.


>      if (machine_class->default_ram_id && current_machine->ram_size &&
>          numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
>          create_default_memdev(current_machine, mem_path);
>      }
> 
> and is thus skipped for -M none.
> 
> Paolo
> 
> > 
> > maybe there is  a bug over there but
> >      "mc->default_ram_size = 0"
> > above, should result in
> >      current_machine->ram_size == 0
> > in case user hasn't provided "-m"
> > and hence memdev shouldn't be created
> >   
> 


