Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C3A5A4602
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:23:50 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSazk-0005W8-9n
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1oSarK-0002WI-Ol
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 05:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1oSarG-0005HI-OE
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 05:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661764501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Q4dQwmwbYV3isUtRFv+HG1Y3D3JCqIU7Ll9SBJHujcY=;
 b=JjTF81JJ9pCd6Te9Xekq91WzoFb29sAgKNDclydpM9h922Yyo+d2mpQ5bRnWDbpMU49dHK
 DHewGgyU09ogSXxTfbfIFxKoLnKAziBW6xYIfP8U4HPbQAdtcjLSzIRv3XMBxda5l6VwK+
 w6IeSti7Gx4bDADW7nn3Ny//O7LKnOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-0XItVW3hOaWz2puHoe5K9w-1; Mon, 29 Aug 2022 05:13:16 -0400
X-MC-Unique: 0XItVW3hOaWz2puHoe5K9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD729185A7B2;
 Mon, 29 Aug 2022 09:13:15 +0000 (UTC)
Received: from pinwheel (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 006882166B26;
 Mon, 29 Aug 2022 09:13:13 +0000 (UTC)
Date: Mon, 29 Aug 2022 11:13:06 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Call for KVM Forum 200 panel-discussion topics
Message-ID: <YwyDIiKFq01lO0La@pinwheel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

You can post questions for the upcoming KVM Forum panel discussion[1] at
Dublin here:

    https://etherpad.opendev.org/p/KVMForum_2022_Panel

The session[1] is on 14th September (Wednesday), Dublin, KVM Forum 2022.

The panel is for discussing technical and non-technical topics related
to KVM, QEMU, and open source virtualization in general. The panelists
are developers, managers, researchers, and others involved in open
source virtualization.

The panelists this year are:

  - Christopher Dall, Arm
  - Susie Li, Intel 
  - Sean Christopherson, Google
  - Will Deacon, Google
  - Paolo Bonzini, Red Hat

The bio of the paenlists is listed in the schedule[1].  Previous year's
editions are available on KVM Forum's YouTube channel.

Questions and topics come from the community, so please participate. :-)


[1] https://kvmforum2022.sched.com/event/15jLj/

-- 
/kashyap


