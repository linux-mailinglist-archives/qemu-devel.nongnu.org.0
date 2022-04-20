Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58A50838D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:37:29 +0200 (CEST)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5q4-0007zU-G0
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nh5g7-0006Me-6Q
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nh5g5-0004Cw-Ed
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650443228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcRjdclg4Ux66M7jyIDcUcdUURaKky/uElJYJy0kfRc=;
 b=B0+0FNqHybXRc5IjF6WZfKx0OjwDWqSc8FaPvDMJubzLXdJ8ZHsoCXMxpl1J3sI2hPvTkn
 12l4bowqkXZgAHQHiXqVMXnboX6cQ6JPHKYJmMR3OjM7p4PwPAQdhYJiSQlyvtcKDqFCmJ
 HuDLhqFzdt5arGclUH/bz5e4xbXu9CA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-wxipb_EmMpC0tzQIRnrvFQ-1; Wed, 20 Apr 2022 04:27:06 -0400
X-MC-Unique: wxipb_EmMpC0tzQIRnrvFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 567421161A61;
 Wed, 20 Apr 2022 08:27:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE954200E28A;
 Wed, 20 Apr 2022 08:26:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF7B6180009C; Wed, 20 Apr 2022 10:26:36 +0200 (CEST)
Date: Wed, 20 Apr 2022 10:26:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/e820: remove legacy reserved entries for e820
Message-ID: <20220420082636.jugea2h24qajh3zt@sirius.home.kraxel.org>
References: <20220420043904.1225153-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420043904.1225153-1-ani@anisinha.ca>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 10:09:04AM +0530, Ani Sinha wrote:
> e820 reserved entries were used before the dynamic entries with fw config files
> were intoduced. Please see the following change:
> 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> 
> Identical support was introduced into seabios as well with the following commit:
> ce39bd4031820 ("Add support for etc/e820 fw_cfg file")
> 
> Both the above commits are now quite old. QEMU machines 1.7 and newer no longer
> use the reserved entries. Seabios uses fw config files and

We still support machine types 1.6 & older (although they are
deprecated already), so I think this has to wait until the 1.7 + older
machine types are actually dropped.

Otherwise:
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


