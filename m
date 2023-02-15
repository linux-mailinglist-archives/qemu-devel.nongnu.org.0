Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCAD697C3D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:50:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHEY-0007Ri-To; Wed, 15 Feb 2023 07:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSHEW-0007MI-D1
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:50:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSHEU-0003mq-Nh
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676465398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DMeeeWf+v+tyzPmtXGI8UpBpgc+F/O3p/q4FvtQEfLk=;
 b=cYZhQ/dqtgfJSZM8HxGbE72plUIfkuLp99WzZvw3qm8FoZm2rH4qq/c3zv2SAPV7whv3Ic
 oFzDQmuLgvcTwkHFzEtoCgNze02S/DCAjXrWIeo2bPYIq6QXq8xuqWIySu0jv/LKeu3FU6
 834JCJM4CEt/Vi2WMbnH4MhELgBePg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-uru0VrT1P4u5MhVldYcUpQ-1; Wed, 15 Feb 2023 07:49:47 -0500
X-MC-Unique: uru0VrT1P4u5MhVldYcUpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96C823C0F229;
 Wed, 15 Feb 2023 12:49:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A14D2166B30;
 Wed, 15 Feb 2023 12:49:45 +0000 (UTC)
Date: Wed, 15 Feb 2023 13:49:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, den@openvz.org,
 stefanha@redhat.com, hreitz@redhat.com, alexander.ivanov@virtuozzo.com
Subject: Re: [PATCH] MAINTAINERS: drop Vladimir from parallels block driver
Message-ID: <Y+zU6KaRTGUqoHJf@redhat.com>
References: <20230214182848.1564714-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214182848.1564714-1-vsementsov@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 14.02.2023 um 19:28 hat Vladimir Sementsov-Ogievskiy geschrieben:
> I have to admit this is out of my scope now. Still feel free to Cc me
> directly if my help is needed :)
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks, applied to the block branch.

Kevin


