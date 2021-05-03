Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460C3715CA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:14:40 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYPH-0003T8-KB
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ldYNd-0002d0-SR
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ldYNb-0007r0-Ou
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620047573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQZdDkRonkFE+y2mN5jhWa6rJIJvVgfWtL5WXe2BExk=;
 b=YzJBMo55Foby6Ms/x/NSeri6BbyU/IPV2zQFchL5kKNv4Eyxag1fnm2SbutwqM/2fgiDkc
 TiU4oCzp+d6lcBVtgEKaldWPlklecITciWgqoOpUZMSyhkp3vmD/ENGB9g74A9HbgG/tyc
 VXCU0Ymcx2J+S2uWEDh8Lg8FzmraoK8=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-tawsOzZvMu2uEX6sau_8-A-1; Mon, 03 May 2021 09:12:52 -0400
X-MC-Unique: tawsOzZvMu2uEX6sau_8-A-1
Received: by mail-vk1-f199.google.com with SMTP id
 i68-20020a1f9f470000b02901ea52e1d796so679975vke.18
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JQZdDkRonkFE+y2mN5jhWa6rJIJvVgfWtL5WXe2BExk=;
 b=VpXzq6LkN9H4ApyKEaN3JvsB4doRcaO2VBYX9zRXb4qDG+MjHUz7J3nwZjVgcbsw4+
 QrUwjZwFQ1p6UquztuylpACH6bRZha54atxz+kUAtogN+etQcimXYmN5BJMRwctnx0ob
 bLc7Ly1EPJvIjY45JJMhNB37feZuzNx33PhgGRB2qyd6tFvvujhiqept56yKJaSqEnGW
 tEOq7wQlilW7eZ8lihIYlBUJ2BF1CUjLx3KT+ZBa85fPW+nC0Ya3+VGyD77gNo131wnX
 9/pPBhJK0K8iAcM9f1NmBWdnREQcKJ4Av0KWXt+UwfN0yqwxCJ1+xwgurXwTQ9GjfP/S
 fbCQ==
X-Gm-Message-State: AOAM532GmKEIkWEgU2ndesTh3TF/4PROlNgIcrRhf3Oa/JnNciDdFmHm
 sTaLp3YAj2NaBQrFpAR/n0q0UoLuqoMVtTwWPC6cBoz7xzELVCuZWJBwM1dQWU54w7Ijkp2J3Rd
 PqN7D4hzJJb8X2677/i/l4SDxtFW0TA4=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr14194818uap.113.1620047571395; 
 Mon, 03 May 2021 06:12:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFVIrUv9U9Ct1tCTvgiymbUYKR53uKmMLKytga90Ciy/6pZAOObwqYuVjAfNyC7ffXr7Wk+1CN9rNt8IOjH88=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr14194799uap.113.1620047571198; 
 Mon, 03 May 2021 06:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <ac0e8d46-6e57-b454-9162-17dc2f3b6534@amsat.org>
In-Reply-To: <ac0e8d46-6e57-b454-9162-17dc2f3b6534@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 3 May 2021 10:12:25 -0300
Message-ID: <CAKJDGDb5GXTLB=7nmdu9_znrf4tVHS+6Rto5vdzYXyNcLG+x8Q@mail.gmail.com>
Subject: Re: Problem with Avocado and QEMU console
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Mon, May 3, 2021 at 9:59 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi Cleber, Willian,
>
> Avocado marked the test_mips64el_fuloong2e as failed while
> it succeeded:
> https://gitlab.com/qemu-project/qemu/-/jobs/1231363571
>
> Apparently the first part of the console output is missing.
> (Normal console output attached).
>
> Any idea what could be the cause?
>

The log shows the following:

12:00:37 ERROR| avocado.core.exceptions.TestFail: Failure message
found in console: "Kernel panic - not syncing". Expected: "Kernel
command line: printk.time=3D0 console=3DttyS0"

Does your comment about "console output missing" means the expected
message was supposed to be on this missing part?

> Thanks,
>
> Phil.


