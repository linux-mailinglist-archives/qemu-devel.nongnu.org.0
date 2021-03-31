Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3022350463
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:21:52 +0200 (CEST)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdbL-0000Ny-39
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lRdTT-0001wF-Oi
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lRdTS-0000Ov-9k
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617207221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lPVmgOeeU11vLIzGfziAv0Xhws6vDqJUGpV763vomag=;
 b=Q0u6fgM2RuNhmFz6QfNUv2rnPMljFB1qm0WEqzz57/DxZJsu1Vo2ndPNTBWJqZ7BBu/Uc1
 sJh807pjU2JJgZdDQAw3sVkDQfZdqxcYJyiPzygOL4nqOqgTh2WEzxx0t9QpTvvaMKDirt
 yTcKnCadQLCeWD49aLnI3OaQVny9gPU=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-lCVXpyAeOgatUFKwoLgCUQ-1; Wed, 31 Mar 2021 12:13:40 -0400
X-MC-Unique: lCVXpyAeOgatUFKwoLgCUQ-1
Received: by mail-vk1-f197.google.com with SMTP id i65so863352vkg.19
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lPVmgOeeU11vLIzGfziAv0Xhws6vDqJUGpV763vomag=;
 b=hK1368Giknka28wvL3l9+QiiBNIqfBxAgakfkJxynzYigIr3sWsioBbPaHSkHLI4Z6
 yAIinJadBF5SjQmloEQNiE/5E2Z1chhswrPNxn3Xz240SS5tL3v/4vAfau7g2fhzukG9
 lgdoQob3xudgZrfqL6ekO9Xan8cbMxyaxXNoLSNr2VUOWLIn/VVy0qi+m+EGkoDEWLuz
 Y1by9d1UUPHmgSW2HO8knONRJl/QGw+PoLEwv/J3s0tW5ENWH+E4ssoewJqAE06/Ry1O
 gPe6756TVeHgRKwhTSCsWhz07wA1aZKY49TMHlk0G2Vun1O6IbxT6a31p6SjwH3T7syt
 m4Xg==
X-Gm-Message-State: AOAM532vqEIGRJqabQsUEx5HwpNKm2p2IQSBjXuI02iX31e3GzhtMde3
 41Rbe48UxKJ6x7yDijHqbHk5+wwbBJ6negpUdTHLUPM9fKFCyfxT2ZrSIwVisuG2rOH1HKJoIpL
 FGdG3T4fdsosLAz7IH6kbNl/16fCpEXE=
X-Received: by 2002:a1f:4ec3:: with SMTP id c186mr2391201vkb.11.1617207217761; 
 Wed, 31 Mar 2021 09:13:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTR6bRtRhT4K2inDFjtPeiJ2uxUoYTAy39jCLZ4KlAwthcWHFBuZCHQ9xz6brm1ZjBt4kGxidRYSs63jmjAHI=
X-Received: by 2002:a1f:4ec3:: with SMTP id c186mr2390939vkb.11.1617207214524; 
 Wed, 31 Mar 2021 09:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210331160351.3071279-1-thuth@redhat.com>
In-Reply-To: <20210331160351.3071279-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 31 Mar 2021 13:13:08 -0300
Message-ID: <CAKJDGDZH7P0vr4ZqCXYhpo5VENJicY-+oEVKsa+2HTsgeVnUdg@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci.yml: Test the dtrace backend in one of the jobs
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 31, 2021 at 1:04 PM Thomas Huth <thuth@redhat.com> wrote:
>
> We are using the dtrace backend in downstream RHEL, so testing this
> in the CentOS 8 task seems to be a good fit.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.yml                          | 2 +-
>  tests/docker/dockerfiles/centos8.docker | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


