Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4352C861F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 15:02:21 +0100 (CET)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjky-0000r2-86
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 09:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kjjSU-0001Us-0e
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:43:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kjjSR-0001LU-SP
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606743790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNSxK8+OKqdXWM8hR9abAly7j1BtyASFXgP459M6gaw=;
 b=DeAre2fd5ADjNuNJnLwJ4ltpxdJSFD+a2qpFQIp+zyA71CDk3iBJSJQ3EnCmxjvRVkVaTA
 F50KA90r+ntwYRTFPwqmnjpZB/pvl0LfAf75y9+5Gw5PxshYBUlH43ztkyp8z4fYGxK/BY
 O43LZdY0CpxSXGdannb4YBcFxpSTSvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-ZHlMWhqVN12sK4mMoDEDIQ-1; Mon, 30 Nov 2020 08:43:09 -0500
X-MC-Unique: ZHlMWhqVN12sK4mMoDEDIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21BD61074642;
 Mon, 30 Nov 2020 13:43:08 +0000 (UTC)
Received: from starship (unknown [10.35.206.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 031FC5C1BB;
 Mon, 30 Nov 2020 13:43:06 +0000 (UTC)
Message-ID: <8e484633629fae1c7fc060ea1f4ed79eef2ac986.camel@redhat.com>
Subject: Re: [Bug 1906180] Re: Keyboard keys get stuck
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Bug 1906180 <1906180@bugs.launchpad.net>, qemu-devel@nongnu.org
Date: Mon, 30 Nov 2020 15:43:05 +0200
In-Reply-To: <160672375658.20924.3180698287779374632.malone@gac.canonical.com>
References: <160668110894.7596.13290289019242660849.malonedeb@soybean.canonical.com>
 <160672375658.20924.3180698287779374632.malone@gac.canonical.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <ghoffman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-11-30 at 08:09 +0000, Thomas Huth wrote:
> Which user interface do you use? SDL? GTK? VNC?
> 
> ** Changed in: qemu
>        Status: New => Incomplete
> 
I use GTK and I have seen that exact bug for a while,
but it disappeared long time ago.
You might be unlucky to get the affected version.

Best regards,
	Maxim Levitsky


