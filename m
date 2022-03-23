Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC234E51AF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:57:14 +0100 (CET)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzc1-0000DT-NY
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:57:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nWz2W-00042b-Ov
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nWz2V-0004Ix-95
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648034429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EPQ9czlZyWg242y5U3h90INZOtvu+/OYIKsSMfHPxas=;
 b=cdK9nkwMZ2MwVsK/xnTxda/ijshyXsAFu6igHSqTkJd0NrDv1a+WTNvCBuZ/7lwoz7t9uk
 XU92a3f6tpbbuWPtBz41AcO2rfhpmm8yu+++k3hH0GwYvOkeUeTylY5GcWHui28JlZWjJ8
 sRFS/QRPA/zl/E63V/7bo0gsSxRvYdE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-2vzrTnfxN3S6ob4Q11q8lA-1; Wed, 23 Mar 2022 07:20:26 -0400
X-MC-Unique: 2vzrTnfxN3S6ob4Q11q8lA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BA0C1C05EC9;
 Wed, 23 Mar 2022 11:20:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D63C8C090DC;
 Wed, 23 Mar 2022 11:20:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 2/2] s390x/cpu_models: make "max" match the
 unmodified "qemu" CPU model under TCG
In-Reply-To: <20220322112256.118417-3-david@redhat.com>
Organization: Red Hat GmbH
References: <20220322112256.118417-1-david@redhat.com>
 <20220322112256.118417-3-david@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 23 Mar 2022 12:20:24 +0100
Message-ID: <878rt07w5j.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22 2022, David Hildenbrand <david@redhat.com> wrote:

> Before we were able to bump up the qemu CPU model to a z13, we included
> some experimental features during development in the "max" model only.
> Nowadays, the "max" model corresponds exactly to the "qemu" CPU model
> of the latest QEMU machine under TCG.
>
> Let's remove all the special casing, effectively making both models
> match completely from now on, and clean up.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu_models.c   | 26 +++++++-------------------
>  target/s390x/gen-features.c | 11 ++++++-----
>  2 files changed, 13 insertions(+), 24 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


