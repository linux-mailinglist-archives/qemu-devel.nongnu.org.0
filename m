Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DA6473D76
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 08:14:21 +0100 (CET)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx20x-0005uT-H0
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 02:14:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx1wa-00054A-Qu
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 02:09:49 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx1wY-0001TM-C2
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 02:09:48 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E3AB521A89;
 Tue, 14 Dec 2021 07:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639465783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZsPFM8mICKdQkDdEF9negrEPwdZaFs4f2JyEI1cwvQ=;
 b=nNJsnAmgeyt8iF1ouGtDIom3qRIXmLpnFFGD9PwXxaLUxBx/TNmjLAZIY/8B9u+vWVUKIg
 fP4XP5J05dFSYV6IE1DLn3VO8xNayou3xOxtswHgL8g7eGjkRy3Ms/sNc6RSlFErjtl5c0
 hmDRd05Xqxh4QMSEVLAG8Xepy4GezvE=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Meeting today?
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <YbeWxAn6Zw7rH+5K@redhat.com>
Date: Tue, 14 Dec 2021 08:09:42 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
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
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I realise it=E2=80=99s very short notice, but what about having a =
discussion today at 15:00 ?
Cheers
Mark.


> On 13 Dec 2021, at 19:53, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Mon, Dec 13, 2021 at 07:37:49PM +0100, Paolo Bonzini wrote:
>> On 12/13/21 19:07, Daniel P. Berrang=C3=A9 wrote:
>>>   - /usr/bin/qemu (or /usr/bin/qemu-vm) - for a high level binary =
that
>>>     targets humans and uses a templating system to expose a friendly
>>>     simple config, that internally invokes whichever target specific
>>>     /usr/bin/qemu-buildvm-$TARGET is implied, plus any other =
vhost-user
>>>     backends, or whatever other helper processes it needs
>>=20
>> Adding vhost-user backends and helper processes means one of two =
things:
>> either you are not going to support hotplug, or you are going to redo
>> libvirtd with a QMP-based RPC.
>=20
> I can't say I thought about the helper process idea too much. I was =
not
> trying to imply anything beyond the fact that I think at the high =
level
> human users should only have interact with a single QEMU binary, not
> per-target binaries, and also not worry about helper binaries if they
> happen to be used as impl details.
>=20
> If it were possible to keep auto-spawning of helpers at the high level
> that feels cleaner, so that the low level only has to worry about a
> single way of doing things. If that is too hard for hotplug though,
> so be it, leave auto-spawning in the low level.
>=20
> Any high level thing would need a monitor of some kind since there'll
> always be a need for humans to interrogate the QEMU to some degree. If
> we're trying to keep the monitor high level though, we'd want =
something
> closer to HMP. Perhaps again have an HMP that's based around a =
template
> engine that spits out QMP commands, and can extract bits of the reply
> for pretty printing, so again we're not writing C code for each new
> command that we care to support, just simple template snippets, that
> users can again customize if needed.
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20


