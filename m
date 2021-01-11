Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30DE2F1AD9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:24:24 +0100 (CET)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzzT-0007Yj-Ss
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kyzyE-0006kJ-Ru
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:23:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kyzyB-0006Fe-Vx
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610382183;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7B6AjH8s9sN2jWgOEGhT6HqmB0CEdb14Ra6HMav1854=;
 b=WEGp0OpujHOjV0KJzDpTnIW/JuSzDEdTU4KJHO/f5mI7y+JJNihwTez7gzjna+6qc2LeqW
 bv8zSM4ViQd0mCDhdFnIOkVappzlHpJqu5CnJZ/jp2hx7PiDWhEDq8t0WWrmD6fsFFB+KW
 CHlO+qveI1a6Vcueu49Di4LHr7/nDTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-ZkxdWb2rP6q-cq_BsHVmOg-1; Mon, 11 Jan 2021 11:22:58 -0500
X-MC-Unique: ZkxdWb2rP6q-cq_BsHVmOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AEB6800050;
 Mon, 11 Jan 2021 16:22:57 +0000 (UTC)
Received: from redhat.com (ovpn-115-108.ams2.redhat.com [10.36.115.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47FE86E510;
 Mon, 11 Jan 2021 16:22:55 +0000 (UTC)
Date: Mon, 11 Jan 2021 16:22:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?5rGf6Iqz5p2w?= <18401698361@126.com>
Subject: Re: Ask for suggestions for CVE-2019-12928
Message-ID: <20210111162253.GJ1172772@redhat.com>
References: <74ca794a.6063.176f21e2fca.Coremail.18401698361@126.com>
MIME-Version: 1.0
In-Reply-To: <74ca794a.6063.176f21e2fca.Coremail.18401698361@126.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, pjp@fedoraproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 11:43:53PM +0800, 江芳杰 wrote:
> Hi:
>     Sorry to bother you~
>     I have read the discussions about CVE--2019-12928 ( https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01153.html).
> But, for the scenario of PC users, which is no requirement of network access to QMP, there are some mitigating proposes.
> 1. Modify the compilation options to disable QMP.
> 2. Modify command line parsing function to discard the QMP parameters with network configurations.
> 3. PC manager or other manage software make sure only the trusted user can use QMP.
> 4. Other ideas?

No code changes are required at all. The described scenario was simply a
user mis-configuration.

In rare case there can be valid reasons to use QMP on a public IP address,
but anyone doing so must ensure their usage is secure.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


