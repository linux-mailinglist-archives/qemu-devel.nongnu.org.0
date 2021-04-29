Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47EB36EBA0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:52:23 +0200 (CEST)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc75a-0007uT-Jp
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lc6zp-0002sq-RI
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lc6zl-0005Oo-DW
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619703980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OyJkoP5viAyrTWwPS/MyIfMouDKOGyAnkOyVZLDcpl8=;
 b=d+a4ixLrz6lKp7SCxIN1QlrFM+nQAu9TveJiMQxOIWbBfRONCFBaLjnk0GDzajQFptgSlZ
 A47pYn+Cc3zvXuq40D1BJMEJOxMnCRIT0CzApyiHhCrjNdquI1BeNdvoXQb8Z8Xkghk5eo
 daZ9KdrsAp1huAL1N3DTPMvQWShNM6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-mtgHVPOBPyWiR4K2qCKkWw-1; Thu, 29 Apr 2021 09:46:18 -0400
X-MC-Unique: mtgHVPOBPyWiR4K2qCKkWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D94981840D;
 Thu, 29 Apr 2021 13:46:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 016E22BFE3;
 Thu, 29 Apr 2021 13:46:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 355891800604; Thu, 29 Apr 2021 15:46:12 +0200 (CEST)
Date: Thu, 29 Apr 2021 15:46:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <20210429134612.rtnoy5yo3v36h4l7@sirius.home.kraxel.org>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
 <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
 <YIqwsUAGEvfazbvZ@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YIqwsUAGEvfazbvZ@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Robert Hoo <robert.hu@linux.intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Another option might be that you just nest things:
> 
> { 'struct': 'AudioConfig',
>   'data': {
>       'model': 'AudioDevice',
>       'backend': 'Audiodev' } }
> 
> Possibly instead of 'model' on the top level, you'll actually want to
> nest there, too, and accept device properties.

Hmm.  Not so easy I suspect.  While most sound cards map to a single
device there are exceptions.  pcspk is build-in and hda is two devices.

Where do we stand in terms of QAPI support for -device btw?

> If or when I finally get QAPI aliases merged, we can make this look nice
> on the command line again by simply mapping everything to the top level
> so that you don't necessarily need to use dotted keys like you would
> initially, e.g. -audio backend.driver=sdl,model=hda could be optionally
> reduced to -audio driver=sdl,model=hda.

Yes, with aliasing available this would be a reasonable option.

take care,
  Gerd


