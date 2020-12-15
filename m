Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB22DA90D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:17:48 +0100 (CET)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5Wk-0007lK-VV
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5VP-0007KM-RY
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:16:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5VO-0003DS-9R
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608020181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=At9/LYjCbk5PBpZ2A4rBLUMdT2GRes5G45k5/i2hZLo=;
 b=cIJC3AkPxbyC8QybA6CNknkT1YdNk3de/fXrDcWom9qp4Bp63fu0guy3iakDoIhxImHbYP
 3oYCfwIKuz8SwLGbIqouwKeR2z7NKE+moOzU8uYupNdpnkBzyjfQyah9jxRTxAofLzKEKL
 WChJHNJjA3CXQ5cu03D7QrblcVFt920=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-N5xV50wIPx2qZgW3UqTjGg-1; Tue, 15 Dec 2020 03:16:19 -0500
X-MC-Unique: N5xV50wIPx2qZgW3UqTjGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 615FE107ACE4;
 Tue, 15 Dec 2020 08:16:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0411B5D9DE;
 Tue, 15 Dec 2020 08:16:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 43B4117532; Tue, 15 Dec 2020 09:16:17 +0100 (CET)
Date: Tue, 15 Dec 2020 09:16:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 1/4] coreaudio: rename misnamed variable fake_as
Message-ID: <20201215081617.dlcwkg4crc7tnn44@sirius.home.kraxel.org>
References: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
 <20201213130528.5863-1-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20201213130528.5863-1-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 13, 2020 at 02:05:25PM +0100, Volker Rümelin wrote:
> While the variable once was used to fake audio settings, since
> commit ed2a4a7941 "audio: proper support for float samples in
> mixeng" this is no longer true. Rename the variable to obt_as.
> This is the same naming scheme as in audio/sdlaudio.c
> 
> Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>

Added all to audio queue.

thanks,
  Gerd


