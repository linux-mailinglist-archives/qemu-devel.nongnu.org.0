Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EC95995FA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 09:29:16 +0200 (CEST)
Received: from localhost ([::1]:58016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOwRP-0003OM-RF
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 03:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOwJS-0006hb-Kv
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 03:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOwJO-0002eG-2Q
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 03:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660893656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pq2ygIbnTjNhD5zGIgdNnLduvl4V9fqu4OPfGlZxs9E=;
 b=H+EXxBTIQQs32Hj4rJ19d13hZyPR/CiPh/na/fZcDlayb/kHEUmNj3BgaNzjF8+A/rmOE7
 ROvF2gtCb1IYV0qAp2M4AergyCsJzU5XXoHo2/DFTBABURtTqJyzTkFUBqIZznMtfoW4lr
 SdmLfhMlGPfML7oy8NcrGG5V8vi4Wi0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-obf6AgscMIilMcFU4sPY-Q-1; Fri, 19 Aug 2022 03:20:54 -0400
X-MC-Unique: obf6AgscMIilMcFU4sPY-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D632D3C025BB
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 07:20:53 +0000 (UTC)
Received: from localhost (unknown [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E9AF492C3B;
 Fri, 19 Aug 2022 07:20:53 +0000 (UTC)
Date: Fri, 19 Aug 2022 09:20:52 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <20220819072052.yl4gvepa5ectlvci@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
 <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
 <YsVX7ir+41NPA6Xy@redhat.com> <YsVaVpXPE4YVjmVt@redhat.com>
 <20220817162556.fqjq74dtgi2uuyla@tapioca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lakojj5jmu75dyyx"
Content-Disposition: inline
In-Reply-To: <20220817162556.fqjq74dtgi2uuyla@tapioca>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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


--lakojj5jmu75dyyx
Content-Type: multipart/mixed; boundary="ffvwmdko5pggrclo"
Content-Disposition: inline


--ffvwmdko5pggrclo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 17, 2022 at 06:25:56PM +0200, Victor Toso wrote:
> On Wed, Jul 06, 2022 at 10:48:06AM +0100, Daniel P. Berrang=E9 wrote:
> > On Wed, Jul 06, 2022 at 10:37:54AM +0100, Daniel P. Berrang=E9 wrote:
> > > On Wed, Jul 06, 2022 at 04:28:16AM -0500, Andrea Bolognani wrote:
> > > > You're right, that is undesirable. What about something like this?
> > > >
> > > >   type GuestPanicInformation struct {
> > > >       HyperV *GuestPanicInformationHyperV
> > > >       S390   *GuestPanicInformationS390
> > > >   }
> > > >
> > > >   type jsonGuestPanicInformation struct {
> > > >       Discriminator string                       `json:"type"`
> > > >       HyperV        *GuestPanicInformationHyperV `json:"hyper-v"`
> > > >       S390          *GuestPanicInformationS390   `json:"s390"`
> > > >   }
> > >
> > > It can possibly be even simpler with just embedding the real
> > > struct
> > >
> > >    type jsonGuestPanicInformation struct {
> > >        Discriminator string
> > >        GuestPanicInformation
> > >    }
>
> Similar to what I said in previous email (same thread) to Andrea,
> this would not work because the end result does not match with
> QAPI spec, where HyperV or S390 fields should be at the same
> level as 'type'.
>
> If we embed either HyperV or S390, then it should work, like:
>
>     tmp :=3D struct {
>         GuestPanicInformationHyperV
>         Discriminator string "type"
>     }{}
>
> But I intend to try the json.RawMessage too as with description
> it seems like we can avoid looking the whole json data twice.

For the same reason, I could not use json.RawMessage, sadly.

As Andrea pointed out before, json.RawMessage is just an alias
for []byte. We need a field for that (so, it can't be embed) and
the contents of the JSON need to match that field's name.

I've removed the string manipulation and used a few anonymous
structs instead. I'm attaching a main.go program that tests this
behavior together with input checks that Andrea suggested. This
is more or less how the generated code will look like in the next
iteration but in case one want's to find a nicer/shorter
solution, I'm all ears :)

Cheers,
Victor

--ffvwmdko5pggrclo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="main.go"

package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"strings"
)

type QCryptoBlockOptionsQCow struct {
	KeySecret *string `json:"key-secret,omitempty"`
}

type QCryptoBlockOptionsLUKS struct {
	KeySecret *string `json:"key-secret,omitempty"`
}

type QCryptoBlockOpenOptions struct {
	// Variants fields
	Qcow *QCryptoBlockOptionsQCow `json:"-"`
	Luks *QCryptoBlockOptionsLUKS `json:"-"`
}

func (s QCryptoBlockOpenOptions) MarshalJSON() ([]byte, error) {
	var bytes []byte
	var err error
	if s.Qcow != nil {
		tmp := struct {
			QCryptoBlockOptionsQCow
			Discriminator string `json:"format"`
		}{
			QCryptoBlockOptionsQCow: *s.Qcow,
			Discriminator:           "qcow",
		}
		if bytes, err = json.Marshal(tmp); err != nil {
			return nil, err
		}
	}
	if s.Luks != nil {
		if len(bytes) != 0 {
			return nil, errors.New(`multiple fields set for QCryptoBlockOpenOptions`)
		}
		tmp := struct {
			QCryptoBlockOptionsLUKS
			Discriminator string `json:"format"`
		}{
			QCryptoBlockOptionsLUKS: *s.Luks,
			Discriminator:           "luks",
		}
		if bytes, err = json.Marshal(tmp); err != nil {
			return nil, err
		}
	}
	if len(bytes) == 0 {
		return nil, errors.New(`null not supported for QCryptoBlockOpenOptions`)
	}
	return bytes, nil
}

func (s *QCryptoBlockOpenOptions) UnmarshalJSON(data []byte) error {
	tmp := struct {
		Discriminator string `json:"format"`
	}{}
	if err := json.Unmarshal(data, &tmp); err != nil {
		return err
	}
	switch tmp.Discriminator {
	case "qcow":
		s.Qcow = &QCryptoBlockOptionsQCow{}
		if err := json.Unmarshal(data, s.Qcow); err != nil {
			s.Qcow = nil
			return err
		}
	case "luks":
		s.Luks = &QCryptoBlockOptionsLUKS{}
		if err := json.Unmarshal(data, s.Luks); err != nil {
			s.Luks = nil
			return err
		}
	}
	return nil
}

func main() {
	jsonLuks := `{"key-secret":"my luks secret is here","format":"luks"}`
	jsonQcow := `{"key-secret":"my qcow secret is here","format":"qcow"}`
	r := QCryptoBlockOpenOptions{}
	if err := json.Unmarshal([]byte(jsonLuks), &r); err != nil {
		panic(err)
	} else if r.Luks == nil || r.Qcow != nil {
		panic(fmt.Sprintf("Wrong: %v", r))
	} else if b, err := json.Marshal(&r); err != nil {
		panic(err)
	} else if string(b) != jsonLuks {
		panic(string(b))
	}

	r = QCryptoBlockOpenOptions{}
	if err := json.Unmarshal([]byte(jsonQcow), &r); err != nil {
		panic(err)
	} else if r.Luks != nil || r.Qcow == nil {
		panic(fmt.Sprintf("Wrong: %v", r))
	} else if b, err := json.Marshal(&r); err != nil {
		panic(err)
	} else if string(b) != jsonQcow {
		panic(string(b))
	}

	r = QCryptoBlockOpenOptions{}
	if _, err := json.Marshal(&r); err == nil {
		panic("No fields set should be an error")
	} else if !strings.Contains(err.Error(), "null not supported") {
		panic(err)
	}

	qcowSecret := "my-qcow-secret-is-here"
	luksSecret := "my-luks-secret-is-here"
	r = QCryptoBlockOpenOptions{
		Qcow: &QCryptoBlockOptionsQCow{
			KeySecret: &qcowSecret,
		},
		Luks: &QCryptoBlockOptionsLUKS{
			KeySecret: &luksSecret,
		},
	}

	if _, err := json.Marshal(&r); err == nil {
		panic("multiple fields set should be an error")
	} else if !strings.Contains(err.Error(), "multiple fields set for") {
		panic(err)
	}
}

--ffvwmdko5pggrclo--

--lakojj5jmu75dyyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL/OdQACgkQl9kSPeN6
SE9xcg//YkfomPq2T+6/YnHjDsuRsDp9648cWCBLdqIFgKBfy2tda/jdyF8rWu2+
fU0B0icIYMxkkSXpqiREhbFbslfLUCW89OyLrRsvPS9yZZvzx35GnepdrEuLPtdN
/MHFudDyhM+FMOrVT0VgaTiPu3iTTTAUqNK78FUf01bdxVSDFMup3raiPc22ThAU
u+K8cXZK0KCXx/2yRJZvbET2zO+A3DwY7cXpHMexz1NTnKuXcifAgI3c+HHagxxA
Ndjlb7x8CbBpkH/Af8v//eh0Js66MLbCoifgTBaQpTa+UztmXIHJesi5hKHkQh8p
NRsVNKphnt5KyXIaPKWHVnkXeagugf6tkPlU1iy1A4hFDEy+DKVmCHSu6PjpyZ/c
hLYvQbkn50zoM+ezH/1p4Cc08VBf22EDii34kTXDT9AU4I+hnhilw3yepRG7nD56
ORwvPQoAUJpgdTtlYa2qQnmM/rJ2VI53xOtX8qwRbNjM5wcEIXS83d2lEybrKJQ2
8MHXidDvOfvdGSDCapUHxgySfKOziI6SfizZsak4hIE9Dv+mgCGpiztNbO6oGZxR
SbY6zoQwyqQx0qkv1z2n8sWvpElBU8/cLb0OYdo7A7NV62UIzeCB4zvRhLeTC15J
IOl8LMopPIaryByjLlOCu0qB/K4/NDXSZDwla6CPT1X7qBbH1mE=
=qJA/
-----END PGP SIGNATURE-----

--lakojj5jmu75dyyx--


