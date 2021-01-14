Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3292F6B27
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:39:38 +0100 (CET)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08T3-0002It-B8
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08QX-0001Il-Ho
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08QU-0007TO-Lm
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aCOZSLPj1/G6ExmV/i/WoQkTwdVhoQpSiH3bbEc3uE=;
 b=YUxIU9ryB0En+8wd3ONKEphSGITsaS2u868Q5i7Tf7lSkatkOyJo90PqAmfU0u3d/AWlkU
 i8UocR3U0xtOiLtqIuElEd0xlh/i2KrWjDGPwUBmZAqUd5Uy0vFWWOTHG9qCBOnZ1BGqQD
 o6KM/9Pd5hg4S1FC0JU1NnEVrmwFPOk=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-_X88nHt8Md2GyPh02ApLfg-1; Thu, 14 Jan 2021 14:36:55 -0500
X-MC-Unique: _X88nHt8Md2GyPh02ApLfg-1
Received: by mail-vk1-f198.google.com with SMTP id b62so2719453vkh.19
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9aCOZSLPj1/G6ExmV/i/WoQkTwdVhoQpSiH3bbEc3uE=;
 b=IWdJF8UUn2l0LJlKa1qEaK363UXnmHwUabs64c211Se6b+WwBVilBGb993AskBsk0d
 GZe6/e/yi2GUjBZ9Z2SSgkStixtWKA9T9Fon0u8UiAMrY+fEfF1wR65HaEeaS7btnvPt
 j+/XyXVO5Oo332vJNwLQW3RNtbXbxD63mntc+Ud07q/hV9gSHJ+RZysOPoZJ/euY3EIG
 0asIQJfEulxYjo2c0hbJbKWB3IfVUOkX2uQuazLdMx5B5sHsq39ZysV3kF0R2BB4E+PT
 9oWJ6oPAug89xveOrm8kqUwqITLByVTGr5KiCoXhw65odWHnWRnIFromYhdqvvpv6d/g
 EMZg==
X-Gm-Message-State: AOAM533hGWBrTgCI63fpdZR0p6zpud+cx9TCQB6HaiDeWpn59fwgsQ6d
 AAlZRNg+MKMFqrI48fz8/+DSZ5LKbtxH6sPlHKIGg3d2tuKercH9zZOid+iuBAU4s5RohiTOWVm
 NRCnv3ppbqBAGLE8cMRUo06N+UO3upus=
X-Received: by 2002:a67:f910:: with SMTP id t16mr2393290vsq.50.1610653015195; 
 Thu, 14 Jan 2021 11:36:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLoYd9jn4WxTO6qdC/vSjBTZWRU3hlyvEkfMdp1aWB7BBhYfC4h/1hWg5zgTHKPvYdQXAeTM0f7gYqLzqAcBQ=
X-Received: by 2002:a67:f910:: with SMTP id t16mr2393280vsq.50.1610653015061; 
 Thu, 14 Jan 2021 11:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-12-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-12-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:36:29 -0300
Message-ID: <CAKJDGDYNENeiDXOmrZ1Zs=Ffyzvht5WYo6YHSxR_2HkVHtbZSQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] gitlab: migrate the minimal tools and unit tests
 from Travis
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:27 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> These tests are good at shaking out missing stubs which otherwise work
> if we have built targets. Rather than create a new job just add the
> checks to the existing tools-and-docs build.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 4 +++-
>  .travis.yml    | 9 ---------
>  2 files changed, 3 insertions(+), 10 deletions(-)
>

And, it helps moving out of Travis.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


