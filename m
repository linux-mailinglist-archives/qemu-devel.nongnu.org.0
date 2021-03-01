Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A62F3287EE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:35:48 +0100 (CET)
Received: from localhost ([::1]:54536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmSR-00030i-8v
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lGmQu-0002U7-SB
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lGmQn-0004gK-2b
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614620043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NI9e03RW2jVOK6PVzblC3HkZ1aM+Ukit58nN3msfF68=;
 b=a4MluFUh85JZ0VdclJ2SYC8eIeTegbBWx/UMWXXh0T1foWgz3SNic2VC33ySc55fjrtW+V
 JaAcQe+RBCtqevdjXAyM6tAndXmyNRs32+HFa5cNOmq2M65rWQFYg2yPdMGbA9Jghwn5U+
 y2ywzdqpyXIgOgnrP4KzHPBxecEnZgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-naWybSTWM8WQNWaHV7ckdA-1; Mon, 01 Mar 2021 12:33:49 -0500
X-MC-Unique: naWybSTWM8WQNWaHV7ckdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D862D18BA293
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 17:33:48 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46E365D9E3;
 Mon,  1 Mar 2021 17:33:45 +0000 (UTC)
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210301172837.20146-1-ckuehl@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <26e22fef-086f-6e8c-14f2-d7fc7113846b@redhat.com>
Date: Mon, 1 Mar 2021 11:33:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301172837.20146-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: jsnow@redhat.com, hhan@redhat.com, stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 11:28 AM, Connor Kuehl wrote:
> The contents of this patch were initially developed and posted by Han
> Han[1], however, it appears the original patch was not applied. Since
> then, the relevant documentation has been moved and adapted to a new
> format.
> 
> I've taken most of the original wording and tweaked it according to
> some of the feedback from the original patch submission. I've also
> adapted it to restructured text, which is the format the documentation
> currently uses.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg01253.html
> 
> Reported-by: Han Han <hhan@redhat.com>
> Co-developed-by: Han Han <hhan@redhat.com>

Unusual tag, and his original email has Signed-off-by.  It's easier to
just reuse S-o-b here.

> Fixes: https://bugzilla.redhat.com/1763105
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  docs/tools/qemu-img.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index b615aa8419..5cc585dc27 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -866,6 +866,18 @@ Supported image file formats:
>      issue ``lsattr filename`` to check if the NOCOW flag is set or not
>      (Capital 'C' is NOCOW flag).
>  
> +  ``data_file``
> +    Pathname that refers to a file that will store all guest data. If
> +    this option is used, the qcow2 file will only contain the image's
> +    metadata.
> +
> +  ``data_file_raw``
> +    If this option is set to ``on``, QEMU will always keep the external
> +    data file consistent as a standalone read-only raw image. The default
> +    value is ``off``.
> +
> +    This option can only be enabled if ``data_file`` is set.
> +
>  ``Other``
>  
>    QEMU also supports various other image file formats for
> 

Otherwise,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


