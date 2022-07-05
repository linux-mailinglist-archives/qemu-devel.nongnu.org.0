Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E756733C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:49:19 +0200 (CEST)
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kne-00052v-8l
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kk5-0002mG-Hj
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kk1-0000iX-DZ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657035932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DJd0r6c2bUmocAV1OkhtbG5xnHk40PmudndzU3C24Tc=;
 b=ExvQDtGYUVluhg5tA8AttvLSb+tZgLyLXXb4lYiV+Ry0BnM09bg+g9vzhcSF3XhNAjdOAY
 yZ6oWtl7ra3wkI3xfEUoKyhJpU7u6QjA4Dx53werh6gN0kBAD9C7hCjqGprEzpEREG8Gov
 39L3eSm7I27m+DXZBvNxu2nvQBmv6hw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-KJ-Q6EMLORG2Djx6y8wE9w-1; Tue, 05 Jul 2022 11:45:31 -0400
X-MC-Unique: KJ-Q6EMLORG2Djx6y8wE9w-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-31c8c7138ebso43916987b3.17
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=DJd0r6c2bUmocAV1OkhtbG5xnHk40PmudndzU3C24Tc=;
 b=iC0QEvyglisJud2zEfNQUHER7wpKhEELrNyu0WS2qQits2MEzv7kHkZsrVGJew1Ef3
 /bnc29jCJ6bJdxTae3kNZPBZRiKEDS5IArORBqKfAe/PcJGqE2ZBtRZN8dn1tBV9fcIh
 QSvcD6jv8E6SK/f15Ny3mTuYOvBTBAJOpwek1BzfLiEF5nrr/46I5EOE0QTkZxNKSHVy
 z8m6wJz0iflOavbwChb2rRgubl2RjkZuBj8IzQ66LBISQ/8/omvMa5NYllftmBJ/JnJr
 XtQAOU4z7YY3JlIc0Q8JM8TqadSwFxpGI7ewdzf12Y7b/oeul/H4RFaFygrkwIwwku3q
 lzWA==
X-Gm-Message-State: AJIora/wM7wGprq2kFy2bt9MKWl8iLEpif1jTMKjKMU5VBuUMFpCgzSe
 RLXQmQ7uFUSiU/BWX+wepp9GLqfJhQVuDqPdfjlxfVVL7jTuNzybhyTBz+c3mIFmWdooQ9SN7O1
 SioZ3wTFH5LXah3KbGMaOcrN8smI12WU=
X-Received: by 2002:a25:b90c:0:b0:668:b8b8:ba5a with SMTP id
 x12-20020a25b90c000000b00668b8b8ba5amr38235884ybj.7.1657035930910; 
 Tue, 05 Jul 2022 08:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smzOD1KZPgrWfgc6e6btew9iBOi45lA4mJm2U4hkqTgbjrspzPZUeHN2i3cIX6ExQ3mvvEgJg7TzLulP8wxiE=
X-Received: by 2002:a25:b90c:0:b0:668:b8b8:ba5a with SMTP id
 x12-20020a25b90c000000b00668b8b8ba5amr38235866ybj.7.1657035930668; Tue, 05
 Jul 2022 08:45:30 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Jul 2022 08:45:30 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220617121932.249381-5-victortoso@redhat.com>
Date: Tue, 5 Jul 2022 08:45:30 -0700
Message-ID: <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Jun 17, 2022 at 02:19:28PM +0200, Victor Toso wrote:
> qapi:
>   | { 'union': 'SetPasswordOptions',
>   |   'base': { 'protocol': 'DisplayProtocol',
>   |             'password': 'str',
>   |             '*connected': 'SetPasswordAction' },
>   |   'discriminator': 'protocol',
>   |   'data': { 'vnc': 'SetPasswordOptionsVnc' } }
>
> go:
>   | type SetPasswordOptions struct {
>   | 	// Base fields
>   | 	Password  string             `json:"password"`
>   | 	Connected *SetPasswordAction `json:"connected,omitempty"`
>   |
>   | 	// Variants fields
>   | 	Vnc *SetPasswordOptionsVnc `json:"-"`
>   | }

Generated code:

> type GuestPanicInformation struct {
>     // Variants fields
>     HyperV *GuestPanicInformationHyperV `json:"-"`
>     S390   *GuestPanicInformationS390   `json:"-"`
> }
>
> func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
>     type Alias GuestPanicInformation
>     alias := Alias(s)
>     base, err := json.Marshal(alias)
>     if err != nil {
>         return nil, err
>     }
>
>     driver := ""
>     payload := []byte{}
>     if s.HyperV != nil {
>         driver = "hyper-v"
>         payload, err = json.Marshal(s.HyperV)
>     } else if s.S390 != nil {
>         driver = "s390"
>         payload, err = json.Marshal(s.S390)
>     }
>
>     if err != nil {
>         return nil, err
>     }
>
>     if len(base) == len("{}") {
>         base = []byte("")
>     } else {
>         base = append([]byte{','}, base[1:len(base)-1]...)
>     }
>
>     if len(payload) == 0 || len(payload) == len("{}") {
>         payload = []byte("")
>     } else {
>         payload = append([]byte{','}, payload[1:len(payload)-1]...)
>     }
>
>     result := fmt.Sprintf(`{"type":"%s"%s%s}`, driver, base, payload)
>     return []byte(result), nil

All this string manipulation looks sketchy. Is there some reason that
I'm not seeing preventing you for doing something like the untested
code below?

  func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
      if s.HyperV != nil {
          type union struct {
              Discriminator string                      `json:"type"`
              HyperV        GuestPanicInformationHyperV `json:"hyper-v"`
          }
          tmp := union {
              Discriminator: "hyper-v",
              HyperV:        s.HyperV,
          }
          return json.Marshal(tmp)
      } else if s.S390 != nil {
          type union struct {
              Discriminator string                      `json:"type"`
              S390          GuestPanicInformationHyperV `json:"s390"`
          }
          tmp := union {
              Discriminator: "s390",
              S390:          s.S390,
          }
          return json.Marshal(tmp)
      }
      return nil, errors.New("...")
  }

> func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
>     type Alias GuestPanicInformation
>     peek := struct {
>         Alias
>         Driver string `json:"type"`
>     }{}
>
>     if err := json.Unmarshal(data, &peek); err != nil {
>         return err
>     }
>     *s = GuestPanicInformation(peek.Alias)
>
>     switch peek.Driver {
>
>     case "hyper-v":
>         s.HyperV = new(GuestPanicInformationHyperV)
>         if err := json.Unmarshal(data, s.HyperV); err != nil {
>             s.HyperV = nil
>             return err
>         }
>     case "s390":
>         s.S390 = new(GuestPanicInformationS390)
>         if err := json.Unmarshal(data, s.S390); err != nil {
>             s.S390 = nil
>             return err
>         }
>     }
>     // Unrecognizer drivers are silently ignored.
>     return nil

This looks pretty reasonable, but since you're only using "peek" to
look at the discriminator you should be able to leave out the Alias
type entirely and perform the initial Unmarshal operation while
ignoring all other fields.

The comments made elsewhere about potentially being more strict and
rejecting invalid JSON also apply here.

-- 
Andrea Bolognani / Red Hat / Virtualization


