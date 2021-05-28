Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244BE393C7C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 06:40:33 +0200 (CEST)
Received: from localhost ([::1]:44764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmUIR-0007St-Oq
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 00:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lmUHV-0006np-84
 for qemu-devel@nongnu.org; Fri, 28 May 2021 00:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lmUHS-0008Cu-Id
 for qemu-devel@nongnu.org; Fri, 28 May 2021 00:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622176768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aaNqoazY4ILSSE3jiOijOkL2JVyJttrenGPICgGweQo=;
 b=QcMpBwAGCnAt1ABcHD2mvHImZ3PaCzySnYOK//EsvUw8/vfjfVTQ9dOZhMc6H1u2hg03HX
 ZF5Pzg+y/Xu5Cpd6SL3wXUFwP5yeL9z/uec6uK0FxDBeiFxX70focEQDjRXmt/jQ1hs2lv
 1P0Q2BldiF00aUNCkajNdAGPpjY9ZZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-GZs5YyWzNqqLk4V6hEpgJg-1; Fri, 28 May 2021 00:39:26 -0400
X-MC-Unique: GZs5YyWzNqqLk4V6hEpgJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B48061007467;
 Fri, 28 May 2021 04:39:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-29.ams2.redhat.com [10.36.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B72A05B686;
 Fri, 28 May 2021 04:39:17 +0000 (UTC)
Subject: Re: [PATCH v1 3/6] tests/tcg/configure.sh: tweak quoting of
 target_compiler
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210527160319.19834-1-alex.bennee@linaro.org>
 <20210527160319.19834-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <541953b3-273b-8a28-c29a-b432c6fd0e51@redhat.com>
Date: Fri, 28 May 2021 06:39:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210527160319.19834-4-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/05/2021 18.03, Alex Bennée wrote:
> If you configure the host compiler with a multi-command stanza like:
> 
>    --cc="ccache gcc"
> 
> then the configure.sh machinery falls over with confusion. Work around
> this by ensuring we correctly quote so where we need a complete
> evaluation we get it. Of course the has() check needs single variable
> so we need to unquote that. This does mean it essentially checks that
> just the ccache command exits but if we got past that step we still
> check the compiler actually does something.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   tests/tcg/configure.sh | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index ed6492ce59..aa7c24328a 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -222,10 +222,10 @@ for target in $target_list; do
>   
>     got_cross_cc=no
>   
> -  if eval test "x\${cross_cc_$arch}" != xyes; then
> -      eval "target_compiler=\${cross_cc_$arch}"
> +  if eval test "x\"\${cross_cc_$arch}\"" != xyes; then
> +      eval "target_compiler=\"\${cross_cc_$arch}\""
>   
> -      if has "$target_compiler"; then
> +      if has $target_compiler; then
>             if test "$supress_clang" = yes &&
>                     $target_compiler --version | grep -qi "clang"; then
>                 got_cross_cc=no
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


