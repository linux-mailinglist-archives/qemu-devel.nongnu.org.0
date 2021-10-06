Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E9A424666
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:59:47 +0200 (CEST)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYC8o-0003c8-9P
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYC75-0001R9-Jg
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYC73-0003cL-Mv
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633546677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faTNEitwbtVbS2lUFvx56Mw/nUfdEeJhjMRwJmmrcE0=;
 b=QAtedLQyI47zV7leHeTZnGAKOfJ72f7daYIcnPGhlkVnbHwSkjgZje35erq8Os+8GEq78t
 V7ybuYFL59Cmnt3shdLmxw+SiWtHPHwc5D53ftFU4qTOnZ6Je2Y/VljJp1UR/qyTrAOdFf
 NndtawxxlAaiczW6vXYrpnthI1HUvyQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-G9XinGyANWuWZxecG1UHMg-1; Wed, 06 Oct 2021 14:57:56 -0400
X-MC-Unique: G9XinGyANWuWZxecG1UHMg-1
Received: by mail-pl1-f197.google.com with SMTP id
 l12-20020a170903120c00b0013eb930584fso1911956plh.22
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 11:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=faTNEitwbtVbS2lUFvx56Mw/nUfdEeJhjMRwJmmrcE0=;
 b=hnSHyvYGI6K6V7+AOv6PY3+9aPEHQ/Xbd/pR4eqOkVHvxvj8tfjnNrMi/FVXEKdlMy
 ouPKKJz0lg3vLu2cEFf1OzTiRiTID90zEUzWLD7Ln5z898F/r0P4+RYZzDg+MgzoHXvC
 fIjIIeabVBTHPxIyR9BbH/qvAf2EX9QmgvFuxFXUjjGM4Nz0Br6TGjq74mbPBUNuIdAv
 t2V7r8boaaNNwKoD5k8ru7z+3db6q755FRvVYtHpwxnWJetrVL31aj91bibZLihaqu0s
 QKPf+1eSFl8F+xxMBnozBBEnRZZaU9ULqFCrznK33YugQH/L3CWLoiqaTZ5USHx9tovK
 tYLQ==
X-Gm-Message-State: AOAM531wGqV80s3mUa6jRh6dgCkAoFyHxMFKgX081mTv1e8438F8MPoO
 EXYQDTaN3MeTxCnGvwX7I6c9udjcvMUxnSeFxp+sncf4s3ry4vQcdOvmnB6ZYxfmJ8yVUritZE9
 S3OImMxuE4Y18bSzCMiLgleFdLazjlG4=
X-Received: by 2002:a17:90b:4c86:: with SMTP id
 my6mr287830pjb.203.1633546675140; 
 Wed, 06 Oct 2021 11:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHrVJP6cad2YqApYJucbQTdi29c0rROApe1tMhy8cz/JYmBggZH4QojE1+ltSJXXWt+CjfaRF/AgYm8UnceeQ=
X-Received: by 2002:a17:90b:4c86:: with SMTP id
 my6mr287792pjb.203.1633546674940; 
 Wed, 06 Oct 2021 11:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-10-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-10-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Oct 2021 15:57:29 -0300
Message-ID: <CAKJDGDb7TkOH930=W+qW=iRevZa3OV+UQS9x1a65y430M_9yuw@mail.gmail.com>
Subject: Re: [PATCH 09/16] tests/acceptance/boot_xen.py: merge base classes
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 3:58 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> While it's a good practice to have reusable base classes, in this
> specific case there's no other user of the BootXenBase class.
>
> By unifying the class used in this test, we can improve readability
> and have the opportunity to add some future improvements in a clearer
> fashion.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_xen.py | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


