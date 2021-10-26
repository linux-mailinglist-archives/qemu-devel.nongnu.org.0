Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC043BBE5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:55:56 +0200 (CEST)
Received: from localhost ([::1]:57936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTUB-0004lB-Pp
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTQw-0000lt-Rl
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTQv-0005G1-Ht
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635281552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9on7oqICtXp0Ib305X1ZfsDed7FqlxYnS51kX3uOdUw=;
 b=g6zXwBCEs/RB17aDCH4ocHr6wfbAuE79CvhX/YMikQ9KvkGBMl5E+i4BDGmka06Ud5spfx
 EXeceVX5oixg12Qb18b04Xe6AS0ihEnJbe+50MxLfs9Jlv4jT2VnKo8EgJep1llM4oxWbr
 /zeG4NM7Jyu2HXgGVa0oqdybcfy6yL0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-RBeXvE-TMQKKw-5PXWidfA-1; Tue, 26 Oct 2021 16:52:31 -0400
X-MC-Unique: RBeXvE-TMQKKw-5PXWidfA-1
Received: by mail-pg1-f199.google.com with SMTP id
 w13-20020a63934d000000b002a2935891daso327359pgm.15
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9on7oqICtXp0Ib305X1ZfsDed7FqlxYnS51kX3uOdUw=;
 b=LBPV4g9bPUz/cfB1aHUkH5iya3uCYJzXMdw8iPE3oLOzYYlXIHgtMiv74SJK3PiNlH
 TxX6sKmhFA5ZF6y29Ace5ob3I6GFNOaZjSNAYST8GupnROkqr7sn69kzswkEf8yNYGJJ
 zHruKzOFr3teazCaAE9z+NJe/z3K3Qj3qQ1CL3jamzPKOm1T2os+FCEwmyRe6b0uJibT
 +opLnLy4uaPlBSUZrTvc2EoLsCgRJM8Vq8dhcM9w7JhDk4zzBqHMytrj6ypRoA4H0yDa
 YBnMcf++0HwwNFR2oXSuxbSgd0lvARqHIqLDqJaVPbBTI7YDyO4U5fitG2nxCcRGV82o
 ipsQ==
X-Gm-Message-State: AOAM530rSo90gcQGOpRqbckkSn75IgsrpBPzmLYDQ/6E9VhFUgXbpZAd
 6QrlVefL0GwjGOGDLJ1FGy5PJxGogvFwoU+Zs9NArHWo0nc/39TK7VyVg5oa3L/fNv5vJpBuski
 aQQvuGHR7TxeNphAfwT7Z89OXStIhpZw=
X-Received: by 2002:a17:90a:8d18:: with SMTP id
 c24mr1187948pjo.123.1635281550627; 
 Tue, 26 Oct 2021 13:52:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs+iKvmiRBNQ5Aj+1CBlFqY5N5t4hywBDlSdlpHd8PyEBBx+tqHtU8EvqTO+HxeGyeNaTcxsraddY52/eUSIg=
X-Received: by 2002:a17:90a:8d18:: with SMTP id
 c24mr1187915pjo.123.1635281550441; 
 Tue, 26 Oct 2021 13:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-10-alex.bennee@linaro.org>
In-Reply-To: <20211026102234.3961636-10-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 26 Oct 2021 17:52:03 -0300
Message-ID: <CAKJDGDZF+xgj-yKYjohzG+Z6SMWTQWaj09v=y4QsQBNtsx21qA@mail.gmail.com>
Subject: Re: [PATCH v1 09/28] tests/docker: split PARTIAL into PARTIAL and
 VIRTUAL images
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 Daniel Berrange <berrange@redhat.com>, kuhn.chenqun@huawei.com,
 qemu-devel <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 7:22 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> This is mostly to ensure we don't include the toolchain and bootstrap
> builds in DOCKER_IMAGES which is useful when verifying all images
> still build.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


