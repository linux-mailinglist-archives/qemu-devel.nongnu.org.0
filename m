Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1791837153B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:27:42 +0200 (CEST)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXfp-0001Z3-6q
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldXeR-0000fi-IA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:26:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldXeF-000683-1F
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620044762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOUQnA2gMwWnkXWzherrzp71ut71BO40hNb+lieu0/M=;
 b=X4X1KwWRHP9zkRWPS2l+mVRQNOYLCUwJW5GQbPXWGPWw55zd9fbiZdBrpfI2ih980dKrV3
 HWlqfxYklWS9wbo1DHqXUHNvQ7cNN031xWlIDu9u9C74AlJ1SU2fO7JOIeeQmExj5v6R8v
 6u1dpz1Lv4IHQcZ4j2y/2iHTFFgIymU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-jgAzSJnJNm6kCftjnwAPRQ-1; Mon, 03 May 2021 08:26:00 -0400
X-MC-Unique: jgAzSJnJNm6kCftjnwAPRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FBA4107ACC7;
 Mon,  3 May 2021 12:25:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC82210013C1;
 Mon,  3 May 2021 12:25:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 029CB1BC0891; Mon,  3 May 2021 14:25:56 +0200 (CEST)
Date: Mon, 3 May 2021 14:25:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/2] hw/usb: Do not build USB subsystem if not required
Message-ID: <20210503122556.lxdjhgsat6pa2u7c@sirius.home.kraxel.org>
References: <20210424224110.3442424-1-f4bug@amsat.org>
 <b435a81e-36b0-c9cc-5661-8f87f4a33fc5@amsat.org>
MIME-Version: 1.0
In-Reply-To: <b435a81e-36b0-c9cc-5661-8f87f4a33fc5@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 02, 2021 at 10:13:10PM +0200, Philippe Mathieu-Daudé wrote:
> ping?

Added to usb queue now.

(now that the 6.0 freeze is over I'm starting to collect non-bugfix
 patches again ...)

take care,
  Gerd


