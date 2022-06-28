Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E30E55C0FE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:36:53 +0200 (CEST)
Received: from localhost ([::1]:34766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ASa-0006k5-EK
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o6AOQ-0004La-2w
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o6AOL-00080R-UI
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656419538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ud4V+ID6MT1TgtWnwsorD91ZOtP6EyyuKR5RBaVqPuk=;
 b=b2PyGMkJF78uUf8ptV90EGsLarvfOd+l3Wjh/rxzPWgpp/VUpc7Pf9xCkpDfJV1o1WA0aC
 +9784/P25rVq7fcXF1ZSrKBWnAglp+mwjBIwZWDcizHgRmcwzlNZsG+p5Glw+sO+nnfOjs
 ySHRwvHJDQ/gIPI6z9vG5HU6+DDxQ04=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-L8sToQFqPh-i6Nmx-QZFug-1; Tue, 28 Jun 2022 08:32:16 -0400
X-MC-Unique: L8sToQFqPh-i6Nmx-QZFug-1
Received: by mail-ej1-f69.google.com with SMTP id
 qk8-20020a1709077f8800b00722fcbfdcf7so3565475ejc.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ud4V+ID6MT1TgtWnwsorD91ZOtP6EyyuKR5RBaVqPuk=;
 b=tF2Py0I+RSD3w3sG+sz7RLODHCxg2ZRhUC4iMAxm5IcEHOYET6bADC3bHeYXv9iG2Z
 BhCPs9XAWTdyIb9y8i4xEXqnkVLsDN/Lt39NwFB+5CyD2Wf2yqTRIs46dKj7Dt3+ncEe
 eMSn+sMSbZVD2xwZ3Ym4baivZp+nkGblFDOYlwqTqMxaPktjv8lXcVcw57SoD63AktQ4
 U5vJaenvmfM/na/HuHQq/WUKyM5JG6UeKEUA4bbET1CM4+1eijk2q5O3soidT0DTkYG5
 AyP0dvssGiLNeGgDpooPYQPtVtKhYrxjgPoud916ra+TE77TUIk+8Ynj4V/NJ2vKrdSj
 Q+9Q==
X-Gm-Message-State: AJIora8IEElEQOfiM+tytbFIV17HcMXaMncR0mPYBCicyptgnKDEilRm
 xHfLRUVO+PRa1CbDnQ2zSY8QXJfvdUUaFZ9bl7BdlKqcm2EVEp45daLyaK/QMoTfaZ0wr2rIQrS
 2zowyuEMheILWf2uVd4wAaavABPPQs6c=
X-Received: by 2002:a17:906:58c6:b0:722:f703:4659 with SMTP id
 e6-20020a17090658c600b00722f7034659mr17115268ejs.209.1656419535516; 
 Tue, 28 Jun 2022 05:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vDarpM9D+0+1yLqrWbLoWyakfqO7QHNZo7rZe3GzfH2tkEE1DhQt7hgQYl8zOxD9NR0NsxtGR6ZH/FnmsjEug=
X-Received: by 2002:a17:906:58c6:b0:722:f703:4659 with SMTP id
 e6-20020a17090658c600b00722f7034659mr17115246ejs.209.1656419535298; Tue, 28
 Jun 2022 05:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220628010908.390564-1-leobras@redhat.com>
 <20220628010908.390564-3-leobras@redhat.com>
 <YrqzhFAePnnEl8A8@redhat.com>
In-Reply-To: <YrqzhFAePnnEl8A8@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 28 Jun 2022 09:32:04 -0300
Message-ID: <CAJ6HWG5UGpgBqK-7OTA6Gxu0LKMfGq5gVvYffOaSMWO1bfyjVw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not
 working
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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

On Tue, Jun 28, 2022 at 4:53 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jun 27, 2022 at 10:09:09PM -0300, Leonardo Bras wrote:
> > Some errors, like the lack of Scatter-Gather support by the network
> > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on us=
ing
> > zero-copy, which causes it to fall back to the default copying mechanis=
m.
>
> How common is this lack of SG support ? What NICs did you have that
> were affected ?

I am not aware of any NIC without SG available for testing, nor have
any idea on how common they are.
But since we can detect sendmsg() falling back to copying we should
warn the user if this ever happens.

There is also a case in IPv6 related to fragmentation that may cause
MSG_ZEROCOPY to fall back to the copying mechanism, so it's also
covered.

>
> > After each full dirty-bitmap scan there should be a zero-copy flush
> > happening, which checks for errors each of the previous calls to
> > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> > warn the user about it.
> >
> > Since it happens once each full dirty-bitmap scan, even in worst case
> > scenario it should not print a lot of warnings, and will allow tracking
> > how many dirty-bitmap iterations were not able to use zero-copy send.
>
> For long running migrations which are not converging, or converging
> very slowly there could be 100's of passes.
>

I could change it so it only warns once, if that is too much output.

Best regards,
Leo

>
>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 684c014c86..9c62aec84e 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -624,6 +624,9 @@ int multifd_send_sync_main(QEMUFile *f)
> >              if (ret < 0) {
> >                  error_report_err(err);
> >                  return -1;
> > +            } else if (ret =3D=3D 1) {
> > +                warn_report("The network device is not able to use "
> > +                            "zero-copy-send: copying is being used");
> >              }
> >          }
> >      }
> > --
> > 2.36.1
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


