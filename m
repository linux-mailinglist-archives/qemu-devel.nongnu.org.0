Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA922792A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 09:04:36 +0200 (CEST)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxmKJ-000491-8n
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 03:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jxmJ2-0003jD-NC
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 03:03:16 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25649
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jxmJ0-0000l4-2G
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 03:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595314993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=u5d0bhXt3sfyqcWUcu3ZfzX3B20Z+uZolkLXl+v8n+A=;
 b=gk/aoF6kMvpPTzdFyn8p/yOdYhxp+djCzG/8jrsLr9rCb+HqhO6MCPNiXv/yqMMPdPoj1F
 NBnvtSNdE6HZAiRCMwrzNj1qZ+nzwxEmfS0c+UtxUmPXucKfZaHmBwmVNqMAztswnGDLko
 nYulXyvEZSNfAwDRyjddbdt69gBK5R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-jwdaaqWHPGGgJF9JergpuQ-1; Tue, 21 Jul 2020 03:03:11 -0400
X-MC-Unique: jwdaaqWHPGGgJF9JergpuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 223C51DE1;
 Tue, 21 Jul 2020 07:03:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-102.ams2.redhat.com [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D8476FEE9;
 Tue, 21 Jul 2020 07:03:06 +0000 (UTC)
Subject: Re: [PATCH] pc-bios: s390x: Add a comment to the io and external new
 PSW setup
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <033b0db7-7b7d-6eb0-9018-bcc342f13509@de.ibm.com>
 <20200715140820.3401-1-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <108aafd0-e82d-53b8-ef77-d8b9fb36a80f@redhat.com>
Date: Tue, 21 Jul 2020 09:03:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200715140820.3401-1-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:26:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: borntraeger@de.ibm.com, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/07/2020 16.08, Janosch Frank wrote:
> Normally they don't need to be set up before waiting for an interrupt
> but are set up on boot. The BIOS however might overwrite the lowcore
> (and hence the PSWs) when loading a blob into memory and therefore
> needs to set up those PSWs more often.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  pc-bios/s390-ccw/start.S | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/start.S b/pc-bios/s390-ccw/start.S
> index 01c4c21b26..b0fcb918cc 100644
> --- a/pc-bios/s390-ccw/start.S
> +++ b/pc-bios/s390-ccw/start.S
> @@ -64,7 +64,10 @@ consume_sclp_int:
>          stctg   %c0,%c0,0(%r15)
>          oi      6(%r15),0x2
>          lctlg   %c0,%c0,0(%r15)
> -        /* prepare external call handler */
> +        /*
> +         * Prepare external new PSW as it might have been overwritten
> +         * by a loaded blob
> +         */
>          larl %r1, external_new_code
>          stg %r1, 0x1b8
>          larl %r1, external_new_mask
> @@ -84,7 +87,10 @@ consume_io_int:
>          stctg %c6,%c6,0(%r15)
>          oi    4(%r15), 0xff
>          lctlg %c6,%c6,0(%r15)
> -        /* prepare i/o call handler */
> +        /*
> +         * Prepare i/o new PSW as it might have been overwritten
> +         * by a loaded blob
> +         */
>          larl  %r1, io_new_code
>          stg   %r1, 0x1f8
>          larl  %r1, io_new_mask
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


