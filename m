Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624542FCD93
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:55:13 +0100 (CET)
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ACm-0002V4-EO
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2ABO-00022S-SC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:53:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2ABL-0005OH-Bf
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611136422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UW2RlfneJvAvYhmzEwEWRVhq+5rYNDgsIR5SLNTmrgY=;
 b=ZQQLuzj8XsalsTfO/V4xyEWHnbBnwJzg0AIG3HVMZ6laf4UO8QG9DxUUiqosbUn4u+4VcP
 gCfZopdVpehZc5eOrjTDtu/HgZeDuIAItHUud+GKmKE13hXt9Y60g/hit65Mb8k995MsiC
 ol9ykbdwdAKTBB6HNOAx8cFGrei/cDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-fT2MgWDOPL-PSoteGjuoaA-1; Wed, 20 Jan 2021 04:53:38 -0500
X-MC-Unique: fT2MgWDOPL-PSoteGjuoaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FD4D1800D41;
 Wed, 20 Jan 2021 09:53:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37A9527C5E;
 Wed, 20 Jan 2021 09:53:27 +0000 (UTC)
Subject: Re: [PATCH] fuzz: refine the ide/ahci fuzzer configs
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210120060745.558970-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <46576a57-f8c1-5300-2b2c-064b4d7642ba@redhat.com>
Date: Wed, 20 Jan 2021 10:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120060745.558970-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/2021 07.07, Alexander Bulekov wrote:
> Disks work differently depending on the x86 machine type (SATA vs PATA).
> Additionally, we should fuzz the atapi code paths, which might contain
> vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
> cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
> machine types.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 7fed035345..2ec52fbb63 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -85,10 +85,28 @@ const generic_fuzz_config predefined_configs[] = {
>           .objects = "intel-hda",
>       },{
>           .name = "ide-hd",
> +        .args = "-machine pc -nodefaults "
> +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> +        "-device ide-hd,drive=disk0",
> +        .objects = "*ide*",
> +    },{
> +        .name = "ide-atapi",
> +        .args = "-machine pc -nodefaults "
> +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> +        "-device ide-cd,drive=disk0",
> +        .objects = "*ide*",
> +    },{
> +        .name = "ahci-hd",
> +        .args = "-machine q35 -nodefaults "
> +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> +        "-device ide-hd,drive=disk0",
> +        .objects = "*ahci*",
> +    },{
> +        .name = "ahci-atapi",
>           .args = "-machine q35 -nodefaults "
>           "-drive file=null-co://,if=none,format=raw,id=disk0 "
>           "-device ide-hd,drive=disk0",

Shouldn't that be ide-cd now for ahci-atapi?

  Thomas


