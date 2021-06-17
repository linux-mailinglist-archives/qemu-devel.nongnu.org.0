Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF003AAB28
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 07:40:36 +0200 (CEST)
Received: from localhost ([::1]:54006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltklX-0004hv-6J
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 01:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltkjE-00040f-Q8
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltkjC-0002oY-3V
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623908288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1hae8vB/MHA1B3VFPw/n5jJXyHK2ThG/RvaTvTFlx8=;
 b=FpZfQx9U1eu/A0NW2j4Ty79tJry1Fg0iDEyVeNSFZT0wqHIUzqrnrfo1whjm+bt08sZ7vS
 PfytqDZU1Ma5J9WbSIKY7I8nnSYgGUiFfoFavQQXhTnMu3hGS6mmwh/2VBxoE+jnGXyY4g
 8RvqFdW9fPql87JY7HYjVa2oZj1LmZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-fxFkRhOeMVu1hvYy-zWUnA-1; Thu, 17 Jun 2021 01:38:07 -0400
X-MC-Unique: fxFkRhOeMVu1hvYy-zWUnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9205DDF8A3;
 Thu, 17 Jun 2021 05:38:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DA596090F;
 Thu, 17 Jun 2021 05:38:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D21F18000B2; Thu, 17 Jun 2021 07:37:59 +0200 (CEST)
Date: Thu, 17 Jun 2021 07:37:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Message-ID: <20210617053759.uibvdpu2wtq3fqwv@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <5953598.eXybCX72BP@pizza>
 <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
 <2963309.4TrVdrBa0x@pizza>
 <20210616092815.rjznyjnvgrrfojq6@sirius.home.kraxel.org>
 <bdf9b356-87ee-0749-c977-f48989fa8e26@suse.de>
MIME-Version: 1.0
In-Reply-To: <bdf9b356-87ee-0749-c977-f48989fa8e26@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?B?Sm9zw6k=?= Ricardo Ziviani <jose.ziviani@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >> However, please correct me if I'm wrong, I understand that an accelerator as a 
> >> module will add an overhead that some user won't be willing to pay. So, give 
> >> them the option to have built-in accelerators seems a good idea.
> > 
> > Modules add some overhead, yes, and there are surely use-cases where you
> 
> Where do we expect the overhead to be, and of which nature?

The dynamic linking needed then when loading the module adds a bit of
overhead (compared to static linked code).  Increases qemu start time
a bit.

On the other hand the start overhead can be reduced by modules,
specifically for the case that a module depends on shared libraries and
is *not* needed.  With for example gtk being modular the gtk shared
libraries (plus indirect dependencies like pango, cairo etc) are only
loaded when you actually use gtk, whereas a non-modular build would load
them no matter what.

The code reorganization needed for modularization can add some overhead
too, when using function pointers instead of direct calls for example
(see QemuSpiceOps).  That overhead doesn't go away when you do a
non-modular build though ...

take care,
  Gerd


