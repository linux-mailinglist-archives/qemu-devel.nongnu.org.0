Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6E2FD356
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:00:13 +0100 (CET)
Received: from localhost ([::1]:53064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Exw-0001q7-ED
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:00:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2EwU-0001Gb-8p
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:58:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2EwR-0000o9-D5
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611154717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qh+O3F1pRG/vLNskRWeYWMnW3IOoWFMXx2o9tG0imGw=;
 b=UBb5MVHk7saTH0usKN/PJpOqxzq9V+UD2n1Mo6mBrQGUS7rMEYEuZesNqh0GUgyrIxPLh/
 Q1/i+cdih9jJzutdnIRsNhSKCosqJ7rfMSPxfVHtaYNs622QRHddcVEBxs70F+YDNlspgz
 c0zf0z3B60OyMAiXDxEIF9oab083c/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-2OCWDjG6NwO-QW2BmwHmJA-1; Wed, 20 Jan 2021 09:58:34 -0500
X-MC-Unique: 2OCWDjG6NwO-QW2BmwHmJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB9C2806663;
 Wed, 20 Jan 2021 14:58:32 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DD4D60C74;
 Wed, 20 Jan 2021 14:58:29 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210118170308.282442-1-philmd@redhat.com>
 <20210118170308.282442-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [RFC PATCH 1/2] scsi/utils: Add INVALID_PARAM_VALUE sense code
 definition
Message-ID: <505a6e2f-a07b-5e1f-a6d0-3d32b6388bb3@redhat.com>
Date: Wed, 20 Jan 2021 08:58:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118170308.282442-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/scsi/utils.h | 2 ++
>  scsi/utils.c         | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/include/scsi/utils.h b/include/scsi/utils.h
> index fbc55882799..096489c6cd1 100644
> --- a/include/scsi/utils.h
> +++ b/include/scsi/utils.h
> @@ -57,6 +57,8 @@ extern const struct SCSISense sense_code_LBA_OUT_OF_RANGE;
>  extern const struct SCSISense sense_code_INVALID_FIELD;
>  /* Illegal request, Invalid field in parameter list */
>  extern const struct SCSISense sense_code_INVALID_PARAM;
> +/* Illegal request, Invalid value in parameter list */
> +extern const struct SCSISense sense_code_INVALID_PARAM_VALUE;
>  /* Illegal request, Parameter list length error */
>  extern const struct SCSISense sense_code_INVALID_PARAM_LEN;
>  /* Illegal request, LUN not supported */

Pre-existing: the term 'illegal' is suspect in computer science (the
code isn't breaking any laws); I prefer 'invalid'.  But that's a pet
peeve of mine, and not something you need to change here.

> diff --git a/scsi/utils.c b/scsi/utils.c
> index b37c2830148..793c3a6b9c9 100644
> --- a/scsi/utils.c
> +++ b/scsi/utils.c
> @@ -197,6 +197,11 @@ const struct SCSISense sense_code_INVALID_PARAM = {
>      .key = ILLEGAL_REQUEST, .asc = 0x26, .ascq = 0x00
>  };
>  
> +/* Illegal request, Invalid value in parameter list */
> +const struct SCSISense sense_code_INVALID_PARAM_VALUE = {
> +    .key = ILLEGAL_REQUEST, .asc = 0x26, .ascq = 0x01
> +};
> +
>  /* Illegal request, Parameter list length error */
>  const struct SCSISense sense_code_INVALID_PARAM_LEN = {
>      .key = ILLEGAL_REQUEST, .asc = 0x1a, .ascq = 0x00
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


