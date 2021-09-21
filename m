Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE9413475
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 15:39:17 +0200 (CEST)
Received: from localhost ([::1]:60066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSfzQ-0004Ur-2M
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 09:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mSfvW-0000u5-Hh
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:35:14 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:32944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mSfvU-0006qy-CO
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:35:14 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEBB722132;
 Tue, 21 Sep 2021 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632231308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sMo4jQgkx1CNSHYsn8sRPJDCd6oIwoO/dodQntBg9ZA=;
 b=X/7guWRwKAPnfqzXX/c+nneo2vqPcm5J1JFPAKIzLUcKUqwYmZvN60AVMPvf+dOYSbvufb
 UYvUY0IxGHANk22rhLfuU0avekwVHNFcPsclyg1Xq3JXG+49yiWCiX6JKBRUp0x2g3nBwE
 eDVjgsnAHvm44UKmN/mRXN4C3Pob8V4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632231308;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sMo4jQgkx1CNSHYsn8sRPJDCd6oIwoO/dodQntBg9ZA=;
 b=Z18k74KjYBvG2Dmlq6oWTyZhkkOFfG9GxZ8Na7mVLIZZiVLvmapSg3kRKKsZE3qgqoQ6t8
 yxqAooO7OnGalRDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DF7413BD1;
 Tue, 21 Sep 2021 13:35:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a9XbA4vfSWG1QgAAMHmgww
 (envelope-from <jziviani@suse.de>); Tue, 21 Sep 2021 13:35:07 +0000
Date: Tue, 21 Sep 2021 10:35:04 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
Message-ID: <YUnfiJyiEMjMcksQ@pizza>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
 <YUSS0Jp+GBwNwYg3@pizza>
 <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
 <YUiGcjBviIqPIyJB@pizza>
 <20210921052542.h4ehwc3ovt2wo2en@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IJNZ36WWOhWfYj7G"
Content-Disposition: inline
In-Reply-To: <20210921052542.h4ehwc3ovt2wo2en@sirius.home.kraxel.org>
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IJNZ36WWOhWfYj7G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!!

On Tue, Sep 21, 2021 at 07:25:42AM +0200, Gerd Hoffmann wrote:
>   Hi,
>=20
> > But, in anyway, I'll still need to store the target architecture that
> > can use such core module, like I did here in this patch. Otherwise,
> > if I compile different targets at the same time, I'll end up with the
> > same problem of targets trying to load wrong modules.
>=20
> That all works just fine today.  If you have target-specific modules
> (i.e. source files added to specific_ss instead of softmmu_ss when
> compiling into core qemu) you only need to add those to the
> target_modules[] (instead of modules[]) and you are set.
>=20
> In-tree example: qtest accelerator.

Exactly, but what it doesn't seem to work (or I'm not understanding it
well) is: how the target will know whether it can or cannot load a
module.

For example, suppose I build target-list=3Ds390x-softmmu,x86_64-softmmu.
Both targets will be linked to the same modinfo.c object, which will
have a 'hw-display-virtio-gpu-pci' entry (it wouldn't if I build only
s390x-softmmu). When I execute ./qemu-system-s390x, it will try to
load hw-display-virtio-gpu-pci and will throw the errors I mentioned
earlier.

If, for example, I add that module_need(PCI_BUS), we will continue
not knowing whether the target in execution has the required bus
(without injecting dependencies in module.c). But it would be easier if
we have such information in modinfo.c directly (of an modinfo-<arch>.c).
I understood that it's not an arch issue, it's the target that doesn't
current implement such core module. But, in practice, we will end up
need to query that information.

Please, correct me if I'm not getting the point correctly.

Thank you!!


>=20
> take care,
>   Gerd
>=20

--IJNZ36WWOhWfYj7G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmFJ34QACgkQaJ4wdCKK
F5bKOQ//aPdZUcEvf7DV/G8YdNZBKutJBej920dycMsJYO9iw+NlElnsbMOSTgAd
82zu6alS2JLywp3jafLdSv4QQh9QU17gYcgnVqDntirNC+zwHvTfSrbEYtQbh0by
Ux0Sd+H8OoHitkEsDTa4zD/iZuuVWNr/0nFEdsIh3g2LBYml4TbZ+SXxRomWKvH/
Cz5esepoMm+nkQ0AiyRrggVYTkzDEJLRkpTDUkIePs2RjzmgPMzUNeyDptL57Uke
aPz6bM/Y5pUN2xOZywzcnIzrB1FGZysnD/iRE7iJ7TMYHXdizXxvgGgQtvlaYYRS
MiyYRproPLVcjA7rhHX2Nsvhjie1fDHBG8kh8N86r6WX/jcmG7q+cUGzVvdXxjw+
WYMmPDdvPCR48meLB8Y4Da1weiL+pZMcg808Kvok16ds96adq+k/HEzxKgHHlmS1
Gztwhb2J/CrehoIW3h2iHxReDFXdnwE/KD8ucuxZ2oamhNFxuMX8vyf2t6p33ANO
ih3zjRw7C/WdjMZ+jBpCVKxaH0+MHLcZnxci8LqEipC7yMdxwZoADjdSxcHTMmoM
L6qsatbJ/Gjqn0EdB9t1BzKUsNlCM+0dlTtnJUdw+sI6V7pGQRhV99VFcq8H89q2
VzbjhRQMLIQMiYYIRE6sMWxqIJbfrFaJO4mLiiIYdjQHmldQ9lI=
=XXdh
-----END PGP SIGNATURE-----

--IJNZ36WWOhWfYj7G--

