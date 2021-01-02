Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C02E86CE
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 09:45:13 +0100 (CET)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvcX9-0001DB-O5
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 03:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kvcW4-0000lc-72
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 03:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kvcW1-00005D-DG
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 03:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609577038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qu8X8xqbrCEDA5oU6+djhmrGn+6quVz3xMo5Vld+DLo=;
 b=R5pzzxRTZnrdd/r6KYpLkAQL3B8I5JlsyVs2HB5ScHL7iVVRpx9AjF6QemoE4dht957yEP
 xKOeOWStoXuSqP9xC2NOiNazPEZNhOLYwVI1B4hIPhZ0FUh/D1rvBBOT0koRT4EDnwzosR
 Wpsq9cnt+/4Xcb4buJn6g8KkarHrMHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-M9Zqai-fMEqFOy4vh4T2vw-1; Sat, 02 Jan 2021 03:43:54 -0500
X-MC-Unique: M9Zqai-fMEqFOy4vh4T2vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB3E7801A9E;
 Sat,  2 Jan 2021 08:43:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B739660BF3;
 Sat,  2 Jan 2021 08:43:49 +0000 (UTC)
Subject: Re: [PATCH 01/16] tcg/s390x: Rename from tcg/s390
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201225201956.692861-1-richard.henderson@linaro.org>
 <20201225201956.692861-2-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c1a50435-51d8-fb24-65ae-2c474e1aa5b0@redhat.com>
Date: Sat, 2 Jan 2021 09:43:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201225201956.692861-2-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.749, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/12/2020 21.19, Richard Henderson wrote:
> This emphasizes that we don't support s390, only 64-bit s390x hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build                             | 2 --
>   tcg/{s390 => s390x}/tcg-target-conset.h | 0
>   tcg/{s390 => s390x}/tcg-target-constr.h | 0
>   tcg/{s390 => s390x}/tcg-target.h        | 0
>   tcg/{s390 => s390x}/tcg-target.c.inc    | 0
>   5 files changed, 2 deletions(-)
>   rename tcg/{s390 => s390x}/tcg-target-conset.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target-constr.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)
> 
> diff --git a/meson.build b/meson.build
> index 372576f82c..a6c8b4d431 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -117,8 +117,6 @@ if 'CONFIG_TCG_INTERPRETER' in config_host
>     tcg_arch = 'tci'
>   elif config_host['ARCH'] == 'sparc64'
>     tcg_arch = 'sparc'
> -elif config_host['ARCH'] == 's390x'
> -  tcg_arch = 's390'
>   elif config_host['ARCH'] in ['x86_64', 'x32']
>     tcg_arch = 'i386'
>   elif config_host['ARCH'] == 'ppc64'
> diff --git a/tcg/s390/tcg-target-conset.h b/tcg/s390x/tcg-target-conset.h
> similarity index 100%
> rename from tcg/s390/tcg-target-conset.h
> rename to tcg/s390x/tcg-target-conset.h
> diff --git a/tcg/s390/tcg-target-constr.h b/tcg/s390x/tcg-target-constr.h
> similarity index 100%
> rename from tcg/s390/tcg-target-constr.h
> rename to tcg/s390x/tcg-target-constr.h
> diff --git a/tcg/s390/tcg-target.h b/tcg/s390x/tcg-target.h
> similarity index 100%
> rename from tcg/s390/tcg-target.h
> rename to tcg/s390x/tcg-target.h
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> similarity index 100%
> rename from tcg/s390/tcg-target.c.inc
> rename to tcg/s390x/tcg-target.c.inc
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


