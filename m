Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E942609D5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:09:12 +0200 (CEST)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFVsV-0004H5-9z
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFVrp-0003rc-MQ
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 01:08:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42641
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFVrn-0004gM-7E
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 01:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599541705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swmMFWj31hy21R24HOPhDb3bLtnTArgt9iIfrV3WrAg=;
 b=jA+09SxzpXq+jixLqI8em4JUDmHc4Qceus1dkUtHxkjk5s/cwohc8JjDKkTep8eycO/Nk/
 H8DnDNK4Q0qg83nKozFhuy0XRFCa2pqdu6QyOY89jLyy9S9GVAYeFxqAudZEv6L3iuRptC
 GWUDaHoVL6s2+OwOYTFRDIRKeUUhg2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-rh8jPgxCODGjemyTDLw9Bg-1; Tue, 08 Sep 2020 01:08:22 -0400
X-MC-Unique: rh8jPgxCODGjemyTDLw9Bg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB9E31DDEF;
 Tue,  8 Sep 2020 05:08:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 691445C1C4;
 Tue,  8 Sep 2020 05:08:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 81CE7ED9; Tue,  8 Sep 2020 07:08:20 +0200 (CEST)
Date: Tue, 8 Sep 2020 07:08:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Plans to refreshing iPXE roms ?
Message-ID: <20200908050820.l7a6dpsz7aa5wdib@sirius.home.kraxel.org>
References: <20200907125212.GH810755@redhat.com>
 <CAFEAcA_O8huQnONrVKwYdUgHQaZEqf1FudZaNscwRcbYWuWaaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_O8huQnONrVKwYdUgHQaZEqf1FudZaNscwRcbYWuWaaA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 07, 2020 at 01:58:20PM +0100, Peter Maydell wrote:
> On Mon, 7 Sep 2020 at 13:53, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > The current iPXE ROMs in QEMU date from Janary 2019, so feels like
> > they are overdue for a refresh.
> 
> Sounds good.

Thanks for the reminder, I'll look into it.

> My impression has been that ROM refreshes
> seem to tend to arrive comparatively late in the QEMU
> release cycle -- I think it would be ideal if we did
> them earlier, given that they amount often to a big
> infusion of code changes all at once.

Well, ipxe update was discussed recently and I skipped it
for 5.1 exactly because it would have landed during the
freeze.  And there was no good reason to risk that.

For seabios I usually try to land larger updates at the
begin of the freeze, so we have the whole -rc phase for
testing.

take care,
  Gerd


