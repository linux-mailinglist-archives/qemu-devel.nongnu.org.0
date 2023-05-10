Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EF6FDC6E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 13:16:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhnv-0004qa-Ft; Wed, 10 May 2023 07:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwhnr-0004pQ-HE
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwhno-0001rn-10
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683717370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vb06uTZHD2amsvZo2fGYjcKGOYtUilec5gQlx1OgND8=;
 b=Tbl+M7wcVcdRYHDxpsOdIV2BUHx8AGcRFFyaUqnMJtSZ+PI8qBMWatTfuRgD4kTD7Fmjoi
 417wKg+xt1cuzov9HIN06WImPhSaI+e64jnz79EpCuNbnlmd26Y+POHEs6xCSDjAV/2goV
 iSKJbz9aX28YlQw6MVWuIuhUCz0RUn4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-B_9MU-RsP0CpLffiSjuyQg-1; Wed, 10 May 2023 07:16:07 -0400
X-MC-Unique: B_9MU-RsP0CpLffiSjuyQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D5E92811BC9;
 Wed, 10 May 2023 11:16:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C97D2026D25;
 Wed, 10 May 2023 11:16:05 +0000 (UTC)
Date: Wed, 10 May 2023 13:16:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 den@openvz.org, alexander.ivanov@virtuozzo.com
Subject: Re: [PATCH v8 2/5] blockdev: transactions: rename some things
Message-ID: <ZFt89PEmN7GWc1di@redhat.com>
References: <20230421115327.907104-1-vsementsov@yandex-team.ru>
 <20230421115327.907104-3-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421115327.907104-3-vsementsov@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 21.04.2023 um 13:53 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Look at qmp_transaction(): dev_list is not obvious name for list of
> actions. Let's look at qapi spec, this argument is "actions". Let's
> follow the common practice of using same argument names in qapi scheme
> and code.
> 
> To be honest, rename props to properties for same reason.
> 
> Next, we have to rename global map of actions, to not conflict with new
> name for function argument.
> 
> Rename also dev_entry loop variable accordingly to new name of the
> list.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


