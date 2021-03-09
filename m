Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F0331FA5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:04:00 +0100 (CET)
Received: from localhost ([::1]:58866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJWPP-0007fL-8a
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJWOQ-0007FM-BJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:02:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJWOO-0000Nm-De
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615273375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdQxX8pK5SXhRmkiYr30clBEurD2jXj3hkI4YjfN1Pc=;
 b=VNYZ2u22t3ooSrzE/AMU+3aU5cdY6lX68aYeXX3CAK/i13fNrV+qsSlV77pUCkk8XzIamw
 SwF2OdykpZ1xmKlp7HTw1sV70ppyZBIbwtcNk9bZQbcfOYvUdogBlBAD7L/f8jvmrE0GFC
 /0BFD3ZR1v1euTwW9n7IrCVQohst60U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-TxeM1uImM9abNQ8tOzCIrA-1; Tue, 09 Mar 2021 02:02:53 -0500
X-MC-Unique: TxeM1uImM9abNQ8tOzCIrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4CAA108BD08;
 Tue,  9 Mar 2021 07:02:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89EDA10013D6;
 Tue,  9 Mar 2021 07:02:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B86FE18000A2; Tue,  9 Mar 2021 08:02:46 +0100 (CET)
Date: Tue, 9 Mar 2021 08:02:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?5p2O55qG5L+K?= <a_lijiejun@163.com>
Subject: Re: [PATCH] virtio-gpu: Add spaces around operator
Message-ID: <20210309070246.ia3qulpgpt2iysj6@sirius.home.kraxel.org>
References: <62fc3043.352f.178152186b1.Coremail.a_lijiejun@163.com>
MIME-Version: 1.0
In-Reply-To: <62fc3043.352f.178152186b1.Coremail.a_lijiejun@163.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 11:57:02AM +0800, 李皆俊 wrote:
> From 0512d1cbe5c01844b4aca260024006e058dc1b6c Mon Sep 17 00:00:00 2001
> 
> From: lijiejun <a_lijiejun@163.com>
> 
> Date: Tue, 9 Mar 2021 11:17:59 +0800
> 
> Subject: [PATCH] virtio-gpu: Add spaces around operator

Patch is mangled by your mailer.
Please use 'git send-email' to submit patches.

thanks,
  Gerd


