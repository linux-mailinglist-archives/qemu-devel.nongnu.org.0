Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5D37B011
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:29:35 +0200 (CEST)
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZ0Y-0007Po-KO
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgYzX-0006is-1X
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgYzT-00051A-UQ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620764907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stxfxovDZwsNFYsZmJ99pJDWfu0o42BpyR/3uJBBpvI=;
 b=Y/Wx0hR7BuaO4juJgePBd6W+7c/KpH+mKP1BA+KiuyKYvOZj9XNhLACmZCWTLMPInoQFKj
 1AlQW4ohsXu6ROlU+GSZo0bFhP/dU3ccXEHXm/2vhcR4mYea9SRv5OTaEp1OsuKb3hAFGc
 /VLlavh+OUzIR6IhMUbJLCPzvQsIpSc=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-A3dkl-GmM-WGNVWBIG62Mw-1; Tue, 11 May 2021 16:28:23 -0400
X-MC-Unique: A3dkl-GmM-WGNVWBIG62Mw-1
Received: by mail-vs1-f69.google.com with SMTP id
 t28-20020a67d91c0000b02902276f2a59b9so10141053vsj.15
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=stxfxovDZwsNFYsZmJ99pJDWfu0o42BpyR/3uJBBpvI=;
 b=KqVNq6r/0mCQE4pE/5MKoJFLdmtr7tq5qqD3IAVe7yB+9yRbNNh4R2fAtxsy884b6t
 3WCQ9YpLBNkTq1ywUS30mHgr6NkeDD7apmpemSkEDyp9rbtnRgghgCvesIkIlbrX/QFV
 AUxfCiduhUMM2B6vZLJWw5xYibOMl346h4/a3IN2eQJK443ucs+tv4Bz5ZaIy+PmoKtx
 SMCb8zGItLhzxcmSIVDh/eH91ufeYkeO8BRYCLEb8dzB/fl0AyWZpe9cTh4ZH++nzloH
 1HJyhPA3RhsilQmx+RO5hSj49+XCbwZ+oh1jgyOM+qhHAgTJzp65ac6oIm0w2YunWlgp
 aoig==
X-Gm-Message-State: AOAM5305e5DZlhXJWoyPhRPzU8nWANmKmAUHeqVsgx3Vcj5udSVbU1Ab
 hLO51adIlnNyYj9rA9PBeMP/GaQG+SvtJYfLtPGKTwGdrVBsS0Lak+RIHte4lWywEKooHr/3Dmd
 CwifYPxN+ACO5gjeXOC0CbTnKcPzsFKA=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr28276411vsg.45.1620764903258; 
 Tue, 11 May 2021 13:28:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR6Kpk0kgUJl804hDziqPHj8c4DbB9lUFnxDkJdQFYe4tWskdXAWJOdGDUBqQUCKT2zR9cHfFj6Ka+lRNPquM=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr28276403vsg.45.1620764903074; 
 Tue, 11 May 2021 13:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-5-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-5-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:27:57 -0300
Message-ID: <CAKJDGDZZ16SJa0rQQACnURL-Q7iKop7KT7C+nun5Yn=tPs-n-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gitlab-ci: Extract crossbuild job templates to
 crossbuild-template.yml
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
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Extract the crossbuild job templates to a new file
> (crossbuild-template.yml) to be able to reuse them
> without having to run all the jobs included, which
> are mainly useful for mainstream CI.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/crossbuild-template.yml | 41 ++++++++++++++++++++++++++
>  .gitlab-ci.d/crossbuilds.yml         | 43 ++--------------------------
>  2 files changed, 43 insertions(+), 41 deletions(-)
>  create mode 100644 .gitlab-ci.d/crossbuild-template.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


