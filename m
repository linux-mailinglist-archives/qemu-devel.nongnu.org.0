Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4780C322500
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 05:48:42 +0100 (CET)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPcn-0006H7-Bd
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 23:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEPXz-0001lP-0b
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 23:43:43 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEPXx-0005vZ-5R
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 23:43:42 -0500
Received: by mail-ed1-x536.google.com with SMTP id h25so10827554eds.4
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 20:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3XsiF+kEKGGWG467hYHh5bnXlvpC0NbU+/pn/Sb1SeM=;
 b=HQw6okVNhpKs9oWKtky6J2Q06BkJpgBH2rf2HAicHaqldjFdbb5HjuuCuj37QFDIhz
 zraDr7OjrrSVtFK7Rq1gCe2GzEMfXetvIPhGhh0yu3rr/sqZBZxgIbQOp0R0sFJRuYM3
 pkE8XW2Q/1+bfyOeVsltXWEBKncu6aZ1YSy+NrreZVnUajcnFnJSkCxE0/+Y4AO1tDN2
 vnOwWJuzYX0HGpSnUs/kW2SGHMlRHAwZ020hOeV4fwxVqzRnuduI82lnsAaH/q0Vl/pD
 I/y0GDOYVvi79m7xbIIxypTtF9hnSAd+P7ebHPsyC4j6uPWONjDzT8tXQrTFCSpDwirU
 VFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3XsiF+kEKGGWG467hYHh5bnXlvpC0NbU+/pn/Sb1SeM=;
 b=H3s1b1gAFbLO2JWbSLB6q8rbcUf7FkxebABe91kFcbDr16TD57r4grVO0pFhs0IfFY
 CczhDtjCgxiIKrkeAephqnCaUlYkz+C+SgLHaSqlwAOpVpoCiN16qpCfiGjjvbT3J/IL
 LKmckd6Z91IeLpobDwzKNtf+vilajI2BhxlO6v+Ho/dueELAvHQwTCKyrGWjTOjm5ZBp
 S1q7ZVpnB8DviU02KJVbDwb3tdmbqwcBkDp2OpB/eYovqaYnSfuBVY/a3jaydJkZrOuY
 ErsNXnrINmSO8Vsygakf93ORS1wtiz3VTg4k6xeDCj2pZWtWWyvWuSjBcpRuGzaEBi32
 yOpg==
X-Gm-Message-State: AOAM532Sk9hMFV3x2cOIKHvs74TJFKCmICo3ThoXFMifXQgdeEEeKUlF
 9qH5rn+nlJ9T5U09tovRPbCLL/GJkFYSMdTd+4w=
X-Google-Smtp-Source: ABdhPJyhFuT68LN+DLxRAGX3a/caqNR5yXDbPBCeSZbFGVoEM26lI9Vl7VER4jv8/UnV8opyYLV5Ywsf33yuTEwArUs=
X-Received: by 2002:a05:6402:270d:: with SMTP id
 y13mr25938648edd.149.1614055417148; 
 Mon, 22 Feb 2021 20:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20210219144848.wy7wmel4lixaqkyb@sirius.home.kraxel.org>
 <20210220113810.78371-1-akihiko.odaki@gmail.com>
 <20210222105100.idqhislns33etne7@sirius.home.kraxel.org>
In-Reply-To: <20210222105100.idqhislns33etne7@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 23 Feb 2021 13:43:26 +0900
Message-ID: <CAMVc7JXTXngrnKF-u91S7JHUMVWrDGLEdupX4XN99dM1ZPJw-w@mail.gmail.com>
Subject: Re: [PATCH v2] ui/console: Pass placeholder surface to displays
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8822=E6=97=A5(=E6=9C=88) 19:51 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
>   Hi,
>
> >  #define QEMU_ALLOCATED_FLAG     0x01
> > +#define QEMU_PLACEHOLDER_FLAG   0x02
>
> > +static inline int is_placeholder(DisplaySurface *surface)
> > +{
> > +    return surface->flags & QEMU_PLACEHOLDER_FLAG;
> > +}
>
> Interesting idea.  That approach makes sense too.
>
> > +        if (!placeholder) {
> > +            placeholder =3D qemu_create_message_surface(640, 480, plac=
eholder_msg);
> > +            placeholder->flags |=3D QEMU_PLACEHOLDER_FLAG;
>
> I think we should set the placeholder flag in
> qemu_create_message_surface() because every surface created with that
> function is some kind if placeholder.
>
> Also when replacing an existing surface we should make the placeholder
> the same size, to avoid pointless ui window resizes.
>
> > -    if (!new_surface) {
> > +    if (is_placeholder(new_surface)) {
>
> We should check whenever this is the primary or a secondary window here
> and only destroy secondary windows.  qemu hiding all windows but
> continuing to run has great potential for user confusion ...
>
> > -    if (!new_surface) {
> > +    if (is_placeholder(new_surface)) {
>
> Same here.

The other surfaces created by qemu_create_message_surface() are not
considered as "placeholder" here, and have contents to be displayed.
Since no emulated devices give NULL to dpy_gfx_replace_surface for the
primary connection, it will never get the "placeholder", and its
window will be always shown.

Regards,
Akihiko Odaki

>
> take care,
>   Gerd
>

