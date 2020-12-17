Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0A72DCE12
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:08:04 +0100 (CET)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppGV-0005LN-FG
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kppFD-0004s9-Sy
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kppFC-0004E5-Bu
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608196001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GBI9y0PGiea2KqHB5PALZhEzXJxfxSxMTKDYNLWQAs=;
 b=FmVH3UOOE/vAMDOkFy1SDhKEYDMlB+2jrCFcpUKeoyp+d6y5U48msqIo8mUB3A+JzW5G0q
 NKy5GjOuZInFK0dSG+b+PQjdgbcXwsWkrXGgIDMRANWwIKXm2Al4IBobcFFTpir0LgE7AI
 UXIg9vHGttorNttcsqp0g43tgltlzDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-TogJvAiRN-mknzRVgOHB0w-1; Thu, 17 Dec 2020 04:06:40 -0500
X-MC-Unique: TogJvAiRN-mknzRVgOHB0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 160A68735D4
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 09:06:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-175.ams2.redhat.com [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7524E1971D;
 Thu, 17 Dec 2020 09:06:38 +0000 (UTC)
Subject: Re: [PATCH 3/4] configure: accept --enable-slirp
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201217085005.10644-1-pbonzini@redhat.com>
 <20201217085005.10644-4-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dba8b892-aaab-d9a4-271b-363e92698114@redhat.com>
Date: Thu, 17 Dec 2020 10:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201217085005.10644-4-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
> Meson understands -Dslirp=enabled, so there is no reason not to
> accept the configure option as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configure b/configure
> index 18af8207d9..568818e72d 100755
> --- a/configure
> +++ b/configure
> @@ -1083,6 +1083,8 @@ for opt do
>    ;;
>    --disable-slirp) slirp="disabled"
>    ;;
> +  --enable-slirp) slirp="enabled"
> +  ;;
>    --enable-slirp=git) slirp="internal"
>    ;;
>    --enable-slirp=system) slirp="system"
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


