Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55655197B23
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 13:47:11 +0200 (CEST)
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIsso-0004je-7F
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 07:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1jIsrn-0004J7-Vj
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 07:46:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1jIsrm-0003xN-HT
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 07:46:07 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:35324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1jIsrm-0003vB-84
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 07:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585568765;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRmjzLFJiE5slz7+3x6UupGRjSvBMbCa9O0khygW9K4=;
 b=fgjSe1rpcL75dJwONJsNmBRA1BWSSv5EOEZKpTfjTdteYHktylH/HMfJd41ztalSQlFaae
 qQiXOzq9WF7kRqArm8JWqFmo9PLxAV+xlI0WyloTe/FdW8OOxHrLJpGLr+oaQytTx7eKT9
 cBoB43lAoIpzFhSpyHvu4YfaDf0FRkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-XB14QAIyPlCR8SBhGMnjhw-1; Mon, 30 Mar 2020 07:46:03 -0400
X-MC-Unique: XB14QAIyPlCR8SBhGMnjhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 464F3DB20;
 Mon, 30 Mar 2020 11:46:02 +0000 (UTC)
Received: from redhat.com (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E563019756;
 Mon, 30 Mar 2020 11:46:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: Re: [PATCH v2] migration: fix bad indentation in error_report()
In-Reply-To: <09f7529c665cac0c6a5e032ac6fdb6ca701f7e37.1585329482.git.maozhongyi@cmss.chinamobile.com>
 (Mao Zhongyi's message of "Sat, 28 Mar 2020 01:19:08 +0800")
References: <09f7529c665cac0c6a5e032ac6fdb6ca701f7e37.1585329482.git.maozhongyi@cmss.chinamobile.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 30 Mar 2020 13:46:00 +0200
Message-ID: <87ftdqkqvb.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mao Zhongyi <maozhongyi@cmss.chinamobile.com> wrote:
> bad indentation conflicts with CODING_STYLE doc.
>
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


