Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B703938D7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 00:54:41 +0200 (CEST)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmOtk-0004dD-6l
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 18:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lmOso-0003vC-RC
 for qemu-devel@nongnu.org; Thu, 27 May 2021 18:53:42 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:32840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lmOsk-0002A4-Q7
 for qemu-devel@nongnu.org; Thu, 27 May 2021 18:53:41 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 836BC1FD2F;
 Thu, 27 May 2021 22:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622156012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=GcXMKwFgpQ4ELT31d7auAnPdKFWa7it3lGLIthg+iko=;
 b=ZooinfHMibSlIlcr2SqZUNUV89ai/GE5m4NSSOLg2Ff3wFxqwwz5UwU3pxOAqhqkml1LUH
 +V2ite2DdtjNDd1kEp/UnilOUja0lhyVu+/aNrL/pTdbbAouo/NNtEAysigYFGVBNgPMEl
 Hff+nTa1tMRHmQdAf2rMA5Xh5WQcZDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622156012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=GcXMKwFgpQ4ELT31d7auAnPdKFWa7it3lGLIthg+iko=;
 b=ErSHELL/AQEhxCjUMyDYCYGpPbaw+XuR29SRWjVKQ/0ooF0jlyDph56B0qbSppwMQljUZE
 X1P/LaCjMNvb+uDw==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 5134511A98;
 Thu, 27 May 2021 22:53:31 +0000 (UTC)
Date: Thu, 27 May 2021 19:53:24 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: Performance issue with qcow2/raid
Message-ID: <YLAi5HE3cBVSR8pz@pizza.suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CKnOnJN8kOAXXqEK"
Content-Disposition: inline
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CKnOnJN8kOAXXqEK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello team,

I'm currently investigating a performance regression detected by iozone fil=
esystem benchmark (https://www.iozone.org/).

Basically, if I format a QCOW2 image with XFS filesystem in my guest and ru=
n iozone I'll get the following result:

$ mkfs.xfs -f /dev/xvdb1 && \
  mount -t xfs /dev/xvdb1 /mnt && \
  /opt/iozone/bin/iozone -a -e -s 16777216 -y 4 -q 8 -i 0 -i 1 -f /mnt/iozo=
ne.dat

kB        block len  read     reread
16777216  4K         354790   348796
16777216  8K         362356   364818

However, if I revert the commit 46cd1e8a47 (qcow2: Skip copy-on-write when =
allocating a zero cluster) and run the same, I see a huge improvement:

$ mkfs.xfs -f /dev/xvdb1 && \
  mount -t xfs /dev/xvdb1 /mnt && \
  /opt/iozone/bin/iozone -a -e -s 16777216 -y 4 -q 8 -i 0 -i 1 -f /mnt/iozo=
ne.dat

kB        block len  read     reread
16777216  4K         524067   560057
16777216  8K         538661   537004

Note that if I run iozone without re-formating the disk, I'll get results s=
imilar to last formatting. In other words, if I my current QEMU executable =
doesn't have commit 46cd1e8a47 and I format the disk, iozone will continue =
showing good results even if I reboot to use QEMU with that commit patched.

My system has a RAID controller[1] and runs QEMU/Xen. I'm not able to repro=
duce such behavior in other systems.=20

Do you have any suggestion to help debugging this? What more info could hel=
p to understand it better?
My next approach is using perf, but I appreciate if you have any hints meas=
ure qcow efficiently.

[1]
# lspci -vv | grep -i raid
1a:00.0 RAID bus controller: Broadcom / LSI MegaRAID SAS-3 3108 [Invader] (=
rev 02)
        Kernel driver in use: megaraid_sas
        Kernel modules: megaraid_sas

Thank you very much!

Jose R. Ziviani

--CKnOnJN8kOAXXqEK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmCwIt8ACgkQaJ4wdCKK
F5ZO4hAAmTNV6vfoUkSGRj7ACelxDthWJFRj4fu2C5egFhqWNjxTxvoq473BuLH6
y+LRS5E1HFfAe2fOfYBEu5Q9J90le5xyP5nEHNgxcNxbW4ozOhJH9UDoeks1HewH
59XLvjZsO54D3vNjmQNCAajbsRmGxRdqByTtSfnR8ZT/vcaoqfRwhjcaYgSFeXmS
kS01UgkWXPVyH4RR8qxiWPZQriKp9G1+EbYaAob7nWSOLpEmuCbBy/6b4G5DWsgE
0bsqHZFZteN++kW4MRd0GkVXzWebWPITy+mGWy/CViTzvcH6E/aqC+/QKs74A+rK
i7yVOwd2R7s4MkcPJ4EcgZVg0UTloVfDfLVm+05hoMpXUwGsLL2ILl1IR3fVevrY
9YSDdJv5eXOeOeedN5ATiwqk+WfbtEcjcfaHbHqahoEGS7HXNKrNDA+UQc0nVEm/
LuW4AXwlXoKD//fbhtJU4ZAkOfFGJCDWvfQlzFRiHViYhn7oY9z2yK5AY9ktYjYM
6SPDNwaVbUhNBTVHuldsZ8AcAEQuOlqIOTfNutsire+tItB4xNflUPa15Z6+GMWJ
Ya6pgGjh4fQBHvEITsTr1/BsU7vDj85tpg5jzmRRPvNELnDKd11BeBlosnIv/Zf7
/GzFJdeKFyunMFKbvlLLHc6pzT+ryUdapJmjx50Ri4ZhCMT4uEY=
=lAYT
-----END PGP SIGNATURE-----

--CKnOnJN8kOAXXqEK--

