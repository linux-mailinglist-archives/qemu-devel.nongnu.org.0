Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3859737B077
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:05:28 +0200 (CEST)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZZH-0000TM-AU
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZVi-00058T-S6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZVg-0000tM-Tb
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620766904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZ6q82dlUidjMoFqOSuq0Bdhoqo7I4O2Afj9D6ZNCJg=;
 b=Iio5BxP3xTPWLsw4BbnqnWUyC5aycKKeLWH+0PgktdhsezSxPjW7Yy19QC/ydllpCFE3R6
 dX/HCcI8VOpOuPKkgy+OIhvkHPD2kRu725eXx4M+3meZmf9Dd60XOJre5EnEsO3EJT2nXc
 Bz901WXe13gghvz70W93F+2yKGOyalE=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-xt1S0sUYNeKa_JQ8r4wEqQ-1; Tue, 11 May 2021 17:01:40 -0400
X-MC-Unique: xt1S0sUYNeKa_JQ8r4wEqQ-1
Received: by mail-vs1-f72.google.com with SMTP id
 p23-20020a67d7170000b02902276bd91076so10194355vsj.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 14:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sZ6q82dlUidjMoFqOSuq0Bdhoqo7I4O2Afj9D6ZNCJg=;
 b=SLKNwPpT+y48Y805/jCh5gAUVOPPou+ApYGjNO3ZPrKXKyoj79P7V9CR9OnukLZ/Cf
 5mrGwMe9JUzMn5GVk7pLbL+Q+FahnyzoHtRLSFf+DKL6KBVLYdVxPqVdiytyXmBW19c1
 bkb3uAfV79Wmhnvbtw4cHeKYCqCrmyNku2JTIwXDz4hQC7966lGOBP1Wso945jUOWUiu
 TE5NbVMEpDQEfaMxAJfJ+qHnucwnBJeyvTu4CZVxHKxPts8MpqVUSgZd/NDDlU/1453v
 Htd2pSwXNBuf1QN7iUzCIwkc5kJrdQcqVK91r4Wvw0Lm3Bw9auC7SRhmvuvp88mZ/Yyn
 Yy9A==
X-Gm-Message-State: AOAM531BDs9X0nWumlIlXsFGkQiYVL6gE86s+Y4rLKzyfrSU4aUTHWBU
 ZVn6EvaLx9gWpJPiHYwKQOrGoGw76H/ogiTQl3P/MKS+I5Z/TFaOSqYHtA1Gl39bc+n45PBxUJs
 eJOz2YswPaG1nanFfg12Pne2IeDfHOi8=
X-Received: by 2002:a67:6f86:: with SMTP id k128mr24604045vsc.50.1620766899662; 
 Tue, 11 May 2021 14:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0LPz49xw6Gv2l5pZZ+B8KwtnvVRzRClyeb4YgHcmIjh7yIzMNBjleOt1LPik7E0VgC1qyPzc9mJjJd4iKbQU=
X-Received: by 2002:a67:6f86:: with SMTP id k128mr24604023vsc.50.1620766899470; 
 Tue, 11 May 2021 14:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-8-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-8-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 18:01:13 -0300
Message-ID: <CAKJDGDZJ5yNRLOrg1pP_TvrvuQdSFpKu3ab4y3se_i+MOiiWfQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] crypto: drop used conditional check
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 10:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> The condition being tested has never been set since the day the code was
> first introduced.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  crypto/tlscredsx509.c | 2 --
>  1 file changed, 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


