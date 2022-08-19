Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E340599E20
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:28:23 +0200 (CEST)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP3v4-0003lO-5k
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1oP3sQ-0000sQ-4C
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1oP3sL-00048i-OW
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660922731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6lhgq07Pc0GYIDdPJdodxH721pPx4bZ5G9m0OC8vmw=;
 b=bHE+yoAZ6czbq6VwMxalLSh/73KaNS845Ll5OmcCkLiDvC5mo9PcdEWAvWvWqVCouNc5me
 N7ncrHBZhMDep6WprEtMn14nnSe4wV1lHNLxZzZGygwuGR05ysmB7cldqSn2YnijKkLuPf
 nAzDIHYGcALqOE+dvRWRwhdGLb2S/RA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-eFqN4bjeNVC-MrW3VtNhCA-1; Fri, 19 Aug 2022 11:25:27 -0400
X-MC-Unique: eFqN4bjeNVC-MrW3VtNhCA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-33580e26058so82188697b3.4
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc;
 bh=l6lhgq07Pc0GYIDdPJdodxH721pPx4bZ5G9m0OC8vmw=;
 b=noNzJI/qoebRKMrLSg1AKD2tmNwb/BSvyC6ZuGiOSZgh91Xsw4Le4v0nmJDBkEs8aK
 xBL192fcQgqNu9mjjCtxSA/xH7zpyq+zg1j/r3ZgYN/Yxag6ogxlnbACENkkNm+X/0bl
 tqv3wl7c2HC+C4bKv0l4Sd2Ai0EWc2N6clU5miyHlZk3MEEYid2NG5LwUYr5579VJSzI
 fEtemkXzVFUkHOxksmaiBn05GqHw/HIndbG/OdVdXNMZYK9iYr+QvznUM/taijNAGAGh
 8/GTTSGWDtE7S3mJAZJCCS+WeYlVKJWLzOAFkaBtiHMoEf5VfgJNfF9M4xN1GL0UZwLu
 N+5g==
X-Gm-Message-State: ACgBeo109mw0rXmkkjhlDHhu9zE/IiSlihnDe5IQDTBio1jbXgrK6u6B
 9J8CSnDi8eTmK8z7lb6yFWmEcF/97WR2UARn3f1Gt8bxBaK4/WLuk6Ebplo6R0QsDFzonzMn1Vy
 HGZ/OJnDFOpJa05/Acd9xTTVsl27Qsfc=
X-Received: by 2002:a25:ed0a:0:b0:68e:ad45:6db4 with SMTP id
 k10-20020a25ed0a000000b0068ead456db4mr8488478ybh.118.1660922727163; 
 Fri, 19 Aug 2022 08:25:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4UDscM8ixi9e8Y9A3ogd51voAvE8iDWlpmwLUj5EXcuKvV4VApvbybHd9hDQXMFKAE3XA+tjU49DcBhShcP8c=
X-Received: by 2002:a25:ed0a:0:b0:68e:ad45:6db4 with SMTP id
 k10-20020a25ed0a000000b0068ead456db4mr8488452ybh.118.1660922726896; Fri, 19
 Aug 2022 08:25:26 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Aug 2022 10:25:26 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
 <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
 <YsVX7ir+41NPA6Xy@redhat.com> <YsVaVpXPE4YVjmVt@redhat.com>
 <20220817162556.fqjq74dtgi2uuyla@tapioca>
 <20220819072052.yl4gvepa5ectlvci@tapioca>
MIME-Version: 1.0
In-Reply-To: <20220819072052.yl4gvepa5ectlvci@tapioca>
Date: Fri, 19 Aug 2022 10:25:26 -0500
Message-ID: <CABJz62Msu=vCqWPF6mtREQph8F_aQA-EmC8bm8ez8-AeEiv+OA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
To: Victor Toso <victortoso@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Aug 19, 2022 at 09:20:52AM +0200, Victor Toso wrote:
> > > On Wed, Jul 06, 2022 at 10:37:54AM +0100, Daniel P. Berrang=C3=A9 wro=
te:
> > > > On Wed, Jul 06, 2022 at 04:28:16AM -0500, Andrea Bolognani wrote:
> > > > > You're right, that is undesirable. What about something like this=
?
> > > > >
> > > > >   type GuestPanicInformation struct {
> > > > >       HyperV *GuestPanicInformationHyperV
> > > > >       S390   *GuestPanicInformationS390
> > > > >   }
> > > > >
> > > > >   type jsonGuestPanicInformation struct {
> > > > >       Discriminator string                       `json:"type"`
> > > > >       HyperV        *GuestPanicInformationHyperV `json:"hyper-v"`
> > > > >       S390          *GuestPanicInformationS390   `json:"s390"`
> > > > >   }
> > > >
> > > > It can possibly be even simpler with just embedding the real
> > > > struct
> > > >
> > > >    type jsonGuestPanicInformation struct {
> > > >        Discriminator string
> > > >        GuestPanicInformation
> > > >    }
> >
> > Similar to what I said in previous email (same thread) to Andrea,
> > this would not work because the end result does not match with
> > QAPI spec, where HyperV or S390 fields should be at the same
> > level as 'type'.

