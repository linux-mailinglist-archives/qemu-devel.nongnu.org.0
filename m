Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10FA38B22D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:47:55 +0200 (CEST)
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjxq-00005p-JY
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljjsv-0007rZ-IP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:42:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljjss-0008SC-IC
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621521765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3e9w3/EC4+QuS86ar5aOnA/P+FizFOzIr6J8HDF+5Vo=;
 b=IAe+/v03OjXC9bGnLFueoLr564Dj2U8U11O9O91V6t+KE8vciJJRJV4y5Ax6guWFHiowzg
 ikrKkQfUQPObKcnXaUDyGM9i7BNSnJl92+HpnqTcobGoSrvWjt9aC28+QjfZI2vFNKghQ2
 wQNSJ6lrCfeBqT+buAx7PPdFMrrGltc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-kHxfHl4IMYa01U2fS3K1_g-1; Thu, 20 May 2021 10:42:40 -0400
X-MC-Unique: kHxfHl4IMYa01U2fS3K1_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DFDE8042CF;
 Thu, 20 May 2021 14:42:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D405E159;
 Thu, 20 May 2021 14:42:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D690E113865F; Thu, 20 May 2021 16:42:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/6] qapi/parser: Allow empty QAPIDoc Sections
References: <20210519191718.3950330-1-jsnow@redhat.com>
 <20210519191718.3950330-3-jsnow@redhat.com>
Date: Thu, 20 May 2021 16:42:34 +0200
In-Reply-To: <20210519191718.3950330-3-jsnow@redhat.com> (John Snow's message
 of "Wed, 19 May 2021 15:17:14 -0400")
Message-ID: <87y2c94gbp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> It simplifies the typing to say that _section is always a
> QAPIDoc.Section().
>
> To accommodate this change, we must allow for this object to evaluate to
> False for functions like _end_section which behave differently based on
> whether or not a Section has been started.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> Probably a better fix is to restructure the code to prevent
> _end_section() from being called twice in a row, but that seemed like
> more effort, but if you have suggestions for a tactical fix, I'm open to
> it.

First step is to find out how _end_section() can be called twice in a
row.  It isn't in all of "make check".  Hmm.


