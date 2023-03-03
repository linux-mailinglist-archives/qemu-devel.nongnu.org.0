Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EFF6AA41D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDlb-0007l9-GE; Fri, 03 Mar 2023 17:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYDla-0007ku-5g
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYDlY-0002rM-4R
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677882038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sHN6UDBhUp50bPo0DP6hReriZaZCOmsluvf058UPH8U=;
 b=Em0JCdUQuHFRndagQJOaQ3eRHR6J9czsqjNC8MrRGqcJu0Wh0XUDmhj1C+fp1/K4coI0NL
 AHACwkiuOXOBT/szSs8PCVk264RtqPOxNJ8z6iwk8gHMZCET8vnrSpcKk90YJIxWBXOOV7
 SDs2eeTx/byAjDPM8yvOURc+8DPotM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-JqaUh9cQNqqv_sc-WfSk6w-1; Fri, 03 Mar 2023 17:20:35 -0500
X-MC-Unique: JqaUh9cQNqqv_sc-WfSk6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E77B2101B42B;
 Fri,  3 Mar 2023 22:20:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53A40492B00;
 Fri,  3 Mar 2023 22:20:33 +0000 (UTC)
Date: Fri, 3 Mar 2023 16:20:31 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 2/6] spec: Tweak description of maximum block size
Message-ID: <20230303222031.hmmy3xuclhr4lrv3@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-3-eblake@redhat.com>
 <ba63e991-247f-5f19-ca6f-8b9c2b9a3c70@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba63e991-247f-5f19-ca6f-8b9c2b9a3c70@yandex-team.ru>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Dec 16, 2022 at 11:22:49PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 11/15/22 01:46, Eric Blake wrote:
