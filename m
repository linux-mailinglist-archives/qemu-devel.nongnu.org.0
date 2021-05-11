Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71337B01D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:35:45 +0200 (CEST)
Received: from localhost ([::1]:45130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZ6W-0007BY-2c
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ5F-0005KE-JB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ5C-0000DT-R6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620765262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGS7nDaAGGtZ/yKr/8tseu0h6pMHf/EpoiKanxmp39U=;
 b=N3rVCOuVzgMNAmOVPZrpCris/YlKplPZ4mofZLyJSYOAr7ZBrIqqpJIRFGlrPDJhPfiVBP
 Gozc2mPy3iXWy4HqoG9zg6v1xtCbYHa9tiSZVynDwLfxXvlqWraiF5lPGcq5f5lr68TPpl
 0U7LkL2SaQcs9zoF2dzDG0/iDlKGFY4=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-2wzd-Q-LPla0e4Atc5wIsw-1; Tue, 11 May 2021 16:34:20 -0400
X-MC-Unique: 2wzd-Q-LPla0e4Atc5wIsw-1
Received: by mail-ua1-f69.google.com with SMTP id
 v7-20020a9f31870000b029020b2d4ea5d9so950202uad.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sGS7nDaAGGtZ/yKr/8tseu0h6pMHf/EpoiKanxmp39U=;
 b=Uwtd6aFao+lx4JTdxzdJRr6aqlmyIDfm3k0dAm0N+4ETKkBo7PWx0KF7ouaLIqPqCd
 r6B7q8xLH3QVzTCX2UaKFeYLTihVZJJ4bggNwK0JmK0YiVmwsm2Y6WgKWG9pOmb+m8d2
 dujDxvtYXzWSmIu+Hux8FxEbCcOkMIbt5/bBJAF42tq4SiYY/o3u6qBAVmvsJa1gLDZ2
 xIDhQDx0hVsljasEr/+zWErFrPydCD6TalivrPPsY3M36Su4sSZequap1MuGjXN8VN4B
 HufjR9YufDVhptTl6TDFgyBinoDRXzNCNbQf7/ptSAGazsFPxgv6g/4ulsUJh7RUYUj2
 eYZQ==
X-Gm-Message-State: AOAM533vITq0SR+21mK0yE41c3KxZMPV3BA280edpfdgPX152EaZckul
 gpAUHvqwXtD8PsF+dNpToFVoSP5WyfQCeHxmoDwPMvnErYCChfVsvoEc/5IMLuYQOjNNSisUxNs
 sUBjrEfZLJdKmqdT3eO971mSVoTvuf2k=
X-Received: by 2002:a05:6122:1244:: with SMTP id
 b4mr24534683vkp.11.1620765260068; 
 Tue, 11 May 2021 13:34:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXYfmnxrK86JJ/PXlWbBYgcQUvjNcocXThoJTG0s+pduBOSyFZJp6cV3BBDaPp41qKwJEAzr+omQ0VbPENAJM=
X-Received: by 2002:a05:6122:1244:: with SMTP id
 b4mr24534658vkp.11.1620765259933; 
 Tue, 11 May 2021 13:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-8-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-8-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:33:54 -0300
Message-ID: <CAKJDGDbK+JSG=0dWWgoPqfJTejFNCCCXha2Og_m9=nctg_ckag@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] gitlab-ci: Extract default build/test jobs
 templates
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
> To be able to reuse the mainstream build/test jobs templates,
> extract them into a new file (buildtest-template.yml).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 69 ++++++++++++++++++++++++++++
>  .gitlab-ci.yml                      | 71 +----------------------------
>  2 files changed, 70 insertions(+), 70 deletions(-)
>  create mode 100644 .gitlab-ci.d/buildtest-template.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


