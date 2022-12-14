Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DE964C4EE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:19:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MWJ-0005CN-Hy; Wed, 14 Dec 2022 02:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MWF-0005B7-GQ
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:49:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MWD-0003v4-He
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SIJjWPkm0nwmrciogK8/dsVJxBQloZ227zGgDXyeHY=;
 b=bo4+35LceBPTzXyCRcpbPz80qmOloF1VXA3gE7L9jgaIFYx8t2Gs4+i/O1ERS2xZ2wvtGk
 /udlvJ3Cjqp1jMWggdFPcW3xkd0h4usLLIieWN8+vEaBKIEtBWOBVfKc0tE711898stdpe
 62xL2Xrq0qW9HjJ8hRuNa4919XEEDYU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-hWoDln15PsalzJ6FG--QAQ-1; Wed, 14 Dec 2022 02:49:31 -0500
X-MC-Unique: hWoDln15PsalzJ6FG--QAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8589C381494A
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 07:49:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 620AA40C2064
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 07:49:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 60E6E21E6900; Wed, 14 Dec 2022 08:49:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] include: Include headers where needed
References: <20221214074721.731441-1-armbru@redhat.com>
 <20221214074721.731441-4-armbru@redhat.com>
Date: Wed, 14 Dec 2022 08:49:28 +0100
In-Reply-To: <20221214074721.731441-4-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 14 Dec 2022 08:46:52 +0100")
Message-ID: <87tu1ymnlj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Resent by accident, please ignore this copy.


