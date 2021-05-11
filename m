Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BD37B00F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:27:53 +0200 (CEST)
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgYyt-0004Bt-Sa
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgYvm-0000vN-SB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgYvh-0002SD-Df
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620764671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGGKmk5e1boK3NUT2PEGv4CSJE5uBp7xIijFgwKFxWo=;
 b=esBkHySGdm0fbIdwuIbqBOr6FOL+TQwOzvozxhYuyKSR+knhbh2OCkTfOUua1IYQIuat68
 wmGXhZsVZ3s/0SRxW+UYRl1icUQh07kclvhKFW1g1DzMXE9dAhv6BrOhqy3tnnfneORV+Q
 0x1+aOMoQ+6LSQJVfBvuKBGjO1kiOXw=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-M5NKCPCyMMmaD3Q324th-Q-1; Tue, 11 May 2021 16:24:29 -0400
X-MC-Unique: M5NKCPCyMMmaD3Q324th-Q-1
Received: by mail-ua1-f69.google.com with SMTP id
 r26-20020ab058da0000b02901e9245a03f1so2616898uac.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cGGKmk5e1boK3NUT2PEGv4CSJE5uBp7xIijFgwKFxWo=;
 b=Ycip61MiYnjT4CE9vqx9pPRvqRXXabvToBfSUm6MhvgJvyA9wsC/B7wSdk6mt13hAG
 bRq62O/heQZf8bkk7ZxBtM2eYcD5M/U+amivnPUq50TF+syt9Jm4P/yHXVnyW8CQLS6i
 hWn6fD3KSSUPf7jdO9+HXKgU1qbYvrBXOj8uNXk03DYm8dBPQg7YBCuqCPwpZGe03+kk
 maMGMvPcqGQyEexHUG1qowE9DTqTmPGMOx3WbqxKo+wsqwKr4aSbD9pmnS+8Qt9xjEGX
 Ekq55CLodEa9dOVVIBTvZ3azcZnpYNu7FFyvBKneexmpatbnvwOZm/GuqKtv+zEQ0dKx
 QVeA==
X-Gm-Message-State: AOAM533Yf1ccyqfNX8ImJMIEyKsFAxwAUudQfrYpW+vzOnxzYMq5wA//
 U/jC1WTCly7b5Jar5GW5SrRAwGT208shGTzmelJgYoga3Esxmb6SCZaouFEoRpU0AN3YQQsZGG5
 PQU0wWLgPccScRV+2lVDWUaE5rNpZsCE=
X-Received: by 2002:a67:2642:: with SMTP id m63mr27039362vsm.39.1620764669030; 
 Tue, 11 May 2021 13:24:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi7eK6unR/rDGh3T06MPW2amiOv6Vzc1uFUMHceewo7xPtW6wzM7Zgue+ZaaCvbW9BpHS7M9TX00Sj5Zs1W2s=
X-Received: by 2002:a67:2642:: with SMTP id m63mr27039348vsm.39.1620764668874; 
 Tue, 11 May 2021 13:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-2-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-2-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:24:03 -0300
Message-ID: <CAKJDGDY_zOvWXMP33_tEf5napC80Z7bYB=A-8RY8iUOzOA8erg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] gitlab-ci: Replace YAML anchors by extends
 (acceptance_test_job)
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> 'extends' is an alternative to using YAML anchors
> and is a little more flexible and readable. See:
> https://docs.gitlab.com/ee/ci/yaml/#extends
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


