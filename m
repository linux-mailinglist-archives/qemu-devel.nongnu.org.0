Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A041394A7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 16:19:42 +0100 (CET)
Received: from localhost ([::1]:51762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir1VF-0004B3-Rl
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 10:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ir1To-0003iz-Fl
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 10:18:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ir1Tl-0002ZA-M7
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 10:18:10 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44415
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ir1Tl-0002Ye-IY
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 10:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578928689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGZMFSnd8yt24/QrbeWsXQt9Cq6rzCMtLbmMe3F3Wfg=;
 b=V2B/HdpgLf05LFcj1t8umub3bvdqzTvEiig0A2bm0xjFRdfGLBiPPQBlLr2yU6V2YzVsNs
 MzwbT+UGeegnrKYi+MTKcS9Vmn3rmsK1pNmjuhs8ER/qnoIG9TodMBvcegVEy+uLjzxLMM
 eGX+ggkJ8pSVRu9+mtPEAvrZZgOCrhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-79KikgRiOOi7GGeuQ1kV3Q-1; Mon, 13 Jan 2020 10:18:05 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B3D800D4C;
 Mon, 13 Jan 2020 15:18:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF1CE5DA70;
 Mon, 13 Jan 2020 15:17:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71BCC1138600; Mon, 13 Jan 2020 16:17:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 40/59] hsb/hcd-ehci.c: remove unneeded labels
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-41-danielhb413@gmail.com>
Date: Mon, 13 Jan 2020 16:17:56 +0100
In-Reply-To: <20200106182425.20312-41-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 6 Jan 2020 15:24:06 -0300")
Message-ID: <87pnfnxu57.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 79KikgRiOOi7GGeuQ1kV3Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo in subject: s/hsb/usb/


