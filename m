Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431CC5FE39E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:59:39 +0200 (CEST)
Received: from localhost ([::1]:43084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj5In-0007ni-F6
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj5Gs-0005Ki-Dl
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:57:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj5Go-00061L-Rr
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665694653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfMB6UZ6j9o8Ffa/dy5AELtg6EVVYOTwiurJFzKsKQs=;
 b=B4iBBrr6u7qPqiQdpjG39s1AgTi7aqZ9YnVjmez7fvO9LylcVnsyNivw864PdsqDIrm9Ji
 GRyuiUhSX26qsGm3BPGcYQxZFZN02HL2CIzpqD/yNw2OCRN3iWR7OsYEjukOzmNMcGxP9E
 /V7r4Qm/u1gyVikqVnhK3KNU4McPwXI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-r5CSg02oMlmzGEjSsMUdlQ-1; Thu, 13 Oct 2022 16:57:32 -0400
X-MC-Unique: r5CSg02oMlmzGEjSsMUdlQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 p18-20020ab01552000000b003e348b9ba6fso1196396uae.14
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PfMB6UZ6j9o8Ffa/dy5AELtg6EVVYOTwiurJFzKsKQs=;
 b=3RG6lpTGESL3ERwavzP0yoUNwMdUuvBN4/OjtnEdhagTrTE6a34wII7XrW4VQkKmgG
 A8rdVO8JqohlgjHTzutxsHpV5w8LqHuMspGTAl1O4ajqI1TKkjPtN9xTQjjwuBkxsHcW
 EbVq+dh7fQ2tR68szZqOyAF8yLMtzxURgdW5gYVv0PTzhwd9pDNh+KvqOo5F9gC65A8/
 xwru2XOVe17BglY6OPN0rBUw0HJtB3xs5y7qrIZ8sdgVsHh55j/Ul3RelJTfjhoUCsnq
 8rC7MHQZJ3wntnMOC5TmopooYEVlcpTQ7yEERBMztmBev+4Q9SAX0Bc4OICMN/Bs8uOC
 wHlQ==
X-Gm-Message-State: ACrzQf1iIxF4SOxo4UnGzO3e0baMhdrDjvjhdDmCiaKoK+Bwbp6nRXxE
 1oX/IOTaAzPwiT0ReL6kElTOGlTR22grk0RKGVqxEH1nJTJmfa3370KhqFEidDJGhKOYHwgZwvQ
 rY5Jc+SsZbl40+FAfcF43TEBjhMHb0SE=
X-Received: by 2002:a05:6102:e52:b0:3a7:c278:b60a with SMTP id
 p18-20020a0561020e5200b003a7c278b60amr1311576vst.54.1665694650470; 
 Thu, 13 Oct 2022 13:57:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM79y1ptsEkCHIxn7gapczB/Hcb2ewBhWgjRakOXC0riyRKEcwgCA9cjq2LuGW/0khMKiOFXnrB3Nhii5uWDVLQ=
X-Received: by 2002:a05:6102:e52:b0:3a7:c278:b60a with SMTP id
 p18-20020a0561020e5200b003a7c278b60amr1311527vst.54.1665694648737; Thu, 13
 Oct 2022 13:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221013131304.623740-1-pbonzini@redhat.com>
 <8735brpilw.fsf@linaro.org>
In-Reply-To: <8735brpilw.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 13 Oct 2022 22:57:17 +0200
Message-ID: <CABgObfZ3GH9-nFL7wZYxFtA0F49OmMPOKb3=qqfNWtXySr7arA@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg: include CONFIG_PLUGIN in config-host.mak
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 13, 2022 at 10:35 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  configure | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/configure b/configure
> > index f4ff1cf305..a5af9c524f 100755
> > --- a/configure
> > +++ b/configure
> > @@ -2474,6 +2474,9 @@ echo "HOST_CC=3D$host_cc" >> $config_host_mak
> >  if test -n "$gdb_bin"; then
> >      echo "HAVE_GDB_BIN=3D$gdb_bin" >> $config_host_mak
> >  fi
> > +if test "$plugins" =3D "yes" ; then
> > +    echo "CONFIG_PLUGIN=3Dy" >> $config_host_mak
> > +fi
>
> Don't we already do that anyway?

No, we don't.  CONFIG_PLUGIN enables "make test-plugins" and "make
plugins" but not the plugin tests in tests/tcg.

Paolo


