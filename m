Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547E30464E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 19:33:57 +0100 (CET)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4TA3-0003jR-PB
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 13:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4T8h-0003Ee-Vz
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 13:32:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4T8d-0000Tt-Gs
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 13:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611685945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ofkk0zhzKMecaxalEcckCXt7GGp/xZbk81lOZoXi1s=;
 b=ROkROAki3wezeP/tDfVM0Oy6Uq2k06DZjtmB/JuiErH8AVi538Q4HD8jSn+muG7I3Fjl4k
 +/vWjFUeJ6raBEhTuaZhA0KWK9ceqkFOFKykuqaOxtDQyhyxoH1d4F/Vd3xWKCicTa3ZAr
 PFi8PecU9OAAabw9vuTP9ov/K1vWSPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-R1uuMAwTNmCwYpGkIEgrPQ-1; Tue, 26 Jan 2021 13:32:23 -0500
X-MC-Unique: R1uuMAwTNmCwYpGkIEgrPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C61B918C8C0E;
 Tue, 26 Jan 2021 18:32:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-182.ams2.redhat.com [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48FB572167;
 Tue, 26 Jan 2021 18:32:20 +0000 (UTC)
Subject: Re: [PATCH v3] configure: Only build s390-ccw BIOS when system
 emulation is built
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210125165826.2894021-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6bf30108-0448-9d21-608b-e7cf19f03a90@redhat.com>
Date: Tue, 26 Jan 2021 19:32:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125165826.2894021-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/2021 17.58, Philippe Mathieu-Daudé wrote:
> It is pointless to build the s390-ccw BIOS when only user-mode
> emulation is built. Only build it when s390 system mode emulation
> is selected.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3: Restrict to s390x host (thuth)
> v2: Restrict to s390x-softmmu target (thuth)
> ---
>   configure | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index dcc5ea7d630..4751d3e352d 100755
> --- a/configure
> +++ b/configure
> @@ -5372,8 +5372,14 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
>       done
>   fi
>   
> +s390_ccw_bios=no
> +# Only build s390-ccw bios if we're targetting s390x system emulation
> +case $target_list in
> +  *"s390x-softmmu"*) s390_ccw_bios=yes
> +  ;;
> +esac
>   # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
> -if test "$cpu" = "s390x" ; then
> +if test "$cpu" = "s390x" && test "$s390_ccw_bios" = yes; then

Looks good to me now ... but maybe it could even be done simpler (without 
the case statement) by simply doing:

  if test "$cpu" = "s390x" && echo "$target_list" | grep -q s390x-softmmu ; then
  ...

?

  Thomas


