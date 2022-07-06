Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71041568417
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:52:38 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91i0-0001VV-EK
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o91Kd-0000D6-Sy
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o91Kb-00014A-3R
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657099704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPQzKL14n4LksGAvp74JiBBrAO+WfUZxPQgdcqJ77mY=;
 b=Ob32FDLnwD82G7Kovn6QK4NQT19lvcuX8jyjbDWPEpLokAFUmfjSkjFgswANXQrSu1ZLGB
 8K5SR3+6ELT8/qQm8LvS+iCtsyMrBJk2GdUrLieKD6SkjCLUnHiRuM1A0suVrRALY3Ql35
 6rUFrJsjagLxppDrNLi9i2IxqOqgxyM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-9HPSehr_MumPydS8fjgeGw-1; Wed, 06 Jul 2022 05:28:17 -0400
X-MC-Unique: 9HPSehr_MumPydS8fjgeGw-1
Received: by mail-yb1-f199.google.com with SMTP id
 w2-20020a25ef42000000b0066d68be3fbcso11450347ybm.13
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xPQzKL14n4LksGAvp74JiBBrAO+WfUZxPQgdcqJ77mY=;
 b=qfw/4nW7NkPbzI92Nu/JxC5sKV0hyQCDf+ayuLwuYeksvNGS620ZrtEI2Kc/VoxGqu
 dtPrivSlJIPZNhcAWRj/yALyhi2CDUOPuU4DHod2MwP/I5ZxQjRsEPxSReK22fyU29ib
 vyoVEi/In6C/eYz1ci98eev6lgfpNnVMkk1HgWIrGcZU2kZkfb21e6WVsmjQTUaXzBAf
 2ACNj9rqoCUa0tHgDVL7YMcg1vAkJFL2jOBG5tSJkNDgPHjTbGUOgVeFcVo9koEwG7Yc
 BfQNaWNOW7svUDIrZXClgghx0rlyaINbgVLMN5569ebI1Cp0RBCPjSk6XE6XBfdMzZw8
 iiig==
X-Gm-Message-State: AJIora8ego9RtLlR6WyK06dt/UgCl75vVmiVWj4ljAHFtTDF12yi27CP
 xkR1MP60JVLPpWnWd/eqn58XdQR4KKJkTOpvZr6WDNiHph0F07ZJBkab3iAIKYasqFWVcUx0mU9
 Mr+0qkYNuusjQRl7a4fmOTMVBPjOCw3E=
X-Received: by 2002:a25:b90c:0:b0:668:b8b8:ba5a with SMTP id
 x12-20020a25b90c000000b00668b8b8ba5amr42382089ybj.7.1657099696878; 
 Wed, 06 Jul 2022 02:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stLjjn5PFaYgf2WdtjbpbOOU2F6ASMt1RoFyltueFgQWipqey9R1K12FIshsMBAihmEdwAMU88GP9Lyb/p5ik=
X-Received: by 2002:a25:b90c:0:b0:668:b8b8:ba5a with SMTP id
 x12-20020a25b90c000000b00668b8b8ba5amr42382070ybj.7.1657099696663; Wed, 06
 Jul 2022 02:28:16 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 04:28:16 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YsRoTs/Ev+MPiIoN@redhat.com>
Date: Wed, 6 Jul 2022 04:28:16 -0500
Message-ID: <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
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

On Tue, Jul 05, 2022 at 05:35:26PM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Jul 05, 2022 at 08:45:30AM -0700, Andrea Bolognani wrote:
> > All this string manipulation looks sketchy. Is there some reason that
> > I'm not seeing preventing you for doing something like the untested
> > code below?
> >
> >   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
> >       if s.HyperV !=3D nil {
> >           type union struct {
> >               Discriminator string                      `json:"type"`
> >               HyperV        GuestPanicInformationHyperV `json:"hyper-v"=
`
> >           }
> >           tmp :=3D union {
> >               Discriminator: "hyper-v",
> >               HyperV:        s.HyperV,
> >           }
> >           return json.Marshal(tmp)
> >       } else if s.S390 !=3D nil {
> >           type union struct {
> >               Discriminator string                      `json:"type"`
> >               S390          GuestPanicInformationHyperV `json:"s390"`
> >           }
> >           tmp :=3D union {
> >               Discriminator: "s390",
> >               S390:          s.S390,
> >           }
> >           return json.Marshal(tmp)
> >       }
> >       return nil, errors.New("...")
> >   }
>
> Using these dummy structs is the way I've approached the
> discriminated union issue in the libvirt Golang XML bindings
> and it works well. It is the bit I like the least, but it was
> the lesser of many evils, and on the plus side in the QEMU case
> it'll be auto-generated code.

