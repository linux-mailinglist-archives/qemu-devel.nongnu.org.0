Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBA131FA0F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:45:09 +0100 (CET)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD65k-0007O5-0y
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD631-0005fA-Fh
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:42:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD62t-0001BG-3H
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613742128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/MBIxzMiNPEXkiOWl7hBOV2ZlkOG0XzoeF3CwQl1xw=;
 b=hA3nHQKLHiVExSDBZk/XeSVOQ1+E31PDEoyc7kK1v4D1h3txajAzQHhE03A7lADCjbVj3K
 jChGuRyu1bfirKXlxjkpH5opmeEpwBWcBEeKtSH7adF3ymqNo4K/0nTlVMVoXJVnIfP6ar
 WniNItkfonSEZwwd/GJWaB/MgHpmNIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-mX2abOILNH-kY16to9ZyZg-1; Fri, 19 Feb 2021 08:42:06 -0500
X-MC-Unique: mX2abOILNH-kY16to9ZyZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5DD4801965;
 Fri, 19 Feb 2021 13:42:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52AEF5D720;
 Fri, 19 Feb 2021 13:41:59 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] css: SCHIB measurement block origin must be aligned
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-devel@nongnu.org
References: <1613741973-3711-1-git-send-email-pmorel@linux.ibm.com>
 <1613741973-3711-2-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c5d8de0c-9dab-ec80-3ac7-cd180baed81a@redhat.com>
Date: Fri, 19 Feb 2021 14:41:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613741973-3711-2-git-send-email-pmorel@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/02/2021 14.39, Pierre Morel wrote:
> The Measurement Block Origin inside the SCHIB is used when
> Measurement Block format 1 is in used and must be aligned
> on 64 bytes otherwise an operand exception is recognized
> when issuing the Modify Sub CHannel (MSCH) instruction.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   target/s390x/ioinst.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
> index a412926d27..1ee11522e1 100644
> --- a/target/s390x/ioinst.c
> +++ b/target/s390x/ioinst.c
> @@ -121,6 +121,12 @@ static int ioinst_schib_valid(SCHIB *schib)
>       if (be32_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_XMWME) {
>           return 0;
>       }
> +    /* for MB format 1 bits 26-31 of word 11 must be 0 */
> +    /* MBA uses words 10 and 11, it means align on 2**6 */
> +    if ((be16_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
> +        (be64_to_cpu(schib->mba) & 0x03fUL)) {
> +        return 0;
> +    }
>       return 1;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


