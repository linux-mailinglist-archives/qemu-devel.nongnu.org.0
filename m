Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491146A5F84
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:19:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5Ur-0005nc-PG; Tue, 28 Feb 2023 14:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pX5Uo-0005nP-O4
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:18:42 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pX5Um-0005Y6-Vm
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:18:42 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-536c02eea4dso303062647b3.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bgtx0d2xUbdEXGbg09kS2QGl5JRv9fkAvcagUrHQCvA=;
 b=eiKeChizTUTaTrSGxRop7Xw5criG4K7FllMxd46Mi5RiM891deY7kw9kRMKOdvdDUE
 Ru8V6vJVnjbdMFmMnBcpxwtpzIxGOi/smUtK+hlj94fhgHy7hx9wqml5QWgVxZ7QDWyT
 SX+toM0xFCT00lOtcdvqGuU+2ybOXlUFn6ImtkfuaI8+WrKUUf4FwEOqj79UM2i0B+MH
 oVfmhStTyxOz34R4PDqBf1PDCcjk9Dl2TndybWoaP08DiMr+rpMQymJ3myfQF+oSnwMk
 W+jTJ96r8g+XMuNx3pj7l9LOToA+kwBy9ZsalKV7omNlhW3H5xzit0MC5vyNy5xnNOvD
 +p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bgtx0d2xUbdEXGbg09kS2QGl5JRv9fkAvcagUrHQCvA=;
 b=aJ9xX4pVVtpwnJOlXqBfN0BDCCXNak1MFXS5b5a+On1JpQ/UQxsqpNNdKxm3pb95OK
 ONvdQOpy7q/UsCN1pZ1zdhkLO7Xyvq3JPK5d6n9xYZjC7rcltaJO53LK6vnSorp10ux9
 tcc/UcNzifLKDoY+M6dsW7Sy0L8Vco3IFfAI1iMvnINMR3YO/89Ev7Z1/dbSmS/Xpd+D
 lQqaABOmaej5fYCbkrOE6f4778teYUvF+QcyrKrEBweiiGdZSWPLjIpWh0Ya3U7NpOHa
 tgF7IGroompkAGrJ9ik8SSbG6MwRyJNNSzKMycCKc9lQ/dk0B6KacHysjxh2ep+S7uUu
 gw1A==
X-Gm-Message-State: AO0yUKVvqpDDm2eHXQnUL21Lo37xrcGhpIZnC3vFJBGzUDxwJ1Zwigub
 aj1/oxbcm7WWR1Mh0p282CcEqLGgC2ST4gcXTIA=
X-Google-Smtp-Source: AK7set/XLZ7lobv72yfzN4DvD4gz4CO41MLOk3YUWH4fz5iHIJMWZjQDFPwS/AlT9r8ii4ZGF6A9CEGm3fUJLHb8fQY=
X-Received: by 2002:a81:ae24:0:b0:52e:b48f:7349 with SMTP id
 m36-20020a81ae24000000b0052eb48f7349mr1027979ywh.6.1677611917963; Tue, 28 Feb
 2023 11:18:37 -0800 (PST)
MIME-Version: 1.0
References: <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora> <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230228094756-mutt-send-email-mst@kernel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 28 Feb 2023 14:18:25 -0500
Message-ID: <CAJSP0QWz4o8Sa_MHU=zkERqU2=iim8adN7Hg1eLZ_v+yfsHeFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 28 Feb 2023 at 09:58, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Feb 28, 2023 at 04:30:36PM +0200, Anton Kuchin wrote:
> > I really don't understand why and what do you want to check on
> > destination.
>
> Yes I understand your patch controls source. Let me try to rephrase
> why I think it's better on destination.
> Here's my understanding
> - With vhost-user-fs state lives inside an external daemon.
> A- If after load you connect to the same daemon you can get migration mostly
>   for free.
> B- If you connect to a different daemon then that daemon will need
>   to pass information from original one.
>
> Is this a fair summary?
>
> Current solution is to set flag on the source meaning "I have an
> orchestration tool that will make sure that either A or B is correct".
>
> However both A and B can only be known when destination is known.
> Especially as long as what we are really trying to do is just allow qemu
> restarts, Checking the flag on load will thus achive it in a cleaner
> way, in that orchestration tool can reasonably keep the flag
> clear normally and only set it if restarting qemu locally.
>
>
> By comparison, with your approach orchestration tool will have
> to either always set the flag (risky since then we lose the
> extra check that we coded) or keep it clear and set before migration
> (complex).
>
> I hope I explained what and why I want to check.
>
> I am far from a vhost-user-fs expert so maybe I am wrong but
> I wanted to make sure I got the point across even if other
> disagree.

How do the source QEMU and virtiofsd know which migration mode to use?
The virtiofsd implementation might support both external and internal
migration. Source QEMU needs to know whether to ask source virtiofsd
for device state so it can be included in the migration stream or not.

Stefan

