Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F20330D8B1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:32:28 +0100 (CET)
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GOZ-0001AE-IO
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7GMp-0000LH-81
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:30:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7GMm-0003mF-Fm
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612351832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+AfIKF9tfsOv5cUXL3t3Ty7Sz8jGMPL+/TRlA25mIQQ=;
 b=idtxtJ9CGImz+RL6GsN0gu0VceXTHbHlvTU9XfUV+dFb8Os3fluZWC3d5I/Ws/Hj85Ygfz
 NENbRX3BSXswDmmRaVCbLr+wUmL+wV44h30h87pl+dKTN2UbkWYDj6H+MhiCS+1HfqxyKw
 J0gTv5sDxqsA6qa6/DZtIehGnkREJ1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-Nn5fdm4FMB2Hjnnnwf-8Ug-1; Wed, 03 Feb 2021 06:30:31 -0500
X-MC-Unique: Nn5fdm4FMB2Hjnnnwf-8Ug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA09809DD6;
 Wed,  3 Feb 2021 11:30:30 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C8A42CE39;
 Wed,  3 Feb 2021 11:30:17 +0000 (UTC)
Date: Wed, 3 Feb 2021 11:30:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 1/1] virtiofsd: Allow to build it without the tools
Message-ID: <20210203113014.GG2950@work-vm>
References: <20210201211456.1133364-1-wainersm@redhat.com>
 <20210201211456.1133364-2-wainersm@redhat.com>
 <OSBPR01MB45828271AC8D2F8F5FAA52D7E5B59@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <41d8b908-652f-a8c4-0bef-7420c65bd1d2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <41d8b908-652f-a8c4-0bef-7420c65bd1d2@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wainer dos Santos Moschetta (wainersm@redhat.com) wrote:
> 
> On 2/2/21 2:55 AM, misono.tomohiro@fujitsu.com wrote:
> > > Subject: [PATCH 1/1] virtiofsd: Allow to build it without the tools
> > > 
> > > This changed the Meson build script to allow virtiofsd be built even
> > > though the tools build is disabled, thus honoring the --enable-virtiofsd
> > > option.
> > > 
> > > Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > I misunderstood that virtiofsd builds somehow depends on tools build at that time.
> > Thanks for fixing. I did quick build test.
> Thanks for the review and test!
> 
> If not needed a v2 for this patch, please could the maintainer add to the
> commit message:
> 
>   Fixes: cece116c939d219070b250338439c2d16f94e3da (configure: add option for
> virtiofsd)

OK, I cna add that; I'll take it through virtiofs next time I need to do
a pull.

> - Wainer
> 
> > 
> > Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> > 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


