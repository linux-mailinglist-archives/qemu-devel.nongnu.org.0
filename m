Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354C6AA44B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:28:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDrl-0002qw-Bv; Fri, 03 Mar 2023 17:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYDrj-0002py-Ii
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYDrh-0006BW-O4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677882421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KWJ8rQ1EpPbdLKx92XVvUTt4YmEfP74hv8yW16bLh5Y=;
 b=SXjWetiFklV7BRh2N0iBNJn5NRDxnnBMuowjgIX1y/En2YDhxZr+Mi/B5jK5OzH48KSGrz
 W23MkfyXS+rqKWIfkW6+JFiQ96KcvZB269xvqo2EWmU4P8nGTt4fY4ZFlYUAdLkOY0PnVZ
 aNzBoxmc/Vd29eZo+KO1nmlAOg6f0q4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-qH8xlqCSMGmXmQ3pIZZq4w-1; Fri, 03 Mar 2023 17:26:56 -0500
X-MC-Unique: qH8xlqCSMGmXmQ3pIZZq4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7448A185A78B;
 Fri,  3 Mar 2023 22:26:56 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFD7D4010E7B;
 Fri,  3 Mar 2023 22:26:55 +0000 (UTC)
Date: Fri, 3 Mar 2023 16:26:53 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 2/6] spec: Tweak description of maximum block size
Message-ID: <20230303222653.xivvmvilswu3lii3@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-3-eblake@redhat.com>
 <Y/ThgdLldvb5rpwA@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/ThgdLldvb5rpwA@pc220518.home.grep.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 21, 2023 at 05:21:37PM +0200, Wouter Verhelst wrote:
> Hi Eric,
> 
> Busy days, busy times. Sorry about the insane delays here.

No problem; I've been tackling other things in the meantime too, so
this extension has taken far longer than I planned for more reasons
than just slow review time.

> 
> On Mon, Nov 14, 2022 at 04:46:51PM -0600, Eric Blake wrote:
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
> >  doc/proto.md | 127 +++++++++++++++++++++++++++++----------------------
> >  1 file changed, 73 insertions(+), 54 deletions(-)
> > 
> > diff --git a/doc/proto.md b/doc/proto.md
> > index 8f08583..53c334a 100644
> > --- a/doc/proto.md
> > +++ b/doc/proto.md
> > @@ -745,8 +745,8 @@ text unless the client insists on TLS.
> > 
> >  During transmission phase, several operations are constrained by the
> >  export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
> > -as well as by three block size constraints defined here (minimum,
> > -preferred, and maximum).
> > +as well as by three block size constraints defined here (minimum
> > +block, preferred block, and maximum payload).
> > 
> >  If a client can honour server block size constraints (as set out below
> >  and under `NBD_INFO_BLOCK_SIZE`), it SHOULD announce this during the
> > @@ -772,15 +772,15 @@ learn the server's constraints without committing to them.
> > 
> >  If block size constraints have not been advertised or agreed on
> >  externally, then a server SHOULD support a default minimum block size
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
> > +size is smaller); while a client desiring maximum interoperability
> > +SHOULD constrain its requests to a minimum block size of 2^9 (512),
> > +and limit `NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum
> > +block size of 2^25 (33,554,432).  A server that wants to enforce block
> > +sizes other than the defaults specified here MAY refuse to go into
> > +transmission phase with a client that uses `NBD_OPT_EXPORT_NAME` (via
> > +a hard disconnect) or which uses `NBD_OPT_GO` without requesting
> 
> This does more than what the commit message says: it also limits payload
> size from 0xffffffff to 2^25. We already have a "A server that desires
> maximum interoperability" clause that mentions the 2^25, so I'm not
> entirely sure why we need to restrict that for the default cause.
> 
> Remember, apart from specifying how something should be implemented, the
> spec also documents current and historic behavior. I am probably
> convinced that it makes more sense to steer people towards limiting to
> 2^25, but it should be done in such a way that servers which accept a
> 0xffffffff block size are not suddenly noncompliant. I don't think this
> does that.

I'll have to play more with the wording here.  A client shouldn't send
larger write requests to a server without knowing the server will
accept it (because traditional servers disconnect instead - the
alternative is to read the client's entire payload, and the larger the
payload is, the longer that takes - the client is starving the server
from serving other clients by making it chew through data).  But
sending larger read requests MAY be tolerated by a server that sends a
graceful error message ("you requested more than I'm willing to send,
but my error response is short so the connection can stay open"), even
if several historical implementations have also hung up at that point
(at least qemu implements a malloc() call for both read and writes;
reads populate the buffer from the client, writes populate the buffer
to send back to the client - the connection is aborted when the
malloc() is not attempted because it exceeds 2^25 bytes).

But I also see your point about not declaring a server non-compliant
merely because it allows for a larger payload, nor a client that sends
larger payloads to a known-happy server that accepts those payloads.
nbdkit historically chose 64M as its limits instead of qemu's 32M.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


