Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA38327E1C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:18:40 +0100 (CET)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhVX-0000DM-5d
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGhUA-00082W-Mz
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGhU3-0004JB-VU
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614601025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxvpzp2f08sZ9j7aU+ky6/uv4u7OFi76kvWgj/LWBLM=;
 b=J4CkWdUylJ61mMFgy1U7IWvps2DfJzH8eoSS/l3mSB3NRiym8dqNP87YGKmr3ya6OVVRXR
 XqjUXo+CRxcx5t4U4x236EiGm/f/4DK+0sD3Wd+Z7esjwgtWbtSQs9eaq4U/XNX0ky+hlg
 YDgF9MHVSfDFiv901G2Qpkus0DkTG3s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-kSLieZroMX6Q2ZC5pGcJSg-1; Mon, 01 Mar 2021 07:17:01 -0500
X-MC-Unique: kSLieZroMX6Q2ZC5pGcJSg-1
Received: by mail-wr1-f72.google.com with SMTP id e7so2437102wrw.18
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 04:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bxvpzp2f08sZ9j7aU+ky6/uv4u7OFi76kvWgj/LWBLM=;
 b=lUCWx1khfIxAAU9EVTW8AoZRjUCuKKTdWVyvnG54uS2gY3IaRnrrLHEsRl8IQTfUL6
 CyH0ro8LWwA5K+xaqSHCFIE2GxA3rw7IwGBUsj4oAd0qPDXFbrgST4dINUotGRyQnFKe
 tWYD5vEZtoPuyi/q4qM7QJRwGz2GlDmAI6LY5ZR9CNSBEuFdPAEGKlfVFnJaScIouEF2
 TJI3+OSvl7lImSjA16uCS+FJi7kY5HGRJsh2gwGDDZm4A0ZEkRlYjLhMYs9iOComfD7x
 7oYCEjS9SElH5WsXXTcc+jH4t5yafktN2fMw/NzBlZWrmzkspbtSXyOYj4u4Ui2wzn5b
 71PA==
X-Gm-Message-State: AOAM531CdRR2gGh7fl6eqPdGceS89P7qsXPKq2L0DGyB11CS7Un+ejky
 RmYx8h1PbrNJzdTv4XH21BtC9ZgR+6j+nryZ7kAfnOhYrAZ9o+wLfSHxXSI8AvLLdMbsMliGE7U
 vfsyX/4GqlftXvrQ=
X-Received: by 2002:a05:600c:2254:: with SMTP id
 a20mr16171513wmm.115.1614601020774; 
 Mon, 01 Mar 2021 04:17:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/2aQ7Gq+B/XZZN8Fv78emh3zGUPQG2/y5w7LtYQsK9UBW1BzLisdGtGGVyySHKwOV7iO9vg==
X-Received: by 2002:a05:600c:2254:: with SMTP id
 a20mr16171496wmm.115.1614601020602; 
 Mon, 01 Mar 2021 04:17:00 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y16sm1520023wrh.3.2021.03.01.04.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 04:16:59 -0800 (PST)
Subject: Re: [PATCH 1/1] qga-vss: Use dynamic linking for GLib
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210209145423.178611-1-konstantin@daynix.com>
 <4ecbde1e-fd10-28a5-10b7-33dda8c7f9a1@redhat.com>
 <CAJ+F1CKciDps3CtVFfuwHPrq0PhA7oEHZoSySM7AauG_zFboWA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8c1f1047-cf60-9cf6-6f86-850ffe8b55a1@redhat.com>
Date: Mon, 1 Mar 2021 13:16:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKciDps3CtVFfuwHPrq0PhA7oEHZoSySM7AauG_zFboWA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kostiantyn Kostiuk <konstantin@daynix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 13:10, Marc-André Lureau wrote:
> If I read the old Makefile right, it's a bug we introduced by commit 
> 7272fc7 (meson: convert vss-win32), since glib was in the -shared list.
> 
> So it's legitimate to revert it to me:
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Queued, thanks.

> 
>      >
>      > Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com
>     <mailto:konstantin@daynix.com>>
>      > ---
>      >  qga/vss-win32/meson.build | 4 ++--
>      >  1 file changed, 2 insertions(+), 2 deletions(-)
>      >
>      > diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
>      > index 780c461432..90825edef3 100644
>      > --- a/qga/vss-win32/meson.build
>      > +++ b/qga/vss-win32/meson.build
>      > @@ -1,5 +1,5 @@
>      >  if add_languages('cpp', required: false)
>      > -  glib_static = dependency('glib-2.0', static: true)
>      > +  glib_dynamic = dependency('glib-2.0', static: false)
>      >    link_args =
>     cc.get_supported_link_arguments(['-fstack-protector-all',
>     '-fstack-protector-strong',
>      >                                               
>       '-Wl,--add-stdcall-alias', '-Wl,--enable-stdcall-fixup'])
>      >
>      > @@ -8,7 +8,7 @@ if add_languages('cpp', required: false)
>      >                  cpp_args: ['-Wno-unknown-pragmas',
>     '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
>      >                  link_args: link_args,
>      >                  vs_module_defs: 'qga-vss.def',
>      > -                dependencies: [glib_static, socket,
>      > +                dependencies: [glib_dynamic, socket,
>      >                                 cc.find_library('ole32'),
>      >                                 cc.find_library('oleaut32'),
>      >                                 cc.find_library('shlwapi'),
>      >
> 
> 
> 
> 
> -- 
> Marc-André Lureau


