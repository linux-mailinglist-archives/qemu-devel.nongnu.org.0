Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CD16C656A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:42:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfIND-0000ev-Ua; Thu, 23 Mar 2023 06:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfINA-0000cu-6h
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfIN8-00027n-MT
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679568041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ihQcspZIGPd2ffDRuw03jmH5lqCLlLY9Bcbb3dTapPg=;
 b=a7Nt98UEGmKnifHGLE6b/2I6UGQd5G7qzbX0dgtz9R7geHwPU/6xUIYu4f5z3iVmK4StGH
 nl83rYXMZ0BCFv7dx/gk7gBkuBIcbDfNyMYtcqc++V7iObGb0HiIpYqZXbvISGsr0bwcdE
 aiY1iQg5remYoDeQEjUXYcKvWNQ9JMU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-QLgoRd59OVyNvtW9C7NVfA-1; Thu, 23 Mar 2023 06:40:39 -0400
X-MC-Unique: QLgoRd59OVyNvtW9C7NVfA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45DCB85530C;
 Thu, 23 Mar 2023 10:40:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FD214021B1;
 Thu, 23 Mar 2023 10:40:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9842221E6926; Thu, 23 Mar 2023 11:40:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 David Alan Gilbert <dgilbert@redhat.com>
Subject: Example output for query-vcpu-dirty-limit
Date: Thu, 23 Mar 2023 11:40:36 +0100
Message-ID: <87mt43zr6j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

query-vcpu-dirty-limit's doc comment has an example, but it shows only
input, no output:

    ##
    # @query-vcpu-dirty-limit:
    #
    # Returns information about virtual CPU dirty page rate limits, if any.
    #
    # Since: 7.1
    #
    # Example:
    #   {"execute": "query-vcpu-dirty-limit"}
    #
    ##

The simplest fix is

    # Example:
    # -> {"execute": "query-vcpu-dirty-limit"}
    # <- {"return": []}

But I'd rather show a non-empty reply here.  I don't want to make one
up, because making up example output tends to result in incorrect
examples.  Could you run the command for me in context where it returns
non-empty output?


