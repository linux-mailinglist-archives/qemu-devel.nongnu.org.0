Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86130628D53
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:21:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieB-0002ZI-U8; Mon, 14 Nov 2022 18:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidu-0001eb-3j
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiEK-0002C6-EI
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+e9YSpNcasjSd/2vWE8941Sgr54UDwzaslyclKxDqQ=;
 b=e1mQ+lrH3FfQtbiXBKn9J0AGDAOu3Qj8hwNrQ/GQ5cJn7NM5aGNKSuyySbBD3+ZqYcTDzX
 epjDLciZgXP9/0LARfbTgxwdDDj1Ej2n5sSWB3oWVejuLW2eE4rGbPPoT/HwIYdqE3jfld
 mDi97/veoUqVzN9Jj1vaWgAtVM2/sso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-5FSCGvSyMaOhcr0VHvAfrQ-1; Mon, 14 Nov 2022 17:47:00 -0500
X-MC-Unique: 5FSCGvSyMaOhcr0VHvAfrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDF3485A59D;
 Mon, 14 Nov 2022 22:46:59 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 871682024CC0;
 Mon, 14 Nov 2022 22:46:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 2/6] spec: Tweak description of maximum block size
Date: Mon, 14 Nov 2022 16:46:51 -0600
Message-Id: <20221114224655.2186173-3-eblake@redhat.com>
In-Reply-To: <20221114224655.2186173-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 9f30fedb improved the spec to allow non-payload requests that
exceed any advertised maximum block size.  Take this one step further
by permitting the server to use NBD_EOVERFLOW as a hint to the client
when a request is oversize (while permitting NBD_EINVAL for
back-compat), and by rewording the text to explicitly call out that
what is being advertised is the maximum payload length, not maximum
block size.  This becomes more important when we add 64-bit
extensions, where it becomes possible to extend `NBD_CMD_BLOCK_STATUS`
to have both an effect length (how much of the image does the client
want status on - may be larger than 32 bits) and an optional payload
length (a way to filter the response to a subset of negotiated
metadata contexts).  In the shorter term, it means that a server may
(but not must) accept a read request larger than the maximum block
size if it can use structured replies to keep each chunk of the
response under the maximum payload limits.
---
 doc/proto.md | 127 +++++++++++++++++++++++++++++----------------------
 1 file changed, 73 insertions(+), 54 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 8f08583..53c334a 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -745,8 +745,8 @@ text unless the client insists on TLS.

 During transmission phase, several operations are constrained by the
 export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
-as well as by three block size constraints defined here (minimum,
-preferred, and maximum).
+as well as by three block size constraints defined here (minimum
+block, preferred block, and maximum payload).

 If a client can honour server block size constraints (as set out below
 and under `NBD_INFO_BLOCK_SIZE`), it SHOULD announce this during the
@@ -772,15 +772,15 @@ learn the server's constraints without committing to them.

 If block size constraints have not been advertised or agreed on
 externally, then a server SHOULD support a default minimum block size
-of 1, a preferred block size of 2^12 (4,096), and a maximum block size
-that is effectively unlimited (0xffffffff, or the export size if that
-is smaller), while a client desiring maximum interoperability SHOULD
-constrain its requests to a minimum block size of 2^9 (512), and limit
-`NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum block size of
-2^25 (33,554,432).  A server that wants to enforce block sizes other
-than the defaults specified here MAY refuse to go into transmission
-phase with a client that uses `NBD_OPT_EXPORT_NAME` (via a hard
-disconnect) or which uses `NBD_OPT_GO` without requesting
+of 1, a preferred block size of 2^12 (4,096), and a maximum block
+payload size that is at least 2^25 (33,554,432) (even if the export
+size is smaller); while a client desiring maximum interoperability
+SHOULD constrain its requests to a minimum block size of 2^9 (512),
+and limit `NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum
+block size of 2^25 (33,554,432).  A server that wants to enforce block
+sizes other than the defaults specified here MAY refuse to go into
+transmission phase with a client that uses `NBD_OPT_EXPORT_NAME` (via
+a hard disconnect) or which uses `NBD_OPT_GO` without requesting
 `NBD_INFO_BLOCK_SIZE` (via an error reply of
 `NBD_REP_ERR_BLOCK_SIZE_REQD`); but servers SHOULD NOT refuse clients
 that do not request sizing information when the server supports
@@ -818,17 +818,40 @@ the preferred block size for that export.  The server MAY advertise an
 export size that is not an integer multiple of the preferred block
 size.

