Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE8857E3E2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:44:56 +0200 (CEST)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEupk-0001Ye-1f
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEuk3-0003HQ-N6
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEuk1-0004HO-CZ
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658504340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aykfvyqCb9m58XbbPo/5tK0OVCKJKFLRXLpb9/eTBA=;
 b=IP1+Akn38d06OBOY9MwkJLhWFPbhb5LdfPPrrj7ioQab8I/JiuBSQm2o1F6LFFZHVa+bU8
 56Mb5DfdA11ua03bA2NRHXhbspRbkgt7u9MLxKSb6/rdIBEcNOGFjKtkV83lZRpkhTgQSA
 f1DDJdyYG72XEf1+llMaV/AOSuVGruY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-Sa3v8O6tMfWZtfC8c90QrA-1; Fri, 22 Jul 2022 11:38:47 -0400
X-MC-Unique: Sa3v8O6tMfWZtfC8c90QrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 004E78001EA;
 Fri, 22 Jul 2022 15:38:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE064C27D95;
 Fri, 22 Jul 2022 15:38:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/3] target/s390x: display deprecation status in
 '-cpu help'
In-Reply-To: <20220722120224.2311982-3-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220722120224.2311982-1-berrange@redhat.com>
 <20220722120224.2311982-3-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 22 Jul 2022 17:38:45 +0200
Message-ID: <87zgh1ma2i.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 22 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> When the user queries CPU models via QMP there is a 'deprecated' flag
> present, however, this is not done for the CLI '-cpu help' command.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/s390x/cpu_models.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


