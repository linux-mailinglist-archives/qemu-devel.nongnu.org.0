Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E612CAD2A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:20:14 +0100 (CET)
Received: from localhost ([::1]:42118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkC8C-00047N-Vk
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkC7A-0003gS-Gd
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:19:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkC74-0007Nu-5n
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606853940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9g77MfrMBp4JifHRimyUhC+4grrhwkthFqOnsAEXRtk=;
 b=hjsrPEjoFXb9Ug7vdVQH1MtCirnCwf/ErP6z/0DohJJtO4Uew/Os2r5vUb95+6BWPbPOSC
 POgdkh7hisVJgbnGC4YYmPUCK0I8vivytLFebSecJBf6k3Jx8FCEjB4tFeMyeZ/sm/S/xU
 QWIL2V7h25nAWZC0itVViOMYVARKhyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-ii5nJNe-OHKNuBDcyifMrA-1; Tue, 01 Dec 2020 15:18:58 -0500
X-MC-Unique: ii5nJNe-OHKNuBDcyifMrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0CB88144E0;
 Tue,  1 Dec 2020 20:18:57 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73B0163B8C;
 Tue,  1 Dec 2020 20:18:57 +0000 (UTC)
Subject: Re: [PATCH] docs/devel/writing-qmp-commands.txt: Fix docs
To: Zihao Chang <changzihao1@huawei.com>, qemu-devel@nongnu.org
References: <20201201143308.1626-1-changzihao1@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9da0bb67-797a-9e70-3cfe-4f3c414d6778@redhat.com>
Date: Tue, 1 Dec 2020 14:18:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201143308.1626-1-changzihao1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: armbru@redhat.com, xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 8:33 AM, Zihao Chang wrote:
> Fix the example of add qmp hello-world example.
> Without ":", make will report error:
> ../qapi/misc.json:573:2: line should end with ':'
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  docs/devel/writing-qmp-commands.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
> index 46a6c48683..28984686c9 100644
> --- a/docs/devel/writing-qmp-commands.txt
> +++ b/docs/devel/writing-qmp-commands.txt
> @@ -243,7 +243,7 @@ There are many examples of such documentation in the schema file already, but
>  here goes "hello-world"'s new entry for qapi/misc.json:
>  
>  ##
> -# @hello-world
> +# @hello-world:
>  #
>  # Print a client provided string to the standard output stream.
>  #
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


