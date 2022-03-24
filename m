Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A74A4E6535
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 15:32:45 +0100 (CET)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXOW2-0000Av-Ew
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 10:32:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nXOT0-0007lZ-18
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 10:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nXOSw-0000Iz-LT
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 10:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648132169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0j55qHPKd+csN1w7AUAhUqYcLNBLgDvOAFZ5Cvk32M=;
 b=DKBM+NT3fbMcn5dj+zwfQvtnZQxXeFgWXtH0FcMMihih5Gycc0PNsZDccSQguOPYSEsxx+
 1gQ81zxdAtCZTR+4f7uEgqMicyuzAWcVy87utHj8He/PyhVWyBkmOiod5ibmfjCXspfPYf
 7sJj4CCBtCGnTrS74+weoYIriEPP4AE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-JQaWuty1PYqB0CnAbWnIkQ-1; Thu, 24 Mar 2022 10:29:26 -0400
X-MC-Unique: JQaWuty1PYqB0CnAbWnIkQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 w1-20020a5b08c1000000b00633be107f28so3702144ybq.4
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 07:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y0j55qHPKd+csN1w7AUAhUqYcLNBLgDvOAFZ5Cvk32M=;
 b=U+efci/pO8IWPtcY2Q5NCJ9fdgh4pWPgXs0ISZZLEGc9hp6rPRJ2786D/wroioCU0r
 j1d7GiWp75gSujvBuE3kSl0x0tgEeMuFnwGW2xbVnBeg3z5CTqLbxTOAQucBm+W6ZcU/
 PgDUAk2E7FtYUFCGkySKMcKt1i9yJ8A5JrNB3Kn649doP1VIJq3fy5GdrcvbOzkQPZl4
 UQE+uyKloxDoBG/r2ep+0GYurXM4vSBe45uKbIwWvHfAVSwH15jg34xAl01/bIsDxIIo
 Sv/6nclwxK+cKxMNQlfAFc4nFaWpjMRvkld+v7KUtCKEB4Adfaijbi2Tz+oEqYFHkrAL
 i4SA==
X-Gm-Message-State: AOAM5326XwGg/BdM4izLTU41t53xODyqum86Ux1Wa3BDqXS3EVVhCSgL
 gMyhvnqGBm9iATfN13Qldp46wG8Lm3VASJJv9KFdtbzgFz/YrDvyF8vZh3rJ9TN1IFinxcOLKxu
 uTL6WnMX+nz9swexZyN6vCQ7C66dKuYw=
X-Received: by 2002:a25:d008:0:b0:633:c639:88c8 with SMTP id
 h8-20020a25d008000000b00633c63988c8mr4882951ybg.547.1648132166075; 
 Thu, 24 Mar 2022 07:29:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRWl/CqtZQSo1FQQQti78eFohh3wpDvXwrBah+2g6g/Nm1iL32uryPbhjiczCs8FV/Wbi42xvZOMTjxrxuIy4=
X-Received: by 2002:a25:d008:0:b0:633:c639:88c8 with SMTP id
 h8-20020a25d008000000b00633c63988c8mr4882929ybg.547.1648132165889; Thu, 24
 Mar 2022 07:29:25 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 14:29:25 +0000
From: Andrea Bolognani <abologna@redhat.com>
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
 <YjwzCM3/wZ4S2fxf@redhat.com> <Yjwzy97JAHKhvCHn@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yjwzy97JAHKhvCHn@redhat.com>
Date: Thu, 24 Mar 2022 14:29:25 +0000
Message-ID: <CABJz62N52DA8P9EweUnqgO6-Yy6-e8in2PDyjqcE_kbhWh7kvA@mail.gmail.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 09:03:07AM +0000, Daniel P. Berrang=C3=A9 wrote:
> > Overall making it *all* GPLv2+ compat is going to be important if you
> > want people to be comfortable using it. If it has a mix of GPLv2+
> > and GPLv2-only code in the source tarball, then the overall combined
> > work will have to be considered GPLv2-only and that will put people
> > off using it. Even if they could theoreticallly restrict their usage
> > to only the GPLv2+ parts, many won't get that far before moving on.

Agreed.

> Actually I'll go furthuer and suggest that if we're going to do a
> relicensing at all, and your goal is to encourage usage, then GPLv2+
> is the wrong choice. Use LGPLv2+ if you want to facilitate usage, while
> retaining a copyleft license.

Does LGPL make sense in the context of Python, where there is no
linking?

--=20
Andrea Bolognani / Red Hat / Virtualization


