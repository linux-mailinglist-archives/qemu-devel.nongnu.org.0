Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56530BAF6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:31:28 +0100 (CET)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6s1v-0007yN-3C
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6rzJ-00071J-Rw
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6rzG-0001IR-9Z
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612258121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbrhfZ0vnDFZQl/wIwMyV6Rs0bJDoirzCoW312LSTq8=;
 b=L80KY/wf3J8X4bNyftKgxVvFq/l7dHJEeSwmvqGAH/y4H9gssvN3SomHOAzCVrCKaH0AgV
 fh+ZPS7KO44XbKgEXP9pdRLprxFPFZ4fZdoRV4G1vr+Tz5WjMfb5UcXRTYAf5acBiwB+/X
 iJOfzwGuS8Dl9UA4DnoYNrvbt7JeUso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-7TZDDhk6Mh6uRgEDUFiMXw-1; Tue, 02 Feb 2021 04:28:40 -0500
X-MC-Unique: 7TZDDhk6Mh6uRgEDUFiMXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0893107ACE3;
 Tue,  2 Feb 2021 09:28:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B392722C0;
 Tue,  2 Feb 2021 09:28:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B1B78113865F; Tue,  2 Feb 2021 10:28:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
References: <20210129081519.3848145-1-armbru@redhat.com>
 <CAFEAcA_O=48U_3p_mKeRRY99OsJCRSTJmOefDT1gbHVdyE_C0A@mail.gmail.com>
 <20210129121752.GJ4001740@redhat.com>
 <bacb8bab-2719-ae96-f1de-91e598b98abd@redhat.com>
 <20210201213104.GG3872207@habkost.net>
Date: Tue, 02 Feb 2021 10:28:22 +0100
In-Reply-To: <20210201213104.GG3872207@habkost.net> (Eduardo Habkost's message
 of "Mon, 1 Feb 2021 16:31:04 -0500")
Message-ID: <871rdyg6o9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Fri, Jan 29, 2021 at 02:25:56PM +0100, Paolo Bonzini wrote:
>> On 29/01/21 13:17, Daniel P. Berrang=C3=A9 wrote:
>> > > On this one, my vote would be "no". "Versioned machine names
>> > > include the QEMU version number" is pretty well entrenched,
>> > > and requiring users to remember that when they want version 4.2
>> > > they need to remember some other way of writing it than "4.2"
>> > > seems rather unfriendly. And 550 uses of '.' is a lot.
>> > We can't make  keyval_parse() accept "/" instead of ".", but can
>> > we make it accept "/" in addition to ".", and then encourage "/"  ?
>> >=20
>> > People simply wouldnt be able to use "." as keyval separator if
>> > they're using typenames containing "." (or would have to escape
>> > the typename.
>>=20
>> '.' is much more common than '/', and is shared by about all programming
>> languages that have JSON-ish data structures natively.  So using '/' see=
ms
>> decidedly worse to me.
>
> Worse than what, exactly?
>
> Accepting "/" when "." is ambiguous seems decidedly better than
> the following alternatives:
> - renaming machine types to names like "q35-5-0"; or
> - having to escape "." in the command line.

Yes.

However, the ambiguity arises only when type names occur as key, as I
noted in my followup Message-ID: <875z3g2c1f.fsf@dusky.pond.sub.org>.

I figure we could relax the QAPI enum naming rules to permit '.', with
drawbacks that feel tolerable.  One of them: if we ever manage to put
QAPI enums in a key position, we're screwed :)


