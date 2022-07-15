Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C510F575D8D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:39:42 +0200 (CEST)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCGrN-0000Bl-SO
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGp3-0006O8-0V
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:37:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGp1-0003T8-5T
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657874234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtDTC21+MctXDpc4Ypi92CB4UXfrX2aKWVDFCk5iIFI=;
 b=BPEx1UPAS9UNM0U7JpJ9dEJrFktFFKeAroukl8oUoIF6vv6OdRVxqF3HWfTJqMIUX7MoZl
 1iaOH/xzStl/rGPYIK6l7pYYI2w8WgIa8Vvo0XtWJzBUJODcuXIOW43sznNaYOZdQuwC5K
 RjqbK+lGu0glRfX2pQcokm1R06Q1WMA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-a7LG1UaMPM-Mq82btfJhQQ-1; Fri, 15 Jul 2022 04:37:05 -0400
X-MC-Unique: a7LG1UaMPM-Mq82btfJhQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ADEE811E75;
 Fri, 15 Jul 2022 08:37:05 +0000 (UTC)
Received: from localhost (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F252540E8B04;
 Fri, 15 Jul 2022 08:37:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, David Hildenbrand <david@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 3/3] target/arm: display deprecation note in '-cpu help'
In-Reply-To: <20220714150735.1835166-4-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220714150735.1835166-1-berrange@redhat.com>
 <20220714150735.1835166-4-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 15 Jul 2022 10:37:03 +0200
Message-ID: <87sfn23h74.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Thu, Jul 14 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The deprecation notes are currently only displayed at runtime when the
> user activates a CPU. The QMP query displays a simple flag for
> deprecation, while '-cpu help' displays nothing unless the deprecation
> info is duplicated into the 'notes' field.
>
> This changes the code so that deprecation notes are explicitly shown
> in '-cpu help', to assist the user in deciding what to use.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/arm/helper.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


