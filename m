Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10FC4855DC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:28:45 +0100 (CET)
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n58DU-0006a6-D0
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:28:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1n588w-0001fP-Bx
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1n588u-0001qP-GR
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641396238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VjYS9b3y0rt4xOLWtLn6uW06loed5zLyzVvJQAutZM=;
 b=eaXv2FFFmRprPFVREFE4FBXKo7mcHdowWCKeutphY7CS0YW9Yae8DjNOm0lSH0wfBgSZnm
 Hy+tk1v4dXm9jrjXquHsMaxW21YXLIwzrkMCyPPDnIqDoiafi52wZqCvDyQOhHBF3740lE
 Tg0O+DM+Z1vMOkN/yQU/gtGUxhVGY+U=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-lDRVaaneOTiVEy5-tUbhsQ-1; Wed, 05 Jan 2022 10:23:54 -0500
X-MC-Unique: lDRVaaneOTiVEy5-tUbhsQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 t28-20020a63955c000000b0033f3b16a931so21542458pgn.4
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 07:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/VjYS9b3y0rt4xOLWtLn6uW06loed5zLyzVvJQAutZM=;
 b=7DrXREMPHGGlwnu2/W2/EFF6kdMYzbKzRiuNfqAllBO5kV/QTdkhrIqv77SlnQV42p
 4HlR0DENAsVZq0lqfJ2WtYEw+4RQTyK+j1jPx3/C8oewacFHMh5xjwj0dSCGmIQj4aig
 QG7JVM/05dWls6eCljun7FORpNzSpBmyeVXoAt4eSgklZVh39HdfxexdVgmBgHLQ5tkn
 BQ0vDGFWOGepQrVXzetcveCDt9OwYRcJT+8pxY1cFbMVf+GK+P3BDqdhZPu3KKpz0D3Q
 /w1WIGXkrmuH0lQRH2Lp2sCcuQ8bePuKwkDSfqTPE9hEL9K7AWf+16b32H35I6YD8RLb
 gw6Q==
X-Gm-Message-State: AOAM531gjERRHDOdPdnNSGBAqbrjTpq35IsCCQvzpnS7zlQ3WfVkjsXs
 GL2DaQuYLFKjNxkYNc+XtUYRoK7gWDQI0kzFRiiIfSp1EhpbGLyMApZUikTUc7Cv73BPGMTS3k3
 vLOSalicp/T+nR6KKjVdaSWUzManWDBM=
X-Received: by 2002:a17:902:740a:b0:148:e19c:b467 with SMTP id
 g10-20020a170902740a00b00148e19cb467mr54611524pll.61.1641396233276; 
 Wed, 05 Jan 2022 07:23:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHUYX0K5htIZ+Zq3KUVCQg6uH0sPf7UvIXejnInTP/iKl0eQssEvYW0Gf2oF2KU8CjcAkbigTCXPPnJXssVZc=
X-Received: by 2002:a17:902:740a:b0:148:e19c:b467 with SMTP id
 g10-20020a170902740a00b00148e19cb467mr54611505pll.61.1641396233007; Wed, 05
 Jan 2022 07:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20220105095055.44475-1-kkostiuk@redhat.com>
In-Reply-To: <20220105095055.44475-1-kkostiuk@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 5 Jan 2022 19:23:42 +0400
Message-ID: <CAMxuvazHxsuzh8eF7QSEku4oCfq8B1mXN=YjwVtzM5Xqz3sZEQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for QEMU Guest Agent Windows
 components
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 5, 2022 at 1:51 PM Kostiantyn Kostiuk <kkostiuk@redhat.com> wro=
te:
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f871d759fd..1f255ec874 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2729,6 +2729,14 @@ F: scripts/qemu-guest-agent/
>  F: tests/unit/test-qga.c
>  T: git https://github.com/mdroth/qemu.git qga
>
> +QEMU Guest Agent Win32
> +M: Konstantin Kostiuk <kkostiuk@redhat.com>
> +S: Maintained
> +F: qga/*win32*
> +F: qga/vss-win32/
> +F: qga/installer/
> +T: git https://github.com/kostyanf14/qemu.git qga-win32
> +
>  QOM
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  R: Daniel P. Berrange <berrange@redhat.com>
> --
> 2.25.1
>


