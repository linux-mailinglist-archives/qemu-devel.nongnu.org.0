Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8E57B70D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:12:08 +0200 (CEST)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9Ul-0005Fl-Ds
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9Sy-0003Ng-7e
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9St-0006aI-EU
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658322610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAMiZrfX4awrPUKBJjjrU5KRQUDz0xkJ8+2PjMuGrbA=;
 b=gNZSjOU3kfz+6yHu6DPkgy6V3V68NkXwYPkf1HRa/HW+hAhC9yZPd+NnWxaQMQkbANv1Kr
 8gfFK1tVij4Fz/i7Tg2mhNR8GjviFA8ZIfsNrHf4N+vVYf7li4oVng4A6AbH+PY6PNGthB
 ++7iS4kTbsUI2fZW1Iu2gOyOlPyl9nA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-QzWBZPhsPguXdIXXFIMyXQ-1; Wed, 20 Jul 2022 09:10:08 -0400
X-MC-Unique: QzWBZPhsPguXdIXXFIMyXQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 z5-20020a05640235c500b0043ae18edeeeso12053664edc.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 06:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DAMiZrfX4awrPUKBJjjrU5KRQUDz0xkJ8+2PjMuGrbA=;
 b=DmOSd/FABaQDk38C+h/cJk+wO1Zc7YUWMlGIVaUN8cYHUPZMx/QZ03aehgTsa9vNV4
 TNppX2IkU3fCx+sDgUJ5Vfp8alIltCepIruIGfq725d04wVXvYV6RLOwsf7rJMx+Qi2j
 tig1jRHoLZ6oM6/en/iHm1snDn1v+icI6O6tMArqcscBA2JZSg7iRdILlD5+UuJuOKRL
 IPgQ8yn6IjBqEgG0ttv1lZzwgvYpTfnYpGRYL5z3Qh3laxa0+gayu/I9cYKUJVy54Q6H
 r9eWaTWQ/vgtaYw/gObD9cojCyLkJ19EJJ11XPzLot1cOFZkLJRB3TZp4EeVRHFAMjV6
 rUcw==
X-Gm-Message-State: AJIora8nBmmWPlKBAY1PNc8BHYpNDmKAn+1f6k0dq5Roy7UpQv67CEBp
 Xa7AyWHtda1oLW30k/oGfUd5okBg1ncrLWpMlRWMGfX6homVZjo3oO9Z3HUQCDPwFSeP+HUcfyU
 3yb3H9tvYULmecI2hk1hsf6GFMPXylYM=
X-Received: by 2002:a05:6402:194d:b0:43a:82da:b0f3 with SMTP id
 f13-20020a056402194d00b0043a82dab0f3mr50451461edz.104.1658322607479; 
 Wed, 20 Jul 2022 06:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vECwA6FLB46sQFGS69s8Llw0e0ccheFku58t8Uu32N2kKjkxiJMRh6h7u3KzHCIYBnMO7mZvm0Cd/bKGsFYlk=
X-Received: by 2002:a05:6402:194d:b0:43a:82da:b0f3 with SMTP id
 f13-20020a056402194d00b0043a82dab0f3mr50451430edz.104.1658322607288; Wed, 20
 Jul 2022 06:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220719134655.522538-1-lulu@redhat.com>
 <Yta/jwfhnUJzXoof@redhat.com>
In-Reply-To: <Yta/jwfhnUJzXoof@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 20 Jul 2022 21:09:31 +0800
Message-ID: <CACLfguV-dOGVn5NzcVdSog7e1S5nu66NOLwnK3-6aXxwdZFsUg@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] vhost-vdpa: add support for configure interrupt
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, David Gilbert <dgilbert@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 19, 2022 at 10:28 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Tue, Jul 19, 2022 at 09:46:45PM +0800, Cindy Lu wrote:
> > These patches introduced the support for configure interrupt
>
> The email threading of this series isn't setup right. Each
> patch is appearing as a new top level mail, rather than as
> a reply to the cover letter.
>
> I can encourage using 'git-publish' to send patch series to
> qemu-devel to avoid this kind of mistake, as well as giving
> tracking of each version you send through local git tags,
> and being able to auto-remember the cover letter contents.
>
>
> With regards,
> Daniel
sure, Thanks Daniel, I will send these patches by git-pbulish

Thanks
Cindy
>
> [1] https://github.com/stefanha/git-publish
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


