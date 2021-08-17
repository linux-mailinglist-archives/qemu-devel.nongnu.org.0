Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D35C3EECA6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:42:36 +0200 (CEST)
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFyQN-00083t-A6
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mFyPS-00079z-QH
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mFyPQ-0005pB-1w
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629204092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0gBk+ln7xeh2xIevCjjknGU3UWmaQBQBmNOjYqZ5y5M=;
 b=cfVqvomZHw0pMhpu1gPtSPKTK3iD3DR9WL/nyt5dkeieQpQj6W0qtcxmWNF0dCm7oBrfyG
 +b+UO+BqQXt1zPPs1RvsTY5uP+nH5evbMaJNkxvEED/3nvrXvpngJqX1QhNf7MdMoV2S0q
 oNbGCpGnFPPWm7se4TAOlbxYWMeZUAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-30t20cXyMMeSVNdn6x_CLg-1; Tue, 17 Aug 2021 08:41:31 -0400
X-MC-Unique: 30t20cXyMMeSVNdn6x_CLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDAB21051480;
 Tue, 17 Aug 2021 12:41:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C24895FC23;
 Tue, 17 Aug 2021 12:41:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1352D1800385; Tue, 17 Aug 2021 14:41:27 +0200 (CEST)
Date: Tue, 17 Aug 2021 14:41:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Split Audio backends VS frontends
Message-ID: <20210817124127.2ip6fq2ndlubqn5s@sirius.home.kraxel.org>
References: <20210816191014.2020783-1-philmd@redhat.com>
 <20210816191014.2020783-2-philmd@redhat.com>
 <1790111.v9OTG8XKiZ@silver>
MIME-Version: 1.0
In-Reply-To: <1790111.v9OTG8XKiZ@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>, qemu-devel@nongnu.org,
 clamky@hotmail.com, Yonggang Luo <luoyonggang@gmail.com>,
 =?utf-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +Overall Audio frontends

> I would call that "Audio Hardware Emulation" instead of "Overall Audio 
> frontends".

> > +Overall Audio backends

> Likewise I would call this section "Shared/common QEMU audio library/
> subsystem" or something like that instead of "Overall Audio backends".

Well, frontend/backend is common qemu terminology, with "frontend" being
the emulated/virtual device as seen by the guest and "backend" being the 
host-side wireup (i.e. -audiodev / -blockdev / -chardev / -netdev / ...)

take care,
  Gerd


