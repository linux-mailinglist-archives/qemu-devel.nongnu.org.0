Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087236EF51
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 20:06:34 +0200 (CEST)
Received: from localhost ([::1]:59136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcB3Z-0007y1-IC
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 14:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lcB1K-0006yu-7u
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 14:04:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lcB1G-00039U-8R
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 14:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619719449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIDx2Icj+w74gZe6K6R+sHS9lQa7bNL0j49eBNRowJg=;
 b=hBcu2KYr158hS+pWvErT12xcDn1C2sE4L0OcwQC07KhALP1jGR3MJTiKhU8G5EzHdesbWo
 pgrkcBSYZe85qBOXYnDnQ4bAzyay779F2Io/y/9ZSWDb6oRhA1cdKGdxUINzKcM4SdXJHe
 gSgc+Ak7RA5rPKv8p6FnnjuCH2r+Dhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-ec6r92IwOY6ETpJjydtmww-1; Thu, 29 Apr 2021 14:04:07 -0400
X-MC-Unique: ec6r92IwOY6ETpJjydtmww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 742BC107ACE6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:04:06 +0000 (UTC)
Received: from localhost (ovpn-115-66.phx2.redhat.com [10.3.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49AF85DF26;
 Thu, 29 Apr 2021 18:04:03 +0000 (UTC)
Date: Thu, 29 Apr 2021 12:32:34 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <20210429163234.4luvlypmn4gb63v4@habkost.net>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Jiri, +Daniel, +Igor

On Thu, Apr 29, 2021 at 11:59:41AM +0200, Markus Armbruster wrote:
[...]
> I'm not sure there's anything to remove here, but anyway, Peter Maydell:
> 

This one is mine.

There's no code to remove, but the intention is to eventually
change default_cpu_version to CPU_VERSION_LATEST on newer machine
types.

> 
>     Runnability guarantee of CPU models (since 4.1.0)
>     '''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     Previous versions of QEMU never changed existing CPU models in
>     ways that introduced additional host software or hardware
>     requirements to the VM.  This allowed management software to
>     safely change the machine type of an existing VM without
>     introducing new requirements ("runnability guarantee").  This
>     prevented CPU models from being updated to include CPU
>     vulnerability mitigations, leaving guests vulnerable in the
>     default configuration.
> 
>     The CPU model runnability guarantee won't apply anymore to
>     existing CPU models.  Management software that needs runnability
>     guarantees must resolve the CPU model aliases using the
>     ``alias-of`` field returned by the ``query-cpu-definitions`` QMP
>     command.
> 
>     While those guarantees are kept, the return value of
>     ``query-cpu-definitions`` will have existing CPU model aliases
>     point to a version that doesn't break runnability guarantees
>     (specifically, version 1 of those CPU models).  In future QEMU
>     versions, aliases will point to newer CPU model versions
>     depending on the machine type, so management software must
>     resolve CPU model aliases before starting a virtual machine.

libvirt had no time to adapt to this yet.  As far as I
understand, they need the following series to be merged first so
they can more easily resolve the unversioned CPU model name
aliases:

https://lore.kernel.org/qemu-devel/20201013230457.150630-1-ehabkost@redhat.com

I need to rebase that series and resubmit.

-- 
Eduardo


