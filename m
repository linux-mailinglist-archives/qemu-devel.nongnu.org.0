Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504335F061F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 09:58:46 +0200 (CEST)
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeAuz-0007JP-2a
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 03:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1oeArR-0004aO-4h
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1oeArP-0000SV-Ig
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664524501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1RObLdzCYmiMH6a+mT6g54tHLRcid0x4V/z/pnMMGi4=;
 b=aHaqPJfL2QUtS1O74SAeGpooqO1Z98WEgp7i+16QsDzEkMOdDpOHGI3JYYULnmCjY6rUZd
 +eRDV9Gtv99AjuKXe9HcEjh0GdQHBh0qz/axIzt6K72oAYafDj6tHbL9cyDnt0l+ELeFtQ
 /XdeylieYHI5RXAEiVnfyWXkhn3zA5U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-V6vU1-YfPMOlqGy6gy0VYw-1; Fri, 30 Sep 2022 03:53:30 -0400
X-MC-Unique: V6vU1-YfPMOlqGy6gy0VYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C82129324BA;
 Fri, 30 Sep 2022 07:53:30 +0000 (UTC)
Received: from fedora (unknown [10.43.2.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBEF440C6EC2;
 Fri, 30 Sep 2022 07:53:28 +0000 (UTC)
Date: Fri, 30 Sep 2022 09:53:26 +0200
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: dinglimin <dinglimin@cmss.chinamobile.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH] tests/migration: remove the unused local variable
Message-ID: <YzagdkDhECXpG2Md@fedora>
References: <20220928080555.2263-1-dinglimin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220928080555.2263-1-dinglimin@cmss.chinamobile.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On a Wednesday in 2022, dinglimin wrote:
>From: "dinglimin@cmss.chinamobile.com" <dinglimin@cmss.chinamobile.com>
>
>Remove the unused local variable "records".
>
>Signed-off-by: dinglimin <dinglimin@cmss.chinamobile.com>
>---
> tests/migration/guestperf/engine.py | 1 -
> 1 file changed, 1 deletion(-)

Unused since its introduction in 409437e16df273fc5f78f6cd1cb53023eaeb9b72

Reviewed-by: Ján Tomko <jtomko@redhat.com>

Jano


