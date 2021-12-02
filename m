Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4411E465E7E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:03:17 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msg7g-0003aD-97
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msg1K-0001kn-VY
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:56:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msg1I-00056O-P2
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQTbGCDE0Xqs/hBA1bIEQiZM2zPafyqiOcXLBubqZq4=;
 b=LlU59+zNP1wAQrGWz7x7rIhLrdFAZK2tChISWbmbH+xAYfhLJyf6+qOJbaAbr/4t+A2zNS
 db5pVqh5amn/0FhcOR+8ozlGJ2p5a1Q16owqmwMPi/MkqfzIxv6DzHrcNfzERyju1631oq
 vYg0LsnGGiTV1EU/VQYyMmB2ehlzjOw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-nnLGxtbpMZi1muLggiW_Zg-1; Thu, 02 Dec 2021 01:56:39 -0500
X-MC-Unique: nnLGxtbpMZi1muLggiW_Zg-1
Received: by mail-lf1-f69.google.com with SMTP id
 m1-20020ac24281000000b004162863a2fcso10781486lfh.14
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 22:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BQTbGCDE0Xqs/hBA1bIEQiZM2zPafyqiOcXLBubqZq4=;
 b=OKCc7PGRBhFdh09hbY6qfsJVeyZD9nSYmYnOloMmd4Rzz2VWpZL+ABcOsczwQ7yy87
 LGyCfmNGZpiA0kKscAWCf5Oxy8OclktJ75ruuDCowakvZ3y6DxcZF0z+8bbpnZlZjEA9
 lWTqtXfBSHSdkX5OUaBviIWKMxAeiGAaDjS+yoysv4+Wlc1ZDO5pFrXsmDgSkXBZGAdi
 C1obEZtWdwUxKXLVVl8epDUT5kzrvlnvN9+8zhESw2Wo7Pr+8Ymsogs0DxRtsVrHFFyn
 rWWhDxV1/PiVt+HVrTl6H2d/KTdcMBW4v9eKL63RrDw8mJAxezLSncKz+fgURnBQcAys
 sIrA==
X-Gm-Message-State: AOAM5312vVbKp22O/aVRIaBdUyvZgO/B0qkJIjU44ead3FQwEpQ+B0Fg
 OS3eMZu4spLYsgPpm3IjtvpDQo22QBXUN6sqxusvVuSVbiRde/voQLNkCuUU6kEPlcf0JIZxkYS
 MQhf6qbdNNZfD2Fe6eJ+HpXovPNo0Ig0=
X-Received: by 2002:a2e:9e08:: with SMTP id e8mr10015192ljk.472.1638428197398; 
 Wed, 01 Dec 2021 22:56:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxT8LgI7v0IA94jBI/PRwBQhC4ifHFinGWv4WE0nSrJ8D2ZdRLUbYmBjS5RCDoBrLb2d5g8OjKHGEz6Tnuqmyc=
X-Received: by 2002:a2e:9e08:: with SMTP id e8mr10015169ljk.472.1638428197120; 
 Wed, 01 Dec 2021 22:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica> <YZPZq5sC8F1x+TXE@redhat.com>
 <87czn0ukid.fsf@secure.mitica> <YZPe2Skxox5F6G0m@redhat.com>
In-Reply-To: <YZPe2Skxox5F6G0m@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Dec 2021 03:56:26 -0300
Message-ID: <CAJ6HWG4qnVntjXsF7nVDCfmEqJBjVnNHDrLK5auogenDXkUQRA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 1:40 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Nov 16, 2021 at 05:34:50PM +0100, Juan Quintela wrote:
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >
> > >>
> > >>     if (params->zerocopy &&
> > >>         (params->parameters.multifd_compression !=3D MULTIFD_COMPRES=
SION_NONE ||
> > >>          migrate_use_tls())) {
> > >>            error_setg(&err,
> > >>                      "Zerocopy only available for non-compressed non=
-TLS multifd migration");
> > >>         return false;
> > >>     }
> > >>
> > >> You have to do the equivalent of multifd_compression and tls enablem=
ent,
> > >> to see that zerocopy is not enabled, of course.
> > >>
> > >> I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, =
but
> > >> I can't see a way of doing that without a qio.
> > >
> > > I don't think you need to check that feature flag.
> >
> > Oh, I mean other thing.
> >
> > When you set "zerocopy" capability, you don't know if the kernel suppor=
t
> > it.  My understanding is that the only way to check if it supported is
> > here.
>
> If you reqest it and it isn't supported you'll get an error back from
> qio_channel_writev_zerocopy(). That's a bit too late though.
>
> Ideally we should report an error straight after the migration code
> creates the I/O channel, by querying for the feature.
>
>

Agree.
I suggested checking the feature presence where the test is happening
in v5, and the other combinations of migration parameters at
migrate_params_check() as Juan suggested.

What do you think?

> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

Best regards,
Leo


