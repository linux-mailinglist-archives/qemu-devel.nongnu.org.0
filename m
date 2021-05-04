Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ECC372806
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:22:03 +0200 (CEST)
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrFi-000404-3B
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldrEM-00035E-VI
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldrEL-00041m-7X
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620120036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cbVuoi93jyC22klPupVrp1EVushzO7LZBsv1F4pIRv8=;
 b=fsARTNC1YDFll+o6JDq0G8fgTnB4hVl66moBbEy3kogx7hsyLW93P9MMzOuv0rEG3uJFit
 aHlNs3mA5LRwwsmEHHU3ai3KGwofERVRVUEeB8VmGfgBVJHZx0oDVh+PeSuJyJPigBQLYp
 Pir5SR65T8wQC0Tw/4IPJQHrYsccm1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-YJuDFYJONVCTJKCuLDXthQ-1; Tue, 04 May 2021 05:20:35 -0400
X-MC-Unique: YJuDFYJONVCTJKCuLDXthQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE758107ACE4;
 Tue,  4 May 2021 09:20:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A0AB1037E88;
 Tue,  4 May 2021 09:20:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C9291800383; Tue,  4 May 2021 11:20:31 +0200 (CEST)
Date: Tue, 4 May 2021 11:20:30 +0200
From: 'Gerd Hoffmann ' <kraxel@redhat.com>
To: Gustavo Noronha Silva <gustavo@noronha.eti.br>
Subject: Re: [PATCH v2 2/2] ui/cocoa: add option to swap Option and Command,
 enable by default
Message-ID: <20210504092030.h57cm67lmfsnismy@sirius.home.kraxel.org>
References: <20210430213806.81457-1-gustavo@noronha.eti.br>
 <20210430213806.81457-3-gustavo@noronha.eti.br>
 <89cf53fd-989c-ad9b-2657-3171a8527eb6@eik.bme.hu>
 <14dd5acb-e943-464a-938d-043f40c8e5ec@www.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <14dd5acb-e943-464a-938d-043f40c8e5ec@www.fastmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Markus Armbruster ' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 01, 2021 at 07:47:10AM -0300, Gustavo Noronha Silva wrote:
> Hey there,
> 
> On Sat, May 1, 2021, at 6:39 AM, BALATON Zoltan wrote:
> > > On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
> > > swaps them around so that Alt is the key closer to the space bar and Meta/Super
> > > is between Control and Alt, like on non-Mac keyboards.
> > >
> > > It is a cocoa display option, enabled by default.
> > 
> > Not sure it's a good idea to enable this by default. That mixes up the 
> > keyboard unexpectedly for those who don't need this and also different 
> > from previous behaviour so better to have this option enabled by those who 
> > want it than annoy everyone.
> 
> That is indeed a good point. I can certainly switch that off by
> default and enable it myself, anyone else would like to weigh in on
> this one?

Usually the default of new config option is "traditional behavior",
i.e. do what older versions without the config option did.

So, yes, please flip the default.

thanks,
  Gerd


