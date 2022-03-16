Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4844DB1AF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:38:29 +0100 (CET)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTrA-0008QY-Hi
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:38:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUTTf-0004wK-Ca
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:14:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUTTZ-0002Q5-DY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647436442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doLWLnw6eHfr72Gil39CTeI7mAXFeyf2KFHIXi2JXTM=;
 b=JjRDy5fEVf+k0dsg9ln3+aaAfZ9mHe5ErIc5hyI/J+TlyjzvqSt5urFxgQN4XhoMLsdLGW
 kcLzXoSP/9S0SA+jqJxuyaIBFiTcwOrBgBWSCFJkJRkNr20ntrnouV7k9qmyRXR58IierX
 58KqDSwHsMvKqNOC/AFwkeS3J0Yw0w4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-XcP3SJFzMY6WfnqoDoUxwg-1; Wed, 16 Mar 2022 09:14:01 -0400
X-MC-Unique: XcP3SJFzMY6WfnqoDoUxwg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2d07ae11462so18411917b3.8
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=doLWLnw6eHfr72Gil39CTeI7mAXFeyf2KFHIXi2JXTM=;
 b=Qve6dOOOhW5rxfB9sbY5SK9MCXpRZb2jryudf9QeqrNy1G4/S9Rzpq+r37ho9Xxnn+
 yzzd4y1mUSIotehK2O1eifH/DunP7c1eNtmyHWkCUTn5JhFiPh1y2SsBWP71lsC4tGBV
 gOdTPHs9Zfqponfkbl1s6woqKGvT7eB0BgneFK4h92sMOFWVauis+IEUn7HwhbXAwFYi
 DuETuiUMc1/r/IwXFmTnHz5HmhG1BS9gxX62Z8QSucrjXb3lADkot/069DUXPnRy22Nj
 Q3n8BZ1gNS9bqY7lQTgIciruNkoKr6YLks1WPXu4JBA8bINCxdV/4Xzsd3KNYOCS8HqQ
 98ZQ==
X-Gm-Message-State: AOAM532uvmHDQHBt/dlqO60HoZqcAGXXGradt/PIeS7w+SbCrABPcAo4
 vZzhp5XeJIDTY55XtU7yYf15h4kubahHf78rG/No/q4rETnDJk7rxde/UVhGO0ndsn47ve2xaCm
 TLUG21mkEX8yvATQw7IyEanameFOkbzQ=
X-Received: by 2002:a81:fe01:0:b0:2e5:85ba:f316 with SMTP id
 j1-20020a81fe01000000b002e585baf316mr9669734ywn.33.1647436440685; 
 Wed, 16 Mar 2022 06:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXNfUcPZKvQOjw5AA1eq5WPfJWrOI2bg3CFzoCD288vwBLHIpw02WlEaHXmv+HNMaoH4o6fOKdIymi5gP4SFc=
X-Received: by 2002:a81:fe01:0:b0:2e5:85ba:f316 with SMTP id
 j1-20020a81fe01000000b002e585baf316mr9669719ywn.33.1647436440503; Wed, 16 Mar
 2022 06:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095156.2613419-1-marcandre.lureau@redhat.com>
 <YjHhjqW4a+td5T7y@redhat.com>
In-Reply-To: <YjHhjqW4a+td5T7y@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 17:13:49 +0400
Message-ID: <CAMxuvaxkV1VpGjEEnOaOpgCakrEsKCxWSfJRdY_aQn8vYLUHRA@mail.gmail.com>
Subject: Re: [PATCH 00/27] Misc fixes and cleanups for 7.0?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Mar 16, 2022 at 5:09 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Mar 16, 2022 at 01:51:56PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Various clean-up and fixes patches that might be worth it for 7.0.
> > Some of the patches have been posted and reviewed before.
>
> FYI, something went wrong with this posting, as it hasn't set mail
> threading, thus every patch appears as a standalone message.
>

Thanks I didn't notice with gmail. I used git-publish with
--separate-send, because I wanted cccmd to apply on each patch. I
thought it would respect the threading though.. Stefan, what do you
recommend instead?


