Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2F3D0F9F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:38:01 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CQC-0007Yg-Ex
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6COe-0006SZ-5I
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:36:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:34930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6COb-00040Y-47
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:36:23 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A12482253D;
 Wed, 21 Jul 2021 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626874579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aq1D3G2CUhTVNBjCVWqM62+pxezv3k8OSyPB2KfTFws=;
 b=dFZPp5WaUcctWkIiiMI9iakr/k1zlM3XszLV5h0ESKccpDvY6iVtJVQ7XbOb0nYkX8FxEp
 B5smm/PL2ZKybFZBWlUoN9cdKxeKXaDFMaIkdq+z16b2oaVJyeQO3KIHvjiW9xwP2z42Ps
 acv9IAefGb7m6gnubKt7UR5CCAFZS3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626874579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aq1D3G2CUhTVNBjCVWqM62+pxezv3k8OSyPB2KfTFws=;
 b=ibp5RRqpguztogUwgV37yjFpTkpOnNcpVOsYVBENSZB53QOCPmPPGlUhYSuGSoLs7zr6Ju
 ROpR5ip9YdX+MaBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A937B13BEE;
 Wed, 21 Jul 2021 13:36:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id /BncGtEi+GCxEQAAGKfGzw
 (envelope-from <jziviani@suse.de>); Wed, 21 Jul 2021 13:36:17 +0000
Date: Wed, 21 Jul 2021 10:36:15 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [RFC 3/3] qom: Improve error message in
 module_object_class_by_name()
Message-ID: <YPgiz1KFjhu6xAx/@pizza>
References: <20210630232749.21873-1-jziviani@suse.de>
 <20210630232749.21873-4-jziviani@suse.de>
 <20210721095445.be2ftvxygi6utoj4@sirius.home.kraxel.org>
 <YPfvkWhq2iaXGadM@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="evvDmP22oVRBcgR4"
Content-Disposition: inline
In-Reply-To: <YPfvkWhq2iaXGadM@redhat.com>
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
Cc: pbonzini@redhat.com, cfontana@suse.de, Gerd Hoffmann <kraxel@redhat.com>,
 ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--evvDmP22oVRBcgR4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 10:57:37AM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Jul 21, 2021 at 11:54:45AM +0200, Gerd Hoffmann wrote:
> > >  ObjectClass *module_object_class_by_name(const char *typename)
> > >  {
> > >      ObjectClass *oc;
> > > @@ -1031,8 +1049,20 @@ ObjectClass *module_object_class_by_name(const=
 char *typename)
> > >      oc =3D object_class_by_name(typename);
> > >  #ifdef CONFIG_MODULES
> > >      if (!oc) {
> > > +        char *module_name;
> > >          module_load_qom_one(typename);
> > >          oc =3D object_class_by_name(typename);
> > > +        module_name =3D get_accel_module_name(typename);
> > > +        if (module_name) {
> > > +            if (!module_is_loaded(module_name)) {
> > > +                fprintf(stderr, "%s module is missing, install the "
> > > +                                "package or config the library path "
> > > +                                "correctly.\n", module_name);
> > > +                g_free(module_name);
> > > +                exit(1);
> > > +            }
> > > +            g_free(module_name);
> > > +        }
> >=20
> > This error logging should IMHO be moved to util/module.c.  Either have a
> > helper function to print the error message, or have
> > module_load_qom_one() print it.
> >=20
> > There is also no need to hard-code the module names.  We have the module
> > database and module_load_qom_one() uses it to figure which module must
> > be loaded for a specific qom object.  We can likewise use the database
> > for printing the error message.
>=20
> IIUC, module loading can be triggered from hotplug of backends/devices,
> If so, we really shouldn't be printing to stderr, but using Error *errp
> throughout, so that QMP can give back useful error messages

Thank you Gerd and Daniel,

I'll improve it and send a v2.

Thank you very much,

Jose

>=20
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20

--evvDmP22oVRBcgR4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmD4Is8ACgkQaJ4wdCKK
F5Z3Cg/+Ld8YPjyzl4nyjaz9kFFUKaiUKt+too2jah4kIkXBDKXrLJKHfNIQqstv
OmsRhccOgAbSQtB5EYj6m61fMpo3yQO9mfEFYux23ftaksZoGYclm/76kYIIsFJs
gB4pKGdBOIkvr3ZelYA87r1ZE+J23PAQHUCazH09av5/ifaDf4CVTJVboAJE5lBx
zQXzcXf4vOdEjVTqNcTvZFLUeeNWOvd6lptXbhOiFunFG31WLTRxHfDAeeBOHwZf
mOGdYfOf7YjkfSwZUyKbUHTCcUN4LMxHZBd5ef5O5c+GhZsLDV3ZD5LNftc5hMI6
FkdtI4z4E9PIpMusxbP92woz6Nfc2xAd5WxO232bY83oTAu7w11Ue0LlrJVShu5+
zs3Rh0998wGS/elsW+BMmXlZ2UJKqgwhAa1EvMHMtK4XBnHm3ufGcF7U1Z3JlnBX
b7J1MlSjenbTGrBDAQqHeGwFdDbg6HtvKNpkD56lwsDmnw39SkqL4/OJcxpOkEYH
e2aYCrD1lmUIIcHkVo/poDoQysxs4fNOPJV4Gknd4i//uc//6boWe1caQxsu8IEm
nSQoc/JikfDKe9qPyzMWMBcH3WLlzXt/ePK4Bbo5uGmwCPrnxxLFgqxAmp+xfI5w
/NrRwhNaPBrcU6oHVov20y9gDQPi0oUsY5u5vjVP3N+H/h7DOE0=
=Yopw
-----END PGP SIGNATURE-----

--evvDmP22oVRBcgR4--

