Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4BF390418
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:36:36 +0200 (CEST)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYAd-0001FO-HV
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llY74-0003TT-J0
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llY72-0002J9-VY
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621953172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PV/AbS+g2d1r06Cgx39487d1CyeQX8KnJxoozKGpULY=;
 b=awCQ2SoVR0+k44/M7olAQGVnh8E7h4Ibhb+tVB52QRnCAwc04ath/ShrsdImVjwK2decnF
 fgJYowFOgDK5dNLpq7yDgTuOUh64sJz9ffvKmKnGpmKPqvC65hbacnG+OBOic3H7zhsByZ
 hRzm2VAfWd8XcSPOI2OjMrma/LNOSMA=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-xMdjq_TpOoSpK8-emWLbJg-1; Tue, 25 May 2021 10:32:50 -0400
X-MC-Unique: xMdjq_TpOoSpK8-emWLbJg-1
Received: by mail-ua1-f72.google.com with SMTP id
 o4-20020ab037640000b0290218107a4549so6917409uat.14
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PV/AbS+g2d1r06Cgx39487d1CyeQX8KnJxoozKGpULY=;
 b=LW+2A8gzwsasUSyP578ajtJ7mhnYFFEuGHbkxho7QuJBZHcD+SI1T/HbUlRXOpzGZz
 CrIBT1mK5etMLAh/MLwMeh+Ht1YuxOCBRZfU3XVbUO1Vj1pNASE+Dfz7wkoaBB5fYikw
 IYBhHTd0czzc9OdjvssNrNC0m3MhHutTW7CBbW7A6cKJ+4Kt5hqDrUsl14hSTMHLbCgh
 xbUl7TzSSWmgnyCqRDyfYngxqpCkVCDd2ALRDLqQTAlagN51WBs8E1pe5Fd5cEmEEtYG
 fWzBbcwEl5OM6dEkBSczzVQRAgUVjvh6EClgNsh4NqjCPyLfdHDMIZ8FYyshuihJs4R3
 EK9w==
X-Gm-Message-State: AOAM530veUWc2B21c7htRxfE4GfiGimkxJ8wb/u9yuUTgRR86PZ4kst0
 6clMwdWdZP/weXgKLpw0Pqz06QdPgbacpNU8BvwCifouCCRdBb501Xu3qcGMu66ibPUzaGrfYIe
 FTjoJmMwbjM79T2xhuHEfsCQNoULxImE=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr25405242vsj.1.1621953170390; 
 Tue, 25 May 2021 07:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3fPGOKjjRZ2myFllE2boZge30tfZzR2rg7B5WLEr0kJdf/RyY8KQHUimRJnvpmu4T+5sl/NPoF7CmJLF4ZB4=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr25405224vsj.1.1621953170252; 
 Tue, 25 May 2021 07:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-5-f4bug@amsat.org>
In-Reply-To: <20210525082556.4011380-5-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 25 May 2021 11:32:24 -0300
Message-ID: <CAKJDGDYw9MquE9yM3q92dXvCvL-y889F40LL7qoJcPVW11JaDA@mail.gmail.com>
Subject: Re: [PATCH 4/9] gitlab-ci: Extract cross-container jobs to
 container-cross.yml
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 5:26 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Extract the jobs preparing the cross containers into a new file
> (container-cross.yml).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/container-cross.yml | 164 ++++++++++++++++++++++++++++++
>  .gitlab-ci.d/containers.yml      | 166 +------------------------------
>  2 files changed, 165 insertions(+), 165 deletions(-)
>  create mode 100644 .gitlab-ci.d/container-cross.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


