Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942651BC5B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:42:52 +0200 (CEST)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmY0Y-0007Fx-EK
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmWrY-000641-49
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:29:28 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:52945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmWrS-00029H-Pd
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rk1eGWgTJkEVIxIFdsm4rvkwt3jFPMbk5VEmskwG3s0=;
 b=aBeUfO8K+oBYc2zIkH6ZXkv3GhNhUy9j9CKI64vAo+RKRe7D6XLgvQicdhhwdPVV2SqUc+
 JMN3QFlCIe9XZVRBXyGmjYFA8p6BvRJaTvuQu706n7f6iin6TtLdrFAczq5jckqVnONSb2
 v5j5INQMVzlfJUFkJJ732HxwMW7dVFU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-SfIaBTCiM6uHjhtakJ7Zhg-1; Thu, 05 May 2022 04:29:19 -0400
X-MC-Unique: SfIaBTCiM6uHjhtakJ7Zhg-1
Received: by mail-pj1-f72.google.com with SMTP id
 s5-20020a17090aa10500b001d9a8e99e3aso1922794pjp.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rk1eGWgTJkEVIxIFdsm4rvkwt3jFPMbk5VEmskwG3s0=;
 b=hF1ClE0FF+9gS2dScvLauy+/QhOfu8PdaurHHCPjX5WHVuf1eCEDBK1ab708+lrHnA
 w3yFyziMj180Ho+sP7gXdT+2kG+YoWOFmshMh28t6x5UVtv85fJi7nPkxBfJytw5SOOW
 TACgTxW/Q7Qcf1q8g7YSTpvZGL6SsPmz8Whos0v0K/ta9GqJIsideQiG/1TuSMqW5gqV
 ymVMz8n8yKh/8hsir+B7kQIbVYCM67GzhFB+bQVDC0ntnTTRQd8wpZp2a6qMnWfqwvxR
 5VlA0A+TSO7XXUykffycjS9rJlLuTVNaHPjvKzlWdzXHN2Orx9ZXSUVvrfw+cKFjvKeo
 vWlw==
X-Gm-Message-State: AOAM530gNszj/Wn2WDJ/G+EuniFIxloDCeqeahNO7jCH8L4NQckqU958
 pMaavnz2P4p97bvxarJR4E1wYu9qYebY3rYFvCsW3znHeCMVraD/fnS6raKjMbqsG1DG4Vdx7ZX
 PviPSq95hrjJ8b7MMVG4Hrmpm7T5IHe4=
X-Received: by 2002:a17:90a:2e0d:b0:1c9:b839:af02 with SMTP id
 q13-20020a17090a2e0d00b001c9b839af02mr4590988pjd.122.1651739358862; 
 Thu, 05 May 2022 01:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdT/wYQZjIqUJ9e/wzOFovH8SqUDzAU01TZMNIF7pWn2SjYWRvUyDs5Ta/tDKEH1etotmY1uBN+mjUoIKvM6A=
X-Received: by 2002:a17:90a:2e0d:b0:1c9:b839:af02 with SMTP id
 q13-20020a17090a2e0d00b001c9b839af02mr4590963pjd.122.1651739358533; Thu, 05
 May 2022 01:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-4-pbonzini@redhat.com>
 <CAJ+F1CLyTN90uBhc5W8i8i_Vre+FsMU3O-OXUy53kf-4EWxRiQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CLyTN90uBhc5W8i8i_Vre+FsMU3O-OXUy53kf-4EWxRiQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 5 May 2022 10:29:07 +0200
Message-ID: <CABgObfZaucTwU5vo5JKLabiBEKg7dEPhqYv+vSDvbHS72bDk1A@mail.gmail.com>
Subject: Re: [PATCH 3/5] net: slirp: switch to slirp_new
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

On Thu, May 5, 2022 at 10:20 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Thu, May 5, 2022 at 1:07 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> Replace slirp_init with slirp_new, so that a more recent cfg.version
>> can be specified.
>
>
> It was introduced in v4.1.0, but I don't see a minimum libslirp version c=
heck.

In fact 4.3.0 is needed for version 3 of the struct, so the following
needs to be
squashed:

diff --git a/meson.build b/meson.build
index 11876f5141..c902dfabd3 100644
--- a/meson.build
+++ b/meson.build
@@ -2638,7 +2638,7 @@ if have_system
   if slirp_opt in ['enabled', 'auto', 'system']
     have_internal =3D fs.exists(meson.current_source_dir() / 'slirp/meson.=
build')
     slirp =3D dependency('slirp', kwargs: static_kwargs,
-                       method: 'pkg-config',
+                       method: 'pkg-config', version: '>=3D4.3.0',
                        required: slirp_opt =3D=3D 'system' or
                                  slirp_opt =3D=3D 'enabled' and not have_i=
nternal)
     if slirp.found()


Paolo


>
>>
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  net/slirp.c | 27 +++++++++++++++++++++------
>>  1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/net/slirp.c b/net/slirp.c
>> index f1e25d741f..b3a92d6e38 100644
>> --- a/net/slirp.c
>> +++ b/net/slirp.c
>> @@ -389,6 +389,7 @@ static int net_slirp_init(NetClientState *peer, cons=
t char *model,
>>  #if defined(CONFIG_SMBD_COMMAND)
>>      struct in_addr smbsrv =3D { .s_addr =3D 0 };
>>  #endif
>> +    SlirpConfig cfg =3D { 0 };
>>      NetClientState *nc;
>>      SlirpState *s;
>>      char buf[20];
>> @@ -577,12 +578,26 @@ static int net_slirp_init(NetClientState *peer, co=
nst char *model,
>>
>>      s =3D DO_UPCAST(SlirpState, nc, nc);
>>
>> -    s->slirp =3D slirp_init(restricted, ipv4, net, mask, host,
>> -                          ipv6, ip6_prefix, vprefix6_len, ip6_host,
>> -                          vhostname, tftp_server_name,
>> -                          tftp_export, bootfile, dhcp,
>> -                          dns, ip6_dns, dnssearch, vdomainname,
>> -                          &slirp_cb, s);
>> +    cfg.version =3D 3;
>> +    cfg.restricted =3D restricted;
>> +    cfg.in_enabled =3D ipv4;
>> +    cfg.vnetwork =3D net;
>> +    cfg.vnetmask =3D mask;
>> +    cfg.vhost =3D host;
>> +    cfg.in6_enabled =3D ipv6;
>> +    cfg.vprefix_addr6 =3D ip6_prefix;
>> +    cfg.vprefix_len =3D vprefix6_len;
>> +    cfg.vhost6 =3D ip6_host;
>> +    cfg.vhostname =3D vhostname;
>> +    cfg.tftp_server_name =3D tftp_server_name;
>> +    cfg.tftp_path =3D tftp_export;
>> +    cfg.bootfile =3D bootfile;
>> +    cfg.vdhcp_start =3D dhcp;
>> +    cfg.vnameserver =3D dns;
>> +    cfg.vnameserver6 =3D ip6_dns;
>> +    cfg.vdnssearch =3D dnssearch;
>> +    cfg.vdomainname =3D vdomainname;
>> +    s->slirp =3D slirp_new(&cfg, &slirp_cb, s);
>>      QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
>>
>>      /*
>> --
>> 2.35.1
>>
>>
>
>
> --
> Marc-Andr=C3=A9 Lureau


