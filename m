Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D22DE885
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 11:53:23 +0200 (CEST)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMUNO-0006ah-V2
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 05:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMULt-0005EG-GW
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMULr-0004aE-OJ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:51:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51768
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMULr-0004ZB-ES
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571651506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTfPVtWLeeK7kdzKLTde62MZwJYSnxb+lHdGjnuEqaE=;
 b=LndqTswiD7a2rEcWyXt2BWUmcZsvBkZPrSOcAqjp7D4Kv0c1WwthIzrHETHBqYIqPK/UjW
 3KeKyrKc0Ic4D+4Ad/Z7/czNSEIykevRRv5XveJBPgz1NBYFv1ru5ShHTICGmDv/L10F6l
 9pM9lDBh11cgvSTAHhhGaXbOyaBoIsE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-S-mMP-jaM6iSblOgTL7sNg-1; Mon, 21 Oct 2019 05:51:44 -0400
Received: by mail-wr1-f72.google.com with SMTP id k2so6970371wrn.7
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 02:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I1QaBqWRKXPTRLfG7LI+IhUfWh/rJl14+/VsA7zHGSI=;
 b=fYG6oNjICMiZ0IimDa82uCRu88Fy0awoo5m+84eFoUSJbJhFUtmvEC5GmQ/kAx/VCh
 /PqjMRYoKUEojwne6dkDx3cOV7Pmej/zIF1vEUWXSvUeokk2/94RCTnXw+WZ3+e9hiqZ
 WhMukum/NblEQiFVhOraSGdnwL9gxxrimKA0sO4Yw4CzKk04Hi8W9cEI8bXvrLYXBxrT
 jhPyIwLBIePDAHmxnu/hzzSnFwxoT8ufh+sQ1Vhsrgy3CD3SJmVau8uhUrbMnLANqG91
 hL5TRG43FKMv6CPudsFAe/ff2MaFe/1Zpg1xV6OkjDklDxOYYYk0jm9EPy3JueLHZtCa
 abfg==
X-Gm-Message-State: APjAAAWvJ0jtGYNNyHMsMIxL07dcIxoe3aR4ZQ3JacC0D3mGqm2IVjiY
 sOLGHFiuI/E8TsPO6x1pvoSBgH9r/JxEFyRmJGd6qrrMONGPCg3f/BTtlPmwH8pvBTApgkbPIf5
 UncpUVfxV2BgKFoo=
X-Received: by 2002:adf:fe10:: with SMTP id n16mr20197024wrr.288.1571651503686; 
 Mon, 21 Oct 2019 02:51:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhTQdbIe+7vdg5dT9fLtZjTDlJ2dCkYDCmqoVFjVw6lFh3xgsxrJEYD9AG2VdB0wXXv3mWzw==
X-Received: by 2002:adf:fe10:: with SMTP id n16mr20197002wrr.288.1571651503457; 
 Mon, 21 Oct 2019 02:51:43 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id o1sm12650787wmc.38.2019.10.21.02.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 02:51:42 -0700 (PDT)
Subject: Re: qemu/powernv: coreboot support?
To: Peter Maydell <peter.maydell@linaro.org>,
 "Marty E. Plummer" <hanetzer@startmail.com>
References: <20191018172622.kz4smemh5cwesfit@proprietary-killer>
 <21ba3404-dcd3-fe06-7725-d58e249f9fd2@kaod.org>
 <20191019153108.gkupn3tnihspq7th@proprietary-killer>
 <1cbd1882-15c8-5471-cd65-1c84c2920ba8@kaod.org>
 <20191019192315.c3jzj3nbvpfjydsw@proprietary-killer>
 <CAFEAcA-LuxBA1m9dTqNxx_gi74E=MR=-M7sOFGddFxttgfvPiA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <05114fc6-a1ca-b4ea-6cbf-d2b92af4ec3d@redhat.com>
Date: Mon, 21 Oct 2019 11:51:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LuxBA1m9dTqNxx_gi74E=MR=-M7sOFGddFxttgfvPiA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: S-mMP-jaM6iSblOgTL7sNg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/19 9:48 PM, Peter Maydell wrote:
> On Sat, 19 Oct 2019 at 20:24, Marty E. Plummer <hanetzer@startmail.com> w=
rote:
>> Turns out the 'not text' warning came from lists.sr.ht, I wonder why
>> that mailed me.
>=20
> It's just an individual subscribed address that complains,
> not the qemu mailing list itself.
>=20
> Philippe, did you say it was you that had subscribed
> a lists.sr.ht address ? Could you configure it not
> to complain to individual list senders? Failing that,
> would it be too annoying to unsubscribe it? At the moment
> it mostly seems to confuse people.

Unfortunately it is not very configurable, so I simply unsubscribed it
(no problem, it was just an experiment with sr.ht which provide fancy
features such a similar patchwork system and repository, but we use
patchew).

> The other alternative here is I could turn back on the
> qemu-devel list facility that turns HTML emails into plain
> text. I sort of didn't want to do that, though, as editing
> emails means we end up with from-header mangling if the
> sender has a strict dmarc/dkim setup...

Agreed, no need to go back to this.

Sorry for the noise with this experiment.

Regards,

Phil.


