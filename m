Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350A294CED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 14:41:26 +0200 (CEST)
Received: from localhost ([::1]:57150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVDQj-0003n8-6E
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 08:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kVDOt-000284-DW
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 08:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kVDOr-00061S-50
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 08:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603283968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WIJlE9cT5+K/qZ9crtbHJBqYLO5AJ3/vFzX/iieyvx0=;
 b=iKBw/SuJy7A8OcZstgn6A3SOl3jo6cxVR3/q9sjmNdJ3yPrgOyWpKU0uhgQYJR9auGVKHx
 7n93c0DY0SCL20K+1FM46Mzcl8uM6m/I3TUCf56hL+8q2KTAznJha4CCnQxHrVq4t5wu+u
 VgK8Mag0zvL828fO4hAHOzpLrIGqEDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-mErIyp93Ov-v_vEjzSx_zQ-1; Wed, 21 Oct 2020 08:39:25 -0400
X-MC-Unique: mErIyp93Ov-v_vEjzSx_zQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8832D18C5200;
 Wed, 21 Oct 2020 12:39:24 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 141215D9EF;
 Wed, 21 Oct 2020 12:39:20 +0000 (UTC)
Date: Wed, 21 Oct 2020 08:39:20 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] pc: Implement -no-hpet as sugar for -machine hpet=off
Message-ID: <20201021123920.GS5733@habkost.net>
References: <20201020220150.1326086-1-ehabkost@redhat.com>
 <50e184db-bf46-48c1-b3a2-f4151d00cdf6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <50e184db-bf46-48c1-b3a2-f4151d00cdf6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 22:12:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 21, 2020 at 09:32:59AM +0200, Paolo Bonzini wrote:
> On 21/10/20 00:01, Eduardo Habkost wrote:
> > +    pcms->hpet_enabled = true;
> 
> Should this be within #ifdef CONFIG_HPET?  [...]

Oops, I wasn't aware of CONFIG_HPET, and hadn't noticed that
pc_basic_device_init() uses qdev_try_new().  I agree that not
failing if hpet=on is explicitly set and CONFIG_HPET=n is wrong.

Supporting a "require hpet to be on" use case would be a new
feature and out of scope of this work, though.  I will just
rename the property to "allow-hpet".  We can still implement a
OnOfAuto "hpet" property in the future, if we think it's useful.

>                                     [...]  Otherwise
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks!

-- 
Eduardo


