Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC425260F15
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 11:57:27 +0200 (CEST)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFaNT-0003Zq-0D
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 05:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFaMo-0003B7-6s
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 05:56:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26722
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFaMl-0004mQ-JW
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 05:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599559002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRSrr46nAzcxncu/97QL0ZB9GIdxQdqAbtgvXEqn8Nw=;
 b=aWG18ShgDAnCkfbmAoWQVv+9+6dE0o931I6OoGMqhXDo/HvLVDY2SrpMOzSxnNDW5yerep
 GhOObXYMQ6/afhd+PwPq94Q1wSjsETLDKe2gYJuJiBJ+liUl0GCJnQghgBM5U06IeWYJv/
 AimEJm55EEZCk4NveQmqLlXIWqFMa/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-ea0ZTIXpOcGnq6-76zj5QA-1; Tue, 08 Sep 2020 05:56:40 -0400
X-MC-Unique: ea0ZTIXpOcGnq6-76zj5QA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C54F5800470
 for <qemu-devel@nongnu.org>; Tue,  8 Sep 2020 09:56:39 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-122.ams2.redhat.com
 [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1B67282CA;
 Tue,  8 Sep 2020 09:56:35 +0000 (UTC)
Subject: Re: [PULL 0/3] Sirius/ipxe 20200908 patches
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200908061046.10871-1-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e6078611-789f-027b-bea5-759e02b10eee@redhat.com>
Date: Tue, 8 Sep 2020 11:56:34 +0200
MIME-Version: 1.0
In-Reply-To: <20200908061046.10871-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/08/20 08:10, Gerd Hoffmann wrote:
> The following changes since commit e11bd71f89649da3cff439c030d2ccac0cc914e3:
> 
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-09-07' into staging (2020-09-07 16:51:00 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kraxel.org/qemu tags/sirius/ipxe-20200908-pull-request
> 
> for you to fetch changes up to 3e570a9ae9b966362596fd649f2cbcff0b2199c9:
> 
>   ipxe: update binaries (2020-09-08 08:08:30 +0200)
> 
> ----------------------------------------------------------------
> ipxe: update to aug 2020 snapshot.
> 
> ----------------------------------------------------------------
> 
> Gerd Hoffmann (3):
>   ipxe: update submodule
>   ipxe: drop ia32 efi roms
>   ipxe: update binaries
> 
>  pc-bios/efi-e1000.rom    | Bin 240128 -> 159232 bytes
>  pc-bios/efi-e1000e.rom   | Bin 240128 -> 159232 bytes
>  pc-bios/efi-eepro100.rom | Bin 240128 -> 159232 bytes
>  pc-bios/efi-ne2k_pci.rom | Bin 238592 -> 157696 bytes
>  pc-bios/efi-pcnet.rom    | Bin 238592 -> 157696 bytes
>  pc-bios/efi-rtl8139.rom  | Bin 242688 -> 160768 bytes
>  pc-bios/efi-virtio.rom   | Bin 242688 -> 160768 bytes
>  pc-bios/efi-vmxnet3.rom  | Bin 236032 -> 156672 bytes
>  roms/Makefile            |   2 --
>  roms/ipxe                |   2 +-
>  10 files changed, 1 insertion(+), 3 deletions(-)
> 

The series looks good to me.

(I'd be OK to give an R-b, but this is a PULL not a PATCH, so...)

Thanks
Laszlo


