Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE192FE898
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:21:06 +0100 (CET)
Received: from localhost ([::1]:40380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Y1R-00064h-Mw
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2Xui-0008PN-FS
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2Xuc-0001V6-QJ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611227642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xbIUL7Z9c4N6/SsDszMh+48jPXLyJffBt8nt555yTho=;
 b=Kl1D+kBppvKOFw/vtu983uqwH5itvjgEB1BOC9kJrqBiwHrJFmzLFgDz+mB/m5NZ39Dfah
 KSSsohuNpjSUPJLCfUD1AR3xSKZIrDVObOpq2eUNS+qm75DI2p/k5kC0pkQa05CnbUjHH4
 96C0CyT0+jlCT7v7sOi0ojIbX611amE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-GleHVi2lPfmBh_a15r_iCw-1; Thu, 21 Jan 2021 06:14:00 -0500
X-MC-Unique: GleHVi2lPfmBh_a15r_iCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 131FC1015962
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:13:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 859E2722E6;
 Thu, 21 Jan 2021 11:13:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB6FA18000A0; Thu, 21 Jan 2021 12:13:17 +0100 (CET)
Date: Thu, 21 Jan 2021 12:13:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 0/3] vnc: remove "change vnc TARGET" and QMP change
 command, support "-vnc help"
Message-ID: <20210121111317.p7vwmau52odrrtwf@sirius.home.kraxel.org>
References: <20210120144235.345983-1-pbonzini@redhat.com>
 <20210121103831.pb22ib52z5g5onjq@sirius.home.kraxel.org>
 <20210121105204.GI3125227@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121105204.GI3125227@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > So, all in all I feel a bit uncomfortable dropping this without the
> > usual deprecation period.  No strong objections though.
> 
> Well we did deprecate the "change" command in general in 2.5.0.
> 
>   https://qemu.readthedocs.io/en/latest/system/deprecated.html#change-since-2-5-0
> 
> We gave illustrations for replacement for vnc password and CD
> media change, but no replacement was provided for changing
> VNC server config.  That's ok though, as there's no requirement
> that we provide a replacement when deprecating stuff.

Fair enough.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

(assuming you want queue that with other qemu-opts changes,
 but I can also take this through ui queue if you want).

take care,
  Gerd


