Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EF3387698
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:34:23 +0200 (CEST)
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix3O-00059c-JR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liwr9-0000qr-My
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liwr8-0006kp-7z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8z5Fv41MIwEYXV4uSgnIARdZcVBadDzJKQf4iSFpIcg=;
 b=UhbdGxL4RqkLoKxfGVuqWUtAJMXLcMjeQeii391DpksJelmPajDq90dxfpa7DDI/hZ8QiL
 3BL6uy0bu9IJkL5gBw7DmI05RY8oSSrapGUvE0B2drqjT9R9nqI4v5rQ4wDiPdBQ9L3mFx
 ePOsoCklVU8z5cqn3ncbWxeHBF5xW3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-wK4lJsjGMc-OFCQ8v06H3g-1; Tue, 18 May 2021 06:21:40 -0400
X-MC-Unique: wK4lJsjGMc-OFCQ8v06H3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27384800D62;
 Tue, 18 May 2021 10:21:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF48C6267D;
 Tue, 18 May 2021 10:21:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA194180079B; Tue, 18 May 2021 12:21:36 +0200 (CEST)
Date: Tue, 18 May 2021 12:21:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 0/4] Misc. audio patches
Message-ID: <20210518102136.t3rhp3gpnyfcoko6@sirius.home.kraxel.org>
References: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
MIME-Version: 1.0
In-Reply-To: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 17, 2021 at 09:45:04PM +0200, Volker Rümelin wrote:
> A small collection of patches for the audio subsystem.
> 
> It took me one evening to get a working audio system with JACK.
> I never associated the in-(NULL) and out-(NULL) devices in the
> patch bay with qemu.

Added all to audio queue.

thanks,
  Gerd


