Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCD4331D7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:10:02 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcl8D-00088Y-9p
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2k-00014a-Fq
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2f-0007BW-SU
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634634256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOGm4vK+NE9UAvOpm9xDnOyNCpUTjIP9TRU6et7ywjc=;
 b=hjmU34+JU8VyMB37GPKNJ6RhWMgG7iKFcEQLtMnLXMtjo8U4gTpE3Ua7Rqsz+3gqcfvhCa
 uCuzlj+DXVJD/o9eG3QvIvCn52VM1NQPL4nQjCY86x9j/4TA3vcQmnyGBy/WiKEZk0NMiq
 7CoK28gIC4CyL8xFOPtXYrPlU6QFs38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-zF4cbfO6PjGq4HfqN6Lfxw-1; Tue, 19 Oct 2021 05:04:07 -0400
X-MC-Unique: zF4cbfO6PjGq4HfqN6Lfxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B82F18125C6;
 Tue, 19 Oct 2021 09:04:06 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53D347092E;
 Tue, 19 Oct 2021 09:04:03 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] docs: rSTify the "KeySigningParty" wiki
Date: Tue, 19 Oct 2021 11:03:41 +0200
Message-Id: <20211019090344.3054300-4-kchamart@redhat.com>
In-Reply-To: <20211019090344.3054300-1-kchamart@redhat.com>
References: <20211019090344.3054300-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original wiki is here[1].  I converted by copying the wiki source
into a .wiki file and convert to rST using `pandoc`:

    $ pandoc -f Mediawiki -t rst key-signing-party.wiki -o
            key-signing-party.rst

This is a 1-1 conversion; no content changes.

[1] https://wiki.qemu.org/KeySigningParty

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/key-signing-party.rst | 171 +++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 docs/devel/key-signing-party.rst

