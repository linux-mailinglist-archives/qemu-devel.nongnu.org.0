Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECDB48D45E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 10:37:13 +0100 (CET)
Received: from localhost ([::1]:48802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7wXf-0002TL-5o
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 04:37:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n7wUl-0000aX-Ih
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:34:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n7wUe-0008Ox-RB
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:34:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642066441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BQx0cFkThmeeuL4fePmGyMuvGqv2BdFhUKpXot4q6I=;
 b=fXfOs9ANsJ+Kq5/bEgTv5LA/7mqFNqfquTOZCvkQUgbsVCU9iTCXadPiSs1sNvzC6EZw1c
 lS8CZxb6TpFhbiq25t68t9HE1zneATUpUgwHx4OHBWAd2VPUXQi7VSZN/GiGnpuc1HzpoK
 4Tbo2x2g4XOm1gf2c80r6CANppnL2aA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-9uDueohrPWqXiXeCgXYrCg-1; Thu, 13 Jan 2022 04:33:58 -0500
X-MC-Unique: 9uDueohrPWqXiXeCgXYrCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 107A6101F7A1;
 Thu, 13 Jan 2022 09:33:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F5036F11B;
 Thu, 13 Jan 2022 09:33:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D99201800091; Thu, 13 Jan 2022 10:33:54 +0100 (CET)
Date: Thu, 13 Jan 2022 10:33:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Subject: Re: [PATCH v2 2/6] hw/usb/canokey: Add trace events
Message-ID: <20220113093354.4ifcfcpkwnx35r2z@sirius.home.kraxel.org>
References: <Ydhc8cTsH0QNINT/@Sun>
 <YdhdsY93I2DDnG54@Sun>
MIME-Version: 1.0
In-Reply-To: <YdhdsY93I2DDnG54@Sun>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 07, 2022 at 11:35:13PM +0800, Hongren (Zenithal) Zheng wrote:
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>

scripts/checkpatch.pl complains:

ERROR: line over 90 characters
#112: FILE: hw/usb/canokey.c:209:
+            trace_canokey_handle_data_out_err(ep_out, p->iov.size, key->ep_out_size[ep_out]);

ERROR: Hex numbers must be prefixed with '0x'
#157: FILE: hw/usb/trace-events:357:
+canokey_handle_control_setup(int request, int value, int index, int length) "request %04X value %04X index %04X length %04X"

total: 2 errors, 0 warnings, 130 lines checked

take care,
  Gerd


