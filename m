Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF2130BF20
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:17:14 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vYP-0000wP-6B
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l6vGe-0006Sw-73
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:58:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l6vGc-0005Vm-Bd
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612270729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0L95vJMxtgx7BMlq0Friwbuv+DQ7LfFOG2P31eyBdA=;
 b=ZNgI5sA+fxUI+pk6QiK5kRg9vCONxPDKkbSwbLdQ8nbCF5uOV3SjiYnc/rLW4OXDnnlatY
 bgjc+mYLZZFzi0v/Mi9+6c8+iUImfPeqyicxt3mJzJ4dh03e8MGHFuuzOHXJK/o1bJ25Gb
 FYG9ylz8j/2OWXVz58+AOnlBv9VFi+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-T6nArlHRMhaGCWPQj-YJiA-1; Tue, 02 Feb 2021 07:58:47 -0500
X-MC-Unique: T6nArlHRMhaGCWPQj-YJiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A077803625;
 Tue,  2 Feb 2021 12:58:46 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F7D95D763;
 Tue,  2 Feb 2021 12:58:40 +0000 (UTC)
Subject: Re: [PATCH 1/1] virtiofsd: Allow to build it without the tools
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210201211456.1133364-1-wainersm@redhat.com>
 <20210201211456.1133364-2-wainersm@redhat.com>
 <OSBPR01MB45828271AC8D2F8F5FAA52D7E5B59@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <41d8b908-652f-a8c4-0bef-7420c65bd1d2@redhat.com>
Date: Tue, 2 Feb 2021 09:58:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB45828271AC8D2F8F5FAA52D7E5B59@OSBPR01MB4582.jpnprd01.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/2/21 2:55 AM, misono.tomohiro@fujitsu.com wrote:
>> Subject: [PATCH 1/1] virtiofsd: Allow to build it without the tools
>>
>> This changed the Meson build script to allow virtiofsd be built even
>> though the tools build is disabled, thus honoring the --enable-virtiofsd
>> option.
>>
>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> I misunderstood that virtiofsd builds somehow depends on tools build at that time.
> Thanks for fixing. I did quick build test.
Thanks for the review and test!

If not needed a v2 for this patch, please could the maintainer add to 
the commit message:

   Fixes: cece116c939d219070b250338439c2d16f94e3da (configure: add 
option for virtiofsd)

- Wainer

>
> Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
>


