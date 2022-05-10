Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF6521E92
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:27:00 +0200 (CEST)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRlL-0005dZ-7q
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1noRjv-0004qq-0n
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1noRjs-00066Z-3V
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652196327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFoN5YQ23UV/pI0tpRc+24q/+STOB4xewZnpl5SFb7M=;
 b=bQbaxICGgv62YvOeH+o5ITKGGmpI61fQ+8ZqkFb3PrHEzo9/C/IZoIZuhh70sHRgGMxR8W
 x8ebLX2L58NpMvbqVSkCniqKqVq5qF+mrcvXVzMLGoxGZcGQWZ0qr0fH1GafPGZQcLeUOG
 +eR7n8MiF1Qr9rFY5d7Lw0UetsKVL3Y=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-K_1Lbih7NoGRT1NRnZd8EA-1; Tue, 10 May 2022 11:25:25 -0400
X-MC-Unique: K_1Lbih7NoGRT1NRnZd8EA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2f8398e99dcso151009477b3.9
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 08:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DFoN5YQ23UV/pI0tpRc+24q/+STOB4xewZnpl5SFb7M=;
 b=v74fSGv6yE64RhxXPo//kbCmLWf1KYC1UojLREIlIJwTOqMCIVOYv+b/D7stJfZX92
 jSjWkKUhs4W+jxWMG5WWqpf7/6rOZ6dEzKH6kkclmEBFP+MGb699YTCKGVjGyWc0tB60
 pAY7Sorbey0XmoXmzUKWmpELbdhK4izj6gLKGQ9CCJzf8foqKlLOP/fnY6e/5wrulFpU
 sSVhN1RtVKn0dWckjWPuMz7P3zxQjkUbWlKYFf98s+XY/FlA4Sz9s8RG7XfP5ROJbKvR
 uAo7M2kzChxs2lLTuVRWHgSV8O452/VhHcEZvhvw7QRxg1EPal8ldRaA2x3PbOfufQmt
 s9Sg==
X-Gm-Message-State: AOAM530dNOxCUYod49bZMggb+7x6H+wVcH0KsDjfMGvk/Mn1PdmyL7tc
 gtj4ln9aXF8UNO+RwFW3n/AjwIL53AONQYr5GC9vaeAibN7exrIV/Cu3KsY3HoOkaaFpoRZEMT5
 B8IQy3tInokPnPhUrn+kRnba4di0cCtc=
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr20232970ywh.384.1652196325376; 
 Tue, 10 May 2022 08:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyMDg+TLD+mjld+vpzbJtiFZ3OOy4oL+/TiqRzYke498e1KlxbGNlzeV0jJov2hd5WvWMjUM6sDDfSwCE9iWw=
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr20232938ywh.384.1652196325067; Tue, 10
 May 2022 08:25:25 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 May 2022 11:25:24 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 <875ymop374.fsf@pond.sub.org>
 <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
 <Yno14p8M2ABKQCcp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yno14p8M2ABKQCcp@redhat.com>
Date: Tue, 10 May 2022 11:25:24 -0400
Message-ID: <CABJz62NuLx=zOzOk1HxuoZpHiDTNKerc9uWw3L6A=_+Jx5XuJw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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

On Tue, May 10, 2022 at 10:52:34AM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Mon, May 02, 2022 at 10:01:41AM -0400, Andrea Bolognani wrote:
> > Revised proposal for the annotation:
> >
> >   ns:word-WORD-WoRD-123Word
>
> Ugly, but we should only need this in the fairly niche scenarios,
> so not too pain ful to add a handful of these:
>
> Essentially if have the schema use CamelCase with UPPERCASE
> acronyms, and declare two rules:
>
>  1. Split on every boundary from lower to upper
>  2. Acronym detection if there's a sequence of 3 uppercase
>     letters, then split before the last uppercase.

That should cover most of the type names, but we're still going to
need to help the parser out when it comes to detecting acronyms in
other contexts, such as all instances of the word "VNC" below:

  { 'enum': 'DisplayProtocol',
    'data': [ 'vnc', ... ] }

  { 'command': 'query-vnc-servers', ... }

  { 'event': 'VNC_DISCONNECTED', ... }

>   QAuthZListPolicy
>
>      Rule 1: QAuth + ZList + Policy
>      Rule 2: QAuth + ZList + Policy
>
> so only the last case needs   ns:QAuthZ-List-Policy  annotation, whcih
> doesn't feel like a big burden

Note that in my proposal the ns: part would be used exactly for cases
like this one to separate the namespace part which, as you said in
your other reply, needs to be preserved when generating C code but
can be safely dropped when targeting a language that has actual
namespace support. So the annotation would look like

  Q:AuthZ-List-Policy

in this specific case. The ns: part would be optional, as a namespace
is not embedded in most of the names.


It's also interesting to see how "AuthZ" is capitalized in various Go
modules that implement the concept:

https://pkg.go.dev/search?limit=3D50&m=3Dsymbol&q=3Dauthz

Most use "Authz" rather than "AuthZ". If we get to the point where
the only bit of weirdness is how we spell this specific word, I think
I'll be able to live with it :)

--=20
Andrea Bolognani / Red Hat / Virtualization


