Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3883536C019
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:32:47 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbID7-0005KX-N5
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbIBS-0004DE-Go
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbIBQ-0007nO-6U
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619508659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZ6CnDKTFz/3ozPn9vkZ5nKrEGUYBQoJbDNdzJSOoV8=;
 b=EmBy68zDjECEesHQrGyZxOBFtTYq9z8tdBCE0g2wjs08MfBpAZP6O61U49PUBaotXM/4Z3
 +sICtLbJGoJPUM0fV/Ud2Te9wSy/GMZVnuL4GOq0dedD55/aHBXVqZ9mNFhuOPctDOIEUv
 Sr5ggu2QoICfysqeVFLQL84IkqPeCMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-tIJjzh64OZ6ZVqDDKioX_w-1; Tue, 27 Apr 2021 03:30:56 -0400
X-MC-Unique: tIJjzh64OZ6ZVqDDKioX_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE1DC107ACC7;
 Tue, 27 Apr 2021 07:30:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 887D35C73F;
 Tue, 27 Apr 2021 07:30:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 47A191800393; Tue, 27 Apr 2021 09:30:53 +0200 (CEST)
Date: Tue, 27 Apr 2021 09:30:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: Ethernet-over-usb with linux guest using USB Device Controller ?
Message-ID: <20210427073053.ny6fiwxdb6jkhmd2@sirius.home.kraxel.org>
References: <CADPb22QnVowGz2oCWk8mBtjZz-4Cuzu0z=LmfvwotG_QjbuPzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADPb22QnVowGz2oCWk8mBtjZz-4Cuzu0z=LmfvwotG_QjbuPzQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Questions: Is this support in QEMU and if so got any pointers to source for
> existing examples?
> If not, any guidance on how to proceed?

qemu has only usb host controller emulation, not any usb device
controller emulation.  So you are entering new territory and there are
no existing code exsamples, sorry.

take care,
  Gerd


