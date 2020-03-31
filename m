Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9BA1988A6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 02:05:59 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ4Pk-0001Q8-8W
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 20:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jJ4Kk-0003tH-UZ
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jJ4Kj-00008Q-MU
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:00:46 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:32562)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jJ4Ki-0008Un-IK
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585612843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dpxQOGwzUTwe2u+wQcIe51pDRPvvO7Mlj9RV6s2zao=;
 b=iId7a5cAhF0SvlLFvrLaxP9LiatKM04SZeUlg3070LJW+iovJyPuI39ZYahnbf0H1BF6t9
 XcA/7s/FW25IbfQqPs3b5S+wdQhhQGpvrZfN3EGkrtyrYyPPREjqp4lw6VwV5k8nO8Ixtq
 3byQn09bGnn8bVDFGWMTDTHyinegaNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-2DUcrF37M_GYni4e7gJNaA-1; Mon, 30 Mar 2020 20:00:41 -0400
X-MC-Unique: 2DUcrF37M_GYni4e7gJNaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1EA4801E53;
 Tue, 31 Mar 2020 00:00:40 +0000 (UTC)
Received: from probe.redhat.com (ovpn-113-210.rdu2.redhat.com [10.10.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA207100EBB6;
 Tue, 31 Mar 2020 00:00:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 08/14] iotests: touch up log function signature
Date: Mon, 30 Mar 2020 20:00:08 -0400
Message-Id: <20200331000014.11581-9-jsnow@redhat.com>
In-Reply-To: <20200331000014.11581-1-jsnow@redhat.com>
References: <20200331000014.11581-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Representing nested, recursive data structures in mypy is notoriously
difficult; the best we can reliably do right now is denote the leaf
types as "Any" while describing the general shape of the data.

Regardless, this fully annotates the log() function.

Typing notes:

TypeVar is a Type variable that can optionally be constrained by a
sequence of possible types. This variable is bound to a specific type
per-invocation, like a Generic.

log() behaves as log<Msg>() now, where the incoming type informs the
signature it expects for any filter arguments passed in. If Msg is a
str, then filter should take and return a str.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 010bca526c..e2d3e89574 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -28,6 +28,7 @@
 import struct
 import subprocess
 import sys
+from typing import (Any, Callable, Dict, Iterable, List, Optional, TypeVar=
)
 import unittest
=20
 # pylint: disable=3Dimport-error, wrong-import-position
@@ -353,9 +354,16 @@ def _filter(_key, value):
         return value
     return filter_qmp(qmsg, _filter)
=20
-def log(msg, filters=3D(), indent=3DNone):
-    '''Logs either a string message or a JSON serializable message (like Q=
MP).
-    If indent is provided, JSON serializable messages are pretty-printed.'=
''
+
+Msg =3D TypeVar('Msg', Dict[str, Any], List[Any], str)
+
+def log(msg: Msg,
+        filters: Iterable[Callable[[Msg], Msg]] =3D (),
+        indent: Optional[int] =3D None) -> None:
+    """
+    Logs either a string message or a JSON serializable message (like QMP)=
.
+    If indent is provided, JSON serializable messages are pretty-printed.
+    """
     for flt in filters:
         msg =3D flt(msg)
     if isinstance(msg, (dict, list)):
--=20
2.21.1


