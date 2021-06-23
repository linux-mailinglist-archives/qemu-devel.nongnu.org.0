Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4236E3B162A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:46:31 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyWk-0000qw-B9
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvyV3-00007j-QQ
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvyUz-0004AR-Uh
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624437879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IlFEchnEk/AvsywWhA7ckLEa608LJnt39/w9ZPFrSr4=;
 b=WeK800DKKwewKufZ5HFF/ygYD9JFDtrABfUjbkekflEFZAQrq+Kl3k/Fq+SJWKsMw7Cv0N
 5bJRAcXMQNLgvVLOe5wMgQyOTnf/b4sPfXLQuvrsOVuNqgP0qg3AApzmm5ga9XIZBXSBxq
 2JvsKKk5LMomKFjb6mSSoH8nOc9oWvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-LDs1OVeDPLCSrB_tCwG2lA-1; Wed, 23 Jun 2021 04:44:37 -0400
X-MC-Unique: LDs1OVeDPLCSrB_tCwG2lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 322E71084F56;
 Wed, 23 Jun 2021 08:44:36 +0000 (UTC)
Received: from localhost (ovpn-112-213.ams2.redhat.com [10.36.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8B360C13;
 Wed, 23 Jun 2021 08:44:32 +0000 (UTC)
Date: Wed, 23 Jun 2021 09:44:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Subject: Re: RFC: Implementation of QMP documentation retrieval command
Message-ID: <YNL0bxTzaG6NiDaE@stefanha-x1.localdomain>
References: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
 <6fb6d9d7-3af2-c487-a1d4-aa1140c5a54d@redhat.com>
 <CAN6ztm8bjVnFf_X-vEzYOmTdw09bcoQSkVH9h6BdPFr-PEsP_A@mail.gmail.com>
 <YNGu80s+NHMGw6jf@stefanha-x1.localdomain>
 <CAN6ztm-cMNAM7C=y=NzmF6mLjXmqsVL45Zmtv0+=6+fT3a6q=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN6ztm-cMNAM7C=y=NzmF6mLjXmqsVL45Zmtv0+=6+fT3a6q=g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fJFzHFTq84dHqnxO"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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

--fJFzHFTq84dHqnxO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 12:27:55AM +0530, Niteesh G. S. wrote:
> Hi Stefan,
> On Tue, Jun 22, 2021 at 3:05 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
>=20
> > On Mon, Jun 21, 2021 at 11:56:30PM +0530, Niteesh G. S. wrote:
> > > TLDR: The goal of this mail wasn't to review the dummy command I had
> > posted
> > > but
> > > rather start a discussion regarding the implementation of the QMP
> > > documentation
> > > retrieval command for the TUI.
> >
> > It's not clear to me what exactly you wanted to discuss. Here is the QM=
P
> > schema from the commit you linked. It's something concrete that we can
> > discuss:
> >
>=20
> I wanted to discuss the implementation of the documentation retrieval
> command. Things like
> 1) The JSON schema we will be using to represent the documentation.

This is similar to the question I asked about markup below.

> 2) How will we be parsing documentation from the JSON files under qemu/qa=
pi?
> 3) How will/where we'll be storing this parsed information?

