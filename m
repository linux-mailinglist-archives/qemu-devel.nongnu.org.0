Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B75391D01
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:27:19 +0200 (CEST)
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwNK-0001Qq-VH
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llwLu-0000eK-38
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llwLs-0003eI-F7
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622046347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/vy6Bl4TcwZ4IVMZ1Z2U6Al/j/LJ7JNyqkiBhSCREo=;
 b=edmHPIwC0F7xJQtK78dvZnJ18XgxvcICj0/ovC0zqCW9KKkWnHIowYwI3SBcichIW0SG7r
 sZhkdF2A4Nazd+T6K51ei/BUfpuc4YTZZlHT8A5KhAis3GeHmAf+nIA2NnEhQM5hUlT1ZP
 wVw8AgN2EI0Lfxf0btnTuk7CYUlEkIE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-mJgbZIU1P_WATVxcyATZQg-1; Wed, 26 May 2021 12:25:42 -0400
X-MC-Unique: mJgbZIU1P_WATVxcyATZQg-1
Received: by mail-vs1-f69.google.com with SMTP id
 a11-20020a67d30b0000b02902363051a2cbso466770vsj.18
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 09:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q/vy6Bl4TcwZ4IVMZ1Z2U6Al/j/LJ7JNyqkiBhSCREo=;
 b=iS4N6ERFUL1QHXBNfbVXCk7mBjRhSoxdUSe9nIyG2ywEFlRhqBo3lHE1SO5K7xFd5K
 3kDXBp0TWM+uNyz2mGKyHK/4AA68BNROLeokV5BaOBKnLJHXV+nqG4PvPI9CUKE+SlNe
 vJrXE4RFuLf0GPQKUBHRd7rV3Z9jSCBI7XwNV7cNKWeeIAaZn3dK+5Wq/1qDmI6yefCV
 Dht10ZxHHgYh86/DWCtLnBHsC8QEd+YJyJJXxsdAigX+sJatf7wfA6Vqtt5xU2sHrTKv
 X2dSKvu9g6bOkosLrGVpAja9CCA+URlC4O8T2CTOuJZcY+/Ou+xflm/G+r8OZoeiDer2
 rOeA==
X-Gm-Message-State: AOAM532SzBcIE7Bh/J3vDw/0hzo+uPlDD9CkDcp3rhSJkEM+7Nez4tWt
 4IRydAqP29zK7KrvATn7NLuAIUAl4eF5wrCiFjdOpC70dj/zpUDVDnGy7CUM151YtIJ6Q4eExFJ
 gOo26WwftuUcvnKPL2cOWlR4tiqGkCTc=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr33471348uam.5.1622046342393;
 Wed, 26 May 2021 09:25:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg9MZ78UgWKYeRiS6PjXM+waBz1e+F5ZTxgwBjYe+o78EpG2g7abkIs/vdpoHGrFQwrHnnnSSx+36H97pfohs=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr33471330uam.5.1622046342245;
 Wed, 26 May 2021 09:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210525132418.4133235-1-f4bug@amsat.org>
 <20210525132418.4133235-3-f4bug@amsat.org>
In-Reply-To: <20210525132418.4133235-3-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 26 May 2021 13:25:16 -0300
Message-ID: <CAKJDGDboUh8NWmmjKiga6Xsd_KAUM+PL5FUmGaq+KCdoHEHyWw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gitlab-ci: Convert check-dco/check-patch jobs to the
 'rules' syntax
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Tue, May 25, 2021 at 10:24 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Per GitLab documentation [*]:
>
>   "rules replaces only/except and they can=E2=80=99t be used together
>    in the same job."
>
> Since the 'rules' syntax is more powerful and we are already using
> it, convert the check-dco/check-patch jobs so no job use the 'only/
> except' syntax.
>
> [*] https://docs.gitlab.com/ee/ci/yaml/#rules
>
> Inspired-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.yml | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


