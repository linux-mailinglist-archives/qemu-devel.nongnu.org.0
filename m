Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C986462158
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:03:03 +0100 (CET)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmre-0000fa-94
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:03:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mrmYH-0002Ba-IZ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:43:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mrmYE-0005Q0-64
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638214975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=pG53GZexgUNACumkQeOEDtUYFWvJ6t7miATlqcklwmg=;
 b=gpk2A1KiKRWOztrTt2IeLtN0CG6SHAlLAD4DBv+erSQjGu8NBiDGod9JQXfcs2zE1ch4Va
 pXWu1ZQMQu8Y3Y+FzWiULrxePfuZ4RtyzTUyHYZ5lmnoqjMR0W7uqP2lh38JsplJOY3VW8
 KH3+qv2EjDbfE+8C6wOv4CPsPRhOAg4=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-UI4TICQ3PzOSsYmOqbtslw-1; Mon, 29 Nov 2021 14:42:53 -0500
X-MC-Unique: UI4TICQ3PzOSsYmOqbtslw-1
Received: by mail-vk1-f200.google.com with SMTP id
 m25-20020a056122215900b002fac70f81c1so9590977vkd.5
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 11:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pG53GZexgUNACumkQeOEDtUYFWvJ6t7miATlqcklwmg=;
 b=EVQv9HtG/l7nXjf3bMWXPOvsFdhvgDO5hPga4SzFbneU6XKihpVFeszE7ftXvTnUo6
 1mILQp7+Ig2HOAgqiSjIehc0tSZDIvwuUbSh60vTncGBXKh0kG+l4neLV+fsuELaRvJ+
 UaWZ00L5l0KF3ekCFn82PiVhQmfViJUFRT2eWyhQgMGEO76RoFxguAPK60gBM5UJchke
 7JAlhJFF/hdGYShBkgEnNNqQUvbq6F8d8RQnUdAujk0s6/UJOhB6g7Sg60tBdcaYCAAa
 9AI8Bi+a4xgu+9Nivsb/6xt6jH9abylAshQVHjum33E04QrcG2Y07vyhbowWLnym68KT
 n6LQ==
X-Gm-Message-State: AOAM532XmN6OPtfr/CNdQOlw5D3nV6i/nG3F0dezv/up69DEHp1TlF49
 jgsZBk/XrXhne3cgrTfMGcDwXE+Tr6BHzpoVkn00UmftrpiQxbU95i18C6gTxFr2dfjiot+Wkwt
 EJTcM66W4wQ3Rm14cyN26JC6aotIoJ8I=
X-Received: by 2002:a05:6122:790:: with SMTP id
 k16mr39506845vkr.26.1638214973227; 
 Mon, 29 Nov 2021 11:42:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxVjcz4rL/1lCM5xLTQ0YLi1U83pvMPn+oj3uMkYmdkzxk1Y6MIOQdxbOEr913VrDYDwMKcg0Nyhw0cGc1WKQ=
X-Received: by 2002:a05:6122:790:: with SMTP id
 k16mr39506808vkr.26.1638214972951; 
 Mon, 29 Nov 2021 11:42:52 -0800 (PST)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Mon, 29 Nov 2021 14:42:42 -0500
Message-ID: <CAFn=p-YJPcq0VyQNE-sfEsOVhWGxWOgwAXRz=bwQrLUHyiA1NQ@mail.gmail.com>
Subject: Observing VM Status Changes
To: Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000876aa505d1f2a52e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--000000000000876aa505d1f2a52e
Content-Type: text/plain; charset="UTF-8"

Is there a generic event for observing VM state changes? I see we have a
lot of bespoke events like "STOP", "RESUME", "SHUTDOWN" and so forth, but I
can't quickly and at a glance determine if we have a 1:1 correlation for
every QAPI RunState to a QMP Event announcing that state.

I'm looking at e.g. the PAUSED runstate and I can see it set in several
places:

migration/migration.c:            runstate_set(RUN_STATE_PAUSED);
migration/savevm.c:        runstate_set(RUN_STATE_PAUSED);

but for, say, the migration/savevm.c route, it doesn't look like it's
accompanied by a QMP event -- that appears to only be emitted by
softmmu/cpus.c -- and only when the vcpus were already running. In this
case, the savevm route only occurs before we've started the vCPUs.

So as far as I can tell, there's really no well-defined relationship
between the various events in qapi/run-state.json and the RunState
enumeration. This would make it hard for a client to keep track of the VM
state without having to re-query it a lot. Am I mistaken?

(I was looking into adding VM state into the qmp-shell tool such that it
spied on QMP events and updated a toolbar accordingly. However, not every
state seems to be preceded by an event, and not every event gives a strong
indication of what the resulting VM state would actually be. Some runstate
changes don't appear to be announced by any event at all.)

--000000000000876aa505d1f2a52e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is there a generic event for observing VM state chang=
es? I see we have a lot of bespoke events like &quot;STOP&quot;, &quot;RESU=
ME&quot;, &quot;SHUTDOWN&quot; and so forth, but I can&#39;t quickly and at=
 a glance determine if we have a 1:1 correlation for every QAPI RunState to=
 a QMP Event announcing that state.</div><div><br></div><div>I&#39;m lookin=
g at e.g. the PAUSED runstate and I can see it set in several places:</div>=
<div><br></div><div>migration/migration.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0runstate_set(RUN_STATE_PAUSED);</div><div>migration/savevm.c: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0runstate_set(RUN_STATE_PAUSED);</div><div><br></div=
><div>but for, say, the migration/savevm.c route, it doesn&#39;t look like =
it&#39;s accompanied by a QMP event -- that appears to only be emitted by s=
oftmmu/cpus.c -- and only when the vcpus were already running. In this case=
, the savevm route only occurs before we&#39;ve started the vCPUs.</div><di=
v><br></div><div>So as far as I can tell, there&#39;s really no well-define=
d relationship between the various events in qapi/run-state.json and the Ru=
nState enumeration. This would make it hard for a client to keep track of t=
he VM state without having to re-query it a lot. Am I mistaken?</div><div><=
br></div><div>(I was looking into adding VM state into the qmp-shell tool s=
uch that it spied on QMP events and updated a toolbar accordingly. However,=
 not every state seems to be preceded by an event, and not every event give=
s a strong indication of what the resulting VM state would actually be. Som=
e runstate changes don&#39;t appear to be announced by any event at all.)<b=
r></div></div>

--000000000000876aa505d1f2a52e--


