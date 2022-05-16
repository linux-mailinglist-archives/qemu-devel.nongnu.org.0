Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C94527D3C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 07:56:57 +0200 (CEST)
Received: from localhost ([::1]:43596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqTiy-0005bY-9g
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 01:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqTZz-0001ge-8L
 for qemu-devel@nongnu.org; Mon, 16 May 2022 01:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqTZx-0001fB-PC
 for qemu-devel@nongnu.org; Mon, 16 May 2022 01:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652680057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/kgVDXzh4DeX6cDSNsm8wzbGeAZdQOQM8+ouoFMxBWI=;
 b=g5X4cmg4cLkcBMJrnMvAAgu3Q+kmO7BKRVwzDdtioZC+GME6u0BdTEeCjJMd8Z8amsLoYB
 xs9oj4EbcYKOaHd9vzbEIZnGH/WBkDoohlfyyfBNlENo6fcFxDjJULmQOaJoEh6E7reWh0
 sfE0qPJSxt6xv6x7roOzmaCAKFfaUNU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-cFd0E67NNq2osbCKoCk5Ug-1; Mon, 16 May 2022 01:47:33 -0400
X-MC-Unique: cFd0E67NNq2osbCKoCk5Ug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB343979681;
 Mon, 16 May 2022 05:47:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4859740D282E;
 Mon, 16 May 2022 05:47:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 481D421E690D; Mon, 16 May 2022 07:47:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com,  eblake@redhat.com
Subject: Re: [PATCH] qapi/pragma: Tidy up comments
References: <20220510081433.3289762-1-armbru@redhat.com>
Date: Mon, 16 May 2022 07:47:32 +0200
In-Reply-To: <20220510081433.3289762-1-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 10 May 2022 10:14:33 +0200")
Message-ID: <87a6bighaj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Markus Armbruster <armbru@redhat.com> writes:

> Commit 05ebf841ef "qapi: Enforce command naming rules" inserted new
> code between a comment and the code it applies to.  Move the comment
> back to its code, and add one for the new code.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Queued.


