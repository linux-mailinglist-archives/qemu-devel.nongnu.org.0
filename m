Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDDE44EC49
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 18:56:03 +0100 (CET)
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlamQ-0002nF-Ep
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 12:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlakX-0001uo-OS
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 12:54:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlakU-0003XZ-EJ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 12:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636739635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vFdjrq0fXhtiAoX6780dYCZ8d+uF0hswdrZyaVOiEs=;
 b=TLoPCfQJuGDOtU6cVk/6gFskwNPFsamSEz9mF/hvf58Iu+BRJ0n+qqMaLM+twePyP66NwT
 9EIz1GBRT+4qrIcYKnF9qjtCorhrrB7YaH1IFCYbD7QqbCrqaK7lrOlFCFr3ygzYGYwMXh
 IXoaKt4oLpNZrL/Wn0PPzQQapQUtfvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-Ke042Tt2Mn2PkMoegWb6tQ-1; Fri, 12 Nov 2021 12:53:48 -0500
X-MC-Unique: Ke042Tt2Mn2PkMoegWb6tQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA3DC747C;
 Fri, 12 Nov 2021 17:53:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64BD55F4EA;
 Fri, 12 Nov 2021 17:53:45 +0000 (UTC)
Date: Fri, 12 Nov 2021 17:53:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: brak@gameservers.com
Subject: Re: Guests wont start with 15 pcie-root-port devices
Message-ID: <YY6qJt0lXEc2SAtc@redhat.com>
References: <abff2095-9ac8-c115-bc7f-6a19b9defe51@gameservers.com>
MIME-Version: 1.0
In-Reply-To: <abff2095-9ac8-c115-bc7f-6a19b9defe51@gameservers.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 12:35:07PM -0500, Brian Rak wrote:
> In 6.1, a guest with 15 empty pcie-root-port devices will not boot properly
> - it just hangs on "Guest has not initialized the display (yet).".  As soon
> as I remove the last pcie-root-port, the guest begins starting up normally. 

Yes, QEMU 6.1 has a regression

  https://gitlab.com/qemu-project/qemu/-/issues/641 


> commit e2a6290aab578b2170c1f5909fa556385dc0d820
> Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Date:   Mon Aug 2 12:00:57 2021 +0300
> 
>     hw/pcie-root-port: Fix hotplug for PCI devices requiring IO
> 
> Although I can't say I really understand why that commit triggered it.

It caused the firmware to always allocate I/O space for every port
and there's limited total I/O space, so it runs out at 15 devices.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


