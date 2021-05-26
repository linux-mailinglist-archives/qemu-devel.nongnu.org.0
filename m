Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCF391CF3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:22:36 +0200 (CEST)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwIl-0007wM-FV
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llwHb-00078m-0x
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llwHW-0001Zj-GG
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622046076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PViC3upHtEEAywyx7QSzZ7DSOKANRwFbueohAlIUwFw=;
 b=VhJDJ0pWfpHnhM5X5GiofcyXw7XnCpal4OLlYdwGwyDmuptEXUi10asFMTmQ+I+sRatqBT
 3HG403RWoLJNg293nbjHNQal1m4yGdZ5ZyFUIiNJEQmDT7IuWwREKiWGBtXuWPeS11dnnj
 iNHvGdcOId9AFLYPOOXYqwuuV8BBEA4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-ISy7dbxsMTS353VI9eVbpQ-1; Wed, 26 May 2021 12:21:14 -0400
X-MC-Unique: ISy7dbxsMTS353VI9eVbpQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 m15-20020a05610206cfb0290248aedd0e0dso459306vsg.16
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 09:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PViC3upHtEEAywyx7QSzZ7DSOKANRwFbueohAlIUwFw=;
 b=jI1RRMiswHxRK3jpcQUaVVvhGXvKilXRGfLHgTKUwX1nhyo5bCljOOmyOlb0ZZLDb4
 nyvowdiwT/O7s6Pscw6dFedRJ+gmkHkSxkZjJCKaUBZ15/VuMlWoeNWrkOe+tOd9WZnz
 5hLg+/T3iOEwQ7zUgAPGM3Jw93pUYkPQssFCmM+uqPvhyjDPQRdaaLU/Ldc5DCpk7iGN
 PyE+9LgaXR/eWF4CSF0gVkumv0feSWyadrwddJNHowlNSKNNlKdZQkjVme2A38XpdAs2
 4rH7/CU6WR0HMmALC329tSn659oj1kY72Ab9UTlcA5XY/IjXjBnCYgASg8BRfY2kpwGE
 Y6Cg==
X-Gm-Message-State: AOAM530fWnnaXHTa5Em/Q8W8wJ7oTSe9hkvU7qHQvryuOTb41x2l73jW
 oPClY9+P0ySXev60UHjVTSOXtGlIEBx18VZklKswtaaWFCrI6zeDQ34vOqjMoXejpRR0DbcM3p0
 GGoYlyiU+rxkY9uWo03xle7Ch/+CrvX4=
X-Received: by 2002:a05:6102:14c:: with SMTP id
 a12mr12291529vsr.39.1622046073493; 
 Wed, 26 May 2021 09:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJaz6XgPRNfcKwtVIoT+Ooyb09NxPCoiAOSNYS+9uNIYmcQgxMYybPfeLJwSqa/rIhvybyQAC5OuC8UbY2PsA=
X-Received: by 2002:a05:6102:14c:: with SMTP id
 a12mr12291496vsr.39.1622046073277; 
 Wed, 26 May 2021 09:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210525132418.4133235-1-f4bug@amsat.org>
 <20210525132418.4133235-2-f4bug@amsat.org>
In-Reply-To: <20210525132418.4133235-2-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 26 May 2021 13:20:47 -0300
Message-ID: <CAKJDGDZDLTaWrQqZ0BF4pV5SbV=JR=bQH=paQOT2ZDuGSKaGiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] !fixup gitlab: add special rule for the hexagon
 container
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
> Make the build-user-hexagon -> hexagon-cross-container optional
> to avoid on mainstream CI [*]:
>
>  'build-user-hexagon' job needs 'hexagon-cross-container' job
>   but it was not added to the pipeline
>
> [*] https://gitlab.com/qemu-project/qemu/-/pipelines/309137207
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/containers.yml | 7 ++++---
>  .gitlab-ci.yml              | 8 +++++---
>  2 files changed, 9 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


