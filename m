Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5F536637
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:58:30 +0200 (CEST)
Received: from localhost ([::1]:57984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudID-00060H-Ui
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nudFP-00030K-Hb
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:55:35 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nudFM-0006kj-5s
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:55:33 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A4DC1F855
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653670529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=p+CZmcUxJdTqv1QB33KHSWaXjGDPfgfGGgpV6gY6nJY=;
 b=CllRS2kXt5kqr++8Oy7bGnHNL4+s55Bb9Vk7GEvQT/NpjdtPpmVQDSEfhmIKMIv8Gdu/uM
 FtcYKwYqLHEHfzv5f7ayYOz8NyvaqusE4w/YLgb78O7hw2bZarvR7yn7ZDAY/6cxiandMe
 rXoMoX2JEYCxX33rEEi+gUrdF220ZFw=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3572313A84
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 16:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5zB7CoECkWJrKQAAMHmgww
 (envelope-from <dfaggioli@suse.com>)
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 16:55:29 +0000
Message-ID: <6a6dbfb53f2ea5a9740249c2fdf480be183e6ee8.camel@suse.com>
Subject: QEMU malfunctioning if built with FORTIFY_SOURCE=3
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 May 2022 18:55:28 +0200
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-ESPbw33E5TwiAp0sfqi8"
User-Agent: Evolution 3.44.1 (by Flathub.org)) 
MIME-Version: 1.0
Received-SPF: pass client-ip=195.135.220.29; envelope-from=dfaggioli@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--=-ESPbw33E5TwiAp0sfqi8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Everyone!

So, I'm not sure how much this would be interesting, but I thought
about reporting it anyways, then let's see.

A few days ago we started to build openSUSE_Tumbleweed packages with
-D_FORTIFY_SOURCES=3D3 by default (it was =3D2 before, and it's back to =3D=
2
again now, at least for QEMU :-/).

It seemed fine, but then we discovered that a QEMU built that way, does
not work properly. In fact, it crashes pretty early displaying a
message like this: "*** buffer overflow detected ***"

I've had a look around, and did not find anything about previous
attempts of doing that, or things to be aware of, in general, if doing
it.

Now, for now, I don't have many other info myself either. Just some
terminal logs from a few users, and from our automated testing system,
i.e., like this:

$ sudo virsh start VM1
error: Failed to start domain 'VM1'
error: internal error: qemu unexpectedly closed the monitor: qxl_send_event=
s: spice-server bug: guest stopped, ignoring
*** buffer overflow detected ***: terminated

Or this:

error: Failed to start domain 'vm-swtpm-legacy'
error: internal error: qemu unexpectedly closed the monitor: 2022-05-25T16:=
30:05.738186Z qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus r=
equested (2) exceeds the recommended cpus supported by KVM (1)
2022-05-25T16:30:05.738259Z qemu-system-x86_64: -accel kvm: warning: Number=
 of hotpluggable cpus requested (2) exceeds the recommended cpus supported =
by KVM (1)
2022-05-25T16:30:05.742354Z qemu-system-x86_64: warning: host doesn't suppo=
rt requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
2022-05-25T16:30:05.742369Z qemu-system-x86_64: warning: host doesn't suppo=
rt requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
2022-05-25T16:30:05.743989Z qemu-system-x86_64: warning: host doesn't suppo=
rt requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
2022-05-25T16:30:05.744050Z qemu-system-x86_64: warning: host doesn't suppo=
rt requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
*** buffer overflow detected ***: terminated

Or this:
https://openqa.opensuse.org/tests/2375666#step/usr_sbin_dnsmasq/47
https://xenbits.xen.org/people/dariof/download.png (also here, in case
the image disappears from OpenQA)

I am planning to try to investigate this more, but not right away. And
I can't even tell for sure when I'll have time for it. So, this is just
for letting people know that this has been (quickly) attempted, and
that it currently does not work, in case it's interesting for anyone
else.

Of course, in case it's the other way around, i.e., someone already has
more info on the subject that I've not been able to find, feel free to
ping me. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-ESPbw33E5TwiAp0sfqi8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKRAoAACgkQFkJ4iaW4
c+6GFhAAhKaTO+lX7Ep6tdK9cxehfZMhw/qCm9j2nBEvPX5Ss2kyfk/trTAORh3u
onhu0gvF51OzV59Lb90S9ItrNizOBKog8dW/XEtmRBK7TjHN1ANWoAOMa6MJNJzk
oTpamqzAuTI1IxNqIQVhcrd8XWqy+lemWEqp1q4ECplVMuNEXUMryzFg+69XqfXH
ewHHEmujycdSLrIewyIpkpyYvqjqE8kCzWSgYWaAROhRQbz0fkzSH8kvdh9gLphC
5A9HOPVqoHyNacFQg2gWigeV9FxUoi3PfID8k/KBUt5dsrGGSLo7H/w3f0AbSQ2y
H379Q0H6a8yDHD9pkbsKPLa9sViy9r3uYP61tuHNtiUnozp8Qqn+O5JEBtSzcncQ
Ovsg8QFiOLgTO+JutiATnyomhY5CbPTWEfhBD0zhWFxqX2oO13LjFt5xChLY92Wv
z/pn/2B5DbxDZv0m7O8N4j7H6EUNaxNAX97O+ow5kpwt/5Ip5MG7GzV6SJwsOpk6
MwhtxFkTsiJ/rsdAeiYFBIRMKO0EwWRtsfu3v1MWCe35XpdkgyHqr2zCq/8yt7oD
6p7XVLQYmY3VnJtLKaAOi4plPk8K0/wm0ZTrPMC6Qc+gZyuE1I3f921sumU7tKAc
5GZCbknJ9R3Ig7Z9+imEtRHEbqp6d1616WE7MS7MZrdcClyEKec=
=5lQf
-----END PGP SIGNATURE-----

--=-ESPbw33E5TwiAp0sfqi8--

