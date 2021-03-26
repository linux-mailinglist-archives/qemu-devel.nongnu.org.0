Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05D34A441
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:27:35 +0100 (CET)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPikg-0007NG-D3
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPihu-0006Of-Dc
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPihq-0001M4-FN
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616750676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZF8ps/gTxzDVQIP89qCKvDtKRLsf00oPM3ACTq3Ow0=;
 b=FbI4hMhw2M3Jv2IJ5z174p7AzmnMiodv/uPYOR5j/xsP4kifAoq9aXoVx4k0hCFxDfVS7J
 /3cHmz84ZIjCF3sWpwg7aP9RDheEGe6m/ro6LMgfrmC2jOu7UrxLnHdqZGGbA7EvuGjvhE
 /4s1LlpQ29oNV0tH1lmWs7HiORNyGr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-VQihjycwMCu6jW-z9AJ6Dg-1; Fri, 26 Mar 2021 05:24:33 -0400
X-MC-Unique: VQihjycwMCu6jW-z9AJ6Dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 055091019630
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 09:24:33 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-48.ams2.redhat.com
 [10.36.113.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B28255DDAD;
 Fri, 26 Mar 2021 09:24:28 +0000 (UTC)
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210301172837.20146-1-ckuehl@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <794b64ea-3e5f-8387-76c4-240eeb2a1c67@redhat.com>
Date: Fri, 26 Mar 2021 10:24:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301172837.20146-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: jsnow@redhat.com, hhan@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.03.21 18:28, Connor Kuehl wrote:
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
> Fixes: https://bugzilla.redhat.com/1763105
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>   docs/tools/qemu-img.rst | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index b615aa8419..5cc585dc27 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -866,6 +866,18 @@ Supported image file formats:
>       issue ``lsattr filename`` to check if the NOCOW flag is set or not
>       (Capital 'C' is NOCOW flag).
>   
> +  ``data_file``
> +    Pathname that refers to a file that will store all guest data. If
> +    this option is used, the qcow2 file will only contain the image's
> +    metadata.

I think I would like a note here about the fact that when passing this 
option to qemu-img create, the given data file will be newly created, 
i.e. if it already contains data, all that data will be lost.  And 
perhaps also note that qemu-img amend on the other hand will only change 
the reference in the qcow2 file, so the given file should already exist 
and will not be overwritten.

(“Pathname that refers to a file” sounds like the file may already exist 
before this operation, which may give people ideas.  (Not that the ideas 
were bad, it’s just that they have to take care.  Referencing qemu-img 
amend should give them a hint on how to do it right.))

Max

> +
> +  ``data_file_raw``
> +    If this option is set to ``on``, QEMU will always keep the external
> +    data file consistent as a standalone read-only raw image. The default
> +    value is ``off``.
> +
> +    This option can only be enabled if ``data_file`` is set.
> +
>   ``Other``
>   
>     QEMU also supports various other image file formats for
> 


