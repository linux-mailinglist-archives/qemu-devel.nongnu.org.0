Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57262560DC4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 01:55:33 +0200 (CEST)
Received: from localhost ([::1]:47878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6hWu-0008A7-Cf
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 19:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o6hVr-0007TI-9N
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o6hVo-0003xH-35
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656546862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgGr6C+rRmKaOoMWslGXtHUaFr61hMZ2eqUVPPUt6MI=;
 b=Xcb4hyimHbiuXml/8lzgVatrkfbiAHkTDo79ldhJ4+WFRD/PbCNPa/YpgjkFsKusUc3xQD
 MNeN0NsnS0V3T8hEzoqKhCp8qjitngyz1UWcW02MSIa1I2dw+/WfMWKQcuo+74jXBqo9dA
 X+If9J0j7aDZV0D0W7if9XXWy4aDc0M=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-AjddaN2IOhSH_Mi6WaWFoQ-1; Wed, 29 Jun 2022 19:54:20 -0400
X-MC-Unique: AjddaN2IOhSH_Mi6WaWFoQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 q74-20020a9f37d0000000b00381f3cac330so3113112uaq.16
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 16:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fgGr6C+rRmKaOoMWslGXtHUaFr61hMZ2eqUVPPUt6MI=;
 b=6QD8u+GG+PFSWmi+5fx2PC0B/AQticSIO271xulVqKI5/9EwnCxWL/U6Dx2Q4aDheT
 aN7zRjnz73rZR0/sVJc4GijuzG6ykpXCzqwKN4oeKlesZxik51vj/f6fBfuXK0otGsjI
 a2Ciy2xWpmk7hIgxRg0HtY2ymvz9ztkzpUrVDrtTBj9uqdO962+jKxZ0/eiYErMJUV6u
 Gi+E1MCa810U3a8cIRpgpBMgimDXhbZ6o0zCYRa7Z48Fr9iX5gzl2AWk/bJb4BDDcw2B
 IpvOWODsj8lb+HUxA6p8rTwkAiczSl99RAGtfBiSXU6rOVrm6/9wmIFwpBOYlyOtoI65
 eTqw==
X-Gm-Message-State: AJIora9dRJWLYT3imzwo/ImExD/jD1nh8lH3TPaCOyQ0BmUxaUkQJ9Or
 b26zpyVOHEs0Izz/lovb7PVJglUUQDrTqp+YyzksUZHUJEI3+K4tHmJTXGLwuZ8VfvE+ET8nUPc
 T1LcxXNOlvAR443Q0SWpppLqUpe5yNNk=
X-Received: by 2002:a05:6102:3578:b0:354:3f02:c707 with SMTP id
 bh24-20020a056102357800b003543f02c707mr5828189vsb.35.1656546859951; 
 Wed, 29 Jun 2022 16:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tZzsvW3jfT6+hqs1LrQ2IGuvF1WBpFO5rRsDKdPVsD2bS2YnnBsWZPK2WM/wQef8gvf31gSfEUvko3tAqRzMI=
X-Received: by 2002:a05:6102:3578:b0:354:3f02:c707 with SMTP id
 bh24-20020a056102357800b003543f02c707mr5828182vsb.35.1656546859714; Wed, 29
 Jun 2022 16:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220628134939.680174-1-marcandre.lureau@redhat.com>
 <20220628134939.680174-3-marcandre.lureau@redhat.com>
 <YrsNZAznZrxUr/zr@redhat.com>
In-Reply-To: <YrsNZAznZrxUr/zr@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 29 Jun 2022 19:54:08 -0400
Message-ID: <CAFn=p-YCAf7VvCvwjh++KZ3GguG8MKo=ukGR3EqxRYprXgZWDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] python/qemu/machine: accept QMP connection
 asynchronously
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jun 28, 2022 at 10:17 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Tue, Jun 28, 2022 at 05:49:39PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > QMP accept is currently synchronous. If qemu dies before the connection
> > is established, it will wait there. Instead turn the code to do
> > concurrently accept() and wait(). Returns when the first task is
> > completed to determine whether a connection was established.
>
> If the spawned QEMU process was given -daemonize, won't this code
> mistakenly think the subprocess has quit ?

Do we use daemonize with this code anywhere? Is it important that we
are able to?

Many of the shutdown routines I wrote expect to work directly with a
launched process ... at least, that expectation exists in my head. I
suppose a lot of this code may actually just coincidentally work with
-daemonize and I wouldn't have noticed. I certainly haven't been
testing it explicitly. I definitely make no accommodations for it, so
I would expect some stale processes in various cases at a minimum.

If we want to expand to accommodate this feature, can we do that
later? Machine needs a bit of a remodel anyway. (I want to write an
'idiomatic' asyncio version to match the QMP lib. I have some
questions to work out WRT which portions of this appliance can be
upstreamed and which need to remain only in our testing tree. We can
talk about those pieces later, just throwing it out there that it's on
my list.)

--js


