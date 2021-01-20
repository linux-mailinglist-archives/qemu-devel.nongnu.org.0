Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D412FD4AE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:58:50 +0100 (CET)
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Fsf-0000YS-MQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2Ffz-00070t-C1
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2Ffs-0008M3-P3
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611157535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PEQWQXnpTFKrpZo/lFP/WLyeffUrFpbgQisMx03xfFg=;
 b=aRtr3Za/7B+qyf5rIx9/bty39HmBZBDjNl3YkWDJKzrYidibWEYh9N5gURnSW9h0lRcZs3
 qoGu6pGT/tPS+NH7zWe8ejRZdviQ9uqwl8O12nDP/eHhsGcgO9WmDTd5716a6WpWBWbDxN
 zh7JC8XsbZoxdscitlC7gJ6ucOz9yfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-OmnRbAfRNF22FtteAHLx5g-1; Wed, 20 Jan 2021 10:45:33 -0500
X-MC-Unique: OmnRbAfRNF22FtteAHLx5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E545D59;
 Wed, 20 Jan 2021 15:45:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB48D1D7;
 Wed, 20 Jan 2021 15:45:25 +0000 (UTC)
Subject: Re: [PATCH v2] fuzz: refine the ide/ahci fuzzer configs
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210120152211.109782-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <067d9d9d-f77b-f7ff-67b0-0ac995568ea7@redhat.com>
Date: Wed, 20 Jan 2021 16:45:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120152211.109782-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 20/01/2021 16.22, Alexander Bulekov wrote:
> Disks work differently depending on the x86 machine type (SATA vs PATA).
> Additionally, we should fuzz the atapi code paths, which might contain
> vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
> cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
> machine types.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
> 
> v2: Fix ide-hd -> ide-cd in the ahci-atapi config
> 
>   tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 7fed035345..aa4c03f1ae 100644
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
>           .args = "-machine q35 -nodefaults "
>           "-drive file=null-co://,if=none,format=raw,id=disk0 "
>           "-device ide-hd,drive=disk0",
> -        .objects = "ahci*",
> +        .objects = "*ahci*",
> +    },{
> +        .name = "ahci-atapi",
> +        .args = "-machine q35 -nodefaults "
> +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> +        "-device ide-cd,drive=disk0",
> +        .objects = "*ahci*",
>       },{
>           .name = "floppy",
>           .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
> 

Acked-by: Thomas Huth <thuth@redhat.com>


