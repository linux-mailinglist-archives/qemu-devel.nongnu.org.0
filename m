Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3796B34B0B5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:42:48 +0100 (CET)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtI7-00065g-6K
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPtG6-0004Mt-Mk
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 16:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPtG1-0006ys-Uz
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 16:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJk1mMxe5fpxkIrw4glAXbfEkL7uZWZ+KM0eCDzpLeA=;
 b=JOmiQL1vFOYy6/AtxuaaNJ+lTxHDcEGagohyaoCFTlsU2WfbcQvJxgUDB/oon6NLtdyAD8
 tcVJeqxh+ZR/jDCFINYXxo6wtwtNuAC6ZAJ+0pdzo1jlMteZgGteLkIjtuhIcxFczzViGA
 jkFP/s3jQJj01h7ByLRqcImjyjbRtDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-eCBGCHFFNbigWQxjPSGgjg-1; Fri, 26 Mar 2021 16:40:33 -0400
X-MC-Unique: eCBGCHFFNbigWQxjPSGgjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED101501F7;
 Fri, 26 Mar 2021 20:40:32 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79C1719C71;
 Fri, 26 Mar 2021 20:40:32 +0000 (UTC)
Subject: Re: docs/qemu-qmp-ref.7 markup messed up
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <87v99engjp.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <e8e981b4-871c-23c3-8af1-4411b053e4d9@redhat.com>
Date: Fri, 26 Mar 2021 16:40:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87v99engjp.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 10:19 AM, Markus Armbruster wrote:
> When I look at docs/qemu-qmp-ref.7 with less -R, I see
> 
>     ReplicationMode (Enum)
>         An enumeration of replication modes.
> 
>     Values
>         primary
>                Primary mode, the vm's state will be sent to secondary QEMU.
> 
>         secondary
>                Secondary mode, receive the vm's state from primary QEMU.
> 
>     Since
>         2.9
> 
>     If
> -->    defined(CONFIG_REPLICATION).SS BlockdevOptionsReplication (Object)
> 
>         Driver specific block device options for replication
> 
>     Members
>         mode: ReplicationMode
>                the replication mode
> 
> The line I marked with --> is bad.  It should instead look like
> 
>     If
>         defined(CONFIG_REPLICATION)
> 
>     BlockdevOptionsReplication (Object)
> 
>         Driver specific block device options for replication
> 
> Unformatted code:
> 
>      .SS \fBReplicationMode\fP (Enum)
>      .sp
>      An enumeration of replication modes.
>      .SS Values
>      .INDENT 0.0
>      .TP
>      .B \fBprimary\fP
>      Primary mode, the vm\(aqs state will be sent to secondary QEMU.
>      .TP
>      .B \fBsecondary\fP
>      Secondary mode, receive the vm\(aqs state from primary QEMU.
>      .UNINDENT
>      .SS Since
>      .sp
>      2.9
>      .SS If
> --> \fBdefined(CONFIG_REPLICATION)\fP.SS \fBBlockdevOptionsReplication\fP (Object)
>      .sp
>      Driver specific block device options for replication
>      .SS Members
>      .INDENT 0.0
>      .TP
>      .B \fBmode\fP: \fBReplicationMode\fP
>      the replication mode
>      .TP
> 
> I believe line I marked with --> should be broken before .SS.
> 
> I'm using sphinx-build-3 2.2.2.
> 
> I checked with the merge commit that switched QAPI doc generation to
> Sphinx (commit e344ffe73b), same result.
> 
> 

It looks like that's consistent for every case I can see for 
"defined(...)", where the .SS bit comes immediately on the same line.

_nodes_for_if_section seems to handle the docutil tree creation for the 
stuff in question, here, I think?

I changed the heading to "IfZ" to make it nicer to grep, and then If I 
pepper in some prints (mercifully docutils has very nice __str__ 
methods!) I can see this type of stuff:

<section 
ids="qapidoc-713"><title>IfZ</title><literal>defined(CONFIG_REPLICATION)</literal></section>
<section 
ids="qapidoc-717"><title>IfZ</title><literal>defined(CONFIG_REPLICATION)</literal></section>

Hm, I think <literal> is not a block-level element, and maybe there's a 
bug/intentional-design-choice/bug where it can't handle a non-block 
child of a section correctly?

Let me try wrapping it in a PARAGRAPH node...

.SS IfZ
.sp
\fBdefined(CONFIG_REPLICATION)\fP
.SS \fBBlockdevOptionsReplication\fP (Object)
.sp


That looks better, I think.


diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index b7b86b5dff..b7a2d39c10 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -278,7 +278,9 @@ def _nodes_for_if_section(self, ifcond):
          nodelist = []
          if ifcond:
              snode = self._make_section('If')
-            snode += self._nodes_for_ifcond(ifcond, with_if=False)
+            snode += nodes.paragraph(
+                '', '', *self._nodes_for_ifcond(ifcond, with_if=False)
+            )
              nodelist.append(snode)
          return nodelist


Signed-off-by: John Snow <jsnow@redhat.com>

--js


