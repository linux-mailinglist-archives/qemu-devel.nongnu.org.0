Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899624CC95D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 23:44:46 +0100 (CET)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPuBh-0001rN-Lo
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 17:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPuAr-00014E-4F
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPuAp-0007Fc-9O
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646347430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeJx5COOFHKv5ORA+XxqLv4asW7StQ9/UMd6p2xH4gA=;
 b=NQYvDEuTaLn4JEwENJyYlBctnOyR2308nAOGfjsiViqvVkKbRVNwD1l3m0s9f2bU4zAYSG
 UxoWDmcwEtnabuBfrHvdd5K6pWObSn01AVtQYjlir1tWKeCGwZC+NZwp8dxAnMDuSUbw7F
 Q70pJ/lchZ77T/75sfPLqcKCJzbs0eY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-MlrINIEpPxGQAzifNTqjwQ-1; Thu, 03 Mar 2022 17:43:47 -0500
X-MC-Unique: MlrINIEpPxGQAzifNTqjwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63501091DA0;
 Thu,  3 Mar 2022 22:43:46 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C48A4CEE7;
 Thu,  3 Mar 2022 22:43:43 +0000 (UTC)
Date: Thu, 3 Mar 2022 16:43:41 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/5] python/utils: add add_visual_margin() text
 decoration utility
Message-ID: <20220303224341.zkiv7gzcmirogwf7@redhat.com>
References: <20220303205902.4106779-1-jsnow@redhat.com>
 <20220303205902.4106779-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303205902.4106779-2-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 03:58:58PM -0500, John Snow wrote:
> >>> print(add_visual_margin(msg, width=72, name="Commit Message"))
> ┏━ Commit Message ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
> ┃ add_visual_margin() takes a chunk of text and wraps it in a visual
> ┃ container that force-wraps to a specified width. An optional title
> ┃ label may be given, and any of the individual glyphs used to draw the
> ┃ box may be replaced or specified as well.
> ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

I see you dropped the right margin compared to earlier versions, but
agree that this is still a nice visual indicator, and probably easier
to maintain in this form.  And it got rid of the weird spacing on the
left when the wrap point hit at the wrong time.

> +    Decorate and wrap some text with a visual decoration around it.
> +
> +    This function assumes that the text decoration characters are single
> +    characters that display using a single monospace column.
> +
> +    ┏━ Example ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
> +    ┃ This is what this function looks like with text content that's
> +    ┃ wrapped to 72 characters. The right-hand margin is left open to
> +    ┃ acommodate the occasional unicode character that might make
> +    ┃ predicting the total "visual" width of a line difficult. This
> +    ┃ provides a visual distinction that's good-enough, though.
> +    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Yep - hand-waving away Unicode messiness is certainly easiest ;)

Reviewed-by: Eric Blake <eblake@redhat.com>

[take with a grain of salt - my python is weak. But as you said in the
cover letter, it's fairly straightforward to reproduce an environment
where you can see it in action for hands-on testing]

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


