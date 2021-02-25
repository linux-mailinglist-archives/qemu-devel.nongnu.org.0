Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F6324EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:12:19 +0100 (CET)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEZ8-0008Pq-LU
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lFEFW-0004Rc-4x; Thu, 25 Feb 2021 05:52:02 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lFEFU-0004R3-Ee; Thu, 25 Feb 2021 05:52:01 -0500
Received: by mail-pl1-x636.google.com with SMTP id z7so2976561plk.7;
 Thu, 25 Feb 2021 02:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=92wlCLi73UiKGgUvRI3WSO0JRVMfPK3jtuIPtw0C8uI=;
 b=JalDE3YEDOq0ttOH/B510IGYQIvl/I4LwuNGOnj/rmSwbljMmaPoklyBhI0633PeVE
 AmQLGnFb3n8MjWTfrC95Uzn0RwahQ+YIPJeKT9HuBD473PdvfVwZT+xDS8dsC9KEpghy
 FimqwfEqQeUJrOyTNw8kOmXZ7Qj3vrfIZXTAZrDii3axMnM/p32bGFbPAlOPJDg0bJRu
 8S4sGOE1/l8eFSgyOWGOIfNH0qo0rULd+/EOenff6AcIbgUXngCtGWJAstCD2PmZYi5u
 /wSG3ShqCYFgiT4WhGX1uWRCdLumA9hJ9N07IY6BXUHx9Ofx0xvSe6Iz2SliMEJChCJ9
 rv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=92wlCLi73UiKGgUvRI3WSO0JRVMfPK3jtuIPtw0C8uI=;
 b=kCQpJpV71lc0kkUow5r3JlhNGoKDRi/tQmvweocJeevvK3jUCywPtBgg4FeMYus1cn
 xFEA5JnOluEIZzTH/zJRk76GMEKVyYHZt6VOplJ5oDEEnrrsfD7HYTAuL2tceETSbZmx
 KxVgei7J4oxdgqLrKZ3FiS/9+ny2XsHGsXk0qXOAzNvtwv1IsNNJOC1FqaPZXxmpu8rC
 1QlYyRqaMpCzGasa3xDnBN5LmNZIeQrWQpU8SFsZVysWa9eLpdbGFy3S6wWbe7Bi6rt8
 QWT+q+Rp9gd5eUW1plyp2cki2vkou/nTzJgOSi1Lc+pfA75doNrDtNX/S8sttTzWOcT3
 QiGw==
X-Gm-Message-State: AOAM5324cLEKiKP3iN/tdUZrmZSD1yK2ttU+LArQ35QPSiILPYs0y8sP
 BrURlmp60aBTghd7ohXjFkE=
X-Google-Smtp-Source: ABdhPJwnyt3l9ZG8iE94TFMoVuyORb8Zi2uSTLC63fcu6mfKDNKeOO/xhLtGbq+tXglgz3Mkpz+Jow==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr2453169pjb.2.1614250313681; 
 Thu, 25 Feb 2021 02:51:53 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id p11sm5548853pjb.31.2021.02.25.02.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:51:52 -0800 (PST)
Date: Thu, 25 Feb 2021 20:51:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH qemu v13] spapr: Implement Open Firmware client interface
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>
References: <20210209110252.110107-1-aik@ozlabs.ru>
 <a1a58715-970c-2bb8-9b06-de92563c0efe@ozlabs.ru>
 <20210222160106.3b463089@bahia.lan>
In-Reply-To: <20210222160106.3b463089@bahia.lan>
MIME-Version: 1.0
Message-Id: <1614249809.xf2ta0gwg3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Greg Kurz's message of February 23, 2021 1:01 am:
> On Mon, 22 Feb 2021 22:48:51 +1100
> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>=20
>> Ping?
>>=20
>> I need community support here :) I am hearing that having this mode=20
>> helps heaps with development in fully emulated environments as this=20
>> skips SLOF entirely, for example. Another rumour I am hearing is that=20
>> there is interest in running grub in the userspace which this VOF thing=20
>> makes handy too.
>>=20
>=20
> I had tried a previous version of this : skipping SLOF is very
> beneficial to do guest work, even when running on KVM.

I agree. I do run KVM in simulators which works quite well, but
SLOF ends up being the slowest part, it's also a black box to me
so it's difficult to go about debugging or changing things.

I can't be of much more help with the code I'm sorry, except to
add my +1 for the feature and agree with Greg that the non-vof
changes seem small.

Thanks,
Nick

