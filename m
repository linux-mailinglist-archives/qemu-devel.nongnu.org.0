Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E962E258
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:57:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviCC-0006kp-Nu; Thu, 17 Nov 2022 11:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oviC7-0006fo-VI; Thu, 17 Nov 2022 11:56:56 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oviC6-0007wi-Fu; Thu, 17 Nov 2022 11:56:55 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3876f88d320so24531857b3.6; 
 Thu, 17 Nov 2022 08:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RDLJv4RlLJgOpgnySfyL7M/EsOwCsi/Pd9bxAXQao94=;
 b=HmSzpNWRsVNORIqBw1EpOQ975qEfZy1ixK2CF6fVuinzfxyegxtB2UeCxWdzOKrYjo
 v8Mi9IxOQsQMIcVjRw8iNTpku/48PhBP7c6cV+sEE3f3quVdQohBksifBFH9HGni1X/t
 3HIEwfNxww6fVsoN1ybG7QLyeHy4CWYBQiP+P4ysAqKBPSVI6Tzq8TMUPujj/f1IxKiG
 ZGj3Ia66/mF/fdcU4lku1LZKl9TcKazvI+N7FwNl+NKtEYvQSEsWsN9xqyA4+bHRB1Kr
 OET/chXRRya5yAVQ3gqN17D2MK+ZPKmbEIZSZI2CqtcLYfRFjcCGOY5ifGLzi3F4jA4U
 +/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDLJv4RlLJgOpgnySfyL7M/EsOwCsi/Pd9bxAXQao94=;
 b=FmgiALVtbYemfx4g0oh/eRFZ0NGkpRUxyi5YloikXbP6nPkTEbIhc7+bOLvp6bHAms
 mMjz9bOwoIcl+JkXNRVBHTkzyjfVVCvzBIn9sSfPb4NmRbb+hfecq5TRKNBd6E8xWxAe
 FE/q3d34M8ZUGRRJcIX7jPi1uBiq64FesSaXs+knA3daTQvKspmsr2Wu0Li7O0XWBUQZ
 u16V8xMHTNVTsp9qwCK6EKVW3ihLuwi0Q7vFh6K7MXjgf2MDLqIiKfr6w3CIbc4PDpQL
 NbRlWtRSibpevsYag0jolFcnnZ25N+jHqld9zxkH24YbemR4XJZGa4hpeq64WAq5mprn
 WtEQ==
X-Gm-Message-State: ANoB5plUXnk7AFdaLCxpxiBX8rAz4Ti3jcSEAn5tnhpcwyvcDL08nrgq
 r2Uv1qePAliPPJkCXcfzNH2REF2X9hRnMdseMqs=
X-Google-Smtp-Source: AA0mqf5270HChLHociz8W7AmA9W0IbYyjdhBpdTOIEMuzJItqVCPA8DxmR/Csb8i1eI6okLJILoRUlnlknQYa94O5kQ=
X-Received: by 2002:a0d:d202:0:b0:370:1a06:1b4a with SMTP id
 u2-20020a0dd202000000b003701a061b4amr2787208ywd.206.1668704212906; Thu, 17
 Nov 2022 08:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
 <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
 <CAJSP0QUcYkKjJ1NMvKcs=03Z0Yjm+SD6H0wScJ-Zx62sXb6egQ@mail.gmail.com>
 <01e701d8fa2f$4124d750$c36e85f0$@fiebig.nl>
 <CAJSP0QX_PCNU6PFd8svnGJq5U9-0+weAN6MyiyYqWHkssY4QPA@mail.gmail.com>
 <CAJSP0QW76L82s=LM=RpWEwiFPFaNBe4J4AXBi6jtDR2h8dE1UQ@mail.gmail.com>
 <004f01d8fa77$80cfe4b0$826fae10$@fiebig.nl>
In-Reply-To: <004f01d8fa77$80cfe4b0$826fae10$@fiebig.nl>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Nov 2022 11:56:40 -0500
Message-ID: <CAJSP0QVPVhCYKw2vT_un3r=L3xhow5E5OX84xp4uoJUb-1=jFg@mail.gmail.com>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
To: Tobias Fiebig <tobias@fiebig.nl>
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-stable@nongnu.org, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Tobias,
My initial patch was broken. I did some cleanup and sent a v3.

Stefan

