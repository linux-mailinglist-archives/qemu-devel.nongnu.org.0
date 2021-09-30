Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B458541DCF7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:07:25 +0200 (CEST)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxee-00035Z-Nr
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVxde-0001sV-0x
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVxdZ-0007OY-IQ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633014374;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hU/gTUjO+mgEv5qfnpk1X/AAH34RwBWB7RbwfMZ/FC8=;
 b=bkhqhI5rAWoh3gCkouqbALoCgPCwLX6u/4krVkkmAi0wsvlcPt5zJtJQnul3+F3Ja8em/U
 yhlmqJBBK4Ve11sLVWdgnM4vsqeavepc0l64wGShESNoDeNhu7suapPGoocSad/YHpxAtP
 eoMR0UYkKL/iavy75hoZN98FnBHVBcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-o8fOxrIUPeKfSsD4IQC2pg-1; Thu, 30 Sep 2021 11:06:07 -0400
X-MC-Unique: o8fOxrIUPeKfSsD4IQC2pg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DCCF107E1E4;
 Thu, 30 Sep 2021 15:06:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63DFF60854;
 Thu, 30 Sep 2021 15:05:55 +0000 (UTC)
Date: Thu, 30 Sep 2021 16:05:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Remy Noel <remy.noel@shadow.tech>
Subject: Re: Strange qemu6 regression cauing disabled usb controller.
Message-ID: <YVXSUExueN0MpEDG@redhat.com>
References: <20210930134844.f4kh72vpeknr2vmk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210930134844.f4kh72vpeknr2vmk@gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 03:48:44PM +0200, Remy Noel wrote:
> Hello,
> 
> I'm encountering a nagging issue with usbredir and a windows guest, but although I did pinpoint the commit that caused the issue, I have a hard time understanding it.
> 
> The issue occurs when a two usbredir devices are added to a guest windows vm. When the second device is added, the UHCI usb controller is disabled by windows with an error code 43 (can be seen with in the usb adapters section of the device manager).
> 
> The commit causing the issue (everything works well when reverting it) is 7bed89958bfbf40df9ca681cefbdca63abdde39d : device_core: use drain_call_rcu in in qmp_device_add.

Co-incidentally we've just had another bug report filed today that
suggests 7bed89958bfbf40df9ca681cefbdca63abdde39d as a buggy commit
causing deadlock in QEMU

  https://gitlab.com/qemu-project/qemu/-/issues/650

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


