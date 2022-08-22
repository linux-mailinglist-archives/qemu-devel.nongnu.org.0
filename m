Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA39359B9A3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 08:35:50 +0200 (CEST)
Received: from localhost ([::1]:52170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ12L-0003pC-AE
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 02:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oQ10C-0002Ie-G7
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 02:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oQ108-0001ZJ-3g
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 02:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661150007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CTlNR4YmngemyI7DU4NXaAO8L1BGlZgUabnG25AjYHg=;
 b=g3U4rFgGaW7fm3g5oGRFdBtGL+PItDWd2X0sJiU4rSZRPamBwxT3sa6QVG6mrC/GcZLmMV
 NcLb/XUDzzlqI0uUacHHTIISScQrD/U6oFHsRiy0KlKLGcWK7tnTnqV8VkZ3aNHA9cBdQ8
 cp4jCpsMykB5DS7UNjddEhXn/HcKNAs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-lws6SNg9My2C3C5ZBqyDOw-1; Mon, 22 Aug 2022 02:33:23 -0400
X-MC-Unique: lws6SNg9My2C3C5ZBqyDOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B43C804184
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:33:23 +0000 (UTC)
Received: from localhost (unknown [10.40.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12D03909FF;
 Mon, 22 Aug 2022 06:33:22 +0000 (UTC)
Date: Mon, 22 Aug 2022 08:33:21 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <20220822063321.msxpxbvq5o7l4hat@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
 <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
 <YsVX7ir+41NPA6Xy@redhat.com> <YsVaVpXPE4YVjmVt@redhat.com>
 <20220817162556.fqjq74dtgi2uuyla@tapioca>
 <20220819072052.yl4gvepa5ectlvci@tapioca>
 <CABJz62Msu=vCqWPF6mtREQph8F_aQA-EmC8bm8ez8-AeEiv+OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ekugjg53dn3xcwjj"
Content-Disposition: inline
In-Reply-To: <CABJz62Msu=vCqWPF6mtREQph8F_aQA-EmC8bm8ez8-AeEiv+OA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--ekugjg53dn3xcwjj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Aug 19, 2022 at 10:25:26AM -0500, Andrea Bolognani wrote:
> > func (s QCryptoBlockOpenOptions) MarshalJSON() ([]byte, error) {
> > 	var bytes []byte
> > 	var err error
> > 	if s.Qcow != nil {
> > 		tmp := struct {
> > 			QCryptoBlockOptionsQCow
> > 			Discriminator string `json:"format"`
> > 		}{
> > 			QCryptoBlockOptionsQCow: *s.Qcow,
> > 			Discriminator:           "qcow",
> > 		}
> > 		if bytes, err = json.Marshal(tmp); err != nil {
> > 			return nil, err
> > 		}
> > 	}
> > 	if s.Luks != nil {
> > 		if len(bytes) != 0 {
> > 			return nil, errors.New(`multiple fields set for QCryptoBlockOpenOptions`)
> > 		}
>
> Why are you checking this here? I would just have a check like
>
>   if s.Qcow != nil && s.Luks != nil {
>       return nil, errors.New(`multiple fields set for QCryptoBlockOpenOptions`)
>   }
>
> at the top of the function, so that you can abort early and
> cheaply if the user has provided invalid input instead of
> having to wait after one of the fields has already been
> serialized.

In general, I too prefer to return early! So I agree with you
that it is nicer. At the same time, I was thinking a bit from the
code generator point of view and the overall expected diffs when
generating new code.  More below.

> > 		tmp := struct {
> > 			QCryptoBlockOptionsLUKS
> > 			Discriminator string `json:"format"`
> > 		}{
> > 			QCryptoBlockOptionsLUKS: *s.Luks,
> > 			Discriminator:           "luks",
> > 		}
> > 		if bytes, err = json.Marshal(tmp); err != nil {
> > 			return nil, err
> > 		}
> > 	}
> > 	if len(bytes) == 0 {
> > 		return nil, errors.New(`null not supported for QCryptoBlockOpenOptions`)
> > 	}
>
> Similarly, this should be checked early. So the complete check
> could be turned into
>
>   if (s.Qcow != nil && s.Luks != nil) || (s.Qcow == nil && s.Luks == nil) {
>       return nil, errors.New("must set exactly one field")
>   }

Main problem with this approach is that there is some big unions
like BlockdevOptions, this means that we would have to repeat all
fields by the number fields times (40+ in BlockdevOptions' case).

> You should have enough information to produce such a check when
> generating the function, right?

We do!

> If making sure all possible combinations are covered up ends up
> being too complicated, something
> like
>
>   var setFields int
>   if s.Field1 != nil {
>       setFields += 1
>   }
>   if s.Field2 != nil {
>       setFields += 1
>   }
>   // ...
>   if setFields != 1 {
>       return nil, errors.New("must set exactly one field")
>   }
>
> would also work.

I started with this approach actually but then I realized that we
can just keep the if checks and instead of counter, do check the
variable bytes []byte. So, do you think that the counter is
actually preferred instead of inner check? I don't mind changing
it.

> > func (s *QCryptoBlockOpenOptions) UnmarshalJSON(data []byte) error {
> > 	tmp := struct {
> > 		Discriminator string `json:"format"`
> > 	}{}
> > 	if err := json.Unmarshal(data, &tmp); err != nil {
> > 		return err
> > 	}
> > 	switch tmp.Discriminator {
> > 	case "qcow":
> > 		s.Qcow = &QCryptoBlockOptionsQCow{}
> > 		if err := json.Unmarshal(data, s.Qcow); err != nil {
> > 			s.Qcow = nil
> > 			return err
> > 		}
> > 	case "luks":
> > 		s.Luks = &QCryptoBlockOptionsLUKS{}
> > 		if err := json.Unmarshal(data, s.Luks); err != nil {
> > 			s.Luks = nil
> > 			return err
> > 		}
> > 	}
> > 	return nil
> > }
>
> Alternatively, you could define a struct that covers all
> possible fields and deserialize everything in one go, then copy
> the various parts over to the appropriate struct:
>
>   func (s *QCryptoBlockOpenOptions) UnmarshalJSON(data []byte) error {
>       tmp := struct {
>           Discriminator string  `json:"format"`
>           KeySecret     *string `json:"key-secret,omitempty"`
>       }{}
>       if err := json.Unmarshal(data, &tmp); err != nil {
>           return err
>       }
>       switch tmp.Discriminator {
>       case "qcow":
>           s.Qcow = &QCryptoBlockOptionsQCow{}
>           s.Qcow.KeySecret = tmp.KeySecret
>       case "luks":
>           s.Luks = &QCryptoBlockOptionsLUKS{}
>           s.Luks.KeySecret = tmp.KeySecret

I think this one adds a bit more complexity and I'm not convinced
that the gains are worth.

For example, with types that differ over fields with the same
name? We would need to move that inside the anonymous struct
somehow;

For example,if Luks's KeySecret was KeyScretType we would have to
use KeySecretLuks *KeySecretType. Still, both of them would
likely be inside of "key-secret" json object (so, same key for
two different fields, not really sure how that would work out)

>       }
>       return nil
>   }
>
> Honestly I'm unclear on which option is better. Parsing the
> JSON twice, as you're doing in your version, could be
> problematic when the document is large; on the other hand, my
> approach will probably result in more copies of the same data
> being created.

It does sound nice to parse it once but if we really want to do
that, we would need to work with Golang's JSON decoder [0]. IMHO,
parsing twice with in-memory data might be okay for the moment
while we are trying to keep things simple and later we could
benchmark against a custom decoder [0] in the future.

[0] https://pkg.go.dev/encoding/json#Decoder

Cheers,
Victor

--ekugjg53dn3xcwjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMDIzEACgkQl9kSPeN6
SE89UQ/9E4+N3zgmHv1PrjRhSgpDc8GvBFkGPJEfN6JPHksq3o4g3podptI5DZoY
iAcJeYN1a8DTWp4ei89fCLxZZNo3Tgx1MzlwnyYdB13eFYUZ1uPdTBbNSMM/2Lmy
WzQAZ8/puvmJqyF+12ENgm8FaFInLCRed25mNmhp5bN8m4RtTAslMGFxL/22mKoG
3DocFsDai11X0Gwz3e3EhxFoK1mt9++9+bIXkb6qtKX9sYxSvNN0n5VpHrjQd09m
nXGook1k5QWybbOr23QWK4PI0eMUU5CFTt5MlFUrgNyHLeXay6wLRiFgmlYDZi+o
pD0uUuiWwMTV6gmhpYV2y1coBHEQfhtX+hK32wj+t3+L9yU7w+TwmXXsdnWFJwZo
ygI29ewsIXgq4fZDRL3f1wY6FZPyTPg3+mlUkv7exl1W1T2hQeLaDmHweQK99+8R
5Z9ocmpmncbPaZbSoA0CY6MFQ4/Xx9OC1SsglM4O14zDfIj1FQ0kJj0XGBiY0E46
UE7hPmO+Fzrjf87yEc7sLTiWwEyI1Xq+BnB577aVzBdlEP8dcagRkfUqLEjeLddA
GmmOeC9YlendTk/wBQHSAYWr7uFUSiuczO6F+8fPjRt9O5TMGhLM1gWJsBrNhpce
EvlnnmhLNfX2dig6uHFvbbAcrZAZa3r1bG5SpHxule5XC+ZTPOI=
=GgdX
-----END PGP SIGNATURE-----

--ekugjg53dn3xcwjj--


