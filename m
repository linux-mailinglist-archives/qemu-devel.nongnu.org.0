Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B862296F94
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 14:44:18 +0200 (CEST)
Received: from localhost ([::1]:43374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVwQZ-0002E7-Ie
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 08:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVwMO-0005v9-7m
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 08:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVwMK-0003vZ-Ro
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 08:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603456792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFbMOkvTTss1rVx9Iv3aH14gg6PzylAzGIR6EDgeq20=;
 b=AEnYBPxGF5S3DWJEqXY0FdZjSf4gTeEjqc43w3YYD5vJ8LTa45owJZtDIMa1KcKXuV3IZs
 3HP8vpn3gzxyjFhxZub+vzRgv5AbdfMnwWjYNba3DTv5p+fbgzkgU29QQ5wOP5dxtBnm2a
 qcsqkvOa0I/EwKQqaSA2ZY3Nr3oow48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-dFyIwp9QM065C_enzswKKg-1; Fri, 23 Oct 2020 08:39:48 -0400
X-MC-Unique: dFyIwp9QM065C_enzswKKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48599879527;
 Fri, 23 Oct 2020 12:39:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABB4C50DA;
 Fri, 23 Oct 2020 12:39:45 +0000 (UTC)
Subject: Re: [PATCH 10/30] microblaze tcg cpus: Fix Lesser GPL version number
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023121821.19179-1-chetan4windows@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <adef95d9-150c-1224-c979-39315de45e9d@redhat.com>
Date: Fri, 23 Oct 2020 14:39:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023121821.19179-1-chetan4windows@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.108, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: edgar.iglesias@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/2020 14.18, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  target/microblaze/cpu.h       | 2 +-
>  target/microblaze/gdbstub.c   | 2 +-
>  target/microblaze/helper.c    | 2 +-
>  target/microblaze/machine.c   | 2 +-
>  target/microblaze/mmu.c       | 2 +-
>  target/microblaze/mmu.h       | 2 +-
>  target/microblaze/op_helper.c | 2 +-
>  target/microblaze/translate.c | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


