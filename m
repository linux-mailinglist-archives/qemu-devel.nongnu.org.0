Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB9039041E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:37:53 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYBs-0004Xc-Lw
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llY8x-00088Y-S9
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llY8w-0003Q0-8P
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621953289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wioLdrTD2T9Ju8Xyl2WoEwe/j1KPTlvQFXQuQHl4LL4=;
 b=iMUnSSP+ihrN6R+vP0/x8KkxO+iqo5yMTbhCEbQPf4UuqD6yg2jkfyWPrsFvgleoj+GrwJ
 2+hRVwFxD+V6CrO5aCiylqSZlEwQJyepHTmqz1ZwBqLGwRT2AIqd3I9lM7wBUWyfu7Rvcc
 utPH7V0K4H7ycxl+Ja5C3rHkBsPZIe4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-w-NOk80xNB2LDCLf5JQY_A-1; Tue, 25 May 2021 10:34:47 -0400
X-MC-Unique: w-NOk80xNB2LDCLf5JQY_A-1
Received: by mail-vs1-f69.google.com with SMTP id
 g13-20020a0561020ccdb029023fe9ce9042so2948113vst.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wioLdrTD2T9Ju8Xyl2WoEwe/j1KPTlvQFXQuQHl4LL4=;
 b=InCe4Xj4/fF4ihulvrzH0i+C60Ui3/f3eZd/m9tvw43Q4zQ0PKXbngIyBxpN2bqLcd
 ftZyoUXvtbYuuAcU5bAJnV0CBoO0o0DFZ8H894ZYoETg5ejoliBNjNUWvJ7GtSA99RI1
 7mW4NFG9KY3ZJ7s24LxmVA32iufHytAGhsBMvyGZfWcPXzPQt4Lk/ZuFE1m/DZnGZt9/
 tTkQBy1J0hYxQ+2P6+ABIoyyZtLlGQELzAaB2/gSM10LR5+vVwRF/fX11Vto+VDv2xFW
 qGdeEYT8gKHStcad/x9CVDsoaVHHiXcQlcoxHG6dZ0x3RVYDT1pWSMp6aw2TUJF6T0zM
 HR4A==
X-Gm-Message-State: AOAM532hQrR751jYyVyXm6M8paiVkG9sk7GLE3ckOpTC5GO3WeON2wpg
 PxAxbyRYvUXRInSN5+QDTQS57r0+hI7bkk6v7LMld3TCfQJ7jGWTAJ4qJCvF6oV0pSX0d1BCFbG
 bOa8JnyTqAOEnseMyoAmDxZmKAYV8IjY=
X-Received: by 2002:a05:6122:202a:: with SMTP id
 l42mr1559514vkd.2.1621953287521; 
 Tue, 25 May 2021 07:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2X/fEVgsxlDIJpOSVBqPejA0odhB9je1SkcjPjwwXO4QDBkCska1kMOUEDv74G02ID9cVXW213Q81N5VpIzM=
X-Received: by 2002:a05:6122:202a:: with SMTP id
 l42mr1559501vkd.2.1621953287382; 
 Tue, 25 May 2021 07:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-7-f4bug@amsat.org>
In-Reply-To: <20210525082556.4011380-7-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 25 May 2021 11:34:21 -0300
Message-ID: <CAKJDGDZEeN3PcKwKeuo7MfvyCD5TFG-TL=OWkgmyJeL9i8Z-uQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] gitlab-ci: Split gprof-gcov job
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
> This job is hitting the 70min limit, so split it in 2 tasks.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest.yml | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


