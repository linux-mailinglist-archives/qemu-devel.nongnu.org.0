Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5E2FD231
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:14:38 +0100 (CET)
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EFp-0003e1-60
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2EDD-00026b-2E
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:11:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2EDB-0001GB-GI
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611151912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4Py1Hu8t8mEcE/8p3KMHUy9VA8DGk8Zj6KBtTxime8=;
 b=ezi33L7UNnQbNt7pMCTYWPlFz87xa/KEEPduWEYgbJtNlejOP+X/XyGdhY2HcWvIL5iFFf
 NMJHMD69ymN1DH+kyT7twcJDwYJs9Y1nwyzOub01cCEVw74+l5u5q21NpqD5omKsLUMZnt
 I6XhRtJEcdFUnFFGpjbqXirNXd2pJuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-mWXj_nZiO9arNlNdqZfwHQ-1; Wed, 20 Jan 2021 09:11:49 -0500
X-MC-Unique: mWXj_nZiO9arNlNdqZfwHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DC22107ACE4;
 Wed, 20 Jan 2021 14:11:47 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE0EB100238C;
 Wed, 20 Jan 2021 14:11:40 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] hw/usb/dev-uas: Report command additional adb
 length as unsupported
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210118170308.282442-1-philmd@redhat.com>
 <20210118170308.282442-3-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3afd2eb9-e3fe-c337-2041-9785d5453e6b@redhat.com>
Date: Wed, 20 Jan 2021 08:11:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118170308.282442-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@FreeBSD.org>,
 qemu-block@nongnu.org, "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Han Han <hhan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> We are not ready to handle additional CDB data.
> 
> If a guest send a packet with such additional data,

sends

> report the command parameter as not supported.
> 
> We can then explicit there is nothing in this additional

then be explicit that there

> buffer, by fixing its size to zero.
> 
> This fixes an error when building with Clang 11:
> 
>   usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>       uas_iu                    status;
>                                 ^
> 
> Reported-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Ed Maste <emaste@FreeBSD.org>
> Cc: Han Han <hhan@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  hw/usb/dev-uas.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
> index cec071d96c4..b6434ad4b9c 100644
> --- a/hw/usb/dev-uas.c
> +++ b/hw/usb/dev-uas.c
> @@ -16,6 +16,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
> +#include "qemu/log.h"
>  
>  #include "hw/usb.h"
>  #include "migration/vmstate.h"
> @@ -70,7 +71,7 @@ typedef struct {
>      uint8_t    reserved_2;
>      uint64_t   lun;
>      uint8_t    cdb[16];
> -    uint8_t    add_cdb[];
> +    uint8_t    add_cdb[0];      /* not supported by QEMU */
>  } QEMU_PACKED  uas_iu_command;

Technically, a zero-sized array is also a gcc/clang extension, and may
bite us later if that extension starts triggering compiler complaints in
one of the two compilers, just as our current use of an extension is
causing grief in clang 11.  But in the short term, it works, and gets
rid of the more problematic extension of a dynamically-sized type
preventing the determination of a packed union containing that type.

>  
>  typedef struct {
> @@ -700,6 +701,11 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
>      uint32_t len;
>      uint16_t tag = be16_to_cpu(iu->hdr.tag);
>  
> +    if (iu->command.add_cdb_length > 0) {
> +        qemu_log_mask(LOG_UNIMP, "additional adb length not yet supported\n");
> +        goto unsupported_len;
> +    }
> +
>      if (uas_using_streams(uas) && tag > UAS_MAX_STREAMS) {
>          goto invalid_tag;
>      }
> @@ -735,6 +741,10 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
>      }
>      return;
>  
> +unsupported_len:
> +    usb_uas_queue_fake_sense(uas, tag, sense_code_INVALID_PARAM_VALUE);
> +    return;
> +
>  invalid_tag:
>      usb_uas_queue_fake_sense(uas, tag, sense_code_INVALID_TAG);
>      return;
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