diff --git a/docs/devel/key-signing-party.rst b/docs/devel/key-signing-party.rst
new file mode 100644
index 0000000000..94e133c40e
--- /dev/null
+++ b/docs/devel/key-signing-party.rst
@@ -0,0 +1,171 @@
+Key-signing Party
+=================
+
+.. _whats_a_key_signing_party:
+
+What's a key-signing party?
+---------------------------
+
+A key-signing party is a get-together with PGP users for the purpose of
+meeting other PGP users and signing each other's keys. This helps to
+extend the "web of trust" to a great degree. Also, it sometimes serves
+as a forum to discuss strong cryptography and related issues. In QEMU we
+use PGP keys to sign pull requests, so submaintainers need to have PGP
+keys signed by those with direct commit access.
+
+This wiki page gives general information on how we run key-signing
+parties for QEMU; usually there will be one at KVM Forum. For details of
+a specific event (location, organizer, etc) see the wiki page for that
+event.
+
+The instructions here are pretty specific, because there will likely be
+at least a dozen people trying to arrange to sign each others' keys. To
+get this done in a reasonable time we need to be efficient about it, so
+following the instructions makes it easier and smoother for everyone. If
+(for instance) you don't send your key to the organizer before the
+deadline then it's quite likely you won't get your key signed.
+
+.. _what_do_i_need_for_this_party:
+
+What do I need for this party?
+------------------------------
+
+.. _required_items:
+
+Required Items
+~~~~~~~~~~~~~~
+
+-  Physical attendance
+-  Positive picture ID
+-  Your Key ID, Key type, HEX fingerprint, and Key size
+-  A pen/pencil or whatever you'd like to write with....
+-  NO computer
+
+.. _required_process:
+
+Required Process
+~~~~~~~~~~~~~~~~
+
+-  Generate a key/Remember your pass phrase
+-  All attendees send their public keys to a public keyserver. Unless
+   specified otherwise, use keys.gnupg.net. If for some reason you don't
+   want your key to be in a public keyserver, but still want to
+   participate, please let me know.
+-  All attendees send their key ID, key type, fingerprint, and key size
+   to the host, who will compile everyone's key information.
+-  The host prints a list with everyone's key ID, key type, fingerprint,
+   and key size from the compiled keyrings and distributes copies of the
+   printout at the meeting.
+-  Attend the party. Bring along a paper copy of your key ID, key type,
+   fingerprint, and key size that you obtained from your own keyring.
+   You must also bring along a suitable photo ID. Instruct the attendees
+   at the beginning that they are to make two marks on the listing, one
+   for correct key information (key ID, key type, fingerprint, and key
+   size) and one if the ID check is ok.
+-  At the meeting each key owner reads his key ID, key type,
+   fingerprint, key size, and user ID from his own printout, not from
+   the distributed listing. This is because there could be an error,
+   intended or not, on the listing. This is also the time to tell which
+   ID's to sign or not. If the key information matches your printout
+   then place a check-mark by the key.
+-  After everyone has read his key ID information, have all attendees
+   form a line.
+-  The first person walks down the line having every person check his
+   ID.
+-  The second person follows immediately behind the first person and so
+   on.
+-  If you are satisfied that the person is who they say they are, and
+   that the key on the printout is theirs, you place another check-mark
+   next to their key on your printout.
+-  Once the first person cycles back around to the front of the line he
+   has checked all the other IDs and his ID has been checked by all
+   others.
+-  After everybody has identified himself or herself the formal part of
+   the meeting is over. You are free to leave or to stay and discuss
+   matters of PGP and privacy (or anything else) with fellow PGP users.
+   If everyone is punctual the formal part of the evening should take
+   less than an hour.
+-  After confirming that the key information on the key server matches
+   the printout that you have checked, sign the appropriate keys. Keys
+   can only be signed if they have two check-marks. Note that it is
+   really important to check the full fingerprint -- there are many keys
+   on the keyservers are maliciously generated fakes which have the same
+   short 32-bit keyid but the wrong fingerprint!
+-  Send the signed keys back to the keyservers.
+-  Use those keys as often as possible.
+
+.. _why_shouldnt_i_bring_a_computer:
+
+Why shouldn't I bring a computer?
+---------------------------------
+
+There are a variety of reasons, why you don't want to do this. The short
+answer is it would be insecure, unsafe, and of no benefit. For those not
+convinced, here are some reasons why it is insecure, unsafe, and of no
+benefit.
+
+-  Someone might have modified the computers programs, operating system,
+   or hardware to steal or modify keys.
+-  If people are swapping disks with their keys on them the computer
+   owner has to worry about viruses.
+-  If people are carrying their secret keys with them and intend to do
+   the signing at the actual meeting by typing their passphrase into a
+   computer, then they are open to key-logging attacks,
+   shoulder-surfing, etc.
+-  It is much better to just exchange key details and verify ID and then
+   do the signing when you get home to your own trusted computer.
+-  Someone might spill beer on it.
+-  Someone might drop it or knock it off the table.
+-  More reasons, I don't feel like articulating
+
+.. _other_questions_about_signing_keys:
+
+Other questions about signing keys?
+-----------------------------------
+
+You may want to read the `Keysigning Party
+Howto <http://www.cryptnet.net/fdp/crypto/gpg-party.html>`__ which
+includes an explanation of the concepts behind keysigning, instructions
+for hosting a keysigning party, instructions for participating in a
+keysigning party, and step by step instructions for signing other's
+keys.
+
+If you're looking for quick answers you may want to look to the
+questions and answers below, which all come from the `PGP
+FAQ <http://www.pgp.net/pgpnet/pgp-faq/faq.html>`__. It also has a lot
+of other good information, besides what is linked to below.
+
+-  `What is key
+   signing? <http://www.pgp.net/pgpnet/pgp-faq/faq.html#KEY-SIGNING-WHAT>`__
+-  `How do I sign a
+   key? <http://www.pgp.net/pgpnet/pgp-faq/faq.html#KEY-SIGNING-HOW>`__
+-  `Should I sign my own
+   key? <http://www.pgp.net/pgpnet/pgp-faq/faq.html#KEY-SIGNING-SELF>`__
+-  `Should I sign X's
+   key? <http://www.pgp.net/pgpnet/pgp-faq/faq.html#KEY-SIGNING-WHEN>`__
+-  `How do I verify someone's
+   identity? <http://www.pgp.net/pgpnet/pgp-faq/faq.html#KEY-SIGNING-IDENTITY-CHECK>`__
+-  `How do I know someone hasn't sent me a bogus key to
+   sign? <http://www.pgp.net/pgpnet/pgp-faq/faq.html#KEY-SIGNING-KEY-VERIFICATION>`__
+
+.. _other_useful_pgp_links:
+
+Other useful PGP links
+----------------------
+
+A few more links for PGP newbies, or those who wish to re acquaint
+themselves.
+
+-  http://www.pgpi.org/ -- The International PGP Home Page
+-  http://www.pgpi.org/download/ -- Download PGP
+-  http://www.gnupg.org/ -- GNU PGP (Linux)
+-  http://www.pgpi.org/products/tools/search/ -- PGP Tools, Shells, and
+   Plugins
+
+.. _what_if_i_still_have_a_question:
+
+What if I still have a question?
+--------------------------------
+
+If you'd like some help answering it, you can contact the event
+coordinator.
-- 
2.31.1


