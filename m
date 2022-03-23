Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A64E514B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:27:53 +0100 (CET)
Received: from localhost ([::1]:54938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWz9c-0001HD-HP
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:27:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nWz0X-0001wq-BD
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nWz0V-0003Pg-Rp
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648034307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MudOOy6HSJ4zjkPjsTs8F7q0A149yODe1/dyM8hTFs=;
 b=Ye48YlavPIP52XI+lo07PoMIIPGHyOllB4EA/NCVVMOf4H7TQPe8H1kIVnSjRU9rsrKPCe
 BGRu6JIf0gJj1krT8K37BLL+EQoZBW812TMadc95OP5s0Reu10uTR8RjhJvf/cNiP8dgsD
 u4W04R7pnFIQmXOTujwuUJsxLCaHqcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-1AloPgxfPvylW_KrjVqdqg-1; Wed, 23 Mar 2022 07:18:24 -0400
X-MC-Unique: 1AloPgxfPvylW_KrjVqdqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC390185A7B2;
 Wed, 23 Mar 2022 11:18:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4189C141DEFA;
 Wed, 23 Mar 2022 11:18:23 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/2] s390x/cpu_models: drop "msa5" from the TCG "max"
 model
In-Reply-To: <20220322112256.118417-2-david@redhat.com>
Organization: Red Hat GmbH
References: <20220322112256.118417-1-david@redhat.com>
 <20220322112256.118417-2-david@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 23 Mar 2022 12:18:21 +0100
Message-ID: <87bkxw7w8y.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

> We don't include the "msa5" feature in the "qemu" model because it
> generates a warning. The PoP states:
>
> "The message-security-assist extension 5 requires
> the secure-hash-algorithm (SHA-512) capabilities of
> the message-security-assist extension 2 as a prereq-
> uisite. (March, 2015)"
>
> As SHA-512 won't be supported in the near future, let's just drop the
> feature from the "max" model. This avoids the warning and allows us for
> making the "max" model match the "qemu" model (except for compat
> machines). We don't lose much, as we only implement the function stubs
> for MSA, exclusing any real subfunctions.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/897
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/gen-features.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


