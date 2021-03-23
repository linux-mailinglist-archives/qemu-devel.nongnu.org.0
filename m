Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1487934627F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:13:33 +0100 (CET)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiio-0006YV-MJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOign-0005Vo-E2
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOigk-0006Dh-GW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616512281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaaqytMS7zKM04HYfKNIk7OcyQ51T/uhfW9G3AtKThY=;
 b=WNwnf/p8J8xBPTdabSAE8lPI0DpxO8fq7CyQsXqvuCgca+j99ThMghRXSXv0TOQYhpc+6F
 eyl2bpn6+ScUTvVHsMjejhFsaGIFhmpvlaiCO6KNI+eKghrVdeHZ+0EJr6ZG/nCjTSwKCH
 cwQgqveq45yidKN+mjW3lbk21+BAShw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-IIfOKa7nPTKyQQBaCi0-SA-1; Tue, 23 Mar 2021 11:11:19 -0400
X-MC-Unique: IIfOKa7nPTKyQQBaCi0-SA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED3D6612A1;
 Tue, 23 Mar 2021 15:11:18 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 714FB1002D71;
 Tue, 23 Mar 2021 15:11:15 +0000 (UTC)
Subject: Re: [PATCH 21/28] tests-qmp-cmds: Drop unused and incorrect
 qmp_TestIfCmd()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-22-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <75cf604f-beef-b3a5-d58e-797a412be745@redhat.com>
Date: Tue, 23 Mar 2021 10:11:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-22-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: michael.roth@amd.com, jsnow@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 4:40 AM, Markus Armbruster wrote:
> Commit 967c885108 "qapi: add 'if' to top-level expressions" added
> command TestIfCmd with an 'if' condition.  It also added the
> qmp_TestIfCmd() to go with it, guarded by the corresponding #if.
> Commit ccadd6bcba "qapi: Add 'if' to implicit struct members" changed
> the command, but not the function.  Compiles only because we don't
> satisfy the #if.  Instead of fixing the function, simply drop it.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/unit/test-qmp-cmds.c | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> index 266db074b4..99973dde7c 100644
> --- a/tests/unit/test-qmp-cmds.c
> +++ b/tests/unit/test-qmp-cmds.c
> @@ -13,13 +13,6 @@
>  
>  static QmpCommandList qmp_commands;
>  
> -#if defined(TEST_IF_STRUCT) && defined(TEST_IF_CMD)
> -UserDefThree *qmp_TestIfCmd(TestIfStruct *foo, Error **errp)
> -{
> -    return NULL;
> -}
> -#endif
> -
>  UserDefThree *qmp_TestCmdReturnDefThree(Error **errp)
>  {
>      return NULL;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


