Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374743C895A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:08:17 +0200 (CEST)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iMq-0003wd-8R
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3iHo-0003Vx-Dn
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3iHk-0007Zk-GX
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626282178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Z4IROCSG9vlhkqj8cf28dM2V8YLzH5BsgErmeGXVQ4=;
 b=T0KKY7QV5iEpbyH7jYteywLtwxYhj1Fi0C/nzP1ZRk1E3vmfUA+KRPaaofN0HTBf7V+EHn
 jaYPido5PQrFVja9LTYqeDoKoYEpWj+o/+ytfT5fGpQcT2HI0uhpiBwUuuy8rzORjOcMHq
 ibP+LmSHic14KnvQk1a7neWkBvgA+9g=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-5Ld2fJEEOkOWt5NCzoJ9mQ-1; Wed, 14 Jul 2021 13:02:56 -0400
X-MC-Unique: 5Ld2fJEEOkOWt5NCzoJ9mQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 k133-20020a1f3d8b0000b02902589585c3bbso917983vka.19
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1Z4IROCSG9vlhkqj8cf28dM2V8YLzH5BsgErmeGXVQ4=;
 b=of1W24Mzfem7f9gaXIJeFAaE5MCQYGhTD90ayWSLmNWGGLudHCTH/XMyIu+YVmqPUk
 7gaANbDVdp8r5ipsxgbUV6vj8n+j9lnhzbPm4ZiRORIZcfxgpRJBQoDM7nZpV3kWGTqR
 oFZEVlZSX9yn0NAQx7+kyukuagIYmSZl+CHA5zAgUmjgb4DDYi4H0kiZIdttGMzpcpP1
 oJt/nXLweLJF4X7jdy1yfljKg+JHa6Z5aWC/zBgN2o+Fu/zYMcuzM3whQnP9ulDG6iH0
 +81Q/i5nWc2fKR173gPp2resNd0ZcDumP/LHNdxhtGOVwsS551VuEat5JItI5lpbDDkV
 f7Uw==
X-Gm-Message-State: AOAM5338FWeDpdwXTGre5/4Bm4vQWAQPvwBfVyT/d/AJo9rYAFVXkwEJ
 ljwPzY/tZNDPcbcmUXiBHMCDIaRQ+auGMvRnflpn2eNkJSbNof4A+OqtdABAt5Dy16sMPG7qbl4
 omEyxBhm35fSybZYq3oKbyGKgkSZBa6c=
X-Received: by 2002:ab0:6486:: with SMTP id p6mr15383185uam.5.1626282176186;
 Wed, 14 Jul 2021 10:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzpAfq9qlbvXeylkPO2hmk2tKvNS4mcQQZiP2qAX2SB0RzodcmqVwPFSymZ8+TX2VfcTNN2LPmnbDJHdDUmWE=
X-Received: by 2002:ab0:6486:: with SMTP id p6mr15383162uam.5.1626282176021;
 Wed, 14 Jul 2021 10:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210714101003.3113726-1-philmd@redhat.com>
In-Reply-To: <20210714101003.3113726-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 14 Jul 2021 14:02:29 -0300
Message-ID: <CAKJDGDYYOVdg-jR0+O=AKmWwgwD2sn9+M11mJLZ+W-iYdc9qpw@mail.gmail.com>
Subject: Re: [PATCH-for-6.1] gitlab-ci: Extract EDK2 job rules to reusable
 section
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 7:10 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> All jobs depending on 'docker-edk2' job must use at most all
> the rules that triggers it. The simplest way to ensure that
> is to always use the same rules. Extract all the rules to a
> reusable section, and include this section (with the 'extends'
> keyword) in both 'docker-edk2' and 'build-edk2' jobs.
>
> The problem was introduced in commit 71920809cea ("gitlab-ci.yml:
> Add jobs to build EDK2 firmware binaries"), but was revealed in
> commit 1925468ddbf ("docker: EDK2 build job depends on EDK2
> container") and eventually failed on CI:
> https://gitlab.com/qemu-project/qemu/-/pipelines/335995843
>
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> If this is a correct fix, I'll send a similar fix for the
> OpenSBI jobs.
> ---
>  .gitlab-ci.d/edk2.yml | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


