Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D0628CEC2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 14:52:55 +0200 (CEST)
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSJnS-0007L3-HW
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 08:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSJlx-0006Ib-Jj
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 08:51:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSJlw-0004dU-11
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 08:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602593478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BNVaBgNqV+OF6QHhO0L23BaSYEZnhc2VqUwsx/rQPEU=;
 b=F9UlMvK1RSooUXQryJvYxsupimToQPcONGxJz78hbib/UBuceSSjyQCl/nUq96Pe/aIWlJ
 Sq6+byp7Q6+xSYYN6mTWtEYeRLV+++u6VJZsA3bb1q9CTVYl8UEza49vEsqks8RdHzmbtp
 bPjtu4KiRl1814hub86VdQfZ4df5/8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-aARUXmywOnOfNUikWgvbgg-1; Tue, 13 Oct 2020 08:51:17 -0400
X-MC-Unique: aARUXmywOnOfNUikWgvbgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD90879525;
 Tue, 13 Oct 2020 12:51:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FE125C1C2;
 Tue, 13 Oct 2020 12:51:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4BC531750A; Tue, 13 Oct 2020 14:51:14 +0200 (CEST)
Date: Tue, 13 Oct 2020 14:51:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Subject: Re: [PATCH] SDL: enable OpenGL context creation
Message-ID: <20201013125114.ewlkbs7jtc2edd37@sirius.home.kraxel.org>
References: <b2ba98b3-2975-0d4d-1c56-f659923c714d@rwth-aachen.de>
MIME-Version: 1.0
In-Reply-To: <b2ba98b3-2975-0d4d-1c56-f659923c714d@rwth-aachen.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Sun, Oct 04, 2020 at 12:42:21PM +0200, Jan Henrik Weinstock wrote:
> We need to specify SDL_WINDOW_OPENGL if we want to create an OpenGL context
> on it, i.e. when using '-device virtio-gpu-pci,virgl=on'
> 
> Signed-off-by: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>

Added to ui patch queue.

thanks,
  Gerd


