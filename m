Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF53B00A7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:46:47 +0200 (CEST)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvczW-0008FI-6i
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvcp9-00068L-2j
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvcp5-00043m-EZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624354557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d1Jm2YoXD1BCrQjQXxQDV736KqG7wKbym5MS91lnEjg=;
 b=I8iS3I1BbE9Ylw4C1BaKCIqLlZyPn/tg2xS3qz6dlIWxMgGOtOksUenHUVvXGCgYLSOSG0
 iJclwy2W/0COxqhyfgyZkNf87wmyPuOOgWb+r0Ut8LYihA+EaCnfHUghziOcd2vaqVOIF+
 D9ESJR733nD5vMhB5wO4EEzv14Cj74Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-XTFMgrUeNRikP7K4_cYhpw-1; Tue, 22 Jun 2021 05:35:53 -0400
X-MC-Unique: XTFMgrUeNRikP7K4_cYhpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C7D9F92D;
 Tue, 22 Jun 2021 09:35:52 +0000 (UTC)
Received: from localhost (ovpn-114-192.ams2.redhat.com [10.36.114.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FE035D6BA;
 Tue, 22 Jun 2021 09:35:48 +0000 (UTC)
Date: Tue, 22 Jun 2021 10:35:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Subject: Re: RFC: Implementation of QMP documentation retrieval command
Message-ID: <YNGu80s+NHMGw6jf@stefanha-x1.localdomain>
References: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
 <6fb6d9d7-3af2-c487-a1d4-aa1140c5a54d@redhat.com>
 <CAN6ztm8bjVnFf_X-vEzYOmTdw09bcoQSkVH9h6BdPFr-PEsP_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN6ztm8bjVnFf_X-vEzYOmTdw09bcoQSkVH9h6BdPFr-PEsP_A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pNMz0vaObRhyELg5"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, ehabkost@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 armbru@redhat.com, wainersm@redhat.com, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pNMz0vaObRhyELg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 21, 2021 at 11:56:30PM +0530, Niteesh G. S. wrote:
> TLDR: The goal of this mail wasn't to review the dummy command I had posted
> but
> rather start a discussion regarding the implementation of the QMP
> documentation
> retrieval command for the TUI.

It's not clear to me what exactly you wanted to discuss. Here is the QMP
schema from the commit you linked. It's something concrete that we can
discuss:

  ##
  # @CommandDocumentation:
  #
  # A object representing documentation for a command.
  #
  # @name: Command name
  #
  # @doc: A string containing the documentation.

Is @doc in some kind of markup or plain text?

  #
  ##
  { 'struct': 'CommandDocumentation',
    'data': {'name': 'str', 'doc': 'str'} }

  ##
  # @query-cmd-doc:
  #
  # (A simple *prototype* implementation)
  # Command query-cmd-doc will return the documentation for the command
  # specified. This will help QMP clients currently the AQMP TUI to show
  # documentation related to a specific command.
  #
  # @command-name: The command name to query documentation for
  #
  # Returns: A @CommandDocumentation object containing the documentation.
  #
  # Since: TODO: Add a number
  ##
  { 'command': 'query-cmd-doc',
    'data': { 'command-name': 'str' },
    'returns': 'CommandDocumentation' }

Is there a way to retrieve struct/enum/etc documentation?

Do you see a need to query multiple items of documentation in a single
command? A single item query command can become a performance bottleneck
if the clients wants to query the documentation for all commands, for
example. This can be solved by making the the return value an array and
allowing multiple commands to be queried at once.

Do you see a need for wildcard queries where the client does not have
the full command name? I guess the client has enough auto-completion
information to search all commands on the client side, so maybe this
functionality isn't necessary here?

Stefan

--pNMz0vaObRhyELg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDRrvMACgkQnKSrs4Gr
c8iTXAgAsxo1EIh+zBwwjjwALNb77Lk/IxqsjcjFZzxY2sMW8jt1lJy6oYXJGR/O
OSxBMF24IifhPFoOSs5Gwyebw0EfWvkEsZUqWf+UKxquqj0ER2ya74Q7wmrU+Q7z
zLdWTpAE1AKP0Z6gUq4Z282GUT51NfH223fQGCwFJKa/VE4k0Y9LblOUvxMtP1x2
kdTnav5JjzB+6eoqLnkq/HIETYr8ek+/OS9LBDMANZDbevjmBJBHuVt2fqh566Xx
kYtb/whvb2XPvhy5MHL5H5AEVqKnz3LhtccrIvoWi4ur6oKACGo4Kr9LKM8vXgdG
VlE8G4+pXG/RxM8ywUn+EkqEiKB2sQ==
=j4CH
-----END PGP SIGNATURE-----

--pNMz0vaObRhyELg5--


