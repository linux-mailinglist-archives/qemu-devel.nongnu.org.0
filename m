Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C9E2DCE0D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:06:23 +0100 (CET)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppEs-0004Fe-3A
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kppCi-0003ML-Q2
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:04:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kppCg-0003Kk-MD
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608195845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdA3dIkmny/oWyszZRxGS7scLwAEhINm0zyf6JSbl/A=;
 b=WbEYtHXfsdFgyGahpyMD+nZdZOwEa3L+NSq/0nGAIHnL4yur92V4WgBBPFIApp9Ea6ZrCG
 oEUmjgVQbM6dobRXcyfN9SYi76k41yEW1i9uIFtbmG3kgxrkUpHtKgn7cYCP6lyoai31RY
 6aA0wysG7GLdMfOcNdE8NsL6LdSDt5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-rPN5jFxGPtyeLuGjVP1gaA-1; Thu, 17 Dec 2020 04:04:03 -0500
X-MC-Unique: rPN5jFxGPtyeLuGjVP1gaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B7CB800D53
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 09:04:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-175.ams2.redhat.com [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F4195D9CD;
 Thu, 17 Dec 2020 09:04:01 +0000 (UTC)
Subject: Re: [PATCH 2/4] configure: remove variable bogus_os
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201217085005.10644-1-pbonzini@redhat.com>
 <20201217085005.10644-3-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <afbdcc50-f9cf-178c-fbfe-68f921d37a7c@redhat.com>
Date: Thu, 17 Dec 2020 10:04:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201217085005.10644-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/2020 09.50, Paolo Bonzini wrote:
> The condition can be tested also from $targetos, clean up.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 085a5ad7ff..18af8207d9 100755
> --- a/configure
> +++ b/configure
> @@ -467,7 +467,6 @@ gettext="auto"
>  fuse="auto"
>  fuse_lseek="auto"
>  
> -bogus_os="no"
>  malloc_trim="auto"
>  
>  # parse CC options second
> @@ -620,7 +619,6 @@ else
>    # might be going to just print the --help text, or it might
>    # be the result of a missing compiler.
>    targetos='bogus'
> -  bogus_os='yes'
>  fi
>  
>  # Some host OSes need non-standard checks for which CPU to use.
> @@ -2016,7 +2014,7 @@ if test -z "$werror" ; then
>      fi
>  fi
>  
> -if test "$bogus_os" = "yes"; then
> +if test "$targetos" = "bogus"; then
>      # Now that we know that we're not printing the help and that
>      # the compiler works (so the results of the check_defines we used
>      # to identify the OS are reliable), if we didn't recognize the
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