qapi/*.json files are processed when QEMU is built. The QAPI code
generator (scripts/qapi/) can be extended if necessary to generate
convenient output (e.g. C code containing an array of structs with the
QMP command documentation).

> And other questions which will have to be answered before proceeding to
> implement this command.
> 4) Where to get data for autocomplete for the TUI?
>=20
> - One easy way is to hardcode all available commands in the TUI
>    autocomplete. But then we have to make sure to update the autocomplete
>    list for TUI every time one new command gets added to QMP.

The query-qmp-schema QMP command provides the information needed for
autocompletion.

>=20
>=20
>   ##
> >   # @CommandDocumentation:
> >   #
> >   # A object representing documentation for a command.
> >   #
> >   # @name: Command name
> >   #
> >   # @doc: A string containing the documentation.
> >
> > Is @doc in some kind of markup or plain text?
> >
>=20
> Since this is just a prototype I have used plain text. But for the real
> command
> I expect something more structured since the comments I have seen in the
> QAPI schema has some structure associated with them.
> eg:
> ##
> # @query-status:
> #
> # Query the run status of all VCPUs
> #
> # Returns: @StatusInfo reflecting all VCPUs
> #
> # Since:  0.14
> #
> # Example:
> #
> # -> { "execute": "query-status" }
> # <- { "return": { "running": true,
> #                  "singlestep": false,
> #                  "status": "running" } }
> #
> ##
> We have the following structure
> 1) Command name
> 2) Documentation
> 3) Arguments (if any)
> 4) Return type with reference to non-primitive data types like
> structs/enums etc
> 5) Since
> 6) Example
>=20
> In the case of commands referring structures/enums and other non-primitiv=
e
> data types
> if possible we should also add their documentation along with the
> documentation
> for the command.
> Yes, we could find out all the data types referenced by the current comma=
nd
> and
> add them to the documentation if possible. This will make it easy for the
> user.
> If it isn't possible then we must allow to also query documentation relat=
ed
> to struct/enums etc.
>=20
>   #
> >   ##
> >   { 'struct': 'CommandDocumentation',
> >     'data': {'name': 'str', 'doc': 'str'} }
> >
> >   ##
> >   # @query-cmd-doc:
> >   #
> >   # (A simple *prototype* implementation)
> >   # Command query-cmd-doc will return the documentation for the command
> >   # specified. This will help QMP clients currently the AQMP TUI to sho=
w
> >   # documentation related to a specific command.
> >   #
> >   # @command-name: The command name to query documentation for
> >   #
> >   # Returns: A @CommandDocumentation object containing the documentatio=
n.
> >   #
> >   # Since: TODO: Add a number
> >   ##
> >   { 'command': 'query-cmd-doc',
> >     'data': { 'command-name': 'str' },
> >     'returns': 'CommandDocumentation' }
> >
> > Is there a way to retrieve struct/enum/etc documentation?
> >
> Not sure. I have gone through the parser code in qemu/scripts/qapi and al=
so
> have
> seen the parser being used for documentation generation but I still don't
> understand
> the capabilities of the parser.
>=20
>=20
> > Do you see a need to query multiple items of documentation in a single
> > command? A single item query command can become a performance bottlenec=
k
> > if the clients wants to query the documentation for all commands, for
> > example. This can be solved by making the the return value an array and
> > allowing multiple commands to be queried at once.
> >
> Why will clients want to query the documentation for all commands? Even i=
f
> they do
> won't that be an infrequent operation?
> From the TUI perspective, I think it will be enough if we just have the
> capability to
> service one command at a time. We can also have the TUI cache the results
> and
> validate the cache during the greeting process by sending some kind of ha=
sh
> to
> notify if any documentation has changed or not.

Querying multiple commands is probably not necessary in the interactive
TUI use case. But if we're adding a new command it's nice to make it
general so it can be used for other things in the future.

That said, I don't have a strong opinion either way. I was just curious
if anyone can think of a reason to support multiple items in a single
query.

Stefan

--fJFzHFTq84dHqnxO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDS9G8ACgkQnKSrs4Gr
c8jpTgf9GYfYxK7FPoUFl2UF1NYEAP4paILEClhW6m1DV/eaRcXpPWZCO9WFx1lE
42S73XZ/DYD2nELD762QMQUTwAJcZM5OYQ7lPoFORRhin5tz96UcYWEMQOMgrUep
GbKrCV+KOHk79vW5DMtrmbbmqJbvzfMRu6QJO8TgFoBmRgMBDPIGwfRHLDZVbhhP
QpJ46niMxyvX2L+MiG5xyOFyHHAqGSAO2+K2LqbZdtQ2QBgvde1GT6XnSkQc2XRp
UpeTdODiXGBoMn437Dgvn8cAOvw4JXeRJVnso05zI+Akl/E6brUd4Y90fj3LLVGb
6nOaezCoJ4nfKe+baTQp6kJKVoBJQw==
=mg+5
-----END PGP SIGNATURE-----

--fJFzHFTq84dHqnxO--


