Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B30A284F88
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 18:10:38 +0200 (CEST)
Received: from localhost ([::1]:59620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPpXx-0000eG-GK
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 12:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kPpSf-0001zl-PQ
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kPpSb-0003IF-SB
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602000304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+NoW7DZBasMMsaeaD+Z2NTOOoD+XkkainhXfZ1dKjQ=;
 b=dw9zGohIsN7y3YmXTWAQeLGoiaWlmOLom4ZVHq9aHDDZYxV6z3ax7SvaD/jvhWJ5m0b4oz
 nRGDvplQvu17qC6b2ZaeK9ZzfKEQ2Mt7PGJgS0tQaMef3eqO7RBCO7rbA6O2aUbqRinlNw
 /o/gY2dLs43LzJKdJ3DiyrnifeLhvEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-Fi0mBXGdNWuE3JzAlqoKqw-1; Tue, 06 Oct 2020 12:05:02 -0400
X-MC-Unique: Fi0mBXGdNWuE3JzAlqoKqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8C7318C5203;
 Tue,  6 Oct 2020 16:05:01 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-197.ams2.redhat.com
 [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE6E178482;
 Tue,  6 Oct 2020 16:04:55 +0000 (UTC)
Subject: Re: [PATCH v3 1/1] hw/nvram: Always register
 FW_CFG_DATA_GENERATOR_INTERFACE
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201006153636.2383248-1-philmd@redhat.com>
 <20201006153636.2383248-2-philmd@redhat.com>
 <134bbd15-c53c-7686-a36d-f02a81b56e0d@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e7348766-7210-23f8-ab4e-b5985c279909@redhat.com>
Date: Tue, 6 Oct 2020 18:04:54 +0200
MIME-Version: 1.0
In-Reply-To: <134bbd15-c53c-7686-a36d-f02a81b56e0d@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/20 17:51, Richard Henderson wrote:
> On 10/6/20 10:36 AM, Philippe Mathieu-Daudé wrote:
>> +++ b/hw/nvram/fw_cfg-interface.c
>> @@ -0,0 +1,15 @@
>> +#include "qemu/osdep.h"
>> +#include "hw/nvram/fw_cfg.h"
> 
> License boilerplate missing.
> 
> r~
> 

Hrmpf, so easy to forget about that, especially in review :/ Thanks for
catching it.

Laszlo


