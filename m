Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9B3271DAC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 10:14:04 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKGxW-00044C-UJ
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 04:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKGwY-0003Z2-L9
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 04:13:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKGwU-0008KE-VZ
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 04:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600675977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yul56K4liXsZqY9g0rFLrmyW0fwNRpbb6iVgni1fBjk=;
 b=Q16S42ryb037HU8zMOa/m64SrmmRy0hGVz89dRbo3IBCRxX5hxeZjrwET3a/MkErLAaPAp
 6yyIB0Lsl5unzX9/Khv+wRrFIlkkWPnTXJE4LbgGZS3/DIN2FWjbzzKVVAwvtthCFX0P5Q
 UgG3CZoiFpO/gKiJovRugJX+dSX9zZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-dRfYNoU5OzyzlkFt1S4CIA-1; Mon, 21 Sep 2020 04:12:55 -0400
X-MC-Unique: dRfYNoU5OzyzlkFt1S4CIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5445D104D3E0
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 08:12:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D91E60C13;
 Mon, 21 Sep 2020 08:12:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4EB0E16E16; Mon, 21 Sep 2020 10:12:50 +0200 (CEST)
Date: Mon, 21 Sep 2020 10:12:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 4/5] spice: get monitors physical dimension
Message-ID: <20200921081250.dl2nknet2x6ymakv@sirius.home.kraxel.org>
References: <20200917062242.1877925-1-marcandre.lureau@redhat.com>
 <20200917062242.1877925-5-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200917062242.1877925-5-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 17, 2020 at 10:22:41AM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Note that for consistency, we use the same logic as MonitorsConfig to
> figure out the associated monitor. However, I can't find traces of the
> discussion/patches about the "new spice-server" behaviour: it still uses
> the multiple-configurations path in git master.

Ok, can we just purge the dead code then instead of introducing one more
instance of it?

thanks,
  Gerd

PS: patch series looks good to me otherwise.