> > Commit 9f30fedb improved the spec to allow non-payload requests that
> > exceed any advertised maximum block size.  Take this one step further
> > by permitting the server to use NBD_EOVERFLOW as a hint to the client
> > when a request is oversize (while permitting NBD_EINVAL for
> > back-compat), and by rewording the text to explicitly call out that
> > what is being advertised is the maximum payload length, not maximum
> > block size.  This becomes more important when we add 64-bit
> > extensions, where it becomes possible to extend `NBD_CMD_BLOCK_STATUS`
> > to have both an effect length (how much of the image does the client
> > want status on - may be larger than 32 bits) and an optional payload
> > length (a way to filter the response to a subset of negotiated
> > metadata contexts).  In the shorter term, it means that a server may
> > (but not must) accept a read request larger than the maximum block
> > size if it can use structured replies to keep each chunk of the
> > response under the maximum payload limits.
> > ---
> >   doc/proto.md | 127 +++++++++++++++++++++++++++++----------------------
> >   1 file changed, 73 insertions(+), 54 deletions(-)
> > 
> > diff --git a/doc/proto.md b/doc/proto.md
> > index 8f08583..53c334a 100644
> > --- a/doc/proto.md
> > +++ b/doc/proto.md
> > @@ -745,8 +745,8 @@ text unless the client insists on TLS.
> > 
> >   During transmission phase, several operations are constrained by the
> >   export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
> > -as well as by three block size constraints defined here (minimum,
> > -preferred, and maximum).
> > +as well as by three block size constraints defined here (minimum
> > +block, preferred block, and maximum payload).
> > 
> >   If a client can honour server block size constraints (as set out below
> >   and under `NBD_INFO_BLOCK_SIZE`), it SHOULD announce this during the
> > @@ -772,15 +772,15 @@ learn the server's constraints without committing to them.
> > 
> >   If block size constraints have not been advertised or agreed on
> >   externally, then a server SHOULD support a default minimum block size
> > -of 1, a preferred block size of 2^12 (4,096), and a maximum block size
> > -that is effectively unlimited (0xffffffff, or the export size if that
> > -is smaller), while a client desiring maximum interoperability SHOULD
> > -constrain its requests to a minimum block size of 2^9 (512), and limit
> > -`NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum block size of
> > -2^25 (33,554,432).  A server that wants to enforce block sizes other
> > -than the defaults specified here MAY refuse to go into transmission
> > -phase with a client that uses `NBD_OPT_EXPORT_NAME` (via a hard
> > -disconnect) or which uses `NBD_OPT_GO` without requesting
> > +of 1, a preferred block size of 2^12 (4,096), and a maximum block
> > +payload size that is at least 2^25 (33,554,432) (even if the export
> 
> I'm not sure about term "block payload size".. What's "block payload"? May be "reply payload size" or something like this?
> 
> Or should we simply say about simple-reply / structured-reply-chunk total size limit?

Yes, I could live with 'reply payload size limit'; a simple-reply
always has one payload, while a structured-reply can be divided across
multiple chunks where each chunk payload fits that limit.

> 
> > +size is smaller); while a client desiring maximum interoperability
> > +SHOULD constrain its requests to a minimum block size of 2^9 (512),
> > +and limit `NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum
> > +block size of 2^25 (33,554,432).  A server that wants to enforce block
> > +sizes other than the defaults specified here MAY refuse to go into
> > +transmission phase with a client that uses `NBD_OPT_EXPORT_NAME` (via
> > +a hard disconnect) or which uses `NBD_OPT_GO` without requesting
> >   `NBD_INFO_BLOCK_SIZE` (via an error reply of
> >   `NBD_REP_ERR_BLOCK_SIZE_REQD`); but servers SHOULD NOT refuse clients
> >   that do not request sizing information when the server supports
> > @@ -818,17 +818,40 @@ the preferred block size for that export.  The server MAY advertise an
> >   export size that is not an integer multiple of the preferred block
> >   size.
> > 
> > -The maximum block size represents the maximum length that the server
> 
> The term "maximum block size" is not defined anymore (and removed from NBD_INFO_BLOCK_SIZE)...
> 
> > -is willing to handle in one request.  If advertised, it MAY be
> > -something other than a power of 2, but MUST be either an integer
> > -multiple of the minimum block size or the value 0xffffffff for no
> > -inherent limit, MUST be at least as large as the smaller of the
> > +The maximum block payload size represents the maximum payload length
> > +that the server is willing to handle in one request.  If advertised,
> > +it MAY be something other than a power of 2, but MUST be either an
> > +integer multiple of the minimum block size or the value 0xffffffff for
> > +no inherent limit, MUST be at least as large as the smaller of the
> >   preferred block size or export size, and SHOULD be at least 2^20
> >   (1,048,576) if the export is that large.  For convenience, the server
> > -MAY advertise a maximum block size that is larger than the export
> > -size, although in that case, the client MUST treat the export size as
> > -the effective maximum block size (as further constrained by a nonzero
> > -offset).
> > +MAY advertise a maximum block payload size that is larger than the
> > +export size, although in that case, the client MUST treat the export
> > +size as an effective maximum block size (as further constrained by a
> 
> ... but still used.

Hmm, I'll have to make sure I get my wording precise on v3.

> 
> 
> > +nonzero offset).  Notwithstanding any maximum block size advertised,
> > +either the server or the client MAY initiate a hard disconnect if a
> > +payload length of either a request or a reply would be large enough to
> > +be deemed a denial of service attack; however, for maximum
> > +portability, any payload *length* not exceeding 2^25 (33,554,432)
> > +bytes SHOULD NOT be considered a denial of service attack, even if
> > +that length is larger than the advertised maximum block payload size.
> > +
> > +For commands that require a payload in either direction and where the
> > +client controls the payload length (`NBD_CMD_WRITE`, or `NBD_CMD_READ`
> > +without structured replies), the client MUST NOT use a length larger
> > +than the maximum block size. For replies where the payload length is
> > +controlled by the server (`NBD_CMD_BLOCK_STATUS` without the flag
> > +`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ`, both when structured
> > +replies are negotiated), the server MUST NOT send an individual reply
> > +chunk larger than the maximum payload size, although it may split the
> > +overall reply among several chunks.  For commands that do not require
> > +a payload in either direction (such as `NBD_CMD_TRIM`), the client MAY
> > +request a length larger than the maximum block size; the server SHOULD
> > +NOT disconnect, but MAY reply with an `NBD_EOVERFLOW` or `NBD_EINVAL`
> > +error if the oversize request would require more server resources than
> > +the same command operating on only a maximum block size (such as some
> > +implementations of `NBD_CMD_WRITE_ZEROES` without the flag
> > +`NBD_CMD_FLAG_FAST_ZERO`, or `NBD_CMD_CACHE`).
> 
> [..]
> 
> -- 
> Best regards,
> Vladimir
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


