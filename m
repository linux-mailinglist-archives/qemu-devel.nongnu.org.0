Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BDF6EA723
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:37:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppnBe-0007RF-AP; Fri, 21 Apr 2023 05:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppnBa-0007El-7V
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppnBY-0003Yg-BD
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3icSzVfmRuM+szIABXkN8mdFe4M2lgjM6ptqSyVtvI=;
 b=cVToDitkv3CCEk+DmF8iomgEkfmjdi2xS89baeJayPZfGvd40NLIP7sBB2LVe8xytD66DV
 5LguXnjlgNBYvLRdqAfkhZZcQjVDEg0Hy3vjh7Q14GeFksf6suTJNs2k6FaHqgwoDEFd0P
 HHI+KZTchDo2iHNL4yaMAq9s3Ozo9UA=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-7kuMFJJHPNWiqE3B0mFObg-1; Fri, 21 Apr 2023 05:36:06 -0400
X-MC-Unique: 7kuMFJJHPNWiqE3B0mFObg-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-4301bc3d45eso293977137.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069765; x=1684661765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3icSzVfmRuM+szIABXkN8mdFe4M2lgjM6ptqSyVtvI=;
 b=ZtR/gQsbm+MsIFJtmD6a3/SbAdPakwWH+hl+QgTDBQB/S0W0d6l6KC5pHRr4XM9kDk
 ui625ps8oyHYEm9WohhldN2RMqCl35sFFMDK1sKN4W7JTnHhAtWhW5CRduh77utuoHUU
 yp+o19w5uy3vrwzFSm6UOstiFU6DvMdK6mylyY6yHhT9j9FaJ6jDvVjC5Tr5bYRcei02
 7uzTyn9PZFEYn+ML3D1spH6K2aW2Wk6oS5YHH6/2e4PJuk0Hsuf7+hrLXSi2/5/+4JmR
 P+L14yVXITCD+SBBh+d0noxVCWSqZP6XNPSXbyQOiAZZzk88Zh8gvDIrTzYVQHfC1XNQ
 FO+w==
X-Gm-Message-State: AAQBX9e+SEK0bS35Brl+f7kknSlIF0NKHkC4hZQ21Rm9265tBfX8gaQp
 tQdN7W4cXVV9wCEt3NvUQBrcPIQCr2Gcre5T5JCwUIcLsgysTinGx0jaqGfKOove/jUJoHypN9U
 d3z51CMQwv+WqWHUoUpc9L0/PIdEzvxJ7cAbKzkOIaQ==
X-Received: by 2002:a67:ea57:0:b0:42e:faab:8b56 with SMTP id
 r23-20020a67ea57000000b0042efaab8b56mr2071218vso.32.1682069765526; 
 Fri, 21 Apr 2023 02:36:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350blDzL2gSvXZzpaunkcoi1srHk7W1ILWFAFxMEQV4OhctJrmZW8FQb2iY2qqIRgCiULhThaz8kkuPpid7KOYhE=
X-Received: by 2002:a67:ea57:0:b0:42e:faab:8b56 with SMTP id
 r23-20020a67ea57000000b0042efaab8b56mr2071212vso.32.1682069765318; Fri, 21
 Apr 2023 02:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221212131700.250209-1-pbonzini@redhat.com>
 <20221212131700.250209-3-pbonzini@redhat.com>
 <Y8lC8d0/XdEct7Mc@redhat.com>
In-Reply-To: <Y8lC8d0/XdEct7Mc@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 21 Apr 2023 11:35:54 +0200
Message-ID: <CABgObfZr615RrUuPegzN3V5DVpdhkau2_32ep58T8qWdsDS8cw@mail.gmail.com>
Subject: Re: [PATCH 2/3] block: do not check bdrv_file_open
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 19, 2023 at 2:17=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> wrote=
:
> >      assert(!drv->bdrv_needs_filename || bs->filename[0]);
> > -    if (drv->bdrv_file_open) {
> > +    if (drv->bdrv_open) {
> >          ret =3D drv->bdrv_file_open(bs, options, open_flags, &local_er=
r);
> >      } else if (drv->bdrv_open) {
> >          ret =3D drv->bdrv_open(bs, options, open_flags, &local_err);
>
> I suppose you mean drv->protocol_name for the first if condition?
>
> The bug will disappear again after patch 3, but this intermediate state
> is very broken.

Yep, I split the patch wrong. Will resend after you merge block-next.

Paolo


