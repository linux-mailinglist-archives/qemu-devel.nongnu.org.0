Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D360338F2FC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:28:53 +0200 (CEST)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFJs-0002q7-Tv
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llFHg-00013g-Kc
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llFHf-0007Fm-1R
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621880794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WSLnUN65lFfDHA+mKKKcVWZDhw28mJSnvQNLHyWyRA=;
 b=PxbwKkzLn7IwZUauatJsihojf0dbsU7+UG7jwsqJzuOs/POwcbVVjBNHmIqADfpZYKiPzr
 6UiBPf8Jddz/2y0i/UJDqhtml2cOdYiHOhX610TC3GIFDBhbzVE4cCMYRfvurq3bHwakbs
 OUQG/yckxOuPiBLEVkAs9ZHrnVAdRRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-FMLItTiwO62krxE2i4B6Vw-1; Mon, 24 May 2021 14:26:30 -0400
X-MC-Unique: FMLItTiwO62krxE2i4B6Vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D20A801107;
 Mon, 24 May 2021 18:26:29 +0000 (UTC)
Received: from [10.10.116.202] (ovpn-116-202.rdu2.redhat.com [10.10.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 163B72ED6C;
 Mon, 24 May 2021 18:26:27 +0000 (UTC)
Subject: Re: [PATCH] docs: fix broken reference
To: qemu-trivial@nongnu.org
References: <20210511192950.2061326-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <40ae55ed-a1f3-68ff-118d-c3b270f3d85b@redhat.com>
Date: Mon, 24 May 2021 14:26:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511192950.2061326-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 5/11/21 3:29 PM, John Snow wrote:
> Long story short, we need a space here for the reference to work
> correctly.
> 
> 
> Longer story:
> 
> Without the space, kerneldoc generates a line like this:
> 
> one of :c:type:`MemoryListener.region_add\(\) <MemoryListener>`,:c:type:`MemoryListener.region_del\(\)
> 
> Sphinx does not process the role information correctly, so we get this
> (my pseudo-notation) construct:
> 
> <text>,:c:type:</text>
> <reference target="MemoryListener">MemoryListener.region_del()</reference>
> 
> which does not reference the desired entity, and leaves some extra junk
> in the rendered output. See
> https://qemu-project.gitlab.io/qemu/devel/memory.html#c.MemoryListener
> member log_start for an example of the broken output as it looks today.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 5728a681b27..3b9ca696061 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -571,7 +571,7 @@ struct MemoryListener {
>        * @log_start:
>        *
>        * Called during an address space update transaction, after
> -     * one of #MemoryListener.region_add(),#MemoryListener.region_del() or
> +     * one of #MemoryListener.region_add(), #MemoryListener.region_del() or
>        * #MemoryListener.region_nop(), if dirty memory logging clients have
>        * become active since the last transaction.
>        *
> 


