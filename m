Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44663B8529
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:42:37 +0200 (CEST)
Received: from localhost ([::1]:34518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybQC-0004kx-VB
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lybOr-0003uc-6e
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lybOo-0005JE-RK
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625064070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=71O0t+uLgb2RnNCLd/HaCsPnqIz1Hs7imORam0tjljY=;
 b=D9RrgRl9LJX65pd5N39uf3PWXgkF5CPVoiYmUuMAn5GRr3gOv9MRTJyvFjcwakRZzTsmAz
 MO5XyKXnoJGFotAYPW1M2qGG+fcetYulD2EoknZCeCBVFs5k3g2MCA5hbuXrmwd8SczaDd
 YmkAD0d0GDVK6flnXm2Y4tT+/v8GAUQ=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-_EHGUW3CO06RfYztq2RRig-1; Wed, 30 Jun 2021 10:41:06 -0400
X-MC-Unique: _EHGUW3CO06RfYztq2RRig-1
Received: by mail-ua1-f72.google.com with SMTP id
 y22-20020ab063960000b02902782db6cf24so463016uao.20
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=71O0t+uLgb2RnNCLd/HaCsPnqIz1Hs7imORam0tjljY=;
 b=XDoxsVrX+/qrgu+7xF8tw9U8Mp4tkaKKeO6ls0nxb89Wwk3KmsOf0JYNvwh/T/tLwZ
 bItzwBRNNfP43wUNN+CDVD7w54JfsncNGmIoI/gtmzoiu3Ou4Ho2zzjfZNegW0AGGmvp
 OFISEhGwAMAu0a60mJkmRaySSec9XyzeLKFSys/BN5s5g454u3G2D4Hje+jQaBhdPFLK
 AotDJB+eEzLuGG3iEjtuQXO1t6ea8ZRQJdAMRIgpHnDRxmskxFrfkRh3jvjPICGcGnMv
 zptIilZG1wZU0wisHUO6DIJIzau4nY4hW7VJWSlrr63KBJARAW8QXcvGb7x+ZJS4l4YY
 NdTw==
X-Gm-Message-State: AOAM531YFHg2uBgYEa866xzWj16coSoR7yQ8O+JjTfqVelka1ibOzGKL
 i9RtZt80B5yimfuWfn0eQ1z2E3gRDSeey+IMfJajzfx3tfDm3TS0xRs7xh0QkPJJsyS4CB2MB4u
 x0cA8efqPYw7cYbcj4qB5Ex5nBUiuMBQ=
X-Received: by 2002:a67:c09b:: with SMTP id x27mr15876004vsi.50.1625064066490; 
 Wed, 30 Jun 2021 07:41:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg+ZL3EW2uTjTeuca7Dgxd27WPK8/9l5xb01qbIYV7E5TorxoZz6lbUVqQRQ7AFOeeoDqhNOxUVHuVNm5GQsw=
X-Received: by 2002:a67:c09b:: with SMTP id x27mr15875977vsi.50.1625064066326; 
 Wed, 30 Jun 2021 07:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-12-jsnow@redhat.com>
In-Reply-To: <20210629214323.1329806-12-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 11:40:40 -0300
Message-ID: <CAKJDGDYrqaQpj+NH7p7WvnW1zzo3R3DQHhev33=ddcPAkga0NA@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] python: add 'make check-dev' invocation
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 6:43 PM John Snow <jsnow@redhat.com> wrote:
>
> This is a *third* way to run the Python tests. Unlike the first two
> (check-pipenv, check-tox), this version does not require any specific
> interpreter version -- making it a lot easier to tell people to run it
> as a quick smoketest prior to submission to GitLab CI.
>
> Summary:
>
>   Checked via GitLab CI:
>     - check-pipenv: tests our oldest python & dependencies
>     - check-tox: tests newest dependencies on all non-EOL python versions
>   Executed only incidentally:
>     - check-dev: tests newest dependencies on whichever python version
>
> ('make check' does not set up any environment at all, it just runs the
> tests in your current environment. All four invocations perform the
> exact same tests, just in different execution environments.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile | 35 +++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


