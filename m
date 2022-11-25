Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF595638408
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 07:36:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oySIG-0001Mi-LH; Fri, 25 Nov 2022 01:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oySIE-0001Le-H0
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 01:34:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oySIC-0003k8-QV
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 01:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669358070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=20YmKJ1xIuVAZcmOQeg3lNaxg8zLWHBwNz8/5i51puA=;
 b=W4UQpLqopoY6wRwurdK4keMD7QbD3ug1El/ls5+1eEVxBsxKLENbQLaUhxxYs6/x811Sx3
 TxWYa+ZYp+HHlIfBZa/9eq2Q4J3el3HoWbgkO8Mwn15/mUZsmv3B8oS8UJcrGYLwhHWOLy
 7myq/iGgVvYHu4gjuwio2DACKZCKLuU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-HeeoE-1sMqu-OkhVJdFDAQ-1; Fri, 25 Nov 2022 01:34:25 -0500
X-MC-Unique: HeeoE-1sMqu-OkhVJdFDAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 133DA29AB435;
 Fri, 25 Nov 2022 06:34:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C26114C819;
 Fri, 25 Nov 2022 06:34:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6CA471800631; Fri, 25 Nov 2022 07:34:21 +0100 (CET)
Date: Fri, 25 Nov 2022 07:34:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/4] Fixes 20221124 patches
Message-ID: <20221125063421.y7th23snmahilgpt@sirius.home.kraxel.org>
References: <20221124071602.1109150-1-kraxel@redhat.com>
 <CAJSP0QUh2Pp9PdxTQ4HvrraF03eKBeUMJR8WhPN4GgEW36K93w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QUh2Pp9PdxTQ4HvrraF03eKBeUMJR8WhPN4GgEW36K93w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 24, 2022 at 01:03:21PM -0500, Stefan Hajnoczi wrote:
> On Thu, 24 Nov 2022 at 02:27, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > usb+ui: fixes for 7.2
> 
> Hi Gerd,
> I already applied your previous pull request so these patches are in
> qemu.git/master. Do you want to revert the 8.0 patches that were
> included in your previous pull request? I don't know how risky it is
> to have them in 7.2. It's up to you.
> 
> 7d3cf19548 hw/audio/intel-hda: Drop unnecessary prototype
> 3e95ef49e6 hw/audio/intel-hda: don't reset codecs twice
> 1dfb7a175f hw/usb/hcd-xhci: Reset the XHCIState with device_cold_reset()

They look rather safe to me, Peter raised concerns though so I've
re-sent the pull with them dropped.

Peter?

take care,
  Gerd


