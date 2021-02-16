Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F331C93F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:03:23 +0100 (CET)
Received: from localhost ([::1]:47182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBy8Y-0005w2-M3
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lBy4w-00037x-81
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:59:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lBy4u-00033Y-LQ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613473175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abAYU2TJqowXi2NPvKgjnszpd1UKx4SoWXjwgDiRxyY=;
 b=RMsyBEqM97dB3W1BHz4zlIfyrj7O12eP5lF6iUoGR783wb7kMGnUI8THONyKilcvfDTNOm
 v8xL+1efgkz3KkAZ731JLAp10vQ2xAqJynpVO31A2859IxFk/gkEUeqgR9TuwbXBLJ9QaY
 hLvC4IusESXrfTZGdXF+DdrHlowXW+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-dmM7Ohi3OeS9V1mQfhJTOg-1; Tue, 16 Feb 2021 05:59:33 -0500
X-MC-Unique: dmM7Ohi3OeS9V1mQfhJTOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B123480196E;
 Tue, 16 Feb 2021 10:59:32 +0000 (UTC)
Received: from work-vm (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC2BF6A8E8;
 Tue, 16 Feb 2021 10:59:19 +0000 (UTC)
Date: Tue, 16 Feb 2021 10:59:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 1/1] virtiofsd: Allow to build it without the tools
Message-ID: <YCulhZyeZRIS3wQj@work-vm>
References: <20210201211456.1133364-1-wainersm@redhat.com>
 <20210201211456.1133364-2-wainersm@redhat.com>
 <OSBPR01MB45828271AC8D2F8F5FAA52D7E5B59@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <41d8b908-652f-a8c4-0bef-7420c65bd1d2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <41d8b908-652f-a8c4-0bef-7420c65bd1d2@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Queued with that line added to the commit message

> - Wainer
> 
> > 
> > Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> > 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


