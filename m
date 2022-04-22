Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC050B2FD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:34:32 +0200 (CEST)
Received: from localhost ([::1]:45350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhokJ-0000dV-4I
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhofT-0007ka-Bp
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:29:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhofR-0004ZE-FF
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650616168;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DVtAbCbNWwe2b/mUSxwKgU2MsnSA+Kq79RDYPO+ebWQ=;
 b=ejJJmrHh6WEHi/lrjlBV4TuSAefAolTmAhQGPqN6VeQ0fdb73r/G6lHBZPj8B6Sx1n9HtU
 EK4/dbNBlExy2W0tmgG+LqUvimhtyraqZd6vEdUjhzYMLBFFShV5qcdayN4ouFlOq15obx
 i1VWj61ONwmxh4xSDNoUb5gGtzwmls8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-0vdWdOKuPdmIm9u2jnv7Fg-1; Fri, 22 Apr 2022 04:29:25 -0400
X-MC-Unique: 0vdWdOKuPdmIm9u2jnv7Fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BADC0281AF2C;
 Fri, 22 Apr 2022 08:29:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6112C35994;
 Fri, 22 Apr 2022 08:29:23 +0000 (UTC)
Date: Fri, 22 Apr 2022 09:29:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Ren <renzhengeek@gmail.com>
Subject: Re: Is it possible to support hotplug device to PXB bridge?
Message-ID: <YmJnYCMxG1S9pt4U@redhat.com>
References: <CAKM4Aewqpfy3AGFi3Y+roA4jDigYOEbW6oBb3XpsVyxFCYne7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKM4Aewqpfy3AGFi3Y+roA4jDigYOEbW6oBb3XpsVyxFCYne7g@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: marcel@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 03:17:11PM +0800, Eric Ren wrote:
> Hi Marcel and all,
> 
> It fails when I want to hotplug device to PXB bus. Then, I find this
> commit that explicitely declares the fact that PXB bus does not support
> hotplug device onto it.
> 
> 7b346c742cd9 ("hw/pxb: declare pxb devices as not hot-pluggable")
> 
> Could you please help confirm the possibility to make PXB bus hotpluggable,
> and the main work to achieve it if possible?

Instead of trying to hotplug into the PXB, attach a 'pci-bridge' to the
PXB and then you can hotplug into the latter instead.

> Yes, pxb-pcie with Q35 do support hotplug, but we use i440 machine a long way,
> not  willing to change machine type to have it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


