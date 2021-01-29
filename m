Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96A30878C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:48:01 +0100 (CET)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QNk-0001GQ-LV
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5QLf-0008K1-DA
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:45:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5QLb-0008Fz-Bx
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611913546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnOdl7T1MGBItILsFPyLDJbTtbERPOCZWRsHYnEW4m0=;
 b=QRfH2AuIIZW/+KTvxYp3Ex8TU0A3m3fkLAp/OjrFUUbrodRPZVE9AFH/vZwRi8Se6XSvT+
 fImSVDXwcSRBEn/yjWyfutdsn2O5lFEWhGS6/c6mWb+T7dlgeFTi53wdJfC8SrUG/QLpQK
 ElTaRV+f53LXeietoc2Az8C7HJjxiVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-mzlryOcLNXOSedLGk0fQ6A-1; Fri, 29 Jan 2021 04:45:44 -0500
X-MC-Unique: mzlryOcLNXOSedLGk0fQ6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E76621006C80;
 Fri, 29 Jan 2021 09:45:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 773EB5D9EF;
 Fri, 29 Jan 2021 09:45:41 +0000 (UTC)
Subject: Re: [PATCH] tests/Makefile.include: export PYTHON for check-block.sh
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129051346.56109-1-vsementsov@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8e58f632-22fc-d0eb-5e10-c5bcb67a2050@redhat.com>
Date: Fri, 29 Jan 2021 10:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129051346.56109-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/2021 06.13, Vladimir Sementsov-Ogievskiy wrote:
> check-block.sh called by make check-block rely on PYTHON variable being
> set.
> 
> Fixes: f203080bbd9f9e5b31041b1f2afcd6040c5aaec5
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi! As Peter reported, build fails on platforms where python3 is not
> /usr/bin/python3.. This patch should help. At least it works for me if
> I move /usr/bin/python3 to another location and configure it with
> --python=. And doesn't work without the patch.
> Don't know how the thing seemed to work for me before :\
> 
>   tests/Makefile.include | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 3a0524ce74..ceaf3f0d6e 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -138,6 +138,7 @@ check:
>   ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
>   QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
>   check: check-block
> +export PYTHON
>   check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
>   		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
>   		$(filter qemu-system-%, $(ninja-targets))
> 

Tested-by: Thomas Huth <thuth@redhat.com>


