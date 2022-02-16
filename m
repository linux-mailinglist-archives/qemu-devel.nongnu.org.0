Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748084B84FC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:56:38 +0100 (CET)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKH37-00011o-5z
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKH1d-0006ht-PS
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:55:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKH1b-0006n3-Gj
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645005297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gg00B06aTknkpn8geNnM+A4n6+3DatSu4o6FliRQU78=;
 b=FgzRpOF+BEBFBX28Vk9b585ZkEA881yGhht9USQ6Ku7mThUs/SvNavpCzBMps9cvSgnvB4
 t1pDyEppIF6Pw/5I2hsnSj6pzINg3lQMdna79H8/IbukCnLn7xIXSyvLy94Bl2cYeU/Bnl
 /d8hOMxhHw04EcvAY3C5QSM5/u0ddcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-Ep2aWn76NliEnxb5IYd-dg-1; Wed, 16 Feb 2022 04:54:54 -0500
X-MC-Unique: Ep2aWn76NliEnxb5IYd-dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C049F814245;
 Wed, 16 Feb 2022 09:54:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA27254532;
 Wed, 16 Feb 2022 09:54:50 +0000 (UTC)
Date: Wed, 16 Feb 2022 09:54:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] arm: Remove swift-bmc machine
Message-ID: <YgzJ5zUBOg+LDfUX@redhat.com>
References: <20220216080354.65257-1-joel@jms.id.au>
 <142d4fb5-c33f-5902-0aec-a21af01c717c@kaod.org>
 <CACPK8XcE7DS30nS-VmUXRJ4O8tj6KVC4KFV_Jx4ff-a6xFW2DA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACPK8XcE7DS30nS-VmUXRJ4O8tj6KVC4KFV_Jx4ff-a6xFW2DA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 08:08:46AM +0000, Joel Stanley wrote:
> On Wed, 16 Feb 2022 at 08:07, Cédric Le Goater <clg@kaod.org> wrote:
> >
> > On 2/16/22 09:03, Joel Stanley wrote:
> > > It was scheduled for removal in 7.0.
> > >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> >
> > Could you please send a v2 with an update of docs/about/deprecated.rst ?
> 
> Sure. Do we remove the machine from the list once they're gone?

The note in deprecated.rst should be moved to removed-features.rst


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


