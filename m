Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C92DB5D2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 22:26:15 +0100 (CET)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpHpm-0003Io-8W
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 16:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpHnM-0008VJ-48
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 16:23:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpHnI-000499-Ev
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 16:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608067418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpYemzGwoC94cXQf0d03qM7bmu2KRMbztfKsbPHaFKY=;
 b=Ho5nCqF/jDiSreOckmKEdhuoMXp81k0rcmqtfLZ783Utla7eXZAEi4EoajYX8H7dimJbDF
 HDiqiOXkaAeAaUX9hNmW+fyCNGPT+t4m6TyFTJKa/SPsI0p1TaqhC2fHeEuiy3YelxmHzf
 ELOCczHpKKD9yd7IWF/wkMkLih7ndc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-akVyDB_UNpWqPzndP55gCQ-1; Tue, 15 Dec 2020 16:23:36 -0500
X-MC-Unique: akVyDB_UNpWqPzndP55gCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82A9D1084C9C;
 Tue, 15 Dec 2020 21:23:07 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CBA560C0F;
 Tue, 15 Dec 2020 21:23:06 +0000 (UTC)
Date: Tue, 15 Dec 2020 16:23:05 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 1/2] test-char: abort on serial test error
Message-ID: <20201215212305.GC3140057@habkost.net>
References: <20200728143108.2192896-1-marcandre.lureau@redhat.com>
 <20200728143108.2192896-2-marcandre.lureau@redhat.com>
 <cc2227d3-9e5c-96ba-03f9-54f12a356da8@amsat.org>
 <20201215192922.GB3140057@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201215192922.GB3140057@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 02:29:22PM -0500, Eduardo Habkost wrote:
> On Sun, Dec 13, 2020 at 11:51:05PM +0100, Philippe Mathieu-Daudé wrote:
> > On 7/28/20 4:31 PM, Marc-André Lureau wrote:
> > > We are having issues debugging and bisecting this issue that happen
> > > mostly on patchew. Let's make it abort where it failed to gather some
> > > new informations.
> > 
> > "good" news, this started to fail on Gitlab (centos7):
> > 
> > Running test test-char
> > Unexpected error in object_property_try_add() at ../qom/object.c:1220:
> > attempt to add duplicate property 'serial-id' to object (type 'container')
> > ERROR test-char - too few tests run (expected 38, got 9)
> > make: *** [run-test-86] Error 1
> > 
> > https://gitlab.com/philmd/qemu/-/jobs/908114388
> > https://gitlab.com/philmd/qemu/-/jobs/908114389
> > https://gitlab.com/philmd/qemu/-/jobs/908114390
> 
> Do we have any clue what could be causing this?  After looking at
> the code, it smells like memory corruption.
> 
> At first, I thought it could be due to the multi-threaded test
> cases, but the test binary seems to be crashing before the
> multi-threaded test cases have an opportunity to run.

I think I know what's happening:

- char_file_test_internal() creates chr using qemu_chardev_new().
- qemu_chardev_new() automatically assigns ID, adds
  chardev to the QOM tree.
- char_file_test_internal() does _not_ own the reference
  to the created object.
- char_file_test_internal() incorrectly calls object_unref().
- object is freed but, but /containers now has a dangling
  pointer.
- char_serial_test() creates a chardev with ID "serial-id", and
  it ends up being allocated at the same address as the old
  object.
- char_serial_test() correctly calls object_unparent().
- object_property_del_child() looks for the right child property
  in the hashtable, finds the dangling pointer with the same
  address, removes the wrong property, leaves a dangling
  "serial-id" property.
- New object is created by char_serial_test() with ID "serial-id".
- object_property_try_add_child() will fail because of the
  dangling "serial-id" property.

The bug in char_file_test_internal() was detected using the
following patch.

I believe the bug was introduced by commit 1e419ee68fa5
("chardev: generate an internal id when none given") because it
changed the reference ownership semantics of
qemu_chardev_new(NULL, ...).

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
diff --git a/qom/object.c b/qom/object.c
index f2ae6e6b2a..5cfed6d7c6 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -685,6 +685,7 @@ static void object_finalize(void *data)
     object_deinit(obj, ti);
 
     g_assert(obj->ref == 0);
+    g_assert(obj->parent == NULL);
     if (obj->free) {
         obj->free(obj);
     }

-- 
Eduardo


