Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93769346DDD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:24:52 +0100 (CET)
Received: from localhost ([::1]:48780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqOJ-0006n0-Mn
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOqFk-0002Ix-2U
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:16:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOqFe-0005e2-OY
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616541352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAeJa2bOUEYhwiY+wklaHRbb92FxX81gSiFbwHgZG3c=;
 b=aHc/cmR0IW+xD3v+MxARdrZ8j661aU2qnzdCPoiffFZdZwGVIAuxxPnaEKFP0PoEAEzuIg
 rGDymuRf2fGiffc6Od3qZkJUY6gDZ9p9nvZ04HaSXdJOo2gVevbiknQecGfCx4jr2xXIEK
 TAtHdCfYKnQep/qwR30nLb4945nx4JI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-PkokeT7iOjy5tykozp3pkw-1; Tue, 23 Mar 2021 19:15:50 -0400
X-MC-Unique: PkokeT7iOjy5tykozp3pkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 751F81084D68
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 23:15:49 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 113962BFE9;
 Tue, 23 Mar 2021 23:15:45 +0000 (UTC)
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210301172837.20146-1-ckuehl@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <4e64ef24-ba3d-809c-6320-57965c353247@redhat.com>
Date: Tue, 23 Mar 2021 19:15:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301172837.20146-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: hhan@redhat.com, stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 12:28 PM, Connor Kuehl wrote:
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

I think it's okay to just keep the "Signed-off-by" from Han Han here, 
and the implication is that you are signing off on modifications you've 
made since.

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
> +

Might recommend "filename" simply for parity with *FILENAME* argument.

(This is the first appearance of "Pathname" in this file without spaces, 
though "Path name" is indeed used several times.)

> +  ``data_file_raw``
> +    If this option is set to ``on``, QEMU will always keep the external
> +    data file consistent as a standalone read-only raw image. The default
> +    value is ``off``.
> +
> +    This option can only be enabled if ``data_file`` is set.
> +

How does this interact with caching options, if it does? What happens in 
the negative case -- how does the file become inconsistent?

>   ``Other``
>   
>     QEMU also supports various other image file formats for
> 



