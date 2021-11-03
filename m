Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A850443D5F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 07:43:05 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi9zE-0003vY-7l
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 02:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mi9x8-0002jE-2B
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mi9x4-00064Q-Am
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635921648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Wg7WyYx3TEXNV3kr0Pv8Xc/jePLgTFfEaeeDsKCYVU=;
 b=Z7wgKF6iG4aaJWVyKIyT1kVnDWqlT3D+GXYt1rkzBEumQptLiu6KITMV0sP5Qx+kSgePn/
 ExTqWg1qnJcxc4BQ7fbKibLB9DtR9ZzDE6qCyLX5wIIc1gkCq6K4b+yl85GJwcUINNPjps
 dmwkT4Q+hTNRwKJir4M6k1p+WTgZnKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-ekgkSVzlMnuP3edBMqwO2w-1; Wed, 03 Nov 2021 02:40:45 -0400
X-MC-Unique: ekgkSVzlMnuP3edBMqwO2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC74871805;
 Wed,  3 Nov 2021 06:40:43 +0000 (UTC)
Received: from [10.39.192.84] (unknown [10.39.192.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC85719723;
 Wed,  3 Nov 2021 06:40:32 +0000 (UTC)
Message-ID: <8af9f8ce-ae47-6be2-12e8-c197894a9109@redhat.com>
Date: Wed, 3 Nov 2021 07:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 2/4] docs: (further) remove non-reference uses of
 single backticks
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211102184400.1168508-1-jsnow@redhat.com>
 <20211102184400.1168508-3-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211102184400.1168508-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Alexander Bulekov <alxndr@bu.edu>, Eric Blake <eblake@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 19.43, John Snow wrote:
> The series rotted already. Here's the new changes.

Please change the patch description for the final commit (looks ugly in the 
git log otherwise)

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   docs/system/i386/sgx.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