It appears to be the standard way to approach the problem in Go. It
sort of comes naturally given how the APIs for marshal/unmarshal have
been defined.

> > > func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
> > >     type Alias GuestPanicInformation
> > >     peek :=3D struct {
> > >         Alias
> > >         Driver string `json:"type"`
> > >     }{}
> > >
> > >     if err :=3D json.Unmarshal(data, &peek); err !=3D nil {
> > >         return err
> > >     }
> > >     *s =3D GuestPanicInformation(peek.Alias)
> > >
> > >     switch peek.Driver {
> > >
> > >     case "hyper-v":
> > >         s.HyperV =3D new(GuestPanicInformationHyperV)
> > >         if err :=3D json.Unmarshal(data, s.HyperV); err !=3D nil {
> > >             s.HyperV =3D nil
> > >             return err
> > >         }
> > >     case "s390":
> > >         s.S390 =3D new(GuestPanicInformationS390)
> > >         if err :=3D json.Unmarshal(data, s.S390); err !=3D nil {
> > >             s.S390 =3D nil
> > >             return err
> > >         }
> > >     }
> > >     // Unrecognizer drivers are silently ignored.
> > >     return nil
> >
> > This looks pretty reasonable, but since you're only using "peek" to
> > look at the discriminator you should be able to leave out the Alias
> > type entirely and perform the initial Unmarshal operation while
> > ignoring all other fields.
>
> Once you've defined the dummy structs for the Marshall case
> though, you might as well use them for Unmarshall too, so you're
> not parsing the JSON twice.

You're right, that is undesirable. What about something like this?

  type GuestPanicInformation struct {
      HyperV *GuestPanicInformationHyperV
      S390   *GuestPanicInformationS390
  }

  type jsonGuestPanicInformation struct {
      Discriminator string                       `json:"type"`
      HyperV        *GuestPanicInformationHyperV `json:"hyper-v"`
      S390          *GuestPanicInformationS390   `json:"s390"`
  }

  func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
      if (s.HyperV !=3D nil && s.S390 !=3D nil) ||
          (s.HyperV =3D=3D nil && s.S390 =3D=3D nil) {
          // client hasn't filled in the struct properly
          return nil, errors.New("...")
      }

      tmp :=3D jsonGuestPanicInformation{}

      if s.HyperV !=3D nil {
          tmp.Discriminator =3D "hyper-v"
          tmp.HyperV =3D s.HyperV
      } else if s.S390 !=3D nil {
          tmp.Discriminator =3D "s390"
          tmp.S390 =3D s.S390
      }

      return json.Marshal(tmp)
  }

  func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
      tmp :=3D jsonGuestPanicInformation{}

      err :=3D json.Unmarshal(data, &tmp)
      if err !=3D nil {
          return err
      }

      switch tmp.Discriminator {
      case "hyper-v":
          if tmp.HyperV =3D=3D nil {
              return errors.New("...")
          }
          s.HyperV =3D tmp.HyperV
      case "s390":
          if tmp.S390 =3D=3D nil {
              return errors.New("...")
          }
          s.S390 =3D tmp.S390
      }
      // if we hit none of the cases above, that means the
      // server has produced a variant we don't know about

      return nil
  }

This avoid parsing the JSON twice as well as having to define
multiple dummy structs, which keeps the code shorter and more
readable.

I've also thrown in some additional error checking for good measure,
ensuring that we abort when the input is completely nonsensical from
a semantical standpoint.

--=20
Andrea Bolognani / Red Hat / Virtualization


