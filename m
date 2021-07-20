Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483D3D013F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:08:39 +0200 (CEST)
Received: from localhost ([::1]:48516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uAY-0006UB-0u
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m5u6w-0007bK-Df
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m5u6u-0000bw-VZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zuDEjXXltw0bkKjfoU6vZUfZNuKwVGHYuT10bfBQRAE=;
 b=H6ReTkngsvqrx0dkr75lFS2D9obMEwvoxQm2/sIT/ZYL1YS/LMzIW5ZKdUMG9RfewTUIbh
 1iY34Xs5d3l/Fyh1TqjJXXRc4tYEsNXzZXpO4Jq9nUS3qLVPBshYCyg/MLWmniAMlARyVe
 fHuz7iC71um9zZEG9rlPEKSH/IoBpE8=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-HAXC2yTvPSWT7w3MHrfJPw-1; Tue, 20 Jul 2021 14:04:51 -0400
X-MC-Unique: HAXC2yTvPSWT7w3MHrfJPw-1
Received: by mail-ua1-f69.google.com with SMTP id
 k13-20020a9f30cd0000b029025e3e26edb8so11054785uab.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zuDEjXXltw0bkKjfoU6vZUfZNuKwVGHYuT10bfBQRAE=;
 b=U3Nnpx2Jm10CwM2qIz/oOYsM9t2GPgP7tmw52mRwt1xPISudQFSWYrtHPyL5NxBkE1
 uAfywqopJpVLfmn3e+vY8IqKqohO0ygCty39T4Vd5nZWCkMPPTNrtsblwckj15jsRN9o
 haVqN5Uf/GuPasEYhKcMexhdP8c6Sfz5kSjSVKTE7Uw1GyyWN5R3WD+3s+GbPjpCtlmq
 c3RhGL65Xxmt+CxLat1kp1ZL16JRUHZ60grUVkbTzk8+8FrtDgsxYfcDVO1CsXVY0t8S
 +fx/fE2sMMJ2729NBXdL9IfwrXsxroGc6uoGghw3NimdadwI8kxuj3XR2zkA1a7mcHw2
 nvKA==
X-Gm-Message-State: AOAM533jHHV05+s8DlzGZnd6O3+thj3re+Axqndxrt+rJhM3X+WqI1Sk
 3WqBHAd0laraNuvt8z2vKWzUZWEL7XFRl6iT0MFDuKDAnJc0NFk6yWNcpl6VvOJjusUY0XCekkP
 sanlfCXVgLqo0XbYjxRTMZg3nJZpW3Pk=
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr28330371vke.2.1626804290650; 
 Tue, 20 Jul 2021 11:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypvoWEkgdtubqDrTPJwyMg5lf5kd7V80V5lQg5LDvhB/AjPBU+8npo9m3IcdhXvTphSJ0Pe5D7ZambwTFSZkY=
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr28330340vke.2.1626804290457; 
 Tue, 20 Jul 2021 11:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210719073051.1559348-1-thuth@redhat.com>
In-Reply-To: <20210719073051.1559348-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 20 Jul 2021 15:04:24 -0300
Message-ID: <CAKJDGDZdrY-4aa4dYNUpgbz7yf2f2ex_tDESMVt+67baUAdAVg@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Remove the second superfluous macos task
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 4:31 AM Thomas Huth <thuth@redhat.com> wrote:
>
> While there might have been bigger differnces between the -base and
> the -xcode images in the beginning, they almost vanished in the
> current builds, e.g. when comparing the output of the "configure"
> step after cleaning up the differences due to temporary path names,
> I only get:
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


