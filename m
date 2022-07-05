Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAECD56733E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:49:51 +0200 (CEST)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8koB-0006zi-2T
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1o8km2-0004Be-1A
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:47:38 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:24081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1o8km0-00010j-JQ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:47:37 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-LGmAI1_rOHesgANyIZgdOQ-1; Tue, 05 Jul 2022 11:47:12 -0400
X-MC-Unique: LGmAI1_rOHesgANyIZgdOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92545803524;
 Tue,  5 Jul 2022 15:47:11 +0000 (UTC)
Received: from bahia (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E2AC9D7F;
 Tue,  5 Jul 2022 15:47:10 +0000 (UTC)
Date: Tue, 5 Jul 2022 17:47:09 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org, David Gibson
 <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org
Subject: Re: [PATCH] target/ppc/cpu-models: Remove the "default" CPU alias
Message-ID: <20220705174709.0c584bf0@bahia>
In-Reply-To: <20220705151030.662140-1-thuth@redhat.com>
References: <20220705151030.662140-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue,  5 Jul 2022 17:10:30 +0200
Thomas Huth <thuth@redhat.com> wrote:

> QEMU emulates a *lot* of PowerPC-based machines - having a CPU
> that is named "default" and cannot be used with most of those
> machines sounds just wrong. Thus let's remove this old and confusing
> alias now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Good riddance !

Reviewed-by: Greg Kurz <groug@kaod.org>

>  target/ppc/cpu-models.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 976be5e0d1..2667440f73 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -918,6 +918,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>  #endif
>      { "ppc32", "604" },
>      { "ppc", "604" },
> -    { "default", "604" },
> +
>      { NULL, NULL }
>  };


