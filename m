Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150A527D2A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 07:51:58 +0200 (CEST)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqTe8-0002tY-Qy
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 01:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqTZE-0001Er-LW
 for qemu-devel@nongnu.org; Mon, 16 May 2022 01:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqTZC-0001Ym-5x
 for qemu-devel@nongnu.org; Mon, 16 May 2022 01:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652680008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2CWEeabG9WtzdE4oxV03LaH9b4hrXAV7VI0UAdL4cQY=;
 b=er5OjxPVMf7waS5+6IbHsED7+PdGgAAXBbPMFA0sDKPFeEvhPHRvu6hbrfvKc7zSMTo/qL
 YOoopaN6Yijm8o0ZBAb8Ea7QXjMGSK6IVdkAPjcw40q+lav+T2T4YYKVuQtBx6+whfhxyI
 zOEp6/U2IYUwgTs13AhKfUkCUY+X9ZY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390--SwKVsNEN7-W9Il8rZhkXg-1; Mon, 16 May 2022 01:46:44 -0400
X-MC-Unique: -SwKVsNEN7-W9Il8rZhkXg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7235811E75;
 Mon, 16 May 2022 05:46:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 440E15737A3;
 Mon, 16 May 2022 05:46:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 21BA821E690D; Mon, 16 May 2022 07:46:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org,  Juan Quintela <quintela@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>,  Eric Blake <eblake@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  qemu-block@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Eduardo Habkost
 <eduardo@habkost.net>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Yanan Wang <wangyanan55@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 0/8] qapi: Primarily whitespace tweaks
References: <20220503073737.84223-1-abologna@redhat.com>
Date: Mon, 16 May 2022 07:46:42 +0200
In-Reply-To: <20220503073737.84223-1-abologna@redhat.com> (Andrea Bolognani's
 message of "Tue, 3 May 2022 09:37:29 +0200")
Message-ID: <87ilq6ghbx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrea Bolognani <abologna@redhat.com> writes:

> If patch 8/8 is accepted, 7/8 should be squashed into it to reduce
> churn.

Done & queued.  Thanks!


