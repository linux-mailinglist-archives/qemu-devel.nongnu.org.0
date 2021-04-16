Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6CD362535
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:09:47 +0200 (CEST)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXR2Q-0004gG-G8
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQpz-00026E-Sf
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQpx-0003Fg-Qm
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618588613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y91i984hImGwqQz+AKB3DHmF5cVKd0a+w+x4hzSH9wM=;
 b=J91rPZDPzn56wXh/O+ITvtJxlzia2oEkolvoIeVRiLu6ZmB+MqLc6MXEH0I98VMBTc5P2J
 IpsnTX8+/0bUClD65+HmxWHDdo96eRk0lMoeGHsfRlVlrtxnz9qelOuF8Oebib64oD0VDv
 3k/676SK5z/RtIFwh2fwptOsYSrnLfo=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-ZORuEY4INlSfzM80f9psow-1; Fri, 16 Apr 2021 11:56:51 -0400
X-MC-Unique: ZORuEY4INlSfzM80f9psow-1
Received: by mail-ua1-f72.google.com with SMTP id
 h9-20020ab02a890000b02901e86c9535feso1956065uar.15
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y91i984hImGwqQz+AKB3DHmF5cVKd0a+w+x4hzSH9wM=;
 b=uOESEGYUObabWPcLv69+8xFFNkP3fO8ogfZ2aScmXA+CwfirvXGORLhSIiLu5MjBPq
 MQNY6TdjLMtvp+b71Jxs98PwzKxoKn+GeV7m8kwBVIM672+pLkAPTYoF9rRXkBiwpPuj
 72IrMkjk/pqFdpMpjqHL3nLZiK7p3ZnedrjurLh8mdo+qvBm/9SDAss8TSUNXgPR5Ks0
 36Gd9y+8C5ycNtDbFbL/dBNeEY2qAOM2/IIPrmyalRkbRYYf+FXSipQT+/i/KiWr53Mi
 oWBtRQjK5f61JCzBYetqVY2KsnibJXUfwUWnymkxCl81KoSGUeNACxiKN6JCZh9oGjHk
 2s4g==
X-Gm-Message-State: AOAM533Cy9KRx9Zy4yXovHPv2S9wg3EiSpxmNEadcA0FtKu7n1oXzRbl
 6kGnsHQ/CBbhnPODRUVTe99iyeEpDwtf4201wYyn8JIU2TKLHjdZ0Ls4qfEdzVQk0GZEPvmSF6E
 s13NkixCXO69HI3NcKTy82ENHuqTV2Tk=
X-Received: by 2002:ab0:3750:: with SMTP id i16mr7147066uat.113.1618588611072; 
 Fri, 16 Apr 2021 08:56:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfe8/7AfC5bjjOR9jr3mOt9nvaYS5RxcQ2p/vLWkSYxoj3rFJIwmFCQXckY+Un1TMeU2Ko5k4GYrky4ElxLGc=
X-Received: by 2002:ab0:3750:: with SMTP id i16mr7147045uat.113.1618588610940; 
 Fri, 16 Apr 2021 08:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-7-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-7-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 16 Apr 2021 12:56:24 -0300
Message-ID: <CAKJDGDZoKNkL-mO9=H126EnHn4pFJKq2urakuGvM1N8anDsQyw@mail.gmail.com>
Subject: Re: [PATCH 6/8] Acceptance tests: prevent shutdown on non-specific
 target tests
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Auger Eric <eric.auger@redhat.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 6:52 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> When running tests that are not target specific with various target
> binaries, some specific behavior appears.  For s390x, when there's no
> guest code running, it will produce GUEST_PANICKED events as the
> firmware will shutdown the machine.
>
> With this change, no GUEST_PANICKED *event* will be generated.
>
> For some QMP commands, such as "query-migrate", a proper response
> ("guest-panicked" for the s390x target) will still be given.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/migration.py | 4 ++--
>  tests/acceptance/version.py   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


