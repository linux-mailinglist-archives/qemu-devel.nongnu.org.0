Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634D249495
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 07:48:09 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8GxD-0000P2-Sv
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 01:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8Gvi-0007Nf-BF
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:46:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21286
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8Gvf-0006fS-Tz
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597815990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IG1EBajF4JHX/Ig+h1SkGc5Vrgqfh61gjK23y5wHl8s=;
 b=KdLNnZsRkzQGAAWHpZlc7kFDAuM6lqEKKjgePxn6nVRLQtJMcsfw9nzwAecebHUhtv0bF4
 8luswPGq2qfvmHkUWWdwwJqsXwfFG+GAdPRNrvEuxgsaZgvhSdCl9SDk8vKm1b6rzIRcKU
 O7TAx9wR508AnavV4nxGi8kUwm/iQiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-bF05YtvIOX28EIrzWrM7KQ-1; Wed, 19 Aug 2020 01:46:28 -0400
X-MC-Unique: bF05YtvIOX28EIrzWrM7KQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7007B801ADD;
 Wed, 19 Aug 2020 05:46:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C195C1D0;
 Wed, 19 Aug 2020 05:46:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CC8619D8F; Wed, 19 Aug 2020 07:46:25 +0200 (CEST)
Date: Wed, 19 Aug 2020 07:46:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?Q8Opc2Fy?= Belley <cesar.belley@lse.epita.fr>
Subject: Re: [PATCH 00/13] Introduce USB U2F key device
Message-ID: <20200819054625.eswk6sm6hsn74tdn@sirius.home.kraxel.org>
References: <20200812094135.20550-1-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
In-Reply-To: <20200812094135.20550-1-cesar.belley@lse.epita.fr>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 22:38:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Wed, Aug 12, 2020 at 11:41:22AM +0200, César Belley wrote:
> This patch series adds the U2F dedicated support to Qemu through a USB
> U2F key device that can operate in two modes: pass-through and emulated.
> 
> This work is also part of the GSoC program of this year and follows the
> proposal I made for the 'Virtual FIDO2/U2F security key' subject,
> suggested and mentored by by Gerd Hoffmann.
> 
> U2F is an open authentication standard. It enables relying parties
> exposed to the internet to offer a strong second factor option for end
> user authentication.
> 
> The standard brings many advantages to both parties, client and server,
> allowing to reduce over-reliance on passwords, it increases
> authentication security and simplifies passwords.
> 
> The second factor is materialized by a device implementing the U2F
> protocol. In case of a USB U2F security key, it is a USB HID device
> that implements the U2F protocol.
> 
> The USB U2F key device given in this patch series allows to add guest
> U2F security keys via two possible modes: pass-through and emulated.
> 
> The pass-through mode consists of passing all requests made from the
> guest to the physical security key connected to the host machine and
> vice versa. In addition, the dedicated pass-through allows to have a
> U2F security key shared on several guests which is not possible with
> a simple host device assignment pass-through.
> 
> The emulated mode consists of completely emulating the behavior of an
> U2F device through software part. Libu2f-emu is used for that.

Reviewed & tested.  Nice job.
Queued up for merge, pull req goes out in a moment.

Note there is a pending patch series converting the qemu build system
to meson which very likely conflicts with the Makefile changes.  So
there is a chance that the series needs a rebase because of that.

take care,
  Gerd


