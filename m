Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C347246FEA8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:22:53 +0100 (CET)
Received: from localhost ([::1]:37130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvd3E-0003el-TN
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:22:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mvcxr-0004Uk-RK
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:17:19 -0500
Received: from usb-smtp-delivery-124.mimecast.com ([170.10.151.124]:20358
 helo=us-smtp-delivery-124.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mvcxo-0001Ov-F8
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639131434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g9uBEBInYU4I8i04Un2U6pzkE/pkPzeTmrlWx0uJ3aE=;
 b=QqcJCD+2o+lIRKZKmIQ09Ch7JPzj+ofIKYOerE6e+C/rsxkfDQv2ebXe+IGmhyKxrOF7KQ
 +EA9/y5FcMeaJ9KEXzUSJBWrEX2WcjGTTK8bE8Krw9nOsSl7NcI3+FB6hvJlHxcV3GsGpe
 14PI1+9opTjxJp22+2KsnNEvJeWGrB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-h9iVCOFfNyOYRJXlZsVTDQ-1; Fri, 10 Dec 2021 05:17:13 -0500
X-MC-Unique: h9iVCOFfNyOYRJXlZsVTDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F5B0190A7AE;
 Fri, 10 Dec 2021 10:17:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E49A45D72;
 Fri, 10 Dec 2021 10:17:01 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 for-7.0] scripts: Explain the difference between
 linux-headers and standard-headers
In-Reply-To: <20211209194532.1502920-1-peter.maydell@linaro.org>
Organization: Red Hat GmbH
References: <20211209194532.1502920-1-peter.maydell@linaro.org>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Fri, 10 Dec 2021 11:16:59 +0100
Message-ID: <87y24ssr1g.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.151.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09 2021, Peter Maydell <peter.maydell@linaro.org> wrote:

> If you don't know it, it's hard to figure out the difference between
> the linux-headers folder and the include/standard-headers folder.
> So let's add a short explanation to clarify the difference.
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1 of this was from Thomas; I suggested some expanded wording
> and since that made the patch pretty much entirely my text
> Thomas suggested I send this under my name.
> ---
>  scripts/update-linux-headers.sh | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


