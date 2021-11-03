Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E6A443D60
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 07:43:25 +0100 (CET)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi9zY-0004aM-VT
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 02:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mi9xd-00031V-Pn
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mi9xa-0006dz-9s
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635921681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ic7/Tv8dzgxGzExYMNDYxIT6r0CNDDhkoEiObvfIC2Q=;
 b=bUQ38015/ESqg62pYX1mKmFIqXP6RRAgbBUip92zZV27zCdotYNeKxe1cFSIu2m9p565Zf
 9859F7wseZdUOQU1l4aNLxdHFBj+NxSzc+Vm/x/eF+gS/cYOHmn19PNJlexII5yyVFjYG8
 4O2TeoIgjKJgX4EpufsufI5jw4BUXPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-zL_Ra5R7M9-kXDtHSiRHnQ-1; Wed, 03 Nov 2021 02:41:18 -0400
X-MC-Unique: zL_Ra5R7M9-kXDtHSiRHnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E43918A0744;
 Wed,  3 Nov 2021 06:41:16 +0000 (UTC)
Received: from [10.39.192.84] (unknown [10.39.192.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C67F5D9D5;
 Wed,  3 Nov 2021 06:41:07 +0000 (UTC)
Message-ID: <ac937fd6-9db1-6db9-0a30-a3c7e4a16f0f@redhat.com>
Date: Wed, 3 Nov 2021 07:41:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 3/4] docs: (further further) remove non-reference uses
 of single backticks
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211102184400.1168508-1-jsnow@redhat.com>
 <20211102184400.1168508-4-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211102184400.1168508-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Alexander Bulekov <alxndr@bu.edu>, Eric Blake <eblake@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 19.43, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   docs/devel/build-system.rst | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 7f106d2f1c..48e56d7ea9 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -47,16 +47,17 @@ command line options for which a same-named Meson option exists;
>   dashes in the command line are replaced with underscores.
>   
>   Many checks on the compilation environment are still found in configure
> -rather than `meson.build`, but new checks should be added directly to
> -`meson.build`.
> +rather than ``meson.build``, but new checks should be added directly to
> +``meson.build``.
>   
>   Patches are also welcome to move existing checks from the configure
> -phase to `meson.build`.  When doing so, ensure that `meson.build` does
> -not use anymore the keys that you have removed from `config-host.mak`.
> -Typically these will be replaced in `meson.build` by boolean variables,
> -``get_option('optname')`` invocations, or `dep.found()` expressions.
> -In general, the remaining checks have little or no interdependencies,
> -so they can be moved one by one.
> +phase to ``meson.build``.  When doing so, ensure that ``meson.build``
> +does not use anymore the keys that you have removed from
> +``config-host.mak``.  Typically these will be replaced in
> +``meson.build`` by boolean variables, ``get_option('optname')``
> +invocations, or ``dep.found()`` expressions.  In general, the remaining
> +checks have little or no interdependencies, so they can be moved one by
> +one.
>   
>   Helper functions
>   ----------------
> @@ -298,7 +299,7 @@ comprises the following tasks:
>   
>    - Add code to perform the actual feature check.
>   
> - - Add code to include the feature status in `config-host.h`
> + - Add code to include the feature status in ``config-host.h``
>   
>    - Add code to print out the feature status in the configure summary
>      upon completion.
> @@ -334,7 +335,7 @@ The other supporting code is generally simple::
>   
>   For the configure script to parse the new option, the
>   ``scripts/meson-buildoptions.sh`` file must be up-to-date; ``make
> -update-buildoptions`` (or just `make`) will take care of updating it.
> +update-buildoptions`` (or just ``make``) will take care of updating it.
>   
>   
>   Support scripts
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


