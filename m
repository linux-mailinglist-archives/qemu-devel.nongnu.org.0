Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87959702D4D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:00:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXnu-00010z-Qd; Mon, 15 May 2023 08:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyXmv-0000nS-Sx
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyXmu-0008Gh-Dv
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NKEOn73aROVL3rGIOEu3hiB4gtVRAybN2gHo0LhATks=;
 b=Iu/PE1WtMQcjsZJrtJjHA9LFJ3Mpa0Wjn4IHIi+KZ4dXFDDUSIlgoiKt61/UjKtFIwzoA7
 MphizaNtKHUN6b/bVMlfU8yjktIuPqLG1VW1ooNDUxI9851p3KADU2GIdD2YPCXlHBJzI6
 RxTtk+hn3A8Qe6jRvwVhhwpd3Z0lnYg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-DF9iwMLvP9efVjKWB9S4iA-1; Mon, 15 May 2023 08:58:48 -0400
X-MC-Unique: DF9iwMLvP9efVjKWB9S4iA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAAC41C0F2E1;
 Mon, 15 May 2023 12:58:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA76A483EC2;
 Mon, 15 May 2023 12:58:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A15D521E681C; Mon, 15 May 2023 14:58:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 0/2] docs/interop: Convert QMP related txt docs to rst
References: <20230511121553.3356127-1-peter.maydell@linaro.org>
Date: Mon, 15 May 2023 14:58:46 +0200
In-Reply-To: <20230511121553.3356127-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 11 May 2023 13:15:51 +0100")
Message-ID: <87jzx9wy2h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> This patchset deals with a couple of the old .txt files
> that are still hanging around in docs/interop: qmp-spec.txt
> and qmp-intro.txt. Patch 1 converts qmp-spec to rST and
> integrates it into the manual. Patch 2 takes the only
> interesting parts of qmp-intro.txt (the example command
> lines) and puts those into qemu-options.hx so we can
> delete the old .txt file.
>
> v1->v2 changes:
>  * some trivial tweaks suggested by Eric
>  * all patches have been reviewed
>
> Markus, will you take this series through your tree,
> or do you prefer something else?

Happy to take the series through my tree once it converged.


