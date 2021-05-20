Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68390389F97
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:14:23 +0200 (CEST)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdp0-0003rL-FV
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljdYN-00016R-7z
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:57:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljdYH-0000GR-Gs
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621497424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnmBXCTZ9M1Vs3PrnoDLKuiRI3aJ74otAepWGfVpow8=;
 b=clCZYQIq+5SXMZAjgS6ZMuVI9Am32YfISlLawwtmXR/OJcPQni3FDbJgqTBO3ti953YMcE
 FT8Wg8+QuqgiN3nof7kT6lo2ZA4oi5wsqZstNx7hKLGCEnwqu7Wk/b8zfeU+Cpvftjj/DQ
 Snku6W5C2+98UYirlrQEEj3YmT2Kz0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-xFPmWCiFNsmkZY1_ZgCUkg-1; Thu, 20 May 2021 03:57:01 -0400
X-MC-Unique: xFPmWCiFNsmkZY1_ZgCUkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D311580575D;
 Thu, 20 May 2021 07:56:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADC0D1037E81;
 Thu, 20 May 2021 07:56:27 +0000 (UTC)
Subject: Re: [PATCH v3 3/6] gitlab-ci: Run GNU make via the $MAKE variable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-4-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6858c4f6-1980-72ce-297f-e13ce00ce427@redhat.com>
Date: Thu, 20 May 2021 09:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210519184549.2192728-4-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2021 20.45, Philippe Mathieu-Daudé wrote:
> Add the $MAKE variable to call GNU make, and set it to 'gmake'
> on FreeBSD to avoid:
> 
>    $ make -j"$JOBS"
>    make: Unknown modifier ','
>    make: "/builds/dTyar424/0/qemu/build/Makefile" line 3: Need an operator
>    make: "/builds/dTyar424/0/qemu/build/Makefile" line 4: Missing dependency operator
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index fe4f18595ac..f284d7a0eec 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -5,9 +5,11 @@
>           ;
>         then
>           JOBS=$(sysctl -n hw.ncpu)
> +        MAKE=gmake
>           ;
>         else
>           JOBS=$(expr $(nproc) + 1)
> +        MAKE=make

Maybe we could use "gmake" on Linux, too, so we do not have to use the 
indirection with a variable here? Or are there Linux distros where the 
"gmake" link is not available?

  Thomas


