Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6542D93B4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 08:48:52 +0100 (CET)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koibD-0004lg-Eb
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 02:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1koiZ8-0003Oz-FT; Mon, 14 Dec 2020 02:46:45 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1koiZ4-0006mh-5e; Mon, 14 Dec 2020 02:46:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id t16so15407345wra.3;
 Sun, 13 Dec 2020 23:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=BHdVfpz+ocsNz74gAxwIP81g3moH3iC8iFGO8Kw/XoA=;
 b=EqIYR0tThu0qgNT9T9xuUohREN7uU3/nYv2o9PZnwkOoy01/33JaIyu7qjOqsBcuBt
 ttZXZnErtJvmoG+OdZZuREtbZKdtqk1cClVT5cU94+1MAhbExhdJUJ+wLJrr0OPNsnds
 WnljGaZ+nCGc0loroMGOehmrR4mhGjlb/nyZz2nzFZ2I5EwLb0JQZ4tgue3wh9DA8wBQ
 LPCqWQ1saSnEsV2iewf7sACgyqhbZtNSpil3n9GJA+y+9HIJSZ9aBAmIrNkpBRmm5bki
 cdHT6QneiqzWsET313O/4GTy/f5RqgWPwTsgQw7dbD1zUi5olGdsus9Mp1k8WVixPPth
 ymCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=BHdVfpz+ocsNz74gAxwIP81g3moH3iC8iFGO8Kw/XoA=;
 b=PJ3+bPA3PNsnL+YRk0WKroBTYvyI0nN66lqpolRBW5aIhtQy+47Vf+iEFeIh0ZVt8V
 /u1Rjzbw2IVuAirrZyQ8bdbni58NtQHBMZN9kF/jNmrSpp99oCTwYHmqWbtfTQvpns+F
 S8OrWdoBOK7IMQkdgRuzHQnGUkPwl06AopDAGR/9bVruELHcjdgCkkvcFX7VU9k5wmRF
 yjuFtTZ0/G/ks8TOkF86GmB03j5rtemQJ6oBPuapEXyOQJCmICJ2mbjRDGfKuVg5icET
 6rs2JlA6mbQGTTPnTWD6KotEhwuPbAZlLyH//2Z63Nc4y4bF/736pmd5lLzLye9WiNDo
 zzxQ==
X-Gm-Message-State: AOAM531wVDW027ALzYMfECdhhbkYpSb7m3kE2WZqwyYv/uTDfJiRg2QF
 J1d4ZZn3PVd7upwUA8dC0us=
X-Google-Smtp-Source: ABdhPJx1o2F74k/LxZ5tJsRx38QeGjW5/fG5PrI1cslg1GHy7K/GNOmK8lswMQAkQ3sLyeXEW4rXaA==
X-Received: by 2002:adf:e688:: with SMTP id r8mr27357468wrm.20.1607931996233; 
 Sun, 13 Dec 2020 23:46:36 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-221.range109-146.btcentralplus.com. [109.146.187.221])
 by smtp.gmail.com with ESMTPSA id l8sm22757751wrb.73.2020.12.13.23.46.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Dec 2020 23:46:35 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-24-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-24-ehabkost@redhat.com>
Subject: RE: [PATCH v4 23/32] qdev: Move dev->realized check to
 qdev_property_set()
Date: Mon, 14 Dec 2020 07:46:36 -0000
Message-ID: <009c01d6d1ed$40f216b0$c2d64410$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLXjZRr+qbM/S7ZJ9VMMfP1SWcevwGTHZYap+gmSaA=
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Cc: 'Matthew Rosato' <mjrosato@linux.ibm.com>,
 'David Hildenbrand' <david@redhat.com>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'Stefano Stabellini' <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, 'Stefan Berger' <stefanb@linux.vnet.ibm.com>,
 'Markus Armbruster' <armbru@redhat.com>, 'Halil Pasic' <pasic@linux.ibm.com>,
 'Christian Borntraeger' <borntraeger@de.ibm.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 =?UTF-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 'Artyom Tarasenko' <atar4qemu@gmail.com>, 'Thomas Huth' <thuth@redhat.com>,
 'Alex Williamson' <alex.williamson@redhat.com>,
 'Igor Mammedov' <imammedo@redhat.com>, 'John Snow' <jsnow@redhat.com>,
 'Richard Henderson' <rth@twiddle.net>, 'Kevin Wolf' <kwolf@redhat.com>,
 "'Daniel P. Berrange'" <berrange@redhat.com>,
 'Cornelia Huck' <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 'Max Reitz' <mreitz@redhat.com>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Stefan Berger' <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Eduardo Habkost <ehabkost@redhat.com>
> Sent: 11 December 2020 22:05
> To: qemu-devel@nongnu.org
> Cc: Markus Armbruster <armbru@redhat.com>; Igor Mammedov =
<imammedo@redhat.com>; Stefan Berger
> <stefanb@linux.ibm.com>; Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@redhat.com>; Daniel P. Berrange
> <berrange@redhat.com>; Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com>; John Snow <jsnow@redhat.com>; Kevin
> Wolf <kwolf@redhat.com>; Eric Blake <eblake@redhat.com>; Paolo Bonzini =
<pbonzini@redhat.com>; Stefan
> Berger <stefanb@linux.vnet.ibm.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Anthony Perard
> <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; Max Reitz =
<mreitz@redhat.com>; Cornelia Huck
> <cohuck@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; Christian =
Borntraeger
> <borntraeger@de.ibm.com>; Richard Henderson <rth@twiddle.net>; David =
Hildenbrand <david@redhat.com>;
> Thomas Huth <thuth@redhat.com>; Matthew Rosato =
<mjrosato@linux.ibm.com>; Alex Williamson
> <alex.williamson@redhat.com>; Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk>; Artyom Tarasenko
> <atar4qemu@gmail.com>; xen-devel@lists.xenproject.org; =
qemu-block@nongnu.org; qemu-s390x@nongnu.org
> Subject: [PATCH v4 23/32] qdev: Move dev->realized check to =
qdev_property_set()
>=20
> Every single qdev property setter function manually checks
> dev->realized.  We can just check dev->realized inside
> qdev_property_set() instead.
>=20
> The check is being added as a separate function
> (qdev_prop_allow_set()) because it will become a callback later.
>=20
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>


