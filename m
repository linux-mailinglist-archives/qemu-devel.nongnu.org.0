Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86DF37B015
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:32:34 +0200 (CEST)
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZ3S-00026t-0M
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ0z-0000Dd-83
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ0w-0005tz-GD
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620764996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5hc1HkiInm6o7WNKSZAokPU3HvLhe3TLzv0IOPYidU=;
 b=O3AJY+X5NZPujKt481PknNQZWUUs0q25xnOubM3/J1rT6h8Po8UWqKxamaxucx15PAG+Sc
 FncdZfuYfXc4tuNrmjvEhxTcmIY8LjeU2mBToI8a2yzfLTPTnFzTvCu+UD0zhlSeB8Nylq
 nDB2SfUTTpldiNkAEkYdiD1yleTRfmc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-Ovkk9GksMgusTmTM4KyiEA-1; Tue, 11 May 2021 16:29:55 -0400
X-MC-Unique: Ovkk9GksMgusTmTM4KyiEA-1
Received: by mail-ua1-f72.google.com with SMTP id
 y47-20020ab048f20000b02901f8bb2a8695so2626561uac.14
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r5hc1HkiInm6o7WNKSZAokPU3HvLhe3TLzv0IOPYidU=;
 b=MaUKQbtSLeTsk9FQslBiMBXkXEsgR51eChi0BJ6V5Qf8LpffccNdd3THNCpjQXgzWG
 GQZPITVP69zMt10aGpHX/jIjUoLcLwuYIe5mjtagpJk13Uf73iIi3UxbGOPqdj1mRph5
 1jkjeYGmmR7PgsU1MVVtXxGZIjZrColl81qgzqdD6jSFZbZADfnBZVgMmn9Sye6dRxHX
 dh8HomrKNQ7shZLETR7UbPDZQV8EuEaxl+ceVopt4MDiozQyJMunP34gv4kWxgUdWuv0
 pevXuhl1vvFW70K2AexnwtuouiB5TQhewBzy5sPAW0JNUH9aFirJe7RkftaoZyt9Hu0P
 ocog==
X-Gm-Message-State: AOAM532fI51fII2KlXWkXw8Ac/qEihRZx85IF47iSQoeJSW9jWyYHm4E
 s1qnIYNumlSIQAyPgGhidkXbtkyWzpYhL95FLnaCWVVDDSytiqTAfYBietwCMRv28Za5rPTICih
 A2+bHBS6ASq/GDdVsRTR4nPDBgwh8o34=
X-Received: by 2002:a05:6102:149:: with SMTP id
 a9mr13563389vsr.1.1620764994779; 
 Tue, 11 May 2021 13:29:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6DHPOTmczLbxvQyQdS2NMpY338HgsF+cUMgmfko6szpFQseeNzxQYNXV6X4lwwDc2DyWDOxkAi2jH9MfshGE=
X-Received: by 2002:a05:6102:149:: with SMTP id
 a9mr13563379vsr.1.1620764994620; 
 Tue, 11 May 2021 13:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-6-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-6-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:29:28 -0300
Message-ID: <CAKJDGDYZL0jrMw5Wz-q0DiyqzVEuXJtj46i0ujsJsG4XeU_eSQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] gitlab-ci: Extract DCO/style check jobs to
 static_checks.yml
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Extract the DCO / checkpatch jobs to a new file (static_checks.yml)
> to be able to run them without having to run all the jobs included
> in the default .gitlab-ci.yml, which are mainly useful for the
> mainstream CI.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2:
> - renamed static_checks.yml (Wainer)
> - removed moved jobs (Thomas)
> ---
>  .gitlab-ci.d/static_checks.yml | 24 ++++++++++++++++++++++++
>  .gitlab-ci.yml                 | 26 +-------------------------
>  2 files changed, 25 insertions(+), 25 deletions(-)
>  create mode 100644 .gitlab-ci.d/static_checks.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


