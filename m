Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B543D702B48
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:19:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWE7-00012E-JA; Mon, 15 May 2023 07:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyWE2-000113-9A
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:18:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyWDz-0001T9-Tw
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684149522;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0T4nl+4gymHALkNNOz2y0ZDf/qKC7dyqqmwC1sC2A0=;
 b=QPkiwrTyEyqA83P6A16sbTAfQK9YVgDAHEbxfeR6S7WTd1Dp0ToxPqy2CMIxF9L02pFGr0
 QT5ETCq4ilVfLwo7kG0e5lPt1fI0yyawrKznf1Csy+UOE73gFfvtAeg4olJMSphRgztMA0
 RRuaVGdlE1ju3qI2PCWbj9bMC1LQjgo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-OxtOB4LXNeCFkpsuAxQlcg-1; Mon, 15 May 2023 07:18:41 -0400
X-MC-Unique: OxtOB4LXNeCFkpsuAxQlcg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f33f8ffa37so43288325e9.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 04:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684149520; x=1686741520;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0T4nl+4gymHALkNNOz2y0ZDf/qKC7dyqqmwC1sC2A0=;
 b=hAxL8JnGgouwUiGWqfvoszySIoUBkiOM42LAhInexIq/LgRQNFnslTtssJQEXRdpoK
 sBzQmuRAfHEOLchEcb+zoB8dG5XwMdbr9jy9SV9pZv9SJIrZrDxLLyJg0pRuvS1W494G
 H4WUQuoJjZ32JWF6VQq/qlHxDfaWK4gMVwA4ZBQP6bhaFsHpbEqfAzjgWtaTlN8Yarzy
 jEnHFrm+sMtPLE1wEqVklLPGLFtMecAaRYyWD8iCEKveA9gVmboYIuUY594vgI6jPqcH
 +OVBFyHQJDhgZRDkYZJpPNer6vYXZO4PfieSP1JNPWRyBOZqNx/GPCZshX4hW9g/5KZg
 0PVQ==
X-Gm-Message-State: AC+VfDySgVD2XyjJm/zh7Mz5/rR7d59cwEUTnm5EsdQS7PUOtWdjel5B
 Hu+b3kmwQBHI0Um1h3RLigAPeN3JHvmdNPeIN36qCLmsufTWptnWbQn4OKFuw0kcVLMaQCz5Q+B
 1FzSs0mfL8douWWI=
X-Received: by 2002:a05:600c:2313:b0:3f4:2266:8cf0 with SMTP id
 19-20020a05600c231300b003f422668cf0mr18015938wmo.10.1684149520376; 
 Mon, 15 May 2023 04:18:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69TDnptM5ruIUaiWRqM4KzteWJS6EhxUwWYGBbNy6KwfqCzanyB9+41nG0ELHKlQC+RmcBdg==
X-Received: by 2002:a05:600c:2313:b0:3f4:2266:8cf0 with SMTP id
 19-20020a05600c231300b003f422668cf0mr18015909wmo.10.1684149520085; 
 Mon, 15 May 2023 04:18:40 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1c7902000000b003f195d540d9sm36451058wme.14.2023.05.15.04.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 04:18:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: <qemu-devel@nongnu.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  <qemu-block@nongnu.org>,  Eric
 Blake <eblake@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  John Snow <jsnow@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,  Greg Kurz
 <groug@kaod.org>,  <qemu-ppc@nongnu.org>,  <qemu-s390x@nongnu.org>,  Fam
 Zheng <fam@euphon.net>,  Thomas Huth <thuth@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 03/21] migration: We set the rate_limit by a second
In-Reply-To: <d21c0d95-58e5-a274-ea91-2bd275db8a9b@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Mon, 15 May 2023 10:38:22 +0200")
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-4-quintela@redhat.com>
 <d21c0d95-58e5-a274-ea91-2bd275db8a9b@kaod.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 13:18:38 +0200
Message-ID: <877ct9267l.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 5/8/23 15:08, Juan Quintela wrote:
>> That the implementation does the check every 100 milliseconds is an
>> implementation detail that shouldn't be seen on the interfaz.
>
> Si. Pero, "interface" es mejor aqui.

Muchas gracias.

>
>> Notice that all callers of qemu_file_set_rate_limit() used the
>> division or pass 0, so this change is a NOP.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Gracias de nuevo.


