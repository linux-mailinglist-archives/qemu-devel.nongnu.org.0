Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D586D09A5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 17:32:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phuFx-0004HG-76; Thu, 30 Mar 2023 11:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phuFm-0004Gi-Vf
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 11:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phuFl-0006zY-FL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 11:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680190312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oTKtNscao0SAqIst4ZltSRzVr4gqWkpgp6pYckWsNc=;
 b=JAU0qJtwZDm7g3jglkuchUK8BOgvKuxDLH/KWmpgHsmxTK8K8IqFDzZi/AEN14GMKw/VXg
 Xw0kxdMSR5ro11DtkiGKveyvSZVDZzL8NFkZlnj/GMH1l/LRsa9FZ0DNPzAayafNGQFKLm
 DEVfgGikzUpJp+ChE4INHdyo2C4HqGw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-XjyocA8sO9qe2a7ugE4O_w-1; Thu, 30 Mar 2023 11:31:47 -0400
X-MC-Unique: XjyocA8sO9qe2a7ugE4O_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90F89886066;
 Thu, 30 Mar 2023 15:31:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E667202701E;
 Thu, 30 Mar 2023 15:31:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3EFB921E6926; Thu, 30 Mar 2023 17:31:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Warner Losh
 <imp@bsdimp.com>,  Ryo ONODERA <ryoon@netbsd.org>,  Kevin Wolf
 <kwolf@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Kyle
 Evans <kevans@freebsd.org>,  Reinoud Zandijk <reinoud@netbsd.org>,  Daniel
 P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Kashyap Chamarthy
 <kchamart@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 03/11] MAINTAINERS: add a section for policy documents
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-4-alex.bennee@linaro.org>
Date: Thu, 30 Mar 2023 17:31:43 +0200
In-Reply-To: <20230330101141.30199-4-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Thu, 30 Mar 2023 11:11:33 +0100")
Message-ID: <87pm8qp868.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We don't update these often but if you are the sort of person who
> enjoys debating and tuning project policies you could now add yourself
> as a reviewer here so you don't miss the next debate over tabs vs
> spaces ;-)
>
> Who's with me?
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


