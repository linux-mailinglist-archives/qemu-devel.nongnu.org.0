Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649021925DE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 11:39:08 +0100 (CET)
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH3RD-0004wl-EH
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 06:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jH3Pj-0003Av-1O
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:37:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jH3Ph-0008BL-VV
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:37:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:26824)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jH3Ph-0008AM-Qt
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585132652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHaznfnPVqez8yEYXzBKo8nI6ISXDk14yDQ/zGwyu+I=;
 b=SQxHGB+QPOno/Nlu6wpSAzDn8R1n0/wlKp6OAaH/mpQ5wjy0GGP2b5HayqHVMkdj9Peono
 hzqZZCw9gbZ118xiLQ1bvwXVFqBBD4aqxoqePa2GaOZB1w/MuqYdq4/gft5O3ctKyDk2Ds
 vFIO4yzp0wwXZtY1UNtWbjXja3FRyw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-IiHb0iyrMnGHQvRo0wV3Eg-1; Wed, 25 Mar 2020 06:37:30 -0400
X-MC-Unique: IiHb0iyrMnGHQvRo0wV3Eg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C01418C8C01;
 Wed, 25 Mar 2020 10:37:29 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 126675DA83;
 Wed, 25 Mar 2020 10:37:26 +0000 (UTC)
Message-ID: <72b049dcec0391aa128879a3a301f04ba0afd3f3.camel@redhat.com>
Subject: Re: [PATCH v6 05/42] nvme: use constant for identify data size
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
Date: Wed, 25 Mar 2020 12:37:26 +0200
In-Reply-To: <20200316142928.153431-6-its@irrelevant.dk>
References: <20200316142928.153431-1-its@irrelevant.dk>
 <20200316142928.153431-6-its@irrelevant.dk>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-03-16 at 07:28 -0700, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 40cb176dea3c..f716f690a594 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -679,7 +679,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeIdentify *c)
>  
>  static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeIdentify *c)
>  {
> -    static const int data_len = 4 * KiB;
> +    static const int data_len = NVME_IDENTIFY_DATA_SIZE;
>      uint32_t min_nsid = le32_to_cpu(c->nsid);
>      uint64_t prp1 = le64_to_cpu(c->prp1);
>      uint64_t prp2 = le64_to_cpu(c->prp2);

I'll probably squash this with some other refactoring patch,
but I absolutely don't mind leaving this as is.
Fine grained patches never cause any harm.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky




