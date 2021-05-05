Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14563748D1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:43:13 +0200 (CEST)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leNQO-0007xR-Rg
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1leNOT-0006s8-Ar
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1leNOQ-0000dd-Bj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620243669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTpnDIbH4yC5GHTHh0lcd9O08yMdz3mKbe8N9Rxf09I=;
 b=Uind4jMeCnqZh9zcnZrw00yeHtHfwnEvgfMASSHjPbE+rZxIwS1HQK8dInvUzf4iiEtYZW
 GgYSAnIep1LKUB2fmL1BtvppqN3/ooLMzkF9Ux+WvWG6N7bjAYtiJFkUP/q47JXNOCqB1h
 x4/2X6i74UeGF6Xb/7IhaD2rjCvrbmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-r1MfeoJdN2yIpR27lvJgxw-1; Wed, 05 May 2021 15:41:05 -0400
X-MC-Unique: r1MfeoJdN2yIpR27lvJgxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C6B8107ACCD;
 Wed,  5 May 2021 19:41:04 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 469FE5C3DF;
 Wed,  5 May 2021 19:41:04 +0000 (UTC)
Date: Wed, 5 May 2021 15:41:03 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 02/12] accel: Introduce 'query-accels' QMP command
Message-ID: <20210505194103.bwdjnbanrdwcvrxo@habkost.net>
References: <20210505125806.1263441-1-philmd@redhat.com>
 <20210505125806.1263441-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210505125806.1263441-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 02:57:56PM +0200, Philippe Mathieu-Daudé wrote:
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
> 
> - Accelerator is a QAPI enum of all existing accelerators,
> 
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
> 
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
> 
> For example on a KVM-only build we get:
> 
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
> 
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.

I assume this will be clarified in v8, based on your reply to v5.
I don't understand what "target-specific poisoning of accelerator
definitions" means.



> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Sorry for not even reviewing this before, but still:

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


