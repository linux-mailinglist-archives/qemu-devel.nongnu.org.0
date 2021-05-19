Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272AF3896EF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:44:49 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS7c-000479-62
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljS6C-00025o-02
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:43:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljS68-0003Ip-1H
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621453394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEtFg6JHs2r2vA7tl9Xy3ubScRyEPLk9CsSThE5SifU=;
 b=foMlCrXHlhBx7vJzlhBk6k7lRGzIyGoAeqG4J7anhjSULjcOABB3GcJlufoQU2ivcSQgmA
 MetGx54B942fWCU4vN94NgLgcRXhca5Yy/Ae2nPzG1Hlz0VEC94qWdVnqmAjR62m9fjr7f
 aDxmg5kAc0/OjIaov47n4ibCkobSBNI=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-f6lkGOmnOei2Zf8Elo1pIw-1; Wed, 19 May 2021 15:43:08 -0400
X-MC-Unique: f6lkGOmnOei2Zf8Elo1pIw-1
Received: by mail-vs1-f72.google.com with SMTP id
 n26-20020a67d61a0000b029023651d629a4so2465261vsj.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YEtFg6JHs2r2vA7tl9Xy3ubScRyEPLk9CsSThE5SifU=;
 b=hw4FU43gprVWSEYi9AdslmMxWOgCFFKS3WMO7pjSurSyklFQnC70TsAtuLoAc3iqq7
 dkC/FncK+fQ7TArl7K1gVEkupKgfE5IxhP2EehoVRPh+EdkpgIi4rzwwijV7p8S0OfzJ
 87Of1wMWMwJ8K+4jV4lTmllB6hr7XM7t6EicTl78P7ASaOoqIEVxay07Q4wUryHRR5Xf
 a9bxKMExKBNb272QdnN+uHV24+lmn2dUyMwW2oEYLWlrZuKe4IjpQfZbZeViN+YgrTCF
 o+dvtXBj30PzIjWZbUj5m53LFCj4+toQD+BE7cVR7RuR6xxjZMNBnMOx71sIIiaKwpaB
 jCzQ==
X-Gm-Message-State: AOAM531uo3l1dTHEGtja2ewysZZH/dUy7WMDeW2HdL+2evQ3aaq9dBDm
 gz10MCw6/5GLhObLuWqiZAV8Oc9vNnEM9DP0vsZSv6aWo76y/AFGHtFXWRkmqgdKbYTaZfMJX3B
 s478HzTMX5VMPEf/u1jydk2i7j1I/CJU=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr1386209uad.133.1621453386908; 
 Wed, 19 May 2021 12:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTkSechWAMljUrB1qqJDAK8+p7rDGY+5m5fo++opeWmxwwLwMcGG/jEoEL1OT/Y1NYO9f49GvgkuBq04TPDGc=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr1386198uad.133.1621453386771; 
 Wed, 19 May 2021 12:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-6-f4bug@amsat.org>
In-Reply-To: <20210519184549.2192728-6-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 19 May 2021 16:42:40 -0300
Message-ID: <CAKJDGDYNZFEK1neQqXmnc6jMKnrWo-RYFRW9ReAro8G67hg8Mw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] gitlab-ci: Simplify before/after script for
 Avocado based jobs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 3:46 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


