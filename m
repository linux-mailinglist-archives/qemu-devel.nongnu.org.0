Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A04741BB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:44:53 +0100 (CET)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx6Em-0006EB-MB
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:44:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx69h-0003Dr-7I
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:39:37 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:49484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx69e-0003Jv-JL
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:39:36 -0500
Received: from smtpclient.apple (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8F0C020775;
 Tue, 14 Dec 2021 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639481970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQLZ8Uu3GhRun/btWQLE892KKbn80BvciWn03RkzHd0=;
 b=2p1chDjWnI0KEQe41UzdLkaVKLylG27xExkQl6XhG+SyvYXMaswyGBzoSBxbm44t29wAAN
 4DLHVCS3DFlK0ONDNbesB4wSF8EPOeWMBb5fQxa1/UL0R0PtsmWv1/n+NjarFbAqvAB31T
 lo7yUqtjjlp/C8/+q5SAV8JpF3kNez0=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Meeting today?
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <87lf0nto1k.fsf@dusky.pond.sub.org>
Date: Tue, 14 Dec 2021 12:39:30 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <7315EE5A-6FDD-48E1-AB58-617083105778@greensocs.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org>
To: Markus Armbruster <armbru@redhat.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mark.burton@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Works for me
Cheers
Mark.


> On 14 Dec 2021, at 12:37, Markus Armbruster <armbru@redhat.com> wrote:
>=20
> Mark Burton <mark.burton@greensocs.com> writes:
>=20
>> I realise it=E2=80=99s very short notice, but what about having a =
discussion today at 15:00 ?
>=20
> I have a conflict today.  I could try to reschedule, but I'd prefer to
> talk next week instead.  Less stress, better prep.
>=20


