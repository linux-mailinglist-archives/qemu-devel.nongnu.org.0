Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3939541CD0D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 22:01:12 +0200 (CEST)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVflN-0000zp-UI
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 16:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfYM-0001xu-NS
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:47:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfYL-0008I0-4u
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cgDjrV4GXdU4qJz8MSZHLcBy6FHwQU6T4lkBqVJD5+Q=;
 b=SP0+P03tQXQ9+oU1U+9RkPeusk0NEOd+ZA9P3he+1eA8Yjs82XLFmEp1NWId1z4P/QvPYX
 vXKI/79EVf2TmD/2DPNYii9PDW6myY/OWtEHxhnnk6FZhxKHHOVkU1Y9j5HJYkfSj69D/U
 fwZGSY/s0hBQJS3GDcdPpa4wXT2fojY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-U7yjvOX1M32yCOHdi60o4w-1; Wed, 29 Sep 2021 15:47:39 -0400
X-MC-Unique: U7yjvOX1M32yCOHdi60o4w-1
Received: by mail-lf1-f72.google.com with SMTP id
 e9-20020ac25469000000b003fcfe6c574fso3322042lfn.23
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgDjrV4GXdU4qJz8MSZHLcBy6FHwQU6T4lkBqVJD5+Q=;
 b=ysuLFhC0urwPJ2u3jauv0/UkNd/Qj4aEMiCsYEueVX8a8mIdXAmk8wPf6yZXUvRi0a
 pOuDghKnz88bfMQxi9Q6idUgm08uFA9Cn9EjeLBW1r72tfMZphwQaOEEmCoLsauLIQY1
 JzFxkTOjRfK+GkVJfMAyqkhFVzBiLYg7JsP48Dx8E9Jf4XmP3xWkFAyA+vzugY1nGlGi
 8dm70mp7riJ6nsICGRyakz+e/zDA9yxVuAvH21ZepQd+HX0bKHmxFgNWNjPjvrdp8VpE
 KgObJlamBblQAbucCRexZCX4S60uXMg4wD7at8J9B0pK6kCwmbEaYb7Cklzd3lFxOiSw
 J7uw==
X-Gm-Message-State: AOAM532NpZv5Iv2m68p3Y+KNH9Mtj4tNdDChOTBH+HVnVRxECa3uWWZ6
 cfBZ4iQHXpJ2D8K3qqZ2lW6YFAfY/bW/7be9zvJkKA4UXxA9gXrBCWYmBgYdExINv1SdWO63e1S
 1+05OjM96JQpBBioYYvrNr05khfVi7vA=
X-Received: by 2002:a2e:a794:: with SMTP id c20mr1675292ljf.442.1632944857740; 
 Wed, 29 Sep 2021 12:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7OmtE80r4YB0sZKzN9R1Up/GR1LIawpTHUHic0bTjQ4EYbZ4qKW96Fqwdd4SAr9lK2YEbtrKOD/F0j3GbU8Y=
X-Received: by 2002:a2e:a794:: with SMTP id c20mr1675272ljf.442.1632944857489; 
 Wed, 29 Sep 2021 12:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210922222423.644444-1-leobras@redhat.com>
 <YVOcT0qv0Sv72BmS@t490s>
 <CAJ6HWG7kL1jHmZQX1yLciqEksr=bmvx3f4VHRGqQLf_tT2CKnA@mail.gmail.com>
 <YVS9Ea8BbnrMikRu@t490s>
In-Reply-To: <YVS9Ea8BbnrMikRu@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 29 Sep 2021 16:48:12 -0300
Message-ID: <CAJ6HWG6MOqs5xLKZWBdTA2ELh5QV29yq54LTH1aaJ+=Z8EuSAg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] QIOChannel async_write & async_flush +
 MSG_ZEROCOPY + multifd
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 4:23 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Sep 29, 2021 at 03:34:01PM -0300, Leonardo Bras Soares Passos wrote:
> > You mean like I did in pre-V1, enabling ZEROCOPY for multifd it in QMP?
> > Or is this something else?
>
> I mean any way to still be able to turn zerocopy off? E.g. when the user has no
> privilege on mlock.  Thanks,
>
> --
> Peter Xu
>

Yeah, that makes sense in the new approach of failing when zerocopy is
not possible.
I will make sure to do the in v3.

Best regards,
Leonardo


