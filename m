Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D797568EFF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:23:22 +0200 (CEST)
Received: from localhost ([::1]:55944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o97o8-00031a-OT
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o97n7-0002JX-L9
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:22:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o97n2-0002bh-Sy
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657124531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3oE/S7mlRBw1V6SPzypICPrkUEXFycib4lstJtuJbpE=;
 b=hmnicpeQIoxD8N7QbCNwRX6li23ELu7LZ4nSE+Ggw1Ky5j2vGWceEFJfcpSKyCBS3+0vVz
 Xh7vkcnvyx0LLq/sx9Jtf7qPW6QssAMhUQ0RdqPHXpPERAIxaqNzk+PaMHrzdKRW2VR5T6
 8c2uXPgrUlIWsHUUqc3DfcjhHl8faDc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-DSfSiDLhOQiccVkSlnkufA-1; Wed, 06 Jul 2022 12:22:09 -0400
X-MC-Unique: DSfSiDLhOQiccVkSlnkufA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-31814f7654dso110989307b3.15
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3oE/S7mlRBw1V6SPzypICPrkUEXFycib4lstJtuJbpE=;
 b=7vXSign5Jxy2P7vgc3yQI/x/SmUJWCjDbWJndhUnvy2G5y1+zx39yGKaqFPGbDTNlo
 +BaKFpJXsLcbjCqD0Lfra6F4JLiGKrSalN5OxBxEwxE7N7x64Y2RnGUxwngrTk3x+p3O
 5bBwjhzqg4VMiDwn8LpDPtM4z5M/whWxzzwScsv+5qQsbNRef2bYbKgpAxkMxl8ZSix6
 THL+zBHAZWbsa6xgxnGWwxy5MBuhEGuONMcuAJC2X2xONJP+l7gfY5p9LI031dXWNgma
 ujkpzEzGsUS1lBE7Fx/fsoXPRa6UnzfN2ukznOmfMB9WG6QRc/W/VqqiaQj8DAKN8B8d
 hkzA==
X-Gm-Message-State: AJIora8o4CrEI08izVXMFFSRaj26fxjzaJrdrZ9ty8dz/rEHNSJi9Ygt
 pbNV829MsUisfwhhlRYL3iDDWqg6rdHTgm+AMKMv7qwx8Htf5JwZ31Xf7Ywz5cCtKYOZvA4OSxR
 MmXmWSvIfpACw0yZmNQ8XxuZBLCWbvQM=
X-Received: by 2002:a25:a164:0:b0:66c:d20e:f37c with SMTP id
 z91-20020a25a164000000b0066cd20ef37cmr42885209ybh.547.1657124529262; 
 Wed, 06 Jul 2022 09:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFrbmBWlwCtaXEGF5O4I2Ffzo3kx+Gxb8QMOFG1d3+23dAgITk7PFyFLVodcONs6DSNWo4emOJDonpf3lj+TA=
X-Received: by 2002:a25:a164:0:b0:66c:d20e:f37c with SMTP id
 z91-20020a25a164000000b0066cd20ef37cmr42885186ybh.547.1657124529055; Wed, 06
 Jul 2022 09:22:09 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 11:22:08 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-6-victortoso@redhat.com>
 <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
 <YsRrHbNAZCjmQUcL@redhat.com>
 <CABJz62Pr+7tSGKLpe+OQfhmW_SwaVwdeS2=vmieTjAioiCdV7Q@mail.gmail.com>
 <YsWlP0A7CrHVaPdg@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YsWlP0A7CrHVaPdg@redhat.com>
Date: Wed, 6 Jul 2022 11:22:08 -0500
Message-ID: <CABJz62PhZLRFrzwZY9oWyc88e5_JmSTHGW_Sz1Ys8Pd-+A+mVA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/8] qapi: golang: Generate qapi's event types in Go
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 06, 2022 at 04:07:43PM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Jul 06, 2022 at 09:53:43AM -0500, Andrea Bolognani wrote:
> > Yeah but we're generating structs for all possible events ourselves
> > and we don't really expect external implementations of this
> > interface so I don't see what having this getter buys us over the
> > guarantee, that we have by construction, that all events will have a
> > public member with a specific name that contains the timestamp.
>
> Code doesn't neccessarily want to deal with the per-event type
> structs. It is credible to want to work with the abstract 'Event'
> interface in places and being able to get the Timestamp from that,
> without figuring out what specific event struct to cast it to first.

Makes sense.

> > I still don't like the fact that we have to force clients to use a
> > non-standard API, or that the API for events has to be different from
> > that for unions. But Go won't let you add method implementations to
> > an interface, so we're kinda stuck.
>
> I think this specific case is out of scope for the "standard" JSON
> APIs, and somewhere you'd expect APIs to do their own thing a layer
> above, which is what we're doing here.
>
> More importantly though what we're generating in terms of QAPI derived
> APIs should be thought of as only the first step. Ultimately I would
> not expect clients to be marshalling / unmarshalling these structs at
> all. So from that POV I think the question of "non-standard" APIs is
> largely irrelevant.
>
> Instead we would be providing a "QMPClient" type with APIs for sending/
> receiving instances of the 'Command'/'Response' interfaces, along with
> callback(s) that receives instances of the 'Event' interface.  Any JSON
> marshalling is hidden behind the scenes as an internal imlp detail.

I will note that we want the marshalling/unmarshalling part and the
wire transfer part to be somewhat loosely coupled, to allow for use
cases that are not covered by the high-level client API, but overall
I now agree with you that for most users this shouldn't ultimately
matter :)

--=20
Andrea Bolognani / Red Hat / Virtualization


