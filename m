Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5B1CFACD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 18:34:30 +0200 (CEST)
Received: from localhost ([::1]:58374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYXrR-00080T-Co
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 12:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <B3r3n@argosnet.com>)
 id 1jYXnT-00051X-HL; Tue, 12 May 2020 12:30:23 -0400
Received: from mx.argosnet.com ([51.255.124.196]:27310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <B3r3n@argosnet.com>)
 id 1jYXnS-0003yk-Bv; Tue, 12 May 2020 12:30:23 -0400
Received: from mx.argosnet.com (Argosnet [51.255.124.196])
 by mx.argosnet.com (Postfix) with ESMTP id 2BF292B153;
 Tue, 12 May 2020 18:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=argosnet.com; h=date:to
 :from:subject:cc:in-reply-to:references:mime-version
 :content-type; s=mx; bh=/FGPHdzaqnchEtSMK5RujX97INk=; b=CCg2BUg1
 GDxZfVXn5YkoYMwif8wn2x4rT+WehyB+Erioe2bZKwicUVbLIiX5Tgq5H6LXQbpw
 UpTc33vhAarfc7QIHeqI89o4Juockfmyo4z+413ddNRLqJiWSxnyBDlwCuVwlGc4
 LJjIpfF9fNXyVZwFU7tfY5crzEe/fXbGjJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=argosnet.com; h=date:to:from
 :subject:cc:in-reply-to:references:mime-version:content-type; q=
 dns; s=mx; b=JRn1WM+q6HI3FlFaWW7VKCR0d5sijVMZGAjyJoReIS+obykk9ak
 QebWxuejpRutUqrtKvZoqXXM6Cs+IANHrKYhl85Pm/IkNDJDlPi/sZcp0ZbK5q/9
 NUjtzINY4Ae97iyeP9PlQliAsWyqULdJzF8Jt8vTeyauEfoA+TPHOsPg=
Received: from Osgiliath.argosnet.com
 (lfbn-nic-1-419-246.w90-116.abo.wanadoo.fr [90.116.244.246])
 (Authenticated sender: llevier@pop.argosnet.com)
 by mx.argosnet.com (Postfix) with ESMTPSA id F27D42B152;
 Tue, 12 May 2020 18:30:15 +0200 (CEST)
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Tue, 12 May 2020 18:30:16 +0200
To: Daniel P. =?iso-8859-1?Q?Berrang=C3=A9?= <berrange@redhat.com>
From: B3r3n <B3r3n@argosnet.com>
Subject: Re: Qemu, VNC and non-US keymaps
Cc: B3r3n <B3r3n@argosnet.com>,Philippe =?iso-8859-1?Q?Mathieu-Daud=C3=83?= 
 ? =?iso-8859-1?Q?=C3=82=C2=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-discuss@nongnu.org
In-Reply-To: <20200512091106.GH1191162@redhat.com>
References: <E1jY9FF-0000Po-2c@lists.gnu.org>
 <af732fbf-fd70-97bc-3ea8-25d66f5895de@redhat.com>
 <20200511151155.GO1135885@redhat.com>
 <20200511152957.6CFA8D1826@zmta04.collab.prod.int.phx2.redhat.com>
 <20200511171930.GS1135885@redhat.com>
 <20200512074530.8729D1892D3@zmta01.collab.prod.int.phx2.redhat.com>
 <20200512091106.GH1191162@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Received-SPF: pass client-ip=51.255.124.196; envelope-from=B3r3n@argosnet.com;
 helo=mx.argosnet.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 12:30:18
X-ACL-Warn: Detected OS   = FreeBSD  [generic] [fuzzy]
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_MUA_EUDORA=0.001, MISSING_MID=0.497, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
Message-Id: <E1jYXnT-00051X-HL@lists.gnu.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear all,

>VNC == RFB - they're two different terms of the same thing.
>
>The core RFB/VNC protocol only knows about keysyms.
Ok, so RFB is not the keyword to track :-(

>AFAIK,  TightVNC doesn't support the scancode extension, only TigerVNC.
Confirmed, I replaced TightVNC viewer by TigerVNC, solves the issue. 
I got AltGr working + Ctrl_R acting as AltGr (my Debian kbd definition).
With this client, it is fine.

About this issue:
> > I realize that AltGr is sending 29+100 (seen via showkey), when CTRL_R only
> > sends 97.
> > When using a remote console (iLo and iDRAC), AltGr only sends 100.
> >
> > I wonder if the issue would not also be the fact AltGr sends 2 codes, still
> > another one to select the character key (6 for example).
> >
> > Is that normal Qemu is transforming AltGr (100) in 29+100 ?
>
>It is hard to say without seeing debuging to see what QEMU received.

I saw Qemu must be compile with debug support, ok.
 From this, if you have a recommendation, specific config to setup to 
debug the particular keyboard, I can do that.

To me the issue is here since a single keyboard key should produce a 
single keycode. Since my PC does not send 2 keys (else TigerVNC or 
noVNC would behave the same), it is elsewhere...

Thanks

Brgrds


