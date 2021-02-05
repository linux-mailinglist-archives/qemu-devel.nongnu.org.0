Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045BF3104C8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 06:58:01 +0100 (CET)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7u7z-0006BM-G9
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 00:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7u6v-0005hy-W2
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 00:56:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7u6r-0006ZV-UF
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 00:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612504607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdeTiSTfPuisx8UNW9mHBhfrq/5OH974tDCCc4jypAA=;
 b=FVq3trIw5S0so5ZIc2UnjE6sFJe+CQgmS7QHLM4xID3DL762S+OnVpFO34hiJF0jc3IeLt
 0KV0QMLLQEhbUauYd4DgMvQrib6u/FLqp4pZQ3S2EbnABjuw9+e5MRaYyKXr37amPPebRJ
 t/irdthHTINeNoty/t4XNa0dQa+Z3ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-eQvI4YibN86dxlLqJb3lIg-1; Fri, 05 Feb 2021 00:56:43 -0500
X-MC-Unique: eQvI4YibN86dxlLqJb3lIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D531020C23;
 Fri,  5 Feb 2021 05:56:41 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EABF1A868;
 Fri,  5 Feb 2021 05:56:40 +0000 (UTC)
Subject: Re: [PATCH 1/2] build: add configure flag to indicate when the host
 is Darwin
To: phillip.ennen@gmail.com, qemu-devel@nongnu.org
References: <20210204162544.65439-1-phillip.ennen@gmail.com>
 <20210204162544.65439-2-phillip.ennen@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <eacb4adb-3139-e8ed-0d1f-d070af226872@redhat.com>
Date: Fri, 5 Feb 2021 06:56:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204162544.65439-2-phillip.ennen@gmail.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: stefanha@gmail.com, jasowang@redhat.com, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2021 17.25, phillip.ennen@gmail.com wrote:
> From: Phillip Tennen <phillip@axleos.com>
> 
> Although we already have CONFIG_BSD, I added this flag to be sure that we could rely on various macOS-specific subsystems, such as vmnet.framework.
> 
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> ---
>   configure | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/configure b/configure
> index 87de49e2c2..4afd22bdf5 100755
> --- a/configure
> +++ b/configure
> @@ -5825,6 +5825,10 @@ if [ "$bsd" = "yes" ] ; then
>     echo "CONFIG_BSD=y" >> $config_host_mak
>   fi
>   
> +if [ "$darwin" = "yes" ] ; then
> +  echo "CONFIG_DARWIN=y" >> $config_host_mak
> +fi

  Hi!

We already have these lines in "configure":

if test "$darwin" = "yes" ; then
   echo "CONFIG_DARWIN=y" >> $config_host_mak
fi

... so your patch here looks pretty redundant?

  Thomas