-The maximum block size represents the maximum length that the server
-is willing to handle in one request.  If advertised, it MAY be
-something other than a power of 2, but MUST be either an integer
-multiple of the minimum block size or the value 0xffffffff for no
-inherent limit, MUST be at least as large as the smaller of the
+The maximum block payload size represents the maximum payload length
+that the server is willing to handle in one request.  If advertised,
+it MAY be something other than a power of 2, but MUST be either an
+integer multiple of the minimum block size or the value 0xffffffff for
+no inherent limit, MUST be at least as large as the smaller of the
 preferred block size or export size, and SHOULD be at least 2^20
 (1,048,576) if the export is that large.  For convenience, the server
-MAY advertise a maximum block size that is larger than the export
-size, although in that case, the client MUST treat the export size as
-the effective maximum block size (as further constrained by a nonzero
-offset).
+MAY advertise a maximum block payload size that is larger than the
+export size, although in that case, the client MUST treat the export
+size as an effective maximum block size (as further constrained by a
+nonzero offset).  Notwithstanding any maximum block size advertised,
+either the server or the client MAY initiate a hard disconnect if a
+payload length of either a request or a reply would be large enough to
+be deemed a denial of service attack; however, for maximum
+portability, any payload *length* not exceeding 2^25 (33,554,432)
+bytes SHOULD NOT be considered a denial of service attack, even if
+that length is larger than the advertised maximum block payload size.
+
+For commands that require a payload in either direction and where the
+client controls the payload length (`NBD_CMD_WRITE`, or `NBD_CMD_READ`
+without structured replies), the client MUST NOT use a length larger
+than the maximum block size. For replies where the payload length is
+controlled by the server (`NBD_CMD_BLOCK_STATUS` without the flag
+`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ`, both when structured
+replies are negotiated), the server MUST NOT send an individual reply
+chunk larger than the maximum payload size, although it may split the
+overall reply among several chunks.  For commands that do not require
+a payload in either direction (such as `NBD_CMD_TRIM`), the client MAY
+request a length larger than the maximum block size; the server SHOULD
+NOT disconnect, but MAY reply with an `NBD_EOVERFLOW` or `NBD_EINVAL`
+error if the oversize request would require more server resources than
+the same command operating on only a maximum block size (such as some
+implementations of `NBD_CMD_WRITE_ZEROES` without the flag
+`NBD_CMD_FLAG_FAST_ZERO`, or `NBD_CMD_CACHE`).

 Where a transmission request can have a nonzero *offset* and/or
 *length* (such as `NBD_CMD_READ`, `NBD_CMD_WRITE`, or `NBD_CMD_TRIM`),
@@ -836,24 +859,9 @@ the client MUST ensure that *offset* and *length* are integer
 multiples of any advertised minimum block size, and SHOULD use integer
 multiples of any advertised preferred block size where possible.  For
 those requests, the client MUST NOT use a *length* which, when added to
-*offset*, would exceed the export size. Also for NBD_CMD_READ,
-NBD_CMD_WRITE, NBD_CMD_CACHE and NBD_CMD_WRITE_ZEROES (except for
-when NBD_CMD_FLAG_FAST_ZERO is set), the client MUST NOT use a *length*
-larger than any advertised maximum block size.
-The server SHOULD report an `NBD_EINVAL` error if
-the client's request is not aligned to advertised minimum block size
-boundaries, or is larger than the advertised maximum block size.
-Notwithstanding any maximum block size advertised, either the server
-or the client MAY initiate a hard disconnect if the payload of an
-`NBD_CMD_WRITE` request or `NBD_CMD_READ` reply would be large enough
-to be deemed a denial of service attack; however, for maximum
-portability, any *length* less than 2^25 (33,554,432) bytes SHOULD NOT
-be considered a denial of service attack (even if the advertised
-maximum block size is smaller).  For all other commands, where the
-*length* is not reflected in the payload (such as `NBD_CMD_TRIM` or
-`NBD_CMD_WRITE_ZEROES`), a server SHOULD merely fail the command with
-an `NBD_EINVAL` error for a client that exceeds the maximum block size,
-rather than initiating a hard disconnect.
+*offset*, would exceed the export size.  The server SHOULD report an
+`NBD_EINVAL` error if the client's request is not aligned to advertised
+minimum block size boundaries or would exceed the export size.

 ## Metadata querying

@@ -1595,7 +1603,7 @@ during option haggling in the fixed newstyle negotiation.
       - 16 bits, `NBD_INFO_BLOCK_SIZE`  
       - 32 bits, minimum block size  
       - 32 bits, preferred block size  
