Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FFB60E7A9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:52:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlNG-0005tG-S6; Wed, 26 Oct 2022 14:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onlNE-0005sY-2g
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onlNC-0004RQ-FA
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666809808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j5XGgE6eT0JA5nXkl5BAUkyI/LDBGdZSY4C42iv5zz0=;
 b=ewBrpeVOv0wNejZPRoOzVcpG2w0XBwlX4tcytvEjri7QQAYkD5ivQzPB5TJlX+MmoHSfx4
 pG9kmIZWrYALD0FDht1Gbkgu7i0ixGBXt6FBduwHHe+Ra6JCghkXfbJlQM9Oy7w/ydtLgF
 frQ8JGKtuXyJnHuJ0t8P+CPnW6zc+As=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-8qk2e-k_OWy5OwA9d-JaIQ-1; Wed, 26 Oct 2022 14:43:26 -0400
X-MC-Unique: 8qk2e-k_OWy5OwA9d-JaIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE779382F1AF;
 Wed, 26 Oct 2022 18:43:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2D3E2024CB7;
 Wed, 26 Oct 2022 18:43:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 972BB21E6921; Wed, 26 Oct 2022 20:43:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com
Subject: Re: [PULL 00/28] QAPI patches patches for 2022-10-25
References: <20221025080541.271547-1-armbru@redhat.com>
 <CAJSP0QVkhzTw6_n+UgEVYDBhMqFuve1oVT2SnorwtMarWHgDcA@mail.gmail.com>
Date: Wed, 26 Oct 2022 20:43:24 +0200
In-Reply-To: <CAJSP0QVkhzTw6_n+UgEVYDBhMqFuve1oVT2SnorwtMarWHgDcA@mail.gmail.com>
 (Stefan Hajnoczi's message of "Tue, 25 Oct 2022 16:07:27 -0400")
Message-ID: <87pmeee88j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@gmail.com> writes:

> The following CI failures were reported. I think they may be related
> to this pull request:
[...]

They are.  v2 sent & fingers crossed.  Thanks!


