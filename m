Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6C4C0DA8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 08:54:40 +0100 (CET)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMmTv-00087A-LY
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 02:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMmRB-0006A4-PQ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 02:51:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMmRA-0006q3-AO
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 02:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645602706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BP/ENfiUrhNuqUXtdh/B7Xe85zgsokP2TITJn7Vy+1E=;
 b=Q0L6Nft6xqaCDF8CMNO+CVhGN3cV7EWcWP5U00ji+GQQKAs1qBobvcWUb5lTgAk2HoF74G
 bOu674qbdhU4jhVYCQr4IstpEybYdKn8yvWCyqt5auJebahj0FNb5IrXsqvR6jBmzyvzhp
 u1gxra2zAGh/90roseX9ELFUB/JsQiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-E4tSaFHCNxWNZVa2zNKsTQ-1; Wed, 23 Feb 2022 02:51:45 -0500
X-MC-Unique: E4tSaFHCNxWNZVa2zNKsTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977811091DA8;
 Wed, 23 Feb 2022 07:51:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 538CA103BAC7;
 Wed, 23 Feb 2022 07:51:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D63B721608D8; Wed, 23 Feb 2022 08:51:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Holler <fabian.holler@simplesurance.de>
Subject: Re: [PATCH v2] qapi/migration: Fix examples document wrong field
 name for arguments
References: <20220222170116.63105-1-fabian.holler@simplesurance.de>
Date: Wed, 23 Feb 2022 08:51:31 +0100
In-Reply-To: <20220222170116.63105-1-fabian.holler@simplesurance.de> (Fabian
 Holler's message of "Tue, 22 Feb 2022 18:01:16 +0100")
Message-ID: <875yp6ggvw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Holler <fabian.holler@simplesurance.de> writes:

> The examples for the snapshot-* and calc-dirty-rate commands document
> that arguments for the commands are passed in a 'data' field.
> This is wrong, passing them in a "data" field results in
> the error:
>   {"error": {"class": "GenericError", "desc": "QMP input member 'data'
> 		       is unexpected"}}
> Arguments are expected to be passed in an field called "arguments".
>
> Replace "data" with "arguments" in the snapshot-* and calc-dirty-rate
> command examples.
>
> Signed-off-by: Fabian Holler <fabian.holler@simplesurance.de>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Queued, thanks!