-      - 32 bits, maximum block size  
+      - 32 bits, maximum block payload size  

 * `NBD_REP_META_CONTEXT` (4)

@@ -1743,7 +1751,8 @@ Some chunk types can additionally be categorized by role, such as
 *error chunks* or *content chunks*.  Each type determines how to
 interpret the "length" bytes of payload.  If the client receives
 an unknown or unexpected type, other than an *error chunk*, it
-MUST initiate a hard disconnect.
+MUST initiate a hard disconnect.  A server MUST NOT send a chunk
+larger than any advertised maximum block payload size.

 * `NBD_REPLY_TYPE_NONE` (0)

@@ -1906,7 +1915,9 @@ The following request types exist:
     If structured replies were not negotiated, then a read request
     MUST always be answered by a simple reply, as documented above
     (using magic 0x67446698 `NBD_SIMPLE_REPLY_MAGIC`, and containing
-    length bytes of data according to the client's request).
+    length bytes of data according to the client's request), which in
+    turn means any client request with a length larger than the
+    maximum block payload size will fail.

     If an error occurs, the server SHOULD set the appropriate error code
     in the error field. The server MAY then initiate a hard disconnect.
@@ -1936,13 +1947,18 @@ The following request types exist:
     request, but MAY send the content chunks in any order (the client
     MUST reassemble content chunks into the correct order), and MAY
     send additional content chunks even after reporting an error
-    chunk.  Note that a request for more than 2^32 - 8 bytes (if
-    permitted by block size constraints) MUST be split into at least
-    two chunks, so as not to overflow the length field of a reply
-    while still allowing space for the offset of each chunk.  When no
-    error is detected, the server MUST send enough data chunks to
-    cover the entire region described by the offset and length of the
-    client's request.
+    chunk.  A server MAY support read requests larger than the maximum
+    block payload size by splitting the response across multiple
+    chunks (in particular, a request for more than 2^32 - 8 bytes
+    containing data rather than holes MUST be split to avoid
+    overflowing the `NBD_REPLY_TYPE_OFFSET_DATA` length field);
+    however, the server is also permitted to reject large read
+    requests up front, so a client should be prepared to retry with
+    smaller requests if a large request fails.
+
+    When no error is detected, the server MUST send enough data chunks
+    to cover the entire region described by the offset and length of
+    the client's request.

     To minimize traffic, the server MAY use a content or error chunk
     as the final chunk by setting the `NBD_REPLY_FLAG_DONE` flag, but
@@ -2115,11 +2131,12 @@ The following request types exist:
     If the server advertised `NBD_FLAG_SEND_FAST_ZERO` but
     `NBD_CMD_FLAG_FAST_ZERO` is not set, then the server MUST NOT fail
     with `NBD_ENOTSUP`, even if the operation is no faster than a
-    corresponding `NBD_CMD_WRITE`. Conversely, if
-    `NBD_CMD_FLAG_FAST_ZERO` is set, the server MUST fail quickly with
-    `NBD_ENOTSUP` unless the request can be serviced in less time than
-    a corresponding `NBD_CMD_WRITE`, and SHOULD NOT alter the contents
-    of the export when returning this failure. The server's
+    corresponding `NBD_CMD_WRITE`. Conversely, if `NBD_CMD_FLAG_FAST_ZERO`
+    is set, the server SHOULD NOT fail with `NBD_EOVERFLOW` regardless of
+    the client length, MUST fail quickly with `NBD_ENOTSUP` unless the
+    request can be serviced in less time than a corresponding
+    `NBD_CMD_WRITE`, and SHOULD NOT alter the contents of the export when
+    returning an `NBD_ENOTSUP` failure. The server's
     determination on whether to fail a fast request MAY depend on a
     number of factors, such as whether the request was suitably
     aligned, on whether the `NBD_CMD_FLAG_NO_HOLE` flag was present,
@@ -2272,7 +2289,9 @@ SHOULD return `NBD_EPERM` if it receives a write or trim request on a
 read-only export.

 The server SHOULD NOT return `NBD_EOVERFLOW` except as documented in
-response to `NBD_CMD_READ` when `NBD_CMD_FLAG_DF` is supported.
+response to `NBD_CMD_READ` when `NBD_CMD_FLAG_DF` is supported, or when
+a command without payload requests a length larger than an advertised
+maximum block payload length.

 The server SHOULD NOT return `NBD_ENOTSUP` except as documented in
 response to `NBD_CMD_WRITE_ZEROES` when `NBD_CMD_FLAG_FAST_ZERO` is
-- 
2.38.1


