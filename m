Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1A35F015
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:50:49 +0200 (CEST)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWbEW-0003lJ-8K
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lWbD6-000387-Ee
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lWbD4-0005cE-5n
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618390157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMOWooV4fSw52uLEdPFdPHOP6YogRvE96ZXrnN0k2ko=;
 b=Sz7Lglu+K8UilMW5a2q5d747UUiGCB0p+PHyMzV0+wpL88uPFaXCkMvL5dcY0vPWKd7ERc
 D9KsmRt6a07yEUq3+cY9xbR03RH7vy2TDUBJzZ8TN00novQlgh9nrQMMciM87sMk+hesMJ
 YoJypbTMRd4hqtsPACiSJeBAWNboLZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-wdZ193I_NKGD9tWAp-t0ww-1; Wed, 14 Apr 2021 04:49:12 -0400
X-MC-Unique: wdZ193I_NKGD9tWAp-t0ww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04A57192203C;
 Wed, 14 Apr 2021 08:49:11 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04D2B1A919;
 Wed, 14 Apr 2021 08:49:09 +0000 (UTC)
Date: Wed, 14 Apr 2021 10:49:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ed Davison <1923497@bugs.launchpad.net>
Subject: Re: [Bug 1923497] Re: bios_linker_loader_add_checksum: Assertion
 `start_offset < file->blob->len' failed
Message-ID: <20210414104907.62985c51@redhat.com>
In-Reply-To: <161834938509.17765.14119628731216209208.malone@wampee.canonical.com>
References: <161825934506.9582.2393035423485633300.malonedeb@chaenomeles.canonical.com>
 <161834938509.17765.14119628731216209208.malone@wampee.canonical.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, 13 Apr 2021 21:29:45 -0000
Ed Davison <1923497@bugs.launchpad.net> wrote:

> Hmmm.  Well, I don't know what the command line was.  I use Virtual
> Machine Manager (virt-manager.org) for my interface to the VM and it
> does the startup.  The error shows up when I start the VM.
In this case you should be able to attach domain xml. (View->Details->Overview->XML)

Also try and see if the following patch helps:
https://lore.kernel.org/qemu-devel/20210413160834-mutt-send-email-mst@kernel.org/T/#md70161e63276e9d5b6fd50fd835d2e62895810b8


