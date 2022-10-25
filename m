Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6F60D451
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 21:04:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onPAf-00072S-Rn; Tue, 25 Oct 2022 15:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onPAb-0006yE-G4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 15:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onPAZ-0006lg-Ur
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 15:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666724458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KR4+CXrjyjN9I/M7Hutebv26g9jr1AaZC8Ulfn5FMck=;
 b=dSxMYRchytDqzS6neim71GJYu5jbhuPDdAS6bO+DshdSi3hwmdlZ5sdT5U7WdrMbVH53tV
 GdsksPKrz+8oq4Q8qVBrIScYOsVnOrVgb0yImwm4IXTGaTJoecToS6fK1FvwxD8EQU0uZF
 rTSYTH/YR/DSrOsQhRQ4HQJsL9+nKb8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-CkKZguKlOFOLDKavPtWdTA-1; Tue, 25 Oct 2022 15:00:54 -0400
X-MC-Unique: CkKZguKlOFOLDKavPtWdTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD96A1C05EB0;
 Tue, 25 Oct 2022 19:00:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A0242028E98;
 Tue, 25 Oct 2022 19:00:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E0C021E6921; Tue, 25 Oct 2022 21:00:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com
Subject: Re: [PULL 00/28] QAPI patches patches for 2022-10-25
References: <20221025080541.271547-1-armbru@redhat.com>
 <CAJSP0QX5D-byMkpy0G_3rW-KXOKj=N5RDzTXTW_PazzHJYmtfw@mail.gmail.com>
Date: Tue, 25 Oct 2022 21:00:52 +0200
In-Reply-To: <CAJSP0QX5D-byMkpy0G_3rW-KXOKj=N5RDzTXTW_PazzHJYmtfw@mail.gmail.com>
 (Stefan Hajnoczi's message of "Tue, 25 Oct 2022 11:40:08 -0400")
Message-ID: <87k04nybh7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Tue, 25 Oct 2022 at 05:00, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:
>>
>>   Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)
>>
>> are available in the Git repository at:
>>
>>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-10-25
>
> Hi Markus,
> Please replace this with the HTTPS URL in future pull requests:
> https://repo.or.cz/qemu/armbru.git
>
> The unencrypted git:// protocol makes me nervous.

The signature on the tag should suffice to keep us safe.  But I made the
switch anyway, it can't hurt.


