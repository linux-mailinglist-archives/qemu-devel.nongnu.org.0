Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009863EDA4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:25:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gkL-0007Dg-MD; Thu, 01 Dec 2022 05:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0gkJ-0007DE-T6
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:24:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0gkI-0007bk-Cq
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669890285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tE/T7j2HX0aTsTmYNDJqvYllYIiOJxhnd29kyIGxOWw=;
 b=iEUer82nYtazoUL/RCYQ+XWVxYiQU4HOOUBkRUixH1Cg2Cf/yFYZ6+BDiU+XDn9PBQHHWV
 YovoEPiQiXwOiho5LIeRnUfJX24Q9dfCyHcvBVpV9s0kHepH3S/fh99C08LzZoeRpxrthJ
 VRSS3E7GMVxRc4zul6fwyCVdnS95WXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-epzd5otdP0Ow02uX9i0HpQ-1; Thu, 01 Dec 2022 05:24:43 -0500
X-MC-Unique: epzd5otdP0Ow02uX9i0HpQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64EA58065DE;
 Thu,  1 Dec 2022 10:24:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02433492B04;
 Thu,  1 Dec 2022 10:24:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA88A21E6921; Thu,  1 Dec 2022 11:24:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Jiaxun
 Yang <jiaxun.yang@flygoat.com>,  Vince Del Vecchio
 <Vince.DelVecchio@mediatek.com>
Subject: Re: [PATCH] MAINTAINERS: Inherit from nanoMIPS
References: <20221030225006.43203-1-philmd@linaro.org>
 <PAVPR03MB96784D39EC71F71C86ABAE81F8069@PAVPR03MB9678.eurprd03.prod.outlook.com>
 <PAVPR03MB967895ED1573A16CE6E5A34FF8149@PAVPR03MB9678.eurprd03.prod.outlook.com>
Date: Thu, 01 Dec 2022 11:24:39 +0100
In-Reply-To: <PAVPR03MB967895ED1573A16CE6E5A34FF8149@PAVPR03MB9678.eurprd03.prod.outlook.com>
 (Milica Lazarevic's message of "Thu, 1 Dec 2022 09:26:34 +0000")
Message-ID: <87ilivzajc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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

Milica Lazarevic <Milica.Lazarevic@Syrmia.com> writes:

> Hi,
>
> Stefan is no longer working with us, but I will be more than happy to take maintaining the nanoMIPS ISA on me!
>
> Regards,
> Milica
> Any comments on this?

Suggest you post a patch to update MAINTAINERS, with a suitable cc:.


