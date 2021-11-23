Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9A0459BCA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 06:35:12 +0100 (CET)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpOSV-0003pW-2H
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 00:35:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mpORC-0003Ar-Kj
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 00:33:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mpOR8-0000fI-5L
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 00:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637645624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egeO1KCEzKKZGfk3csmFYP6ZRbnQiFQxYE5u37eHkv0=;
 b=BxmfGsp+DbUjljz9DcyDf9iZYO+Rfuhog9g4gHmF5SIUixThUn84TZXHOOPMwcN77Gm3t+
 IPXnbGnXwPZyxswY3UruxgAD+t0rUProhZNG9/G1qR5rj7kJFJS4xn0OVWhgtZmEHncHqv
 G5pstae7zO1tcJ0d4uYAAMKXjKF8CaE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-GxfUMZksPySF84Lyb7hpHA-1; Tue, 23 Nov 2021 00:33:39 -0500
X-MC-Unique: GxfUMZksPySF84Lyb7hpHA-1
Received: by mail-lf1-f69.google.com with SMTP id
 c14-20020a056512104e00b004036d17f91bso13649502lfb.17
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 21:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=egeO1KCEzKKZGfk3csmFYP6ZRbnQiFQxYE5u37eHkv0=;
 b=QxsTX5bXhgCokDU7U8H8YFGP14nbO2WszFDRSU4ARExbvSvTGdNXSe9LJdl1HU0VVF
 wIfsUp83MxZgjkkCKdysfT21mCXVBcq7bHcESX8WG3Rh/Ygiym6n1RWu0gYaOuQvikam
 xgwLL4YIFnrD4k2HVd8ukjVkVgD/y3NLYJUJszi5lj4wf89KzwJyLir864r2Cb5H1DwG
 JWS7VfKlUKvCCQ1fAyQP/phUTBxDInkWbop1ZSMpJeNB0qYnxoRsEp/leMka7CZTT7A7
 5z23XWFgga8E5BvBUrEbo4qP7ifTllDEQG3r56pUbLpynYYIH/xSir92Q3CEf3hpbwot
 orsw==
X-Gm-Message-State: AOAM533Z6rxraVm8xhhiMa025uIEK3xl7GI0SH30WhZb/xZK6I+biIfp
 pYJVGJJDQS6MCtwLHozoBBhhDh1cw2pyzen0G/CfK2tyUImedi2o0akkRtEhPe6H0ZYcNDlFst4
 n676cDD9MsaCUHcBM6l2UfRcP8lh1s4M=
X-Received: by 2002:a05:6512:32c8:: with SMTP id
 f8mr2043138lfg.669.1637645618412; 
 Mon, 22 Nov 2021 21:33:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2K08jHsgKd4YIGq61bEeQJ/IYVVExI3fR/CLpDD6TF/HooQm20K8/9Arv7nezA0wOpTEDZd9KTgB4rrUMwJ4=
X-Received: by 2002:a05:6512:32c8:: with SMTP id
 f8mr2043112lfg.669.1637645618169; 
 Mon, 22 Nov 2021 21:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-3-leobras@redhat.com>
 <YY4+rIO+U5P2mn4K@redhat.com>
In-Reply-To: <YY4+rIO+U5P2mn4K@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 23 Nov 2021 02:33:27 -0300
Message-ID: <CAJ6HWG7OCWU9mcLO=8GK1uobW2DaFjNf=+V0FyosGfuzFjDMYw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] QIOChannelSocket: Add flags parameter for writing
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hello Daniel,

Thanks for reviewing!
Best regards,
Leo

On Fri, Nov 12, 2021 at 7:15 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Fri, Nov 12, 2021 at 02:10:37AM -0300, Leonardo Bras wrote:
> > Change qio_channel_socket_writev() in order to accept flags, so its pos=
sible
> > to selectively make use of sendmsg() flags.
> >
> > qio_channel_socket_writev() contents were moved to a helper function
> > qio_channel_socket_writev_flags() which accepts an extra argument for f=
lags.
> > (This argument is passed directly to sendmsg().
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  io/channel-socket.c | 26 +++++++++++++++++++-------
> >  1 file changed, 19 insertions(+), 7 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
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


