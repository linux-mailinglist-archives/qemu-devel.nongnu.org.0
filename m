Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D374F7BCA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:37:40 +0200 (CEST)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOaB-0005HI-0Z
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ncOPc-0005o6-LP
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ncOPa-0007XE-Sb
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649323602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+AUGyBYLcX6+8/oE7ohtvrjrNIWeBIbq3OPX8DufCIo=;
 b=N304PEAgIaxg23IxVEAJu/coVPvHjhm9y91QNLLANeDakjHbwR2KtbPx5dKBGTYFmI6yBw
 89WxttYTu9C5vweM9Ryj35AZ5ZKnh4/pqWp2d8rbAJF1ZouCvjf6NLUIXf0+swc/j7l7ua
 89VCXxxH0ZfGpkG6FfpzoUPntaJeh0w=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-fOkBYSFvNGmh2vEL9-prOg-1; Thu, 07 Apr 2022 05:26:41 -0400
X-MC-Unique: fOkBYSFvNGmh2vEL9-prOg-1
Received: by mail-pg1-f200.google.com with SMTP id
 t6-20020a6549c6000000b00398a43dbdf8so2870176pgs.10
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+AUGyBYLcX6+8/oE7ohtvrjrNIWeBIbq3OPX8DufCIo=;
 b=3fJs1SVNVrwQs6qfAYdKErP2u/EPFCdulz6YuEIkmUe/UOhBVD6kBBfcd11pjfskir
 Nj2ZPZu7Xw321QO2CVhfLH1j7Ww8lKgMle4lAW/vyfvfM/YVh35NkjPjORro3iOEtihr
 EksHJ6YaIJvOIoM0L8L2oatF7QAO+CCV8nCrYqpjush9spA42DfaHNeY9XrAsFxZcQfk
 6neb6zyRjM94Me31PwzOydX1kZEuBvjccWKWW5yHzsY9roH/uf0Qz83vILIyu8v9sDsW
 L97UT+lGrVA652oDCrNiiLL+GNBFquas3WBaQeJ+kiFs+WHoRVVHP3HVED9pQ8YcqA7l
 88yQ==
X-Gm-Message-State: AOAM531Zs5EKlFmNUV8mwbdAynqwIcPp7yKgv923ruVAFoaIionzQful
 TI1VLFL0OObEUT5rJGq/htIM/E20l6o6rxkaQE1BJLFvCX2k0AFq718KCMfbX3flP9u07zvUXp7
 qSumbBhG26EH0oq6xK5vaFUwnTmtrf+U=
X-Received: by 2002:a17:902:bb94:b0:157:2ce:fac1 with SMTP id
 m20-20020a170902bb9400b0015702cefac1mr2966394pls.25.1649323600037; 
 Thu, 07 Apr 2022 02:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8BvmlHqCTQwUgff+21F1DP/pIgF2+rtww8jsiJupK1fX5YwJqScsDXinW4KDAc+ZmoYhh5nqSY7ZixRKbUbU=
X-Received: by 2002:a17:902:bb94:b0:157:2ce:fac1 with SMTP id
 m20-20020a170902bb9400b0015702cefac1mr2966377pls.25.1649323599733; Thu, 07
 Apr 2022 02:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220407081712.345609-1-mcascell@redhat.com>
 <CAJ+F1C+HB5Nbsjk4E-KgFQEpyAWFaCkJvswMQj1yu4Rm-rOQ-g@mail.gmail.com>
In-Reply-To: <CAJ+F1C+HB5Nbsjk4E-KgFQEpyAWFaCkJvswMQj1yu4Rm-rOQ-g@mail.gmail.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 7 Apr 2022 11:26:28 +0200
Message-ID: <CAA8xKjXxnuHqhAMjvAtDnD1JB55a2y9=-gZZVZ=JvEzTv4en8A@mail.gmail.com>
Subject: Re: [PATCH v3] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2021-4206)
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 7, 2022 at 11:17 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
>
>
> On Thu, Apr 7, 2022 at 12:23 PM Mauro Matteo Cascella <mcascell@redhat.co=
m> wrote:
>>
>> Prevent potential integer overflow by limiting 'width' and 'height' to
>> 512x512. Also change 'datasize' type to size_t. Refer to security
>> advisory https://starlabs.sg/advisories/22-4206/ for more information.
>>
>> Fixes: CVE-2021-4206
>
>
> (the Starlabs advisory has 2022, I guess it's wrong then)

Yep, that is wrong. I asked them to update the page.

Thanks.

>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
>>
>> ---
>> v3:
>> - fix CVE id (CVE-2021-4206 instead of CVE-2022-4206)
>>
>>  hw/display/qxl-render.c | 7 +++++++
>>  hw/display/vmware_vga.c | 2 ++
>>  ui/cursor.c             | 8 +++++++-
>>  3 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
>> index d28849b121..dc3c4edd05 100644
>> --- a/hw/display/qxl-render.c
>> +++ b/hw/display/qxl-render.c
>> @@ -247,6 +247,13 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QX=
LCursor *cursor,
>>      size_t size;
>>
>>      c =3D cursor_alloc(cursor->header.width, cursor->header.height);
>> +
>> +    if (!c) {
>> +        qxl_set_guest_bug(qxl, "%s: cursor %ux%u alloc error", __func__=
,
>> +                cursor->header.width, cursor->header.height);
>> +        goto fail;
>> +    }
>> +
>>      c->hot_x =3D cursor->header.hot_spot_x;
>>      c->hot_y =3D cursor->header.hot_spot_y;
>>      switch (cursor->header.type) {
>> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
>> index 98c83474ad..45d06cbe25 100644
>> --- a/hw/display/vmware_vga.c
>> +++ b/hw/display/vmware_vga.c
>> @@ -515,6 +515,8 @@ static inline void vmsvga_cursor_define(struct vmsvg=
a_state_s *s,
>>      int i, pixels;
>>
>>      qc =3D cursor_alloc(c->width, c->height);
>> +    assert(qc !=3D NULL);
>> +
>>      qc->hot_x =3D c->hot_x;
>>      qc->hot_y =3D c->hot_y;
>>      switch (c->bpp) {
>> diff --git a/ui/cursor.c b/ui/cursor.c
>> index 1d62ddd4d0..835f0802f9 100644
>> --- a/ui/cursor.c
>> +++ b/ui/cursor.c
>> @@ -46,6 +46,8 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
>>
>>      /* parse pixel data */
>>      c =3D cursor_alloc(width, height);
>> +    assert(c !=3D NULL);
>> +
>>      for (pixel =3D 0, y =3D 0; y < height; y++, line++) {
>>          for (x =3D 0; x < height; x++, pixel++) {
>>              idx =3D xpm[line][x];
>> @@ -91,7 +93,11 @@ QEMUCursor *cursor_builtin_left_ptr(void)
>>  QEMUCursor *cursor_alloc(int width, int height)
>>  {
>>      QEMUCursor *c;
>> -    int datasize =3D width * height * sizeof(uint32_t);
>> +    size_t datasize =3D width * height * sizeof(uint32_t);
>> +
>> +    if (width > 512 || height > 512) {
>> +        return NULL;
>> +    }
>>
>>      c =3D g_malloc0(sizeof(QEMUCursor) + datasize);
>>      c->width  =3D width;
>> --
>> 2.35.1
>>
>>
>
>
> --
> Marc-Andr=C3=A9 Lureau



--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


