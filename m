Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08ED4F56A0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 08:54:09 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbzYO-0008Dp-76
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 02:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nbzQR-00037f-23
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 02:45:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nbzQL-0006KO-QY
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 02:45:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id m30so1698270wrb.1
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vT5lKRiSe8j0+eXGeoLltbnfPLuxM2MtQnFCoNlQhRY=;
 b=guvvtp+W/S97M22sLEIwsyLn0zF1taKz7bDmdm2mt46kjRxz46q3jrmqHPO8zg8aJf
 YSpZrGxO2zhrainGI9VLFXngNULilIEoNKxWyGmZg+nsRK4yfvafFWJakwsGyoksxYcK
 m9PLw1pqIpWoQST0NfJfKSMpH8FSicDe/kcyKBZTJ/VfX+SIh3ZBO1I1n7qSlfQEBLVu
 a9A8a3opTBdaB+bWCcN6Fj3GKydXObFBDgQagkkSEQ+Ld4lh1vIbyNSaQtIp1KI0V1xI
 //LHPEWuatkwxLL0stkMG17fpt1ykQiNtWMG2bWuhqxbLHzP5GaUmtS1vZoH9/59Hhz4
 IUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vT5lKRiSe8j0+eXGeoLltbnfPLuxM2MtQnFCoNlQhRY=;
 b=dO1GhQaSHTDtHiw/6OpDSvL0wdTfyYl1OBZqCae150FHKJXkv8sgGmTrLDvuu2IY0g
 bDsIUBynUCnu7uLNlCCgou0PRCIYiubBLNlgXbWI+PIqZGygYVzp21KkcnF1fZGw+Ynz
 S4ts7kBJ29Yhp0an2r7QTjZ/rm/6c3OtGJLyFzi2vWVJd8q5bagG+myRE4aktQV9Ntv3
 w6MCth44psJVBXxl8J/O/h/RFc8lLs1gjsWTPhVKLO8DsBlwK/Tj0n48j0SxN7cGt0PN
 A+3kJL6XKUiVOXpcJ2apspA01zSHJkZK57wbiFx6GkgYd1xFkRFxH1w5+aj9FCrRDq+Y
 q91A==
X-Gm-Message-State: AOAM532RSKiV1dZs+cfAzlZxZtgLwULcd4qcSX0h8SlvqniJm50Z1aJH
 MZR5ehD7KgDuGxXHMwtW3S0Yxg7GtE16J8TwzG4=
X-Google-Smtp-Source: ABdhPJw6tum4RHCFOL0pIF83twMy7xoVs5xU1eeR0fnuRidWDKsQcHjHO+X1+/jj5Zqb+wXH4gPVQVPobHdu9tv5xy0=
X-Received: by 2002:adf:e6c9:0:b0:206:d1a:7d41 with SMTP id
 y9-20020adfe6c9000000b002060d1a7d41mr5448015wrm.562.1649227544190; Tue, 05
 Apr 2022 23:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220405190658.65187-1-dgilbert@redhat.com>
In-Reply-To: <20220405190658.65187-1-dgilbert@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 6 Apr 2022 10:45:32 +0400
Message-ID: <CAJ+F1C+ueusVmzphJ8_jgFJXts5eJRwX5J5kA==4KdFCh8vabw@mail.gmail.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ece20005dbf6b5cf"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, leobras@redhat.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ece20005dbf6b5cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good work! :)

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

On Tue, Apr 5, 2022 at 11:07 PM Dr. David Alan Gilbert (git) <
dgilbert@redhat.com> wrote:

>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ece20005dbf6b5cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Good work! :)<br></div><div><br></div><div>Reviewed-b=
y: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com=
">marcandre.lureau@redhat.com</a>&gt;<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 5, 2022 at 11:07 PM Dr=
. David Alan Gilbert (git) &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilb=
ert@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"></blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ece20005dbf6b5cf--

