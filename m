Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4843150A24D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:28:18 +0200 (CEST)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXn7-00029H-9h
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXJV-000100-HU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXJU-0007LO-4Z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qlC/LuLKKc1PGNB4eoSEYyk8oD7WL2dGNyzpoYrC7DM=;
 b=Ok+aQHEb6alEwDk7IidFCxG5tdOhS/SrWurK2Xf8SifmDsH3hcUSdwmivYxuSD6Ws/QxFo
 Ik/XFuztKkPN5XREz5g8Tz6i0MzvPsu65Iy7rrom7C7PNPwDSAsoYVusfhz8XLkdrKHTk9
 luqHObdO6HxbyoLDoYBhP6/19KUd/CM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-Bnlb7qmKNEK5Xk-ycPJ2aA-1; Thu, 21 Apr 2022 09:57:32 -0400
X-MC-Unique: Bnlb7qmKNEK5Xk-ycPJ2aA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E41F1014A66;
 Thu, 21 Apr 2022 13:57:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D96A04022C7;
 Thu, 21 Apr 2022 13:57:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D816A21E6A1F; Thu, 21 Apr 2022 15:57:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v5 0/2] Option to take screenshot with screendump as PNG
References: <20220408071336.99839-1-kshitij.suri@nutanix.com>
 <48d3c4c2-7e64-902d-b6ce-d0a547ba4c4c@nutanix.com>
Date: Thu, 21 Apr 2022 15:57:30 +0200
In-Reply-To: <48d3c4c2-7e64-902d-b6ce-d0a547ba4c4c@nutanix.com> (Kshitij
 Suri's message of "Thu, 14 Apr 2022 14:25:01 +0530")
Message-ID: <87tuamsfn9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> Hi,
>
> Hope this mail finds everyone well! I have updated the code as
> required and would be grateful if I could get your reviews for any
> changes that are needed to be implemented in the patch. In case no
> change is required, please do let me know the next steps for the same.

Unless something still comes up in review, the next step is merging.

Gerd, would you like to take it?


