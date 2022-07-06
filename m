Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCDC568833
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 14:22:03 +0200 (CEST)
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o942b-0006dE-IZ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 08:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o9417-0005o5-G0
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 08:20:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o9413-0005zj-MJ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 08:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657110024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8XI7bd+oHtb8J1kSXECcdHZKSjKNKW8iCwH2oVs9EE=;
 b=DN4YNNJqEatHIvJMq9AnuA/LZoNqL8sfsrG5KmovVHddOqJZecpIDkuR5oe4UNNuB0w0NO
 L+FsDOM+VrZGEUasntFvS+8TcIIJMxdn0BuvknVKkSM1UMMPZtC3n88/Q8AaMOKF0dbPuc
 aQcJUm4wwjN7Y4kWFZWFGpxsr2tc6OA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-7_bt_KgEN8i4xu1d0EIcUQ-1; Wed, 06 Jul 2022 08:20:23 -0400
X-MC-Unique: 7_bt_KgEN8i4xu1d0EIcUQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-31cb2fea145so43019797b3.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 05:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h8XI7bd+oHtb8J1kSXECcdHZKSjKNKW8iCwH2oVs9EE=;
 b=xH8FufMBbQPzFSrH7kf9v50UPOV4gEf0bSueO/vNoIx4mBVAWGm03YicHhMm1oCwH5
 AQ9O6elFMUBP0JBe3VfrZhrsP2nGnbRQjvjpUkl4ov7WmfEHg39YPMi4qwd9BMjfsgj8
 W2wslBpyslYnNo2x08/oe1xBa2ngJI+oN1+FL6tw+sikBvWdcJx++1TC0cy5XnvCHB+z
 XVuHg63sPXUsqnwGgJcQbpAQMlSSV4bQZr7ulnPzAzjf3qubyQIqe73K1yBtKfkDurK1
 Tsu/2wJaliH5R/ZWUYkOlh9oWxwezDJiMu/6FD3ZDh1EklvamRhLQa43huVFzbE/L664
 dbqQ==
X-Gm-Message-State: AJIora9YQdYEAGqpZDAS6BJNrqW1HtR4jC3cp/dqnTo/f4NbcnR81KVs
 0Q+E4ecxpJPVNZru0ngy3MrKRjVPkicnpJoJTBozSntzOLvTx0gCHRRHejjTQgTbUWU++XMCPG1
 NnSYAnpsmdVZD0Cfj3hp+LuOUklzcCHM=
X-Received: by 2002:a25:a164:0:b0:66c:d20e:f37c with SMTP id
 z91-20020a25a164000000b0066cd20ef37cmr41731480ybh.547.1657110022571; 
 Wed, 06 Jul 2022 05:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1RENB8oAIdHmDx9C0xVbz9TujkFOehA8IWSeSO/Eq1nmZ6b+P5D0GpdSkrfFeujllgYt/U9iwl0euO/cGMGU=
X-Received: by 2002:a25:a164:0:b0:66c:d20e:f37c with SMTP id
 z91-20020a25a164000000b0066cd20ef37cmr41731456ybh.547.1657110022316; Wed, 06
 Jul 2022 05:20:22 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 07:20:21 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
 <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
 <YsVX7ir+41NPA6Xy@redhat.com> <YsVaVpXPE4YVjmVt@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YsVaVpXPE4YVjmVt@redhat.com>
Date: Wed, 6 Jul 2022 07:20:21 -0500
Message-ID: <CABJz62NwCNPTYbdf01CnFw2m6ZJyyn3VtQ0P54gd=WU+veTJAw@mail.gmail.com>
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

On Wed, Jul 06, 2022 at 10:48:06AM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Jul 06, 2022 at 10:37:54AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Jul 06, 2022 at 04:28:16AM -0500, Andrea Bolognani wrote:
> > >   func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
> > >       tmp :=3D jsonGuestPanicInformation{}
> > >
> > >       err :=3D json.Unmarshal(data, &tmp)
> > >       if err !=3D nil {
> > >           return err
> > >       }
> > >
> > >       switch tmp.Discriminator {
> > >       case "hyper-v":
> > >           if tmp.HyperV =3D=3D nil {
> > >               return errors.New("...")
> > >           }
> > >           s.HyperV =3D tmp.HyperV
> > >       case "s390":
> > >           if tmp.S390 =3D=3D nil {
> > >               return errors.New("...")
> > >           }
> > >           s.S390 =3D tmp.S390
> > >       }
> >
> > I'm not actually sure this works, because the first json.Unmarshal
> > call won't know which branch to try unmarhsalling. So it might be
> > unavoidable to parse twice.  With the XML parser this wouldn't be
> > a problem as it has separated the parse phase and then fills the
> > struct after.

It does, because the struct it's filling with data
(jsonGuestPanicInformation) covers all possible cases. We then pick
only the part we care about and transfer it to the user-provided
return location.

> Right afer sending, I remember how this is supposed to be done. It
> involves use of 'json.RawMessage' eg examples at:
>
>   https://pkg.go.dev/encoding/json#example-RawMessage-Unmarshal
>
> So it would look like:
>
>    type GuestPanicInformation struct {
>        HyperV *GuestPanicInformationHyperV
>        S390   *GuestPanicInformationS390
>    }
>
>    type jsonGuestPanicInformation struct {
>        Discriminator string   `json:"type"`
>        Payload *json.RawMessage
>    }
>
>     func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
>         var p *json.RawMesage
>         var err error
>         if s.HyperV !=3D nil {
>             d =3D "hyper-v"
>             p, err =3D json.Marshal(s.HyperV)
>         } else if s.S390 !=3D nil {
>             d =3D "s390"
>             p, err =3D json.Marshal(s.S390)
>         } else {
> 	    err =3D fmt.Errorf("No payload defined")
> 	}
>         if err !=3D nil {
>             return []byte{}, err
>         }
>
>         return json.Marshal(jsonGuestPanicInformation{d, p}), nil
>     }
>
>    func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
>        tmp :=3D jsonGuestPanicInformation{}
>
>        err :=3D json.Unmarshal(data, &tmp)
>        if err !=3D nil {
>            return err
>        }
>
>        switch tmp.Discriminator {
>        case "hyper-v":
>            s.HyperV :=3D GuestPanicInformationHyperV{}
>            err :=3D json.Unmarshal(tmp.Payload, s.HyperV)
>            if err !=3D nil {
>               return err
>            }
>        case "s390":
>            s.S390 :=3D GuestPanicInformationS390{}
>            err :=3D json.Unmarshal(tmp.Payload, s.S390)
>            if err !=3D nil {
>               return err
>            }
>        }
>
>        return fmt.Errorf("Unknown type '%s'", tmp.Discriminator)
>   }

I guess this version would work too, but I think it might still
perform more computation than the one I suggested?

json.RawMessage is a type alias for []byte, so I think the first call
to json.Unmarshal will have to go through the message to figure out
its structure and the contents of the discriminator field, then
tweak the original input so that only the part that hasn't been
consumed yet is returned. The second call to json.Marshal will then
parse that part, which means that the "inner" chunk of JSON ends up
being processed twice. In the approach I suggested, you go over the
entire JSON in one go.

Things might even out when you take into account allocating and
copying data around though. I'm not particularly interested in
splitting hair when it comes to the most efficient approach at this
point in time :) Knowing that we're not going through the entire JSON
twice is good enough.

--=20
Andrea Bolognani / Red Hat / Virtualization


