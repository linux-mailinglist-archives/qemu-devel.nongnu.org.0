Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7235921338C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 07:35:07 +0200 (CEST)
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrELq-0001Mc-1n
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 01:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jrEL4-0000p7-Lo
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 01:34:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57894
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jrEL2-0006TB-Ru
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 01:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593754455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbYMKsvzLQ5XquOqWTtyZREyyg1cXbg4U4M5thGXZ3E=;
 b=GqdY2wf9GrtE4EI4tUxFM7f2eXYWzPbM8qyhmSqEkgXoy55JMONcOiOQcNVBSrG5CP1tWd
 gCfx4i/fm++XBg9vSbtR5P59jrUR44pUGzIcWcvDtb0Qe80VdSp8eXRXlJja6KeAuOWQrh
 +jZ2suCNx7B7tlSgh0vOUwP1Htsuhks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-Q8TuZL3jP-6XAzVUP4x4AA-1; Fri, 03 Jul 2020 01:34:13 -0400
X-MC-Unique: Q8TuZL3jP-6XAzVUP4x4AA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6559E7BB3;
 Fri,  3 Jul 2020 05:34:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 428D25BAE4;
 Fri,  3 Jul 2020 05:34:11 +0000 (UTC)
Subject: Re: [PATCH] softmmu/vl: Remove the check for colons in -accel
 parameters
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200618074001.13642-1-thuth@redhat.com>
Message-ID: <1a135eb1-8ea6-80f2-85d7-40c8da92c1d1@redhat.com>
Date: Fri, 3 Jul 2020 07:34:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200618074001.13642-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:34:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/06/2020 09.40, Thomas Huth wrote:
> The new -accel option does not accept colons in the parameters anymore
> (since it does not convert the parameters to -machine accel=... parameters
> anymore). Thus we can now remove the check for colons in -accel:
> 
> $ qemu-system-x86_64 -accel kvm:tcg
> qemu-system-x86_64: -accel kvm:tcg: invalid accelerator kvm:tcg
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   softmmu/vl.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index f669c06ede..273acfcf6b 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3485,11 +3485,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                       g_slist_free(accel_list);
>                       exit(0);
>                   }
> -                if (optarg && strchr(optarg, ':')) {
> -                    error_report("Don't use ':' with -accel, "
> -                                 "use -M accel=... for now instead");
> -                    exit(1);
> -                }
>                   break;
>               case QEMU_OPTION_usb:
>                   olist = qemu_find_opts("machine");
> 

Ping?

  Thomas


