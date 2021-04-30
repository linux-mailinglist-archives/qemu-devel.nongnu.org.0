Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAD36FCAF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:48:35 +0200 (CEST)
Received: from localhost ([::1]:46030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcURW-0006lq-7U
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcUOl-0005JM-7W
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcUOf-0006QX-SW
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619793933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SJ4eTLgXAnLugaLdWuwopQ4rQLxZEBUGiVIlEjp7iY=;
 b=Q7iC78e6ADVuJjVa1TKIq61XM0J3e5+Ea1bR+i4wkZGVR/QEOJ7Nkfur0f0RezHf9HdThv
 wuQWju5iHA5sdJcC14QedW21WJWJoqV9mqvs9FlVjx507b2CXJAblAdzYLVUc8BMBppUUV
 YA3EYmKomC0caMgfEg+Vun2zBr71ukg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-k3FW5QVrOxuE0X4Nd0BGoQ-1; Fri, 30 Apr 2021 10:45:31 -0400
X-MC-Unique: k3FW5QVrOxuE0X4Nd0BGoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F03CC801F98;
 Fri, 30 Apr 2021 14:45:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E6B19C45;
 Fri, 30 Apr 2021 14:45:24 +0000 (UTC)
Subject: Re: [PATCH v2] Document qemu-img options data_file and data_file_raw
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210430133452.253102-1-ckuehl@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3f24af14-f324-1707-37b9-cbfc9bd082dd@redhat.com>
Date: Fri, 30 Apr 2021 16:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430133452.253102-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.04.21 15:34, Connor Kuehl wrote:
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
> Fixes: https://bugzilla.redhat.com/1763105
> Signed-off-by: Han Han <hhan@redhat.com>
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
> Changes since v1:
>    * Clarify different behaviors with these options when using qemu-img
>      create vs amend (Max)
>    * Touch on the negative case of how the file becomes inconsistent
>      (John)
> 
>   docs/tools/qemu-img.rst | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index c9efcfaefc..87b4a65535 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -866,6 +866,26 @@ Supported image file formats:
>       issue ``lsattr filename`` to check if the NOCOW flag is set or not
>       (Capital 'C' is NOCOW flag).
>   
> +  ``data_file``
> +    Filename where all guest data will be stored. If this option is used,
> +    the qcow2 file will only contain the image's metadata.
> +
> +    Note: Data loss will occur if the given filename already exists when
> +    using this option with ``qemu-img create`` since ``qemu-img`` will create
> +    the data file anew, overwriting the file's original contents. To simply
> +    update the reference to point to the given pre-existing file, use
> +    ``qemu-img amend``.
> +
> +  ``data_file_raw``
> +    If this option is set to ``on``, QEMU will always keep the external
> +    data file consistent as a standalone read-only raw image. It does
> +    this by forwarding updates through to the raw image in addition to
> +    updating the image metadata. If set to ``off``, QEMU will only
> +    update the image metadata without forwarding the changes through
> +    to the raw image. The default value is ``off``.

Hm, what updates and what changes?  I mean, the first part makes sense 
(the “It does this by...”), but the second part doesn’t.  qemu will 
still forward most writes to the data file.  (Not all, but most.)

(Also, nit pick: With data_file_raw=off, the data file is not a raw 
image.  (You still call it that in the penultimate sentence.))

When you write data to a qcow2 file with data_file, the data also goes 
to the data_file, most of the time.  The exception is when it can be 
handled with a metadata update, i.e. when it's a zero write or discard.

In addition, such updates (i.e. zero writes, I presume) not happening to 
the data file are usually a minor problem.  The real problem is that 
without data_file_raw, data clusters can be allocated anywhere in the 
data file, whereas with data_file_raw, they are allocated at their 
respective guest offset (i.e. the host offset always equals the guest 
offset).

I personally would have been fine with the first sentence, but if we 
want more of an explanation...  Perhaps:

<<EOF

If this option is set to ``on``, QEMU will always keep the external data 
file consistent as a standalone read-only raw image.

It does this by effectively forwarding all write accesses that happen to 
the qcow2 file to the raw data file, including their offsets. 
Therefore, data that is visible on the qcow2 node (i.e., to the guest) 
at some offset is visible at the same offset in the raw data file.

If this option is ``off``, QEMU will use the data file just to store 
data in an effectively arbitrary manner.  The file’s content will not 
make sense without the accompanying qcow2 metadata.  Where data is 
written will have no relation to its offset as seen by the guest, and 
some writes (specifically zero writes) may not be forwarded to the data 
file at all, but will only be handled by modifying qcow2 metadata.

In short: With data_file_raw, the data file reads as a valid raw VM 
image file.  Without it, its content can only be interpreted by reading 
the accompanying qcow2 metadata.

Note that this option only makes the data file valid as a read-only raw 
image.  You should not write to it, as this may effectively corrupt the 
qcow2 metadata (for example, dirty bitmaps may become out of sync).

EOF

This got longer than I wanted it to be.  Hm.  Anyway, what do you think?

Max

> +
> +    This option can only be enabled if ``data_file`` is set.
> +
>   ``Other``
>   
>     QEMU also supports various other image file formats for
> 


