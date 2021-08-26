Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C23F871F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:17:44 +0200 (CEST)
Received: from localhost ([::1]:41756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJEKE-0006Ta-Ss
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJEHw-0005Xp-Bi
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:15:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJEHs-0003bT-JB
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629980115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7zGor1pAi8Pv4p2D7vXiNRA/Bu6ID2uhk8gwuUCvznc=;
 b=Df9f+y1zRiWt6DFwI3pZ3FBFLZFWJL4r+woBDQcwD7XKtQSiM6W/Dp6BVn0/u9hYResS15
 wa1NqIB4kCYmngVebHwsOlGeTbgXlCE4oFPP22UKO6ba9V6m/hjuNa+JE/dYTQCMHtH8QO
 TNFvhI9+unLW9USzOW/8M8eJyne0syY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-8hjrYhzcM_2mOqHYO5SnSg-1; Thu, 26 Aug 2021 08:15:13 -0400
X-MC-Unique: 8hjrYhzcM_2mOqHYO5SnSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C5B184F1A0;
 Thu, 26 Aug 2021 12:15:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0AC360583;
 Thu, 26 Aug 2021 12:15:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5E29A18003AA; Thu, 26 Aug 2021 14:15:07 +0200 (CEST)
Date: Thu, 26 Aug 2021 14:15:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 42/44] hw/i386: add a flag to disable init/sipi
 delivery mode of interrupt
Message-ID: <20210826121507.kaetaey7wocsiko5@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <b11399727683e22ff53a14f15eb93f24eef1d49b.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b11399727683e22ff53a14f15eb93f24eef1d49b.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

>      ioapic_init_gsi(gsi_state, "machine", x86ms->eoi_intercept_unsupported,
> -                    x86ms->smi_unsupported);
> +                    x86ms->smi_unsupported, x86ms->init_sipi_unsupported);

Hmm, why add three different switches here?  I suspect these would all
be used together anyway?  So maybe just add a "tdx mode" to the ioapic?
Or maybe better a "confidential-computing" mode, as I guess amd will
have similar requirements for similar reasons?

thanks,
  Gerd


