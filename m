Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B6F31C215
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:01:11 +0100 (CET)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBj7O-0001r7-Ph
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBj5H-0000jE-PM
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:58:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBj5D-0002FP-Uu
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613415535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LkVBPQzfIoYEzxp5o3AyiIn7aphrQ2Z2vvQVNLC78jg=;
 b=ZqH+5Vq57huYsOz9cx2OVy5ZpYWZtYB+TQNCrJgqKHuR0OzdcvP0JVthCS156B/KRGq3Dk
 franDkky06e76VFPBeHbyZxquc48Zro1mQc/p00aSW9KdmsqHi879DfM0cJZf0YI5x6ny5
 bdQc8M4wmr332err19K19STd62NEnGU=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-zMxdRZSIN6-eZl8s-K5kyg-1; Mon, 15 Feb 2021 13:58:51 -0500
X-MC-Unique: zMxdRZSIN6-eZl8s-K5kyg-1
Received: by mail-ua1-f71.google.com with SMTP id o6so3560851uap.10
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 10:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LkVBPQzfIoYEzxp5o3AyiIn7aphrQ2Z2vvQVNLC78jg=;
 b=PXfznQ9DBiaGxP/aN7WtLkHwtdeHFW40NAmN3r6jfCG7GVmzDRJ7cP9UJH4eRK8hrK
 C2k90Fq6aMtZJoD61Q6eQYH+gN6xGZVYpuhKdW93/F36sQUKMvxb+slFBVrx7w9IyNVv
 WrHI63008pSyD60LdwhnfsaJ2l3VSh45fT69Ngv1z83wvNz9xmU6U/eenEhTIq139t/G
 6WXvuPWdoMUOK9B+DvuoURwdFgamz5o/d7+8D+Jgd5sCgcGPXTrBqsLP5+fk5txNXsWp
 ic8syo/dz4XfPVHu2izaqz2KrHMW+Oj/QSyOjTSIwTZ7tAFVdHnim2ycJAeLvxvPPbdp
 +GJQ==
X-Gm-Message-State: AOAM531vOpBvB/NitllKL0GMD6q3Eq0IblYrXcM1Id2JqpJOiBvB/7JS
 Eu4tZNCWph5ZSrE8Bblwz8afihcd+hWg2hiPpBrZOtCY79EMfusMBQBEi5HM5ZCRrnucL3QubYw
 m2Oa8T2Q6KKuC74FbvOO7fHsvPUeimMo=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr4179567vsr.45.1613415530982; 
 Mon, 15 Feb 2021 10:58:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWkaSUDEU+C7oKEnhqu/yZjhSCt+7H07UChaxADpXAzdDdwVzpqEJY/NPBH7q6C9Y4Jegr7SaDQbftzKP9mJM=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr4179564vsr.45.1613415530859; 
 Mon, 15 Feb 2021 10:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-12-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-12-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 15 Feb 2021 15:58:25 -0300
Message-ID: <CAKJDGDZEGGh4g-GBx95nL4Hxg=K156Oj5RCpzXufpdn5f8iKWg@mail.gmail.com>
Subject: Re: [PATCH 11/22] tests/acceptance/linux_ssh_mips_malta.py:
 standardize port as integer
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 2:24 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/linux_ssh_mips_malta.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


