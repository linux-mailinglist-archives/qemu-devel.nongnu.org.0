Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E13D5AC0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 15:51:52 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m811L-000277-G8
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 09:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8109-0001Mo-Md
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:50:37 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8107-0001pz-8U
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:50:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id a20so11900706plm.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=pSdERsXxWtu+Mfm0LozZ3UKYJbovRZQ1W6exEph3BHA=;
 b=w+GgVaR3Y2krc3evPOQLEyE0nfA7puUb2tQ/UBKp1MM+frUQmaTINsHxskG391c5tz
 cO4SVeysl/I2fKEYB9/VU/xdW6cJRzEcOJ4+ER4HFx6M5H48/FeR2b+HHND53nj+6+Ct
 GXFFtVsslARA6YS1x9Y4zmUcl84f6REW5sQgGdTb/7PmC9Q1zxz/3RLyanUcK9u2K5Z5
 GlerxkLC2jo8S0xDF3Ep4gr4V7ztZDIqgkbuw2n0FSefFDWr4D/NExjTlLCLr+LpH7Xi
 Pknae9L/poAl3HzhIHGod32QjPALPBCA8WBJYBpK6hjyZXi/c3ublOWr5UtPCHzTM7Dt
 z4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=pSdERsXxWtu+Mfm0LozZ3UKYJbovRZQ1W6exEph3BHA=;
 b=eDvYJWCoBbC3j0wNP5gUitvM8NS78+D9DKy+/yy3ug2+8MKup/omIuA05QIDi9sSv/
 5yfEpB7pZUQnEV7kWkvMjizqabWZm2DDZ3B4HE002zq96jxNuQhRJphrk3r9Vmu4kmDO
 ukwXXVPJfiE4GrKVLa+WR4iaPj6fc785jOJnY3Cw1fyCsrdJ0uHYAV1hqiHTVsCYTyu2
 NGNMmwXjQQCxDOrWrd7+iNXjIhbfqf/cL2kF2O6KwV+HTCho/hZkSRsU5oeHb3DUo08G
 tL6pj2/cUNjzIXBDMkb6r0xqP1cTsRWLbaBQWeEwxtLcJ7lY9TEutk85r1HURWezlfYA
 yNBg==
X-Gm-Message-State: AOAM531jCmYbOE2sCYl10mMgeLaUa6qdKReQ8kQfhP8FyNKzvaByf+V1
 +6b2Qr/QStD0DwfdKdBctmFNCg==
X-Google-Smtp-Source: ABdhPJwjh0ubZNyYl7CnT+IbbrDihslyLKtYQX9tFhrFXMdxWI9LMKiTwu5xr2DZluBH08m/QVvIpQ==
X-Received: by 2002:aa7:8d10:0:b029:303:8d17:7b8d with SMTP id
 j16-20020aa78d100000b02903038d177b8dmr17889537pfe.26.1627307430935; 
 Mon, 26 Jul 2021 06:50:30 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.238.202])
 by smtp.googlemail.com with ESMTPSA id d2sm69964pfa.84.2021.07.26.06.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 06:50:30 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 26 Jul 2021 19:20:15 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/acpi: some cosmetic improvements to existing code
In-Reply-To: <20210726152921.4faedd39@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2107261916360.39003@anisinha-lenovo>
References: <20210721141610.139310-1-ani@anisinha.ca>
 <20210726135949.6e55593b@redhat.com>
 <alpine.DEB.2.22.394.2107261823010.37646@anisinha-lenovo>
 <20210726152921.4faedd39@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, jusual@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > index f4d706e47d..856c6e1b47 100644
> > > > --- a/hw/acpi/pcihp.c
> > > > +++ b/hw/acpi/pcihp.c
> > > > @@ -136,6 +136,11 @@ static void acpi_pcihp_disable_root_bus(void)
> > > >          return;
> > > >      }
> > > >
> > > > +    if (!host) {
> > > > +        root_hp_disabled = true;
> > > > +        return;
> > > > +    }
> > > It should be a separate patch,
> > > when this could return NULL?
> > > If it should never be null then assert here would be better.
> >
> > I have sent a v2 without the comment addition. I left the code this way
> > because everywhere else, the code checking host for NULL value is similar.
> > I wanted to keep the symmetry. However, if you strongly feel about the
> > assertion, I will send a v3.
>
> So the first thing is to confirm if NULL return value is valid or not.
> When it clear we can decide whether copy existing check like you do or
> replace all such checks with asserts.

I thought about this a little and I am now inclined to put assertions
everywhere. On i386 we have either q35 or i440fx host bridges. Having a
null host bridge does not sound right. I will make the change, build and
make check before sending out v3 with assertions.


