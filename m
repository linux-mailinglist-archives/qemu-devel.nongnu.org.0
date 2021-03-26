Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A234AAF3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:06:57 +0100 (CET)
Received: from localhost ([::1]:53524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPo36-0006E4-9X
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPo29-0005mD-R5
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPo26-0008HE-OW
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616771153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 resent-to:resent-from:resent-message-id;
 bh=JNOiBAlH0Gwyp0MsGt8H57RvIj2quw1z7i4TpnO0d0I=;
 b=QlFigD5+4vizo/a3CNQlKVx+l/sgxKn1gRaM005Ad3QvRZBIwlRchT+Rrp/CTJL/9vdrb7
 u6SmtKNpXmdtpeNDlVz8DBF6ePfg7jcmtp6WgLa1d97fuIVfwpJtDIz/Wehul53fIxW1qb
 xyBPUI04nfiY9oslIBC4EvMbbnW7JI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-gmH-MtbvNpOuZm7Pcb55Vw-1; Fri, 26 Mar 2021 11:05:51 -0400
X-MC-Unique: gmH-MtbvNpOuZm7Pcb55Vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C426B100855E
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 15:05:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A4E13441
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 15:05:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 23FB011327E1; Fri, 26 Mar 2021 16:05:49 +0100 (CET)
Resent-To: qemu-devel@nongnu.org
Resent-From: Markus Armbruster <armbru@redhat.com>
Resent-Date: Fri, 26 Mar 2021 16:05:49 +0100
Resent-Message-ID: <87wntudkfm.fsf@dusky.pond.sub.org>
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: docs/qemu-qmp-ref.7 markup messed up
Date: Fri, 26 Mar 2021 15:19:38 +0100
Message-ID: <87v99engjp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Lines: 67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When I look at docs/qemu-qmp-ref.7 with less -R, I see

   ReplicationMode (Enum)
       An enumeration of replication modes.

   Values
       primary
              Primary mode, the vm's state will be sent to secondary QEMU.

       secondary
              Secondary mode, receive the vm's state from primary QEMU.

   Since
       2.9

   If
-->    defined(CONFIG_REPLICATION).SS BlockdevOptionsReplication (Object)

       Driver specific block device options for replication

   Members
       mode: ReplicationMode
              the replication mode

The line I marked with --> is bad.  It should instead look like

   If
       defined(CONFIG_REPLICATION)

   BlockdevOptionsReplication (Object)

       Driver specific block device options for replication

Unformatted code:

    .SS \fBReplicationMode\fP (Enum)
    .sp
    An enumeration of replication modes.
    .SS Values
    .INDENT 0.0
    .TP
    .B \fBprimary\fP
    Primary mode, the vm\(aqs state will be sent to secondary QEMU.
    .TP
    .B \fBsecondary\fP
    Secondary mode, receive the vm\(aqs state from primary QEMU.
    .UNINDENT
    .SS Since
    .sp
    2.9
    .SS If
--> \fBdefined(CONFIG_REPLICATION)\fP.SS \fBBlockdevOptionsReplication\fP (Object)
    .sp
    Driver specific block device options for replication
    .SS Members
    .INDENT 0.0
    .TP
    .B \fBmode\fP: \fBReplicationMode\fP
    the replication mode
    .TP

I believe line I marked with --> should be broken before .SS.

I'm using sphinx-build-3 2.2.2.

I checked with the merge commit that switched QAPI doc generation to
Sphinx (commit e344ffe73b), same result.