Yeah, you're absolutely correct, I was misreading the schema and
suggested an implementation that couldn't possibly work.

> > If we embed either HyperV or S390, then it should work, like:
> >
> >     tmp :=3D struct {
> >         GuestPanicInformationHyperV
> >         Discriminator string "type"
> >     }{}
>
> For the same reason, I could not use json.RawMessage, sadly.
>
> As Andrea pointed out before, json.RawMessage is just an alias
> for []byte. We need a field for that (so, it can't be embed) and
> the contents of the JSON need to match that field's name.

Right. It would work if unions looked like

  { "type": "...", "data": { ... }}

with the "data" part having different fields based on the value of
"type", but not for the flat JSON dictionaries that are used for QAPI
unions.

> func (s QCryptoBlockOpenOptions) MarshalJSON() ([]byte, error) {
> 	var bytes []byte
> 	var err error
> 	if s.Qcow !=3D nil {
> 		tmp :=3D struct {
> 			QCryptoBlockOptionsQCow
> 			Discriminator string `json:"format"`
> 		}{
> 			QCryptoBlockOptionsQCow: *s.Qcow,
> 			Discriminator:           "qcow",
> 		}
> 		if bytes, err =3D json.Marshal(tmp); err !=3D nil {
> 			return nil, err
> 		}
> 	}
> 	if s.Luks !=3D nil {
> 		if len(bytes) !=3D 0 {
> 			return nil, errors.New(`multiple fields set for QCryptoBlockOpenOption=
s`)
> 		}

Why are you checking this here? I would just have a check like

  if s.Qcow !=3D nil && s.Luks !=3D nil {
      return nil, errors.New(`multiple fields set for QCryptoBlockOpenOptio=
ns`)
  }

at the top of the function, so that you can abort early and cheaply
if the user has provided invalid input instead of having to wait
after one of the fields has already been serialized.

> 		tmp :=3D struct {
> 			QCryptoBlockOptionsLUKS
> 			Discriminator string `json:"format"`
> 		}{
> 			QCryptoBlockOptionsLUKS: *s.Luks,
> 			Discriminator:           "luks",
> 		}
> 		if bytes, err =3D json.Marshal(tmp); err !=3D nil {
> 			return nil, err
> 		}
> 	}
> 	if len(bytes) =3D=3D 0 {
> 		return nil, errors.New(`null not supported for QCryptoBlockOpenOptions`=
)
> 	}

Similarly, this should be checked early. So the complete check could
be turned into

  if (s.Qcow !=3D nil && s.Luks !=3D nil) || (s.Qcow =3D=3D nil && s.Luks =
=3D=3D nil) {
      return nil, errors.New("must set exactly one field")
  }

You should have enough information to produce such a check when
generating the function, right? If making sure all possible
combinations are covered up ends up being too complicated, something
like

  var setFields int
  if s.Field1 !=3D nil {
      setFields +=3D 1
  }
  if s.Field2 !=3D nil {
      setFields +=3D 1
  }
  // ...
  if setFields !=3D 1 {
      return nil, errors.New("must set exactly one field")
  }

would also work.

> func (s *QCryptoBlockOpenOptions) UnmarshalJSON(data []byte) error {
> 	tmp :=3D struct {
> 		Discriminator string `json:"format"`
> 	}{}
> 	if err :=3D json.Unmarshal(data, &tmp); err !=3D nil {
> 		return err
> 	}
> 	switch tmp.Discriminator {
> 	case "qcow":
> 		s.Qcow =3D &QCryptoBlockOptionsQCow{}
> 		if err :=3D json.Unmarshal(data, s.Qcow); err !=3D nil {
> 			s.Qcow =3D nil
> 			return err
> 		}
> 	case "luks":
> 		s.Luks =3D &QCryptoBlockOptionsLUKS{}
> 		if err :=3D json.Unmarshal(data, s.Luks); err !=3D nil {
> 			s.Luks =3D nil
> 			return err
> 		}
> 	}
> 	return nil
> }

Alternatively, you could define a struct that covers all possible
fields and deserialize everything in one go, then copy the various
parts over to the appropriate struct:

  func (s *QCryptoBlockOpenOptions) UnmarshalJSON(data []byte) error {
      tmp :=3D struct {
          Discriminator string  `json:"format"`
          KeySecret     *string `json:"key-secret,omitempty"`
      }{}
      if err :=3D json.Unmarshal(data, &tmp); err !=3D nil {
          return err
      }
      switch tmp.Discriminator {
      case "qcow":
          s.Qcow =3D &QCryptoBlockOptionsQCow{}
          s.Qcow.KeySecret =3D tmp.KeySecret
      case "luks":
          s.Luks =3D &QCryptoBlockOptionsLUKS{}
          s.Luks.KeySecret =3D tmp.KeySecret
      }
      return nil
  }

Honestly I'm unclear on which option is better. Parsing the JSON
twice, as you're doing in your version, could be problematic when the
document is large; on the other hand, my approach will probably
result in more copies of the same data being created.

--=20
Andrea Bolognani / Red Hat / Virtualization


