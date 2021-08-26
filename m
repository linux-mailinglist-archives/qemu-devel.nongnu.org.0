Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44F3F86EC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:03:44 +0200 (CEST)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJE6h-0001DE-AQ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJE50-0000Jh-5k
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:01:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJE4y-0002ye-PQ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629979315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oTHP8Ry/DO/IuLNpWWeVVCxCQtKNXgqO0Ii/9aqphjo=;
 b=B7ivi439XkbVdAL1b6Z8XAs0MvI+u7YNyuZZyUHHJb+Hk71xrz0hGvVGQ8Qle90cnCctU6
 F7d75Nm2AsSZXDfhVwo5MY06MED3MnHedhK+8XS2JHZyBmNhKRVOxkOnNdtJ+jcrfFjp6R
 up2IweGq+EnhbVuqjR/+LQ2ZGo+HYfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-zZSuDz7WP6ONhOMhuGsqNQ-1; Thu, 26 Aug 2021 08:01:54 -0400
X-MC-Unique: zZSuDz7WP6ONhOMhuGsqNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A141F100E322;
 Thu, 26 Aug 2021 12:01:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 590E31002F12;
 Thu, 26 Aug 2021 12:01:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C6EDA18003AA; Thu, 26 Aug 2021 14:01:50 +0200 (CEST)
Date: Thu, 26 Aug 2021 14:01:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 34/44] target/i386/tdx: set reboot action to
 shutdown when tdx
Message-ID: <20210826120150.w36qf3ac2xf2dhnp@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <d1afced8a92c01367d0aed7c6f82659c9bf79956.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1afced8a92c01367d0aed7c6f82659c9bf79956.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org, mtosatti@redhat.com,
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> In TDX CPU state is also protected, thus vcpu state can't be reset by VMM.
> It assumes -action reboot=shutdown instead of silently ignoring vcpu reset.

Again, better throw an error instead of silently fixing up settings.

take care,
  Gerd


