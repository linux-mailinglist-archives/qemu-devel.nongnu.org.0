Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5A3877F5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:44:48 +0200 (CEST)
Received: from localhost ([::1]:42232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liy9W-00070g-Nl
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1liy82-00062h-84
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1liy7v-0005Rd-HB
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621338186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IMw9RNsLqnb/ITbHR8eJtkGG9OvqZ5LL8p9cmXb4mw=;
 b=U6CUKBbtGd9QHEeWJBKBDIfreC3nKkf/HFV9yEojw6DQniltUJTeJ+35s2tgipDwSERUeZ
 Gi+YUjJygGChbwEuYslUv1BITkiGu9InPx10coHrvYNPNlkiFfqFwi1mUD0naKDKq9W1aZ
 oCN7Hn+wqbvFLcjBmC/EoOK935y7Eug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-sQvPmH1dMtissq_PSRQfGQ-1; Tue, 18 May 2021 07:43:02 -0400
X-MC-Unique: sQvPmH1dMtissq_PSRQfGQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C3A3106BB29;
 Tue, 18 May 2021 11:43:01 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C5832C154;
 Tue, 18 May 2021 11:42:59 +0000 (UTC)
Date: Tue, 18 May 2021 13:42:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl: allow not specifying size in -m when using -M
 memory-backend
Message-ID: <20210518134257.3f0ad212@redhat.com>
In-Reply-To: <20210518103531.104162-1-pbonzini@redhat.com>
References: <20210518103531.104162-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 12:35:31 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Starting in QEMU 6.0's commit f5c9fcb82d ("vl: separate
> qemu_create_machine", 2020-12-10), a function have_custom_ram_size()
> replaced the return value of set_memory_options().
> 
> The purpose of the return value was to record the presence of
> "-m size", and if it was not there, change the default RAM
> size to the size of the memory backend passed with "-M
> memory-backend".
> 
> With that commit, however, have_custom_ram_size() is now queried only
> after set_memory_options has stored the fixed-up RAM size in QemuOpts for
> "future use".  This was actually the only future use of the fixed-up RAM
> size, so remove that code and fix the bug.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: f5c9fcb82d ("vl: separate qemu_create_machine", 2020-12-10)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ac0ff6e160..21e55718a6 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2039,8 +2039,6 @@ static void set_memory_options(MachineClass *mc)
>          exit(EXIT_FAILURE);
>      }
>  
> -    /* store value for the future use */
> -    qemu_opt_set_number(opts, "size", ram_size, &error_abort);
>      maxram_size = ram_size;
>  
>      if (qemu_opt_get(opts, "maxmem")) {


