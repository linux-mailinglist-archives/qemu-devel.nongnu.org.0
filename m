Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CA3F85CD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 12:47:49 +0200 (CEST)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJCvE-0007Bt-3C
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 06:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJCtj-0006Vk-S0
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 06:46:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJCti-0000Ig-Hl
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 06:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629974773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s3WcmJ5Ui/dKQrqpANopt+Dr27EgvA5aiUNsObX9q80=;
 b=HTpk97PxCfoXtPnvpLkdj0j+N6/ngPgo3HXBuchc93Mxhxy3mRyUB1lJCntnFY8aDaMQc7
 v3CKm9hJLtbPbBNNpGDeW2SSBnH8qyvGsQEdBgTKeRCLgfffgJMRW6vm5wLl4ErgKJlIeo
 KGVmE5kKzQ6TetUkX6HgC5TzpRGIfRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-X2-7eMNRMY6yVNTQRx2AZw-1; Thu, 26 Aug 2021 06:46:12 -0400
X-MC-Unique: X2-7eMNRMY6yVNTQRx2AZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD7FEC1A0;
 Thu, 26 Aug 2021 10:46:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3286A3AC1;
 Thu, 26 Aug 2021 10:46:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3DE4B18003AA; Thu, 26 Aug 2021 12:46:04 +0200 (CEST)
Date: Thu, 26 Aug 2021 12:46:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 16/44] hw/i386: Add definitions from UEFI spec for
 volumes, resources, etc...
Message-ID: <20210826104604.azrbz3ltyahu2epy@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <c7e6adac59151440d899bc54705ced2c4cf162e4.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7e6adac59151440d899bc54705ced2c4cf162e4.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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

On Wed, Jul 07, 2021 at 05:54:46PM -0700, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Add definitions for literals, enums, structs, GUIDs, etc... that will be
> used by TDX to build the UEFI Hand-Off Block (HOB) that is passed to the
> Trusted Domain Virtual Firmware (TDVF).  All values come from the UEFI
> specification and TDVF design guide. [1]

Looks like copied completely from somewhere else?
If so please add the source.

Also it should go to some place below include/standard-headers/

take care,
  Gerd


