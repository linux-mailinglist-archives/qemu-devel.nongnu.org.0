Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67A5FA138
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:38:31 +0200 (CEST)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohurN-0003Rz-V9
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ohuZS-0007kA-RR
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ohuZP-00055n-7J
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665415193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sgmIBip81EAKyjZmg3HIJ8LqSWSfc/ifVaTr5Yrxhas=;
 b=aGvG4nVCUXw9HD66DibqRYD41o75B/dMz6j2N9PQN1GvjSXPArgZ5lYIhJPWgInMxeNEgJ
 hOSxguPRx5cTVlxc/uhw3edBZ2FGhQXY1UFBUdUEBr88nFfWQPW0/Zhb/RAnVd+19fcCFz
 CF1z/iuUeR8opQcCKiY06Nv533kpr0g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-KYPAKQxzP7GBcHMBs-SqXw-1; Mon, 10 Oct 2022 11:19:50 -0400
X-MC-Unique: KYPAKQxzP7GBcHMBs-SqXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F7871C05197;
 Mon, 10 Oct 2022 15:19:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6294B145D82C;
 Mon, 10 Oct 2022 15:19:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com
Subject: Re: [PATCH] s390x/pv: remove semicolon from macro definition
In-Reply-To: <20221010151041.89071-1-imbrenda@linux.ibm.com>
Organization: Red Hat GmbH
References: <20221010151041.89071-1-imbrenda@linux.ibm.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 10 Oct 2022 17:19:46 +0200
Message-ID: <874jwbn1t9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 10 2022, Claudio Imbrenda <imbrenda@linux.ibm.com> wrote:

> Remove spurious semicolon at the end of the macro s390_pv_cmd
>
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  hw/s390x/pv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


