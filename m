Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1810518B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 12:38:38 +0100 (CET)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXknF-0000IA-AX
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 06:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iXkk6-0005aM-DJ
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 06:35:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iXkk5-0006Vl-GU
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 06:35:22 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55116)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iXkk5-0006VV-9n
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 06:35:21 -0500
Received: by mail-wm1-x343.google.com with SMTP id x26so3034471wmk.4
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 03:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=u2J3MPfkuk+fxUfCnjPB+5qAAz/itY4wrC0zjDcneec=;
 b=BQxRRALjRjjRdGRgVTRwVSJO7NOa2F5mOcXapbjRkQrWoU007c77plFCsYQgEmYDzb
 1j2W3sdns5W6XB3rulrOSm+32pW24fnk5e2d+L91j7FveJArYVt84ticsGO7qElr/2mn
 QbJ9IS/QelOkVYfuB64VHwZO6/wWKjInh8HJdzhTRRQg7OTGhuvVNXqbSERmbxnQnYZG
 ph0BF+4sbwetdM+TTyY+YT8rfYGfUe/PP6pUdWRugyEISRkZgAEh0P97rDPpKqCqmMwO
 FvrrCwS05/BJzAZ03x+zDd17Vid2vG2EYHXa5rgNrq+Tqxd8si6gzTS3uF50AGf55/PS
 cKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u2J3MPfkuk+fxUfCnjPB+5qAAz/itY4wrC0zjDcneec=;
 b=bODsMMqkIxlILUnq2qBLQpMV/sba87boIj9dPk2mzHDko/zXwOH+9axitHCD0Fv1Fh
 bqv6isk2M6fWoGG1esErTvO4PcblzHvwh/iprAHmQGb1Oq/DoaD/U05bNV6AcO8iAZaD
 4Met5dN9Ft9qpy/BjCMzean6DT1tKyR3oEVbmgeuC/ZOBBQvkoaicJ69zv3w5rJnTnUw
 VB5E+VqG8dao652CoXmbFA+8xfwhYhqtN7tVOjyzY85FT9fKr/JEyMs4jVRzL0YWetKk
 cWRz2IDIl7xg961P2Y325nCfQPtw76xFZtNgCxx91umEOBq+Fc6ITv1ypgEprwzQAJYJ
 bI3w==
X-Gm-Message-State: APjAAAXPHDBqeCtI6ew4b5MNi1pME2DsVfCFuy87gHb0CKY+5JEUgdeY
 N/dsVRpa2Yeh25FeVUJeNqE=
X-Google-Smtp-Source: APXvYqyPccG632aoOojdm0iJo7gjpY42HLfqUFvW3yT7rPxbjdrqYHfYpSxAHpP9dWXXJqayzwwQig==
X-Received: by 2002:a1c:544e:: with SMTP id p14mr9001428wmi.17.1574336120173; 
 Thu, 21 Nov 2019 03:35:20 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id g133sm2430193wme.42.2019.11.21.03.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 03:35:19 -0800 (PST)
Date: Thu, 21 Nov 2019 11:35:18 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [RFC v4 PATCH 16/49] multi-process: Add LSI device proxy object
Message-ID: <20191121113518.GK439743@stefanha-x1.localdomain>
References: <cover.1571905346.git.jag.raman@oracle.com>
 <d3c12e52cf27ac11a5a0ce3462786f55aca3a04c.1571905346.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HcXnUX77nabWBLF4"
Content-Disposition: inline
In-Reply-To: <d3c12e52cf27ac11a5a0ce3462786f55aca3a04c.1571905346.git.jag.raman@oracle.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, john.g.johnson@oracle.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HcXnUX77nabWBLF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 05:08:57AM -0400, Jagannathan Raman wrote:
> Adds proxy-lsi53c895a object, as a derivative of the pci-proxy-dev
> object. This object is the proxy for the lsi53c895a object
> instantiated by the remote process.

The same information could be fetched from the remote process.  That
would eliminate the need for per-device proxy objects.

Stefan

--HcXnUX77nabWBLF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3WdnUACgkQnKSrs4Gr
c8jltwgAltwR9oT5I3Q6q7Q/3d0r1cstbDCR7s9yBGcTtsx0AR4dy8cAg4SFMhtY
d36k1QVeCm5QDK4uyOIsgYORGfUbc3fxQdRXfsCvJGXrFrH1MyUOeZUV2dd+TIC/
TtKSCciC+sGBqZpslHQvMwEmBkM2U5k8iMkYwKZaRziiZ5IRYI0cSG0rxz75f+m7
8iFqXYLVnmmuvWMPf22Mp3tHgFx8sNF2G0+SPj5zC7y7MVm2jpwkv7PrD5SVa9Dw
HVBEoKtMd4eNuwT8kjwvPdAfE/H/Zbd4B4JdRZXriV4HKUMEvcE8Wv4WrPlxkgsu
Ki73ZTCu1tt4AB4Uwvk0Rp6A//Xh8w==
=zGY+
-----END PGP SIGNATURE-----

--HcXnUX77nabWBLF4--

