Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B960149108D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:06:05 +0100 (CET)
Received: from localhost ([::1]:57570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9XKO-0003PX-9k
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:06:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9XHL-0002h7-1e
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 14:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9XHH-00084U-FF
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 14:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642446169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqM5Femgz3FKQagpBb4W99xgvj1lWfM56AJYMMMEiIU=;
 b=E/ceiu86o1+uVpgVD1ZEIwga2zsV3MSOMRDiqbLiknUuJ9v+KxG7rUedgny9gkVr4zIprv
 H8pI/lkcAYSQYxsbu/3XkKP8UHdJ7K28Jb4QnGBSGqvPMQ5R9ahPogERI9pCBMkaghggy+
 lQyPwDGNRxt7PQ8HAkY/f2BWqWJ9LEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-9R4X3pZ5PviNTD3q8onoVA-1; Mon, 17 Jan 2022 14:02:44 -0500
X-MC-Unique: 9R4X3pZ5PviNTD3q8onoVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34A4A100CCC2;
 Mon, 17 Jan 2022 19:02:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A856760854;
 Mon, 17 Jan 2022 19:02:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 380EC11380A2; Mon, 17 Jan 2022 20:02:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: "Startup" meeting (was Re: Meeting today?)
References: <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
 <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
 <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
 <YeWjtxEcbb6jcbi8@redhat.com>
Date: Mon, 17 Jan 2022 20:02:37 +0100
In-Reply-To: <YeWjtxEcbb6jcbi8@redhat.com> (Kevin Wolf's message of "Mon, 17
 Jan 2022 18:13:27 +0100")
Message-ID: <87y23erxrm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Burton <mark.burton@greensocs.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 11.01.2022 um 11:22 hat Mark Burton geschrieben:
>> That is my understanding=E2=80=A6=20
>> See you there!
>
> Unfortunately, I missed this whole thread until now.
>
> If the meeting did happen, has anyone taken notes? And if so, where
> could I find them?

Yes, it did.  Juan, did you take notes?


